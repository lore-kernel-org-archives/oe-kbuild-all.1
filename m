Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534C2F49F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562821; cv=none; b=mJ+hoViZBcGelvs7uG1CfQVchktJKMEHoHFhfhXps0zrEZMX2Yu8V8rzCa2CVZZknF5gAP1SZefqt/hqO0sKf4UJhDYbvarE/XVPB5sW7La4E4322m/TPvjSH1vGiDT2uZQe/eOvEC/Amsi9PD/FjyqP3hz/hLleleSWmdQKBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562821; c=relaxed/simple;
	bh=6F4FIqvRlAxLMiyzjB1a0Loef1xYOuziOaEvpkQ9tjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQp8Oq6aOf1JpTY2VY0DD7+Ip9KguuyNijCLbFkpZOY9iqOKSNZkzcNDWD0HhdRm/Dr5INa9mscqcFB6otlvMFztt2bCKqyElJDrCcNXXsY7SovFR0eeZZCfQ5XHaw02N9pRwjxtYIsGMEeZcbp3tLC/iY5dXcihJsZG2Cy/i0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFWtdqBQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFWtdqBQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso13602235e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777562817; x=1778167617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MHpRBHdNTVeiHYde/smY3bJSKHcAn6/QCWkGp6rSLM=;
        b=BFWtdqBQ66TwOulP5N0d1eKr1gIfJyyTStnO8gujt5OEtprzrYgR4CPgBr8Jk5UBSP
         hxpFt+5s75czIEUR+g14sogqmz87YMmnzjieTQ8YrFt2CeoI0bX4rKINNTvNlXB6fvsK
         mAErdnn0moAT2v+CUELlv6hFNLTegRw/TpjnQs/Z2zCxL2oi9Stjl6lpngY9WnTeCY25
         I9WaRfgdnYMVMLYr1UCEk1MmBSuQE5nvjzz6j+Tk3bg5D4Dp/iS3060IaQZc8cqpmvDy
         3gOVsI8L5D/2EpQmySDqCH70M/F9Wx8PnWoK/U5RnbSUnqLOjPcPpUkZeNsZqWCYt3Do
         Ni7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777562817; x=1778167617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MHpRBHdNTVeiHYde/smY3bJSKHcAn6/QCWkGp6rSLM=;
        b=C9hIGyKYnu6OJsQnl06rIJqhsqWbc+Rn6dz+Byq0AYfmH+bHqtXhSgQChNh8Pyv0lX
         tj36Is6zoqq5c7+cfXuDwUnHz3SeRmvFcWzMpBRcdzd/0LSRDHs+6XWJvCdnkyaR4ERy
         cNcWj/BV4ocJHYLH0F08dlDhkZIQRIv2xFWUKaEex729dd9MvSUs+zw3FI8RDVdB7ysU
         jUO0JZ9uK4Ya2wvVoaS85ZPab+iw+Oox2jPEjcAYLpJQ1XDqxD5R2I7cwKYq2nXppomj
         a1kllBQwqypqBUuTaxNuucvDhr5igBiXJI+bT/G8CPHsXVqWcFmiL4i8WtQ54VguWxl0
         HScA==
X-Forwarded-Encrypted: i=1; AFNElJ+g5Oic96W5EUM29IGhjRfkxUnZu0TcnlAkM3Sw0AKd5m7V/RwQuOf3CUncAbJOe8dTaDHmFiDHCS9xSCAS@lists.linux.dev
X-Gm-Message-State: AOJu0YwbOOwygd5oIPL3VwgDRBmVfiPI/C8eaTq25MxT/1SuelWNY6Iu
	YW88cqllyeSnKbLiEE/piEYVxkq8oFWVpAnl22KrMzdCemX0Fqxmqud8
