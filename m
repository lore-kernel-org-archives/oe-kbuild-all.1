Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8246AAC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690151279; x=1721687279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=csN9hoMTTykcVuhN7h5aDpz+RyLCqyej+nlxuoGN6h4=;
  b=ZwudqwGvimtxLYxanWgBoVhwwZ8ZVhLfCx9gD86ZZfJel6cbDZkxFAE1
   hDZCQ1/1z/8BV3DCFD6zb+KEJT04aeMODMwtaAs/9vxC4GmSBFPEJ/xFz
   Y5TDLKWVYMjeI5czJtuDNWsRASWzyDAHPemv8HUT7NTK0kcRW8Z8hMFsO
   WYzjeRdfFkUxfOFDjbJTwxtWPoSCBhhKSby+jhBqyCIjv0uVtBXj7pzVv
   49Oeec77wR3C+MfkScjlleHpN9+pf6WZPkVscXPZOHF2z+Ym/r0bAoZN+
   c0SV3iAv6kxaZIhiCNSdFMC2ypA4bLP7kG7VuUgy4s9zCep0YzwXTZ0MK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433551352"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="433551352"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 15:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="849426433"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849426433"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 23 Jul 2023 15:27:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNhYU-0009Iz-2Q;
	Sun, 23 Jul 2023 22:27:58 +0000
Date: Mon, 24 Jul 2023 06:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 418/427]
 net/ipv4/inet_connection_sock.c:1105:9: error: implicit declaration of
 function 'reuseport_migrate_sock'
Message-ID: <202307240605.peUpkKTN-lkp@intel.com>
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
config: s390-randconfig-r044-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240605.peUpkKTN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240605.peUpkKTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240605.peUpkKTN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from net/ipv4/inet_connection_sock.c:15:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:19:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from net/ipv4/inet_connection_sock.c:15:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:19:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from net/ipv4/inet_connection_sock.c:15:
   In file included from include/net/inet_connection_sock.h:21:
   In file included from include/net/inet_sock.h:19:
   In file included from include/linux/netdevice.h:37:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> net/ipv4/inet_connection_sock.c:1105:9: error: implicit declaration of function 'reuseport_migrate_sock' [-Werror,-Wimplicit-function-declaration]
                   nsk = reuseport_migrate_sock(sk, child, NULL);
                         ^
>> net/ipv4/inet_connection_sock.c:1105:7: warning: incompatible integer to pointer conversion assigning to 'struct sock *' from 'int' [-Wint-conversion]
                   nsk = reuseport_migrate_sock(sk, child, NULL);
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 1 error generated.


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
