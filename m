Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173C5288537
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389699; cv=none; b=Ad2edOrcTfm3GBBsrlXiJFNslPwWk9vlATn80ygPLCQb39hjwpEa4WVhS7mgxbxQWhY2Lnebj5bvLPNTAaaKgUPrT6Jg4WzTY4YGIcofgsbFIXWsrdLrkv8wzI5Sa2aj60Vf7rT94/kf0cXr29/6jGlFfsht46/Dknw+Sv1NM5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389699; c=relaxed/simple;
	bh=XivsxssY0JeAP69cwY24po+6spXhSOKp9UvjM25rzJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEfazm9QT7w448Q5GjLIcKLL3+uxzpKxOEUkhA56Ia7QWeizzY2lAJcDQCF93R7MekxroJJb9OYC2MeJJ1OAK2axLbxGkBn4I7Y4yyTWXf5b0JGAMt859gC0QkFEf4MXxFyHLt46WB7H2SKslPVbEFEiGbHTUrcvFvnKVkavksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DL21SJ3i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DL21SJ3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766389699; x=1797925699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XivsxssY0JeAP69cwY24po+6spXhSOKp9UvjM25rzJU=;
  b=DL21SJ3iiHWRAZW8AmR6Gyr5KRQj5Om9sYsu3THM7TnBHzPKGRrtMWzi
   ZG2Vp8XEVK6MUFk1o0K+vEKB6zo4TzPdZive7e0LuBIx6uVjgdSGUAwgR
   PsxqokCVf0Am3IBBgT5WVbGBG9N7MLY8VrdEFZPH9fBQwv9CMAAagatL0
   /Tnbh5/In6KRLkYBUC3JSWTv0pgvltqAjxnjfrUQr8QO2/P71WCRMYt5U
   ZxT4CLZ0LUxxevtsxSDDC10rjGExduzV6jr8jZnvWdMCXSK3vwtXOrZp5
   SvSu7GzlqDuF7tmorn0bbu0hvIEBptZn5C+KX1sY1MFX+BOlkMJnGxoU6
   A==;
X-CSE-ConnectionGUID: LpRVDjGYT/a1mJnJ2E4swg==
X-CSE-MsgGUID: F2SNEIqoSOyTqqDHp2fPXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="71873583"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="71873583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:48:18 -0800
X-CSE-ConnectionGUID: +FUyrWf+RFW5GUFzUQqHxw==
X-CSE-MsgGUID: h6qnCO74R9KKowk37ZRhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="204403993"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2025 23:48:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXaeL-000000005PA-2FKR;
	Mon, 22 Dec 2025 07:48:13 +0000
Date: Mon, 22 Dec 2025 08:47:30 +0100
From: kernel test robot <lkp@intel.com>
To: Amit Cohen <amcohen@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:xdp 18/36] include/net/libeth/xdp.h:1498:15: error:
 too few arguments to function 'xdp_build_skb_from_buff'
Message-ID: <202512220803.HDjHZnXO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw xdp
head:   2b8b8ddc8690a398f4deb27a032bd473320a6691
commit: a9594ca8b4dea6c838edd404e1c6cc8f58993015 [18/36] xdp: Pass netdevice to xdp_build_skb_from_buff()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251222/202512220803.HDjHZnXO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220803.HDjHZnXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220803.HDjHZnXO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_txrx_lib.c:6:
   include/net/libeth/xdp.h: In function '__libeth_xdp_run_pass':
>> include/net/libeth/xdp.h:1498:15: error: too few arguments to function 'xdp_build_skb_from_buff'
    1498 |         skb = xdp_build_skb_from_buff(&xdp->base);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/net/libeth/rx.h:10,
                    from include/linux/net/intel/libie/rx.h:7,
                    from drivers/net/ethernet/intel/ice/ice_txrx_lib.c:5:
   include/net/xdp.h:377:17: note: declared here
     377 | struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/intel/ice/ice_txrx.c:11:
   include/net/libeth/xdp.h: In function '__libeth_xdp_run_pass':
>> include/net/libeth/xdp.h:1498:15: error: too few arguments to function 'xdp_build_skb_from_buff'
    1498 |         skb = xdp_build_skb_from_buff(&xdp->base);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/events/xdp.h:12,
                    from include/linux/bpf_trace.h:5,
                    from drivers/net/ethernet/intel/ice/ice_txrx.c:9:
   include/net/xdp.h:377:17: note: declared here
     377 | struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_txrx.c: In function 'ice_clean_rx_irq':
>> drivers/net/ethernet/intel/ice/ice_txrx.c:1042:23: error: too few arguments to function 'xdp_build_skb_from_buff'
    1042 |                 skb = xdp_build_skb_from_buff(&xdp->base);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/xdp.h:377:17: note: declared here
     377 | struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from ice_txrx.c:11:
   include/net/libeth/xdp.h: In function '__libeth_xdp_run_pass':
>> include/net/libeth/xdp.h:1498:15: error: too few arguments to function 'xdp_build_skb_from_buff'
    1498 |         skb = xdp_build_skb_from_buff(&xdp->base);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/events/xdp.h:12,
                    from include/linux/bpf_trace.h:5,
                    from ice_txrx.c:9:
   include/net/xdp.h:377:17: note: declared here
     377 | struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   ice_txrx.c: In function 'ice_clean_rx_irq':
   ice_txrx.c:1042:23: error: too few arguments to function 'xdp_build_skb_from_buff'
    1042 |                 skb = xdp_build_skb_from_buff(&xdp->base);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/xdp.h:377:17: note: declared here
     377 | struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +/xdp_build_skb_from_buff +1498 include/net/libeth/xdp.h