X-Gm-Gg: AeBDievbPCPLQk/K2B7ccjX53Ki/EoVMWalqcnQoK6D3iX6Al2NFatHKRo5wKDoQ6df
	1k01FA7/0zxB9ew/nJ1m2kVeo8fh9iU+7u5Vc45RB4vq/aMnNJc5NkjCetxuOaMv05TrY5PawQR
	ZLQRJs31f1Hyd5LrjlyvqOo6yH+TZfn2gOFVXeDnUCYQL8z8resGUz8Hq7wn/keqKCqYTCZV4JT
	Y8JLFPUhE/OdxnlXS/T7EM/up9QVvlB4/huwSv0jIBq99rBBM33NAIpWDV9z9FEL/Z3wraXlkPL
	iTBkVVvrsrwnNQJ5M3T+CKni2x/6BU9kzY+HSrWhuRwT25rVhj4ohVNyCjg0kdxExWLsuY++8u2
	vqpakGssEizLYhmw8nojKXPTSxiJCvplNfuU5zT9asuQb81lNAwzhCwo7mPvPD6KFIzBxwO0IfI
	cLlgVqAL12GdoEjO2vY+tE641h6RGeiOzIqe/HcOpdgnmpBrlSMuGsu94CDY4r3/F2mSFsafpTB
	8outdksOeeIp8FAHacIvg6Qh6Mi754MMBH5aQ==
X-Received: by 2002:a05:600c:198b:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-48a83d66cb9mr58464225e9.3.1777562817130;
        Thu, 30 Apr 2026 08:26:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:a041:e04f:2600:a0c9:1d35:8283:f96b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2d3811sm70049655e9.3.2026.04.30.08.26.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 08:26:56 -0700 (PDT)
From: "SnailSploit | Kai Aizen" <kai.aizen.dev@gmail.com>
X-Google-Original-From: SnailSploit | Kai Aizen <95986478+SnailSploit@users.noreply.github.com>
To: netdev@vger.kernel.org
Cc: stable@vger.kernel.org,
	jmaloy@redhat.com,
	ying.xue@windriver.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tipc-discussion@lists.sourceforge.net,
	tung.q.nguyen@dektech.com.au,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	"SnailSploit | Kai Aizen" <95986478+SnailSploit@users.noreply.github.com>,
	syzbot ci <syzbot+ci779e8ed86620f383@syzkaller.appspotmail.com>
Subject: [PATCH net v3] tipc: fix UAF race in tipc_mon_peer_up/down/remove_peer vs bearer teardown
Date: Thu, 30 Apr 2026 18:26:54 +0300
Message-ID: <80ae67e96de2f702028e5bacc89db4575e1531ca.1777559945.git.kai.aizen.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CALynFi5d0DuGW50xq7xQnsDPdEuN5jBGTqh8bcsUwxk6L-FAdA@mail.gmail.com>
References: <CALynFi5d0DuGW50xq7xQnsDPdEuN5jBGTqh8bcsUwxk6L-FAdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "SnailSploit | Kai Aizen" <95986478+SnailSploit@users.noreply.github.com>

CVE-2025-40280 fixed tipc_mon_reinit_self() accessing monitors[] from a
workqueue without RTNL.  That patch closed the workqueue path by adding
rtnl_lock() around the call.

However, three additional functions in the same subsystem access
tipc_net->monitors[] from softirq context with no RCU protection at all:

  tipc_mon_peer_up()     - called from tipc_node_write_unlock()
  tipc_mon_peer_down()   - called from tipc_node_write_unlock()
  tipc_mon_remove_peer() - called from tipc_node_link_down()

These are invoked from the packet receive path (tipc_rcv ->
tipc_node_write_unlock / tipc_node_link_down) and hold only the per-node
rwlock, not RTNL.

Concurrently, bearer_disable() -- which always holds RTNL -- calls
tipc_mon_delete(), which sets tn->monitors[bearer_id] = NULL and then
kfree(mon) without an RCU grace period. A softirq reader can observe
the non-NULL slot, take a reference, get preempted, and resume after
kfree(mon) on another CPU, dereferencing freed memory.

Convert monitors[] to __rcu, use rcu_assign_pointer() on creation,
RCU_INIT_POINTER() + synchronize_rcu() on deletion before kfree(), and
the appropriate dereference variant at each read site:

  - tipc_monitor() returns rcu_dereference_bh(...) for softirq callers
    (tipc_mon_peer_up/down/remove_peer/rcv/prep/get_state).
  - tipc_monitor_rtnl() returns rtnl_dereference(...) for RTNL-held
    callers (tipc_mon_delete via bearer_disable, tipc_mon_reinit_self
    via tipc_net_finalize_work which wraps in rtnl_lock(), and the
    netlink dump handlers tipc_nl_add_monitor_peer /
    __tipc_nl_add_monitor).

