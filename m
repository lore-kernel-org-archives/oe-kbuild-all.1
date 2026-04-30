Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954730FC34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563662; cv=none; b=sFm8i3YPQcFxysz+XWmn4hWZwk5vFTIFVhCgfnEt9u4NwxjUrzKLSlROid0y/Z8JzEGTZd4KTHcckqQ/dTOxytpYpZxBkraf0bMDcZcrsDnz/TYczVshmvs/dbw8Hdc4wAvZtvf9USaO5duZUgt4EX9msRhrkb7Tw/opN3NXjxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563662; c=relaxed/simple;
	bh=6F4FIqvRlAxLMiyzjB1a0Loef1xYOuziOaEvpkQ9tjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faNNzOmvmDuCGUHmAx60FXJqvyUxhdX0Dq2zWoV2kyN9IOHdZWmb+6mUQpOSUOzdZ5HbG6XJkg0cihIG9DAl0LypXG7mVhQqDAZ57XJwvWgCa4vYv0FqNQtRg6Zw8Vgzbtx1ZP1au7vVirhu2VbNfrfi2iZHaL+Q3IUnF5hhzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rd5OUgGv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rd5OUgGv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso13795065e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777563659; x=1778168459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MHpRBHdNTVeiHYde/smY3bJSKHcAn6/QCWkGp6rSLM=;
        b=rd5OUgGvSn0cqGlta2t8oIJGbrSNeZiN0nqN4UGc43X5NJQ+GTlITmH1dskDjqC7fs
         96Unri7zphyt3pOrT99OR6DLWMwoYwp7MtDhCr5oAiy8esIzZuzK5lZrMwVt1AgVL3+i
         Hexo2sHB0HEVy4/i/HkKUopdrn22wCzUNNN88kxzdrm9eUS/GkcI5d61XJO+2wtVTICC
         GQRSz0q0p4OsFSzW3rTmTFLt4t9knP6M/4uDQPgZJZQdzxWBG4IfPwNuLXYeQ/gcRjjX
         0BnT4ugKJJ6eTjQcgxDGAKEac1MhAIxdF2/A1wEEd2wm/VkSkN/i8QTTnyIjrvoDt8Yy
         kLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563659; x=1778168459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MHpRBHdNTVeiHYde/smY3bJSKHcAn6/QCWkGp6rSLM=;
        b=d9qef0dF5I2hAkC20wW5XEDBCgwhFmeb0et/HqqQie2Zrxl+eR1msXcjGEe0zbrxnD
         cZ3+8I0G7JZGq3FxyqobRQYeycpzn5ThLtlcTKeb/RcpqKeHD5vAIN1p/KlkLjJjeX4e
         tlmw4Nm4ElORc50ucHy7fbsS7H2U7/+aSsoS0aueqk2a9a9THkjZHf6Cm6Xf3zQQxJnW
         qStxUBWgqx/K9sjq7EqRp5O4+cFO25OQPYiRCaLFrrHlAwled8Fmy8ThI2Fw/gZK0d1E
         YzBLulo+iU1ltuKqMelml1Zp02COoqNFKXKS564LOOEyiSJYVqjXxMSAv0NLXhMChx2E
         WmfA==
X-Forwarded-Encrypted: i=1; AFNElJ8FjtNi9jGN8Uaf9v8A4kzovnoYvqcsnaw4nU56R4b3pAFlug66t5jkF79pYvMQo0eTUKCDmxjZpUaKE8eF@lists.linux.dev
X-Gm-Message-State: AOJu0YwyxbBnAGM9W8PxigPRVBXNPV9L73sfDtcQIWci4FFM3wTDcOa3
	N6Q821OAaT8M7Zwb/Newd3J8Xt2Bwo9mgPntTcTHJ5vEiRoe34rl+MqLIn88/H/kc9LVRw==
X-Gm-Gg: AeBDieta8NnJQ7Bb8Ibl/SOY+R6ZrvKwGzTYsThYkN3UmgFBDBN5nQczhtOyRxP2ViT
	h6vageU46QtUWGvXrFbAlu4jrzccaysLyrteS1RPl68F8cyp7CqzqdzK6rH0MdCxbzlpOMSjCpw
	IZDQcEWtJPmCRxRnE3VqWi0cg4UFix6JxX0sbr5wtf0Np+WjGluybN3Ub9RA3LUSieo9mqhJguG
	I/dT1x/m3Q4hGvWLx81RFigRSeLYc9sZTGtxSuB2b5y+tZX+ikmNhqTegYBVxLkOhFIiAjEPaf9
	oGEtg7h7nQ208AGyOQlX7Kcsd6mzPU0xaBuNkTdUqOfc0Z7m8TQSjTR7Vpg5IMV0cSgqN37ncGf
	jBlRrkeMf3GnN/BQp2iuuMt62Mmf3v01u3VkaxqWIIXGHBvjf2jKWBFT5LzistJVXmVViFg5L2V
	2mfs628aFh9mfbLMEcfQPZ+FOeVS32RObJ6sHJM2Fw2oi/L4O5kqqbXMcbZXVoTTcs8zkXddyVE
	/BI3TJBFMfsGAxo/Mz7lG2CPQT6C7163V/OYA==
X-Received: by 2002:a05:600c:c10b:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48a8445876dmr49276425e9.24.1777563659236;
        Thu, 30 Apr 2026 08:40:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:a041:e04f:2600:f9d2:9c9e:9a42:5d91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c31fb8asm43928545e9.30.2026.04.30.08.40.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 08:40:58 -0700 (PDT)
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
Date: Thu, 30 Apr 2026 18:40:55 +0300
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
Message-ID: <20260430154055.ItGy8Ehuc7RGk6Z9zchOEodw_WihnLUQoOxgxiLsL8U@z>

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

