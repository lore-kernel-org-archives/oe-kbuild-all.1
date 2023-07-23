Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7D3C1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 23:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690155637; x=1721691637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dIO/lKZ3RvDukFeLAndX33aYOqDykJAVWRubyDhAONQ=;
  b=WZRTMEWx3RPLGGN/aZx15mM7YcUcJYTAFM2/gM+M6ybJhANgnLz+lTCc
   26QudioOX/J4eN9IWT+cAMS2UQlCxFSH/lQIMJCu7fCVdx2GHIpVJFK1h
   dCeNXE3LbEBaj8RDZiIUXF2ef47rsAY9mOTsN+GZvMeD5X5y58rIL0kIe
   0d4PlYKxYBfYmFBbRCcsOTyq7jrkiA1g176yDSVjdMbwjCKLFOCO9QNXy
   YUzho3lc/SkKvn7crx11egBNQdXFi9ZyH4i9I+QQcTA4rv2PSIfzBaW+G
   NecNOD/BGhWLrqgXUueeT3XGT7KXiGKatDIino2PGmEGsp9Imus+W791G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433555309"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="433555309"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 16:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="702661721"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="702661721"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2023 16:40:36 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNigm-0009LK-0S;
	Sun, 23 Jul 2023 23:40:36 +0000
Date: Mon, 24 Jul 2023 07:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 418/427]
 net/ipv4/inet_connection_sock.c:1105:9: error: implicit declaration of
 function 'reuseport_migrate_sock'
Message-ID: <202307240703.5G5REGJq-lkp@intel.com>
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
config: hexagon-randconfig-r003-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240703.5G5REGJq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240703.5G5REGJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240703.5G5REGJq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/inet_connection_sock.c:1105:9: error: implicit declaration of function 'reuseport_migrate_sock' [-Werror,-Wimplicit-function-declaration]
    1105 |                 nsk = reuseport_migrate_sock(sk, child, NULL);
         |                       ^
>> net/ipv4/inet_connection_sock.c:1105:7: error: incompatible integer to pointer conversion assigning to 'struct sock *' from 'int' [-Wint-conversion]
    1105 |                 nsk = reuseport_migrate_sock(sk, child, NULL);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/reuseport_migrate_sock +1105 net/ipv4/inet_connection_sock.c

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
