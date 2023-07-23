Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AEE3C1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 23:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690153823; x=1721689823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYctAH7um+UEOWYNlDpoFacdnMv+ZaQIhsLDn3/WvDE=;
  b=Szx/RDB0XUXgDCSXjUOYwWLEs3hj7VzUEWccAgf7j4IWHiyt4vgLvL+0
   d07zd3wf5ptbToybuIO6A3QxELRtrE0rSBiUoKSJE20F6NdsJ/VmI5ofm
   rs22ffUEIQ3yF2KX0+Y8aYcUNioVOS0tcayopvOZZLpjVDYTq0Z/jj0e6
   OlRclriQRHcJZz3XZKrBX/5FnKRpsHop1Auce14wB5k3RTC9sBhWVipZJ
   GHIK9d60rNg6iylUgRV8M3uTvQyiny80nKYenGVi5qomwAvi4xUtDENO3
   SMuHhT3lOFQlixdsU4aH1Mj+C+u+wE6cdG2RHkWgOUpNkjxNjNVmJKBa/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="431110353"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="431110353"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 16:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="755100693"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="755100693"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Jul 2023 16:10:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNiDU-0009KT-2S;
	Sun, 23 Jul 2023 23:10:20 +0000
Date: Mon, 24 Jul 2023 07:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 418/427]
 net/ipv4/inet_connection_sock.c:1105:21: warning: assignment to 'struct sock
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202307240703.3PnrASdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   f414af0d5334f8d1a8cff50f50e6fb3921d490c4
commit: 7c133f1460cf14b5461dd14ea7ea8da69f1d9254 [418/427] tcp: Migrate TCP_ESTABLISHED/TCP_SYN_RECV sockets in accept queues.
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230724/202307240703.3PnrASdZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240703.3PnrASdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240703.3PnrASdZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/inet_connection_sock.c: In function 'inet_csk_listen_stop':
   net/ipv4/inet_connection_sock.c:1105:23: error: implicit declaration of function 'reuseport_migrate_sock'; did you mean 'reuseport_select_sock'? [-Werror=implicit-function-declaration]
    1105 |                 nsk = reuseport_migrate_sock(sk, child, NULL);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       reuseport_select_sock
>> net/ipv4/inet_connection_sock.c:1105:21: warning: assignment to 'struct sock *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1105 |                 nsk = reuseport_migrate_sock(sk, child, NULL);
         |                     ^
   cc1: some warnings being treated as errors


vim +1105 net/ipv4/inet_connection_sock.c

  1077	
  1078	/*
  1079	 *	This routine closes sockets which have been at least partially
  1080	 *	opened, but not yet accepted.
  1081	 */
  1082	void inet_csk_listen_stop(struct sock *sk)
  1083	{
  1084		struct inet_connection_sock *icsk = inet_csk(sk);
  1085		struct request_sock_queue *queue = &icsk->icsk_accept_queue;
  1086		struct request_sock *next, *req;
  1087	
  1088		/* Following specs, it would be better either to send FIN
  1089		 * (and enter FIN-WAIT-1, it is normal close)
  1090		 * or to send active reset (abort).
  1091		 * Certainly, it is pretty dangerous while synflood, but it is
  1092		 * bad justification for our negligence 8)
  1093		 * To be honest, we are not able to make either
  1094		 * of the variants now.			--ANK
  1095		 */
  1096		while ((req = reqsk_queue_remove(queue, sk)) != NULL) {
  1097			struct sock *child = req->sk, *nsk;
  1098			struct request_sock *nreq;
  1099	
  1100			local_bh_disable();
  1101			bh_lock_sock(child);
  1102			WARN_ON(sock_owned_by_user(child));
  1103			sock_hold(child);
  1104	
> 1105			nsk = reuseport_migrate_sock(sk, child, NULL);
  1106			if (nsk) {
  1107				nreq = inet_reqsk_clone(req, nsk);
  1108				if (nreq) {
  1109					refcount_set(&nreq->rsk_refcnt, 1);
  1110	
  1111					if (inet_csk_reqsk_queue_add(nsk, nreq, child)) {
  1112						reqsk_migrate_reset(req);
  1113					} else {
  1114						reqsk_migrate_reset(nreq);
  1115						__reqsk_free(nreq);
  1116					}
  1117	
  1118					/* inet_csk_reqsk_queue_add() has already
  1119					 * called inet_child_forget() on failure case.
  1120					 */
  1121					goto skip_child_forget;
  1122				}
  1123			}
  1124	
  1125			inet_child_forget(sk, req, child);
  1126	skip_child_forget:
  1127			reqsk_put(req);
  1128			bh_unlock_sock(child);
  1129			local_bh_enable();
  1130			sock_put(child);
  1131	
  1132			cond_resched();
  1133		}
  1134		if (queue->fastopenq.rskq_rst_head) {
  1135			/* Free all the reqs queued in rskq_rst_head. */
  1136			spin_lock_bh(&queue->fastopenq.lock);
  1137			req = queue->fastopenq.rskq_rst_head;
  1138			queue->fastopenq.rskq_rst_head = NULL;
  1139			spin_unlock_bh(&queue->fastopenq.lock);
  1140			while (req != NULL) {
  1141				next = req->dl_next;
  1142				reqsk_put(req);
  1143				req = next;
  1144			}
  1145		}
  1146		WARN_ON_ONCE(sk->sk_ack_backlog);
  1147	}
  1148	EXPORT_SYMBOL_GPL(inet_csk_listen_stop);
  1149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