Also, get_self() was a thin wrapper over tipc_monitor() + ->self deref,
duplicating the RCU-checked load that callers already perform on entry.
With monitors[] becoming __rcu, get_self()'s use of tipc_monitor()
generates a lockdep splat in tipc_mon_delete() (RTNL context) because
the inner load is rcu_dereference_bh().  syzbot CI reported this on
v1/v2 of this patch:

  WARNING: suspicious RCU usage in tipc_mon_delete
  net/tipc/monitor.c:108 suspicious rcu_dereference_check() usage!
  ...
  tipc_monitor_rcu_bh+0xf5/0x110  net/tipc/monitor.c:108
  get_self                        net/tipc/monitor.c:209
  tipc_mon_delete+0x10b/0x4d0     net/tipc/monitor.c:704

Drop get_self() entirely.  Each existing caller already has a valid
mon pointer from its initial RCU-correct load, and mon->self is the
result get_self() was returning.  Replace each "self = get_self(...)"
with "self = mon->self;".  This both removes the duplicate dereference
and fixes the lockdep splat.

synchronize_rcu() in tipc_mon_delete() is placed after
write_unlock_bh() and before timer_shutdown_sync() + kfree() so all
softirq readers that already observed the old pointer have completed
before the memory is freed.

Fixes: 35c55c9877f8 ("tipc: add neighbor monitoring framework")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604301148.jfXKC9HF-lkp@intel.com/
Reported-by: syzbot ci <syzbot+ci779e8ed86620f383@syzkaller.appspotmail.com>
Closes: https://ci.syzbot.org/series/6267bc07-4172-4821-b3e5-dac381479d9d
Signed-off-by: SnailSploit | Kai Aizen <95986478+SnailSploit@users.noreply.github.com>
---
 net/tipc/core.h    |  2 +-
 net/tipc/monitor.c | 42 +++++++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/net/tipc/core.h b/net/tipc/core.h
