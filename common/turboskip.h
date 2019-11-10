class TurboSkip {
public:
    TurboSkip()
    : cnt_(0)
    , inc_(0)
    , speed_(4)
    {
    }

    void setEnabled(bool enable) {
        if (enable)
            inc_ = 1;
        else
            cnt_ = inc_ = 0;
    }

    bool isEnabled() const { return inc_; }
    void setSpeed(int speed) { speed_ = speed; }
    int speed() const { return speed_; }

    bool skip() {
        if ((cnt_ += inc_) >= speed_)
            cnt_ = 0;

        return cnt_;
    }

private:
    int cnt_, inc_, speed_;
};
