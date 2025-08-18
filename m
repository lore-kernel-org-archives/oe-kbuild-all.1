Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621D322743
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531646; cv=none; b=ZgYxieoFlWHcQXu2543Sh5O19x2zEI0xp5jsAuS6hf6BGDWVOfdiNKggLQPU1pbTstTkNRJYXLlPsZf6f3HSXpHXJgJKA5Xueow08PlQM2Up/WqL/rgTc8ICSaTnKcGJls0qHcQ+GWeD6XnEdmwpbSn6AOWoZVQa1xCCfdeCncA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531646; c=relaxed/simple;
	bh=/gZzvAKPo/JHHUSG2AbXl7rdaMMAkL+hSCutmhwJp0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eci8g0GnDzYNPTE5PnXvEBZxtI54yrF+1O0iOEbDAXaUI0cKA9ucWokR+LR3tB0mIn6geFH06nf+5Bdot2I6V6kZ5liSa36d74fc82ZoK77EVTNEwh+FsOYAmr0QFYb1PhYUXOXGZmWV1/5q9TQvTN8m2eik7JvIAbS+c55s6AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LknZeG2f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LknZeG2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755531645; x=1787067645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/gZzvAKPo/JHHUSG2AbXl7rdaMMAkL+hSCutmhwJp0U=;
  b=LknZeG2fLzfoI+NjVq7/dBhqUI7VG9+bbyO0w6KwACwcX0NPx5NDs4WI
   IUi7BOgysfc3AbdEt2h9kNUcmR/RpML5HpYwbp40Sb+AZjbwDHi8MTUnP
   4hf+CfDSlzejGC14mM1rAlGmnPYtxWGTdIvLyL6CdP8gX5Me2Qu7aRhyC
   0FGp6YxBx5k6jRQXCoAtVjoWSQYG3+ByMuXcK6EHlRsm21z9eDCKpYmRC
   nLv5HMCHxKdGlz1vOmXSevox1za07f2cVdPSgfkWXEmBbZgXC0l90OBkN
   oABL6MIi+bv6+8+PFIneDh3lKXZ07Ju2l2djLCORy7BjsgFxjsRUVQlrG
   g==;
X-CSE-ConnectionGUID: pks1XKilRh2Fwtg0OW/E0A==
X-CSE-MsgGUID: 4DWmM7YjQfyf9iHsDCmL1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57470414"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57470414"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 08:40:28 -0700
X-CSE-ConnectionGUID: oRIU6DuiQemeNh07Q9qQYA==
X-CSE-MsgGUID: S081KzNcQJifKEk3q9QooQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172031265"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2025 08:40:27 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo1yC-00016h-0I;
	Mon, 18 Aug 2025 15:40:24 +0000
Date: Mon, 18 Aug 2025 17:39:36 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] net/ipv4/tcp_output.c:1312:5: warning:
 variable 'tcp_hdr_rsrvd_4b' set but not used
Message-ID: <202508181721.Nui6OZLt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chengjunjia,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: abe6bde15def9470fe18af30626e62d51f651dd9 [2687/2687] net: tcp: Modify codes for better compatibility of code format
config: x86_64-buildonly-randconfig-2002-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181721.Nui6OZLt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181721.Nui6OZLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181721.Nui6OZLt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_output.c:40:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   net/ipv4/tcp_output.c:186:3: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     186 |                 NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     187 |                               tp->compressed_ack);
         |                               ~~~~~~~~~~~~~~~~~~~
   include/net/ip.h:302:41: note: expanded from macro 'NET_ADD_STATS'
     302 | #define NET_ADD_STATS(net, field, adnd) SNMP_ADD_STATS((net)->mib.net_statistics, field, adnd)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/snmp.h:143:4: note: expanded from macro 'SNMP_ADD_STATS'
     143 |                         this_cpu_add(mib->mibs[field], addend)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:491:33: note: expanded from macro 'this_cpu_add'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:64:1: note: expanded from here
      64 | this_cpu_add_8
         | ^
   arch/x86/include/asm/percpu.h:370:35: note: expanded from macro 'this_cpu_add_8'
     370 | #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
     127 |                               ((val) == 1 || (val) == -1)) ?            \
         |                                              ~~~~~ ^  ~~