index 9ce5f9ff6..cd582f7a2 100644
--- a/net/tipc/core.h
+++ b/net/tipc/core.h
@@ -109,7 +109,7 @@ struct tipc_net {
 	u32 num_links;
 
 	/* Neighbor monitoring list */
-	struct tipc_monitor *monitors[MAX_BEARERS];
+	struct tipc_monitor __rcu *monitors[MAX_BEARERS];
 	int mon_threshold;
 
 	/* Bearer list */
diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
index a94b9b36a..0095a62ae 100644
--- a/net/tipc/monitor.c
+++ b/net/tipc/monitor.c
@@ -99,7 +99,14 @@ struct tipc_monitor {
 
 static struct tipc_monitor *tipc_monitor(struct net *net, int bearer_id)
 {
-	return tipc_net(net)->monitors[bearer_id];
+	return rcu_dereference_bh(tipc_net(net)->monitors[bearer_id]);
+}
+
+/* tipc_monitor_rtnl - dereference monitors[] from RTNL-held control path. */
+static struct tipc_monitor * __maybe_unused
+tipc_monitor_rtnl(struct net *net, int bearer_id)
+{
+	return rtnl_dereference(tipc_net(net)->monitors[bearer_id]);
 }
 
 const int tipc_max_domain_size = sizeof(struct tipc_mon_domain);
@@ -192,13 +199,6 @@ static struct tipc_peer *get_peer(struct tipc_monitor *mon, u32 addr)
 	return NULL;
 }
 
-static struct tipc_peer *get_self(struct net *net, int bearer_id)
-{
-	struct tipc_monitor *mon = tipc_monitor(net, bearer_id);
-
-	return mon->self;
-}
-
 static inline bool tipc_mon_is_active(struct net *net, struct tipc_monitor *mon)
 {
 	struct tipc_net *tn = tipc_net(net);
@@ -358,7 +358,7 @@ void tipc_mon_remove_peer(struct net *net, u32 addr, int bearer_id)
 	if (!mon)
 		return;
 
-	self = get_self(net, bearer_id);
+	self = mon->self;
 	write_lock_bh(&mon->lock);
 	peer = get_peer(mon, addr);
 	if (!peer)
@@ -422,9 +422,12 @@ static bool tipc_mon_add_peer(struct tipc_monitor *mon, u32 addr,
 void tipc_mon_peer_up(struct net *net, u32 addr, int bearer_id)
 {
 	struct tipc_monitor *mon = tipc_monitor(net, bearer_id);
-	struct tipc_peer *self = get_self(net, bearer_id);
+	struct tipc_peer *self;
 	struct tipc_peer *peer, *head;
 
+	if (!mon)
+		return;
+	self = mon->self;
 	write_lock_bh(&mon->lock);
 	peer = get_peer(mon, addr);
 	if (!peer && !tipc_mon_add_peer(mon, addr, &peer))
@@ -449,7 +452,7 @@ void tipc_mon_peer_down(struct net *net, u32 addr, int bearer_id)
 	if (!mon)
 		return;
 
-	self = get_self(net, bearer_id);
+	self = mon->self;
 	write_lock_bh(&mon->lock);
 	peer = get_peer(mon, addr);
 	if (!peer) {
@@ -651,7 +654,7 @@ int tipc_mon_create(struct net *net, int bearer_id)
 	struct tipc_peer *self;
 	struct tipc_mon_domain *dom;
 
-	if (tn->monitors[bearer_id])
+	if (rtnl_dereference(tn->monitors[bearer_id]))
 		return 0;
 
 	mon = kzalloc_obj(*mon, GFP_ATOMIC);
@@ -663,7 +666,7 @@ int tipc_mon_create(struct net *net, int bearer_id)
 		kfree(dom);
 		return -ENOMEM;
 	}
-	tn->monitors[bearer_id] = mon;
+	rcu_assign_pointer(tn->monitors[bearer_id], mon);
 	rwlock_init(&mon->lock);
 	mon->net = net;
 	mon->peer_cnt = 1;
@@ -682,16 +685,16 @@ int tipc_mon_create(struct net *net, int bearer_id)
 void tipc_mon_delete(struct net *net, int bearer_id)
 {
 	struct tipc_net *tn = tipc_net(net);
-	struct tipc_monitor *mon = tipc_monitor(net, bearer_id);
+	struct tipc_monitor *mon = tipc_monitor_rtnl(net, bearer_id);
 	struct tipc_peer *self;
 	struct tipc_peer *peer, *tmp;
 
 	if (!mon)
 		return;
 
-	self = get_self(net, bearer_id);
+	self = mon->self;
+	RCU_INIT_POINTER(tn->monitors[bearer_id], NULL);
 	write_lock_bh(&mon->lock);
-	tn->monitors[bearer_id] = NULL;
 	list_for_each_entry_safe(peer, tmp, &self->list, list) {
 		list_del(&peer->list);
 		hlist_del(&peer->hash);
@@ -700,6 +703,7 @@ void tipc_mon_delete(struct net *net, int bearer_id)
 	}
 	mon->self = NULL;
 	write_unlock_bh(&mon->lock);
+	synchronize_rcu();
 	timer_shutdown_sync(&mon->timer);
 	kfree(self->domain);
 	kfree(self);
@@ -712,7 +716,7 @@ void tipc_mon_reinit_self(struct net *net)
 	int bearer_id;
 
 	for (bearer_id = 0; bearer_id < MAX_BEARERS; bearer_id++) {
-		mon = tipc_monitor(net, bearer_id);
+		mon = tipc_monitor_rtnl(net, bearer_id);
 		if (!mon)
 			continue;
 		write_lock_bh(&mon->lock);
@@ -798,7 +802,7 @@ static int __tipc_nl_add_monitor_peer(struct tipc_peer *peer,
 int tipc_nl_add_monitor_peer(struct net *net, struct tipc_nl_msg *msg,
 			     u32 bearer_id, u32 *prev_node)
 {
-	struct tipc_monitor *mon = tipc_monitor(net, bearer_id);
+	struct tipc_monitor *mon = tipc_monitor_rtnl(net, bearer_id);
 	struct tipc_peer *peer;
 
 	if (!mon)
@@ -827,7 +831,7 @@ int tipc_nl_add_monitor_peer(struct net *net, struct tipc_nl_msg *msg,
 int __tipc_nl_add_monitor(struct net *net, struct tipc_nl_msg *msg,
 			  u32 bearer_id)
 {
-	struct tipc_monitor *mon = tipc_monitor(net, bearer_id);
+	struct tipc_monitor *mon = tipc_monitor_rtnl(net, bearer_id);
 	char bearer_name[TIPC_MAX_BEARER_NAME];
 	struct nlattr *attrs;
 	void *hdr;
-- 
2.43.0

