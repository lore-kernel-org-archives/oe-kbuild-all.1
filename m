Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312785;
	b=iTp0DErZzT3n7zBj75Nmmxrxnmw6fxyn/j8QPD1zWv+0nwZqAWo8jtOa4GoDurIKfPa4
	 gJcGsU9uHXRRJx1/6RKUfjck9lyOe6hbRnvQoN6NU/4pLJeOjhqG4TOEwjixB6Pq4v5U/
	 XxMVoL3qZ/1ixm9omlc9EbykveM+EKO0AcRlJGTolMuZaGF+lkKhEvuuFTR1vMbhIFsBF
	 duQlTkWQd+6eyabejyo1ilNV+5EjTDP7rr5C2eye/RlzsCLnj8WQLo1MOU9wja7bsjY0u
	 RQcKVnqJUGGXPzgIEeQ3Oz8VYtDJrHYCixAB2IS3qSE6BPX0nqc3xe46bdv33JeR+Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312785;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fygEecCJCUJgrLJtcWLuFisD6JsaK+3YiuYOhOVjvXo=;
	b=q0Dx1Hsri6InOw+AmiholmJ/ZSKm+eweHNYJmPmT0oXeQrQuMqNeWQ9fmM5X64y9kNix
	 thTnMfZXU4lChzEIEyFTvYON5LTf4eD8syLwffYqhwAy/SASpiH1XAiKtwezZGK9gJpM0
	 EkBTZF0SvgqWYqW86vb7VlnWjpzMfGp21jwXoe17sZcoJpcwhKMX2OPmPCzM+XcRtk4GU
	 j8Df3bMRqEaCbJfdfLEyy2aarF2t/CCu+9f6IhGMKbPNEoIb8OwqkVV6whqDoMIpP7oEL
	 9nLOGgNl/8GHQcbZPuT0AibxgAcE5xaB/3wZqsfQvQDzXejkmd4pYh0pkhhSpVJ3qSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kOsJNfWG;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE64606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kOsJNfWG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793312783; x=1824848783;
  h=date:from:to:cc:subject:message-id;
  bh=GGqzMNCH+nPu6Hm4Mvq5YP89VmRaQ0MA/5ZdzrPbKpY=;
  b=kOsJNfWGlEICStlxZQsGblPf3O4NIjfvfi4f+2UureNJKRin0gWRTk0/
   klanvZ++zCDX7ay2F6wXK0NKaUdKq805YPz1OZWFI/G9E76pLDTzJfY3z
   g33TSP2v0q3KtpKcoW6YQHhdlXXeRfUfoA9WkosPOybRnYBnQ4g5MdCZW
   Qw1D7rs/HRi3EDRlGk1MQgvGjJUOX8HeyxYdlZxksIVTtVoCvfndabV/D
   c5d3q4jV+WPkV2oBmtWSnT8dz6rz1drfT7dVJ615eVSjXL/G2TgLepzuf
   fXWBeVhQ00DqrW+fYhcMG5yy5HhxAhpdjuQBQ2q87ogSkeev7lX+ifQEF
   Q==;
X-CSE-ConnectionGUID: YIg8Clw2St2EUA4O9hy12g==
X-CSE-MsgGUID: e5jYyiKzSzqh5aUXgDjDAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2095841"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2095841"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 15:26:22 -0700
X-CSE-ConnectionGUID: dvnq/JJzRLaDcMQuwa1Zfg==
X-CSE-MsgGUID: MtyI1TEYSS2hGrCY2FtkHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5231210"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2026 15:26:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMYZd-000000005MR-2v5X;
	Thu, 29 Oct 2026 22:26:17 +0000
Date: Thu, 29 Oct 2026 23:25:51 +0100
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:100GbE_E825_timecounter 14/15]
 drivers/net/ethernet/intel/ice/ice_ptp.c:2366:32: error: 'cached_time'
 undeclared; did you mean 'cache_type'?
Message-ID: <202610292344.LN4xt1gu-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261029/202610292344.LN4xt1gu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292344.LN4xt1gu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292344.LN4xt1gu-lkp@intel.com/

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
    2366 |         ice_trace(rx_hwtstamp, cached_time, ts_high, ts_ns);
         |                                ^~~~~~~~~~~
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
