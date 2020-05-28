Content-Type: multipart/mixed; boundary="===============5328019872463895631=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kbuild-all@lists.01.org
Subject: [PATCH v2] Bluetooth: Acquire sk_lock.slock without disabling interrupts
Date: Thu, 28 May 2020 14:35:12 +0200
Message-ID: <20200528123512.o32lkytxjdpwzi7r@linutronix.de>
In-Reply-To: <20200528071103.GA26242@xsang-OptiPlex-9020>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5328019872463895631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There was a lockdep which led to commit
   fad003b6c8e3d ("Bluetooth: Fix inconsistent lock state with RFCOMM")

Lockdep noticed that `sk->sk_lock.slock' was acquired without disabling
the softirq while the lock was also used in softirq context.
Unfortunately the solution back then was to disable interrupts before
acquiring the lock which however made lockdep happy.
It would have been enough to simply disable the softirq. Disabling
interrupts before acquiring a spinlock_t is not allowed on PREEMPT_RT
because these locks are converted to 'sleeping' spinlocks.

Use spin_lock_bh() in order to acquire the `sk_lock.slock'.

Reported-by: Luis Claudio R. Goncalves <lclaudio@uudg.org>
Reported-by: kbuild test robot <lkp@intel.com> [missing unlock]
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

v1=E2=80=A6v2: Unlock on the way out as reported by the lkp bot.

 net/bluetooth/rfcomm/sock.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
index b4eaf21360ef2..df14eebe80da8 100644
--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -64,15 +64,13 @@ static void rfcomm_sk_data_ready(struct rfcomm_dlc *d, =
struct sk_buff *skb)
 static void rfcomm_sk_state_change(struct rfcomm_dlc *d, int err)
 {
 	struct sock *sk =3D d->owner, *parent;
-	unsigned long flags;
 =

 	if (!sk)
 		return;
 =

 	BT_DBG("dlc %p state %ld err %d", d, d->state, err);
 =

-	local_irq_save(flags);
-	bh_lock_sock(sk);
+	spin_lock_bh(&sk->sk_lock.slock);
 =

 	if (err)
 		sk->sk_err =3D err;
@@ -93,8 +91,7 @@ static void rfcomm_sk_state_change(struct rfcomm_dlc *d, =
int err)
 		sk->sk_state_change(sk);
 	}
 =

-	bh_unlock_sock(sk);
-	local_irq_restore(flags);
+	spin_unlock_bh(&sk->sk_lock.slock);
 =

 	if (parent && sock_flag(sk, SOCK_ZAPPED)) {
 		/* We have to drop DLC lock here, otherwise
-- =

2.27.0.rc0

--===============5328019872463895631==--

