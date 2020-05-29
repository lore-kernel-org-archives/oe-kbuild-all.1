Content-Type: multipart/mixed; boundary="===============0828112182075932030=="
MIME-Version: 1.0
From: Marcel Holtmann <marcel@holtmann.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] Bluetooth: Acquire sk_lock.slock without disabling interrupts
Date: Fri, 29 May 2020 13:50:03 +0200
Message-ID: <C6CE8EBA-73DC-4A8A-9BD2-BC13BBDEC24A@holtmann.org>
In-Reply-To: <20200528123512.o32lkytxjdpwzi7r@linutronix.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0828112182075932030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

> There was a lockdep which led to commit
>   fad003b6c8e3d ("Bluetooth: Fix inconsistent lock state with RFCOMM")
> =

> Lockdep noticed that `sk->sk_lock.slock' was acquired without disabling
> the softirq while the lock was also used in softirq context.
> Unfortunately the solution back then was to disable interrupts before
> acquiring the lock which however made lockdep happy.
> It would have been enough to simply disable the softirq. Disabling
> interrupts before acquiring a spinlock_t is not allowed on PREEMPT_RT
> because these locks are converted to 'sleeping' spinlocks.
> =

> Use spin_lock_bh() in order to acquire the `sk_lock.slock'.
> =

> Reported-by: Luis Claudio R. Goncalves <lclaudio@uudg.org>
> Reported-by: kbuild test robot <lkp@intel.com> [missing unlock]
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> =

> v1=E2=80=A6v2: Unlock on the way out as reported by the lkp bot.
> =

> net/bluetooth/rfcomm/sock.c | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

--===============0828112182075932030==--

