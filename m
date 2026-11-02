Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650659;
	b=KaYYRLz5kjjGSbnkjffCirISMFHNJhmKfFPEoabcTipKbRibNu2xtSjY0cF6PKzcuOnF
	 0EM6tGCpXK1LrryJz40XIMH8lEZ4S7ChOlfnoqTnLkBcpt0Lnfuoo9q3zXYq8hDSG78ha
	 Sal8dXo0ntkPJXiRIiIbGb950XO04Opi1nDPayAbWHX1ktosjRHeAM5bnRsNlbwL3XsLS
	 emCgT8v+L79w8WlbTZzR1kyGOHkeHZP4Xb1Dlb12aJmUAcHSJEtwjt1WohTUCXrXJ2e2S
	 +/biHeIak1gTgcCk9LMgzdYkVv98+8JecsuLQswnFCxgEbNW7Ye2y8tle4QT8yTZ6Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650659;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LMykdtl+jzPkxeZK/vmMQGLshAinqEpw2vELglAbqd0=;
	b=lO8n6yQJLe1iMnW6kMYiWS0ZExl9ZFR83suLq0SNzoMjQpfx6BCL9hX4IC/PipL8J2c4
	 zLVDhdrSF7m/sHsezkHle4gx5H74RVe1p9nUbqoIeBwHUXuL98P3wiQx9O1XIAciDaSzC
	 g16+3hDzbuhmeWlv1SLGjAJB9x4ngB2xVJOlZv3bcF1ETpdE4jatbvTT1JbVUiaCgxl/9
	 v2b3lF99atJg97vKtf0ZVHYpKTJd9PZpsPKlQe8rpmRF9dPXEbhQ5NPeh3ouA8tBaDycq
	 u7OH+6FRlBxTXWOrf4GmYBijzHpKw4QvHVs/7mZBYist5XFVEnzs9+QavzqXE/S8BIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nfvBcYx8;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39E606A32E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 20:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B39E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nfvBcYx8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793650659; x=1825186659;
  h=date:from:to:cc:subject:message-id;
  bh=VO5kXN1UpIKDPgwcHNFlcsTNNVynZ5BBNVPhZFESZ34=;
  b=nfvBcYx8OKF1pMVCOOqw/BfbyMCbk2+LXVcYq/h3STHKCknUwSJsYEp0
   MQACY6RG/+l3yAVbvQFYg+CH2slErYCTxrLuFdE/vWYC8T22EOeUOjbKP
   Xqwtl+SOG37aaPAwciKbEaLBXddTBfNywA9IVfjhhSyLtFBKt8Rbg4m1R
   G/QtMPZsZjJZIS/p037ul4L+KBzAnSTVnxWwQLjQ4MDgi+6OJFG+53Gn2
   8kx/tLRUf7QH+37ZRNEKZL4TMjfPiEg+8W7FOniS33I+iwQ5SXMVxWISz
   pLyIBIck0/FpwIgHAbjpXfDy6EZ1tAxSkiY21Jh/gbxmKIAEjex6qWsqq
   g==;
X-CSE-ConnectionGUID: emNJbz1pRGeBJGMxkypIxA==
X-CSE-MsgGUID: WAnP5L9OTI2qT+p55fyOwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2464254"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2464254"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 12:17:39 -0800
X-CSE-ConnectionGUID: CrMwXY80QLqS+1152fkJaA==
X-CSE-MsgGUID: Dm428blRR7KPvcVG6RAJdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6093907"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2026 12:17:36 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNyTG-00000000hmY-0hgb;
	Mon, 02 Nov 2026 20:17:34 +0000
Date: Tue, 03 Nov 2026 04:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:100GbE_E825_timecounter 14/15]
 drivers/net/ethernet/intel/ice/ice_ptp.c:2366:32: error: 'cached_time'
 undeclared; did you mean 'cache_type'?