4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1425  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1426  /**
5495c58c65aa3d Alexander Lobakin 2025-06-12  1427   * libeth_xdp_run_prog - run XDP program (non-XSk path) and handle all verdicts
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1428   * @xdp: XDP buffer to process
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1429   * @bq: XDP Tx bulk to queue ``XDP_TX`` buffers
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1430   * @fl: driver ``XDP_TX`` bulk flush callback
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1431   *
5495c58c65aa3d Alexander Lobakin 2025-06-12  1432   * Run the attached XDP program and handle all possible verdicts. XSk has its
5495c58c65aa3d Alexander Lobakin 2025-06-12  1433   * own version.
1bb635d3748b71 Alexander Lobakin 2025-06-12  1434   * Prefer using it via LIBETH_XDP_DEFINE_RUN{,_PASS,_PROG}().
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1435   *
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1436   * Return: true if the buffer should be passed up the stack, false if the poll
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1437   * should go to the next buffer.
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1438   */
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1439  #define libeth_xdp_run_prog(xdp, bq, fl)				      \
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1440  	(__libeth_xdp_run_flush(xdp, bq, __libeth_xdp_run_prog,		      \
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1441  				libeth_xdp_tx_queue_bulk,		      \
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1442  				fl) == LIBETH_XDP_PASS)
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1443  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1444  /**
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1445   * __libeth_xdp_run_pass - helper to run XDP program and handle the result
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1446   * @xdp: XDP buffer to process
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1447   * @bq: XDP Tx bulk to queue ``XDP_TX`` frames
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1448   * @napi: NAPI to build an skb and pass it up the stack
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1449   * @rs: onstack libeth RQ stats
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1450   * @md: metadata that should be filled to the XDP buffer
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1451   * @prep: callback for filling the metadata
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1452   * @run: driver wrapper to run XDP program
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1453   * @populate: driver callback to populate an skb with the HW descriptor data
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1454   *
5495c58c65aa3d Alexander Lobakin 2025-06-12  1455   * Inline abstraction that does the following (non-XSk path):
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1456   * 1) adds frame size and frag number (if needed) to the onstack stats;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1457   * 2) fills the descriptor metadata to the onstack &libeth_xdp_buff
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1458   * 3) runs XDP program if present;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1459   * 4) handles all possible verdicts;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1460   * 5) on ``XDP_PASS`, builds an skb from the buffer;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1461   * 6) populates it with the descriptor metadata;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1462   * 7) passes it up the stack.
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1463   *
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1464   * In most cases, number 2 means just writing the pointer to the HW descriptor
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1465   * to the XDP buffer. If so, please use LIBETH_XDP_DEFINE_RUN{,_PASS}()
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1466   * wrappers to build a driver function.
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1467   */
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1468  static __always_inline void
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1469  __libeth_xdp_run_pass(struct libeth_xdp_buff *xdp,
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1470  		      struct libeth_xdp_tx_bulk *bq, struct napi_struct *napi,
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1471  		      struct libeth_rq_napi_stats *rs, const void *md,
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1472  		      void (*prep)(struct libeth_xdp_buff *xdp,
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1473  				   const void *md),
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1474  		      bool (*run)(struct libeth_xdp_buff *xdp,
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1475  				  struct libeth_xdp_tx_bulk *bq),
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1476  		      bool (*populate)(struct sk_buff *skb,
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1477  				       const struct libeth_xdp_buff *xdp,
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1478  				       struct libeth_rq_napi_stats *rs))
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1479  {
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1480  	struct sk_buff *skb;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1481  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1482  	rs->bytes += xdp->base.data_end - xdp->data;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1483  	rs->packets++;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1484  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1485  	if (xdp_buff_has_frags(&xdp->base))
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1486  		libeth_xdp_buff_stats_frags(rs, xdp);
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1487  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1488  	if (prep && (!__builtin_constant_p(!!md) || md))
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1489  		prep(xdp, md);
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1490  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1491  	if (!bq || !run || !bq->prog)
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1492  		goto build;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1493  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1494  	if (!run(xdp, bq))
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1495  		return;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1496  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1497  build:
4c805f7ae1ce61 Alexander Lobakin 2025-06-12 @1498  	skb = xdp_build_skb_from_buff(&xdp->base);
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1499  	if (unlikely(!skb)) {
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1500  		libeth_xdp_return_buff_slow(xdp);
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1501  		return;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1502  	}
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1503  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1504  	xdp->data = NULL;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1505  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1506  	if (unlikely(!populate(skb, xdp, rs))) {
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1507  		napi_consume_skb(skb, true);
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1508  		return;
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1509  	}
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1510  
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1511  	napi_gro_receive(napi, skb);
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1512  }
4c805f7ae1ce61 Alexander Lobakin 2025-06-12  1513  

:::::: The code at line 1498 was first introduced by commit
:::::: 4c805f7ae1ce61a90121378a5ee1f47b3b870c73 libeth: xdp: add XDP prog run and verdict result handling

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