>> net/ipv4/tcp_output.c:1312:5: warning: variable 'tcp_hdr_rsrvd_4b' set but not used [-Wunused-but-set-variable]
    1312 |         u8 tcp_hdr_rsrvd_4b;
         |            ^
   3 warnings generated.


vim +/tcp_hdr_rsrvd_4b +1312 net/ipv4/tcp_output.c

  1286	
  1287	/* This routine actually transmits TCP packets queued in by
  1288	 * tcp_do_sendmsg().  This is used by both the initial
  1289	 * transmission and possible later retransmissions.
  1290	 * All SKB's seen here are completely headerless.  It is our
  1291	 * job to build the TCP header, and pass the packet down to
  1292	 * IP so it can do the same plus pass the packet off to the
  1293	 * device.
  1294	 *
  1295	 * We are working here with either a clone of the original
  1296	 * SKB, or a fresh unique copy made by the retransmit engine.
  1297	 */
  1298	static int __tcp_transmit_skb(struct sock *sk, struct sk_buff *skb,
  1299				      int clone_it, gfp_t gfp_mask, u32 rcv_nxt)
  1300	{
  1301		const struct inet_connection_sock *icsk = inet_csk(sk);
  1302		struct inet_sock *inet;
  1303		struct tcp_sock *tp;
  1304		struct tcp_skb_cb *tcb;
  1305		struct tcp_out_options opts;
  1306		unsigned int tcp_options_size, tcp_header_size;
  1307		struct sk_buff *oskb = NULL;
  1308		struct tcp_md5sig_key *md5;
  1309		struct tcphdr *th;
  1310		u64 prior_wstamp;
  1311		int err;
> 1312		u8 tcp_hdr_rsrvd_4b;
  1313	
  1314		BUG_ON(!skb || !tcp_skb_pcount(skb));
  1315		tcp_hdr_rsrvd_4b = try_to_update_skb_for_caqm(sk, skb);
  1316		tp = tcp_sk(sk);
  1317		prior_wstamp = tp->tcp_wstamp_ns;
  1318		tp->tcp_wstamp_ns = max(tp->tcp_wstamp_ns, tp->tcp_clock_cache);
  1319		skb_set_delivery_time(skb, tp->tcp_wstamp_ns, true);
  1320		if (clone_it) {
  1321			oskb = skb;
  1322	
  1323			tcp_skb_tsorted_save(oskb) {
  1324				if (unlikely(skb_cloned(oskb)))
  1325					skb = pskb_copy(oskb, gfp_mask);
  1326				else
  1327					skb = skb_clone(oskb, gfp_mask);
  1328			} tcp_skb_tsorted_restore(oskb);
  1329	
  1330			if (unlikely(!skb))
  1331				return -ENOBUFS;
  1332			/* retransmit skbs might have a non zero value in skb->dev
  1333			 * because skb->dev is aliased with skb->rbnode.rb_left
  1334			 */
  1335			skb->dev = NULL;
  1336		}
  1337	
  1338		inet = inet_sk(sk);
  1339		tcb = TCP_SKB_CB(skb);
  1340		memset(&opts, 0, sizeof(opts));
  1341	
  1342		if (unlikely(tcb->tcp_flags & TCPHDR_SYN)) {
  1343			tcp_options_size = tcp_syn_options(sk, skb, &opts, &md5);
  1344		} else {
  1345			tcp_options_size = tcp_established_options(sk, skb, &opts,
  1346								   &md5);
  1347			/* Force a PSH flag on all (GSO) packets to expedite GRO flush
  1348			 * at receiver : This slightly improve GRO performance.
  1349			 * Note that we do not force the PSH flag for non GSO packets,
  1350			 * because they might be sent under high congestion events,
  1351			 * and in this case it is better to delay the delivery of 1-MSS
  1352			 * packets and thus the corresponding ACK packet that would
  1353			 * release the following packet.
  1354			 */
  1355			if (tcp_skb_pcount(skb) > 1)
  1356				tcb->tcp_flags |= TCPHDR_PSH;
  1357		}
  1358		tcp_header_size = tcp_options_size + sizeof(struct tcphdr);
  1359	
  1360		/* We set skb->ooo_okay to one if this packet can select
  1361		 * a different TX queue than prior packets of this flow,
  1362		 * to avoid self inflicted reorders.
  1363		 * The 'other' queue decision is based on current cpu number
  1364		 * if XPS is enabled, or sk->sk_txhash otherwise.
  1365		 * We can switch to another (and better) queue if:
  1366		 * 1) No packet with payload is in qdisc/device queues.
  1367		 *    Delays in TX completion can defeat the test
  1368		 *    even if packets were already sent.
  1369		 * 2) Or rtx queue is empty.
  1370		 *    This mitigates above case if ACK packets for
  1371		 *    all prior packets were already processed.
  1372		 */
  1373		skb->ooo_okay = sk_wmem_alloc_get(sk) < SKB_TRUESIZE(1) ||
  1374				tcp_rtx_queue_empty(sk);
  1375	
  1376		/* If we had to use memory reserve to allocate this skb,
  1377		 * this might cause drops if packet is looped back :
  1378		 * Other socket might not have SOCK_MEMALLOC.
  1379		 * Packets not looped back do not care about pfmemalloc.
  1380		 */
  1381		skb->pfmemalloc = 0;
  1382	
  1383		skb_push(skb, tcp_header_size);
  1384		skb_reset_transport_header(skb);
  1385	
  1386		skb_orphan(skb);
  1387		skb->sk = sk;
  1388		skb->destructor = skb_is_tcp_pure_ack(skb) ? __sock_wfree : tcp_wfree;
  1389		refcount_add(skb->truesize, &sk->sk_wmem_alloc);
  1390	
  1391		skb_set_dst_pending_confirm(skb, READ_ONCE(sk->sk_dst_pending_confirm));
  1392	
  1393		/* Build TCP header and checksum it. */
  1394		th = (struct tcphdr *)skb->data;
  1395		th->source		= inet->inet_sport;
  1396		th->dest		= inet->inet_dport;
  1397		th->seq			= htonl(tcb->seq);
  1398		th->ack_seq		= htonl(rcv_nxt);
  1399		*(((__be16 *)th) + 6)	= htons(((tcp_header_size >> 2) << 12) |
  1400						tcb->tcp_flags);
  1401	#ifdef CONFIG_ETH_CAQM
  1402		if (static_branch_unlikely(&sysctl_caqm_enable))
  1403			*(((__be16 *)th) + 6)	|= htons((tcp_hdr_rsrvd_4b & 0x0F) << 8);
  1404	#endif
  1405	
  1406		th->check		= 0;
  1407		th->urg_ptr		= 0;
  1408	
  1409		/* The urg_mode check is necessary during a below snd_una win probe */
  1410		if (unlikely(tcp_urg_mode(tp) && before(tcb->seq, tp->snd_up))) {
  1411			if (before(tp->snd_up, tcb->seq + 0x10000)) {
  1412				th->urg_ptr = htons(tp->snd_up - tcb->seq);
  1413				th->urg = 1;
  1414			} else if (after(tcb->seq + 0xFFFF, tp->snd_nxt)) {
  1415				th->urg_ptr = htons(0xFFFF);
  1416				th->urg = 1;
  1417			}
  1418		}
  1419	
  1420		skb_shinfo(skb)->gso_type = sk->sk_gso_type;
  1421		if (likely(!(tcb->tcp_flags & TCPHDR_SYN))) {
  1422			th->window      = htons(tcp_select_window(sk));
  1423			tcp_ecn_send(sk, skb, th, tcp_header_size);
  1424		} else {
  1425			/* RFC1323: The window in SYN & SYN/ACK segments
  1426			 * is never scaled.
  1427			 */
  1428			th->window	= htons(min(tp->rcv_wnd, 65535U));
  1429		}
  1430	
  1431		tcp_options_write(th, tp, &opts);
  1432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