Message-ID: <202611030449.DS9rrSFF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git 100GbE_E825_timecounter
head:   3f3ca43bb77f800814e88fc923238ad0a122d79f
commit: a1bbd79fcdadf25fd90973f46fe35f9461d04a8c [14/15] ice: store cached PHC time in ice_adapter
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20261103/202611030449.DS9rrSFF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030449.DS9rrSFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030449.DS9rrSFF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_ptp.c:9:
   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_get_rx_hwts':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:2366:32: error: 'cached_time' undeclared (first use in this function); did you mean 'cache_type'?
    2366 |         ice_trace(rx_hwtstamp, cached_time, ts_high, ts_ns);
         |                                ^~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_trace.h:49:67: note: in definition of macro 'ice_trace'
      49 | #define ice_trace(trace_name, args...) ICE_TRACE_NAME(trace_name)(args)
         |                                                                   ^~~~
   drivers/net/ethernet/intel/ice/ice_ptp.c:2366:32: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/ethernet/intel/ice/ice_trace.h:49:67: note: in definition of macro 'ice_trace'
      49 | #define ice_trace(trace_name, args...) ICE_TRACE_NAME(trace_name)(args)
         |                                                                   ^~~~


vim +2366 drivers/net/ethernet/intel/ice/ice_ptp.c

77a781155a65905 Jacob Keller     2021-06-09  2340  
77a781155a65905 Jacob Keller     2021-06-09  2341  /**
3310aad20defb96 Larysa Zaremba   2023-12-05  2342   * ice_ptp_get_rx_hwts - Get packet Rx timestamp in ns
77a781155a65905 Jacob Keller     2021-06-09  2343   * @rx_desc: Receive descriptor
9031d5f491b9571 Larysa Zaremba   2023-12-05  2344   * @pkt_ctx: Packet context to get the cached time
77a781155a65905 Jacob Keller     2021-06-09  2345   *
77a781155a65905 Jacob Keller     2021-06-09  2346   * The driver receives a notification in the receive descriptor with timestamp.
77a781155a65905 Jacob Keller     2021-06-09  2347   */
3310aad20defb96 Larysa Zaremba   2023-12-05  2348  u64 ice_ptp_get_rx_hwts(const union ice_32b_rx_flex_desc *rx_desc,
9031d5f491b9571 Larysa Zaremba   2023-12-05  2349  			const struct ice_pkt_ctx *pkt_ctx)
77a781155a65905 Jacob Keller     2021-06-09  2350  {
77a781155a65905 Jacob Keller     2021-06-09  2351  	u32 ts_high;
a1bbd79fcdadf25 Jacob Keller     2026-10-21  2352  	u64 ts_ns;
77a781155a65905 Jacob Keller     2021-06-09  2353  
b1a582e64bf2229 Jacob Keller     2022-07-27  2354  	if (!(rx_desc->wb.time_stamp_low & ICE_PTP_TS_VALID))
3310aad20defb96 Larysa Zaremba   2023-12-05  2355  		return 0;
b1a582e64bf2229 Jacob Keller     2022-07-27  2356  
b1a582e64bf2229 Jacob Keller     2022-07-27  2357  	/* Use ice_ptp_extend_32b_ts directly, using the ring-specific cached
b1a582e64bf2229 Jacob Keller     2022-07-27  2358  	 * PHC value, rather than accessing the PF. This also allows us to
b1a582e64bf2229 Jacob Keller     2022-07-27  2359  	 * simply pass the upper 32bits of nanoseconds directly. Calling
b1a582e64bf2229 Jacob Keller     2022-07-27  2360  	 * ice_ptp_extend_40b_ts is unnecessary as it would just discard these
b1a582e64bf2229 Jacob Keller     2022-07-27  2361  	 * bits itself.
77a781155a65905 Jacob Keller     2021-06-09  2362  	 */
77a781155a65905 Jacob Keller     2021-06-09  2363  	ts_high = le32_to_cpu(rx_desc->wb.flex_ts.ts_high);
a1bbd79fcdadf25 Jacob Keller     2026-10-21  2364  	ts_ns = ice_ptp_extend_32b_ts(pkt_ctx->phc, ts_high);
77a781155a65905 Jacob Keller     2021-06-09  2365  
5443362bae71a77 Przemyslaw Korba 2026-05-11 @2366  	ice_trace(rx_hwtstamp, cached_time, ts_high, ts_ns);
5443362bae71a77 Przemyslaw Korba 2026-05-11  2367  
3310aad20defb96 Larysa Zaremba   2023-12-05  2368  	return ts_ns;
77a781155a65905 Jacob Keller     2021-06-09  2369  }
77a781155a65905 Jacob Keller     2021-06-09  2370  

:::::: The code at line 2366 was first introduced by commit
:::::: 5443362bae71a77a7bf37467cef3be608ce32783 ice: add rx timestamp tracepoint for debugging

:::::: TO: Przemyslaw Korba <przemyslaw.korba@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
