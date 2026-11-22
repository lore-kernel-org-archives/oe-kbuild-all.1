Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795317441;
	b=IYPKOVl+X70b3ETziNytsTJUCJgfONwQlAg4rbQOeiCjFgQ7LQQQ4rpBcW8gLpevDaFO
	 YPcBsdU4KtzEtR8xzCMRiypjjsWjF6M5aBfnY0FyX0y5JLT36QTbZmhpE5MMUWOVCLkhb
	 fFDhrDxds6RFz6c0xEois+C6fTTEZWcnIDHHgr71n3G3MxrAC5yVkgBstdV93FUxXM8CV
	 yPXBEHZTa+Z8AviwbdpSeQFgpURt1MFqOgbDzh7nqDY3F7r7ZlK5wSDZqB/E49hwnui4d
	 n/gvE9zNN+ImPiKmdKaAVqi0bK86mjgUiOTLJjVtPWF8b7d7hevwOM9ZJ5cYnDwB6Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795317441;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aqKhf4nqWJaPUV1lVpkDDUk5SO+dCpkWRQ+DJBU335c=;
	b=3+Xtu4mZJ1qrQo58rWcZHPDidjklwL5gbm5fjI2WBV7SU5gY79gHXDxjnbdQ6F7XpTep
	 VNl9xzZq4EKBsclVYtlUxTp9F34/iW6N2jX8f12754wK+XU7yXB9lNBHv6BDh44RBx7SW
	 wxYHtMOzPUdfcXGjD3h6DkrLQSt7z/d9l3OowCj3zUWUH04yNYfs/E5B8PLqISYk23h88
	 5XdKp1ahTd9/uGizsEnc3j2NP0mAMIcaplsqPcD6lTUILHUYj6eINQB3j84+4/7+Bzkrn
	 ONNYnXZQGsM4eIUxflVONbu+57Y+tWqUIiaG+8eaPv+P0VnABoRpcFY3rKoqXe88CsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+vBvcgF;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC5606A320
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 03:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EC5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j+vBvcgF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795317440; x=1826853440;
  h=date:from:to:cc:subject:message-id;
  bh=wzWEN9eqTTGcPSyP0RvTTkDw3AWaw23UNzFbNHyUhf4=;
  b=j+vBvcgFWLjqGn7tZsLN19VdlvG2JrRTPANal3X08HKvx1aPVunSbDEu
   osFUD2UoMC1tXDZmgYHDy6UPYjmMvZVJVn1YnyaeUGHJbsVS8XJ0w6cWE
   CwMvCC/Nwx2Y+sSUuPBZFGRAIYNyYrQ7QCkgvaGYldlABt9XpzyLbKyDU
   AiHj7YtqgRl7CGjnAVCG5+pS4JhAi4kuIn1wUhJYB1VaLLQAiau9ni44x
   vNjBnU4ydDXSrlZpIO31bTKdmgtOMZgQfJBXb4kM0pv70exoLmYDc4ZE3
   a8p0A7Ew258VmM0EAjTVNd0p/yRxu6PxHYDs01d816NA8RT7YQQbVdLP6
   w==;
X-CSE-ConnectionGUID: xCAczd+pQie8oqvrGvvMsA==
X-CSE-MsgGUID: jdobWSZDSn2fH1VqhHipwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4048047"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4048047"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 19:17:19 -0800
X-CSE-ConnectionGUID: wVp/NItnRYiwIw6h673Vxw==
X-CSE-MsgGUID: 8+pr5ZUZRi63U4TM9HL0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11271201"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2026 19:17:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUy4p-000000004Tx-2B1Q;
	Sun, 22 Nov 2026 03:17:15 +0000
Date: Sun, 22 Nov 2026 04:16:44 +0100
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V16 17/31]
 drivers/firmware/arm_scmi/telemetry.c:2517:51: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <20261122040854.LMskIQfL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V16
head:   2583f5d73857467989b273f5a1a2f7bee48debd9
commit: d3c1949548189ec1b05987113bf19c80a7d3d9d0 [17/31] firmware: arm_scmi: Add Telemetry DEs configuration support
config: parisc-randconfig-r2303-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122040854.LMskIQfL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122040854.LMskIQfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122040854.LMskIQfL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/telemetry.c:2517:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct eplg *eplg @@     got struct eplg [noderef] __iomem *[assigned] _eplg @@
   drivers/firmware/arm_scmi/telemetry.c:2517:51: sparse:     expected struct eplg *eplg
   drivers/firmware/arm_scmi/telemetry.c:2517:51: sparse:     got struct eplg [noderef] __iomem *[assigned] _eplg
>> drivers/firmware/arm_scmi/telemetry.c:2816:37: sparse: sparse: Using plain integer as NULL pointer
   drivers/firmware/arm_scmi/telemetry.c:2818:37: sparse: sparse: Using plain integer as NULL pointer
>> drivers/firmware/arm_scmi/telemetry.c:2286:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *limit @@     got struct eplg *eplg @@
   drivers/firmware/arm_scmi/telemetry.c:2286:31: sparse:     expected void [noderef] __iomem *limit
   drivers/firmware/arm_scmi/telemetry.c:2286:31: sparse:     got struct eplg *eplg

vim +2517 drivers/firmware/arm_scmi/telemetry.c

  2499	
  2500	static struct payload __iomem *
  2501	scmi_telemetry_blkts_payld_locate(struct device *dev,
  2502					  struct telemetry_shmti *shmti, u32 *bts_offs,
  2503					  struct payload __iomem *payld, u32 de_id)
  2504	{
  2505		struct payload __iomem *bts_payld = NULL;
  2506	
  2507		if (!bts_offs)
  2508			return IOMEM_ERR_PTR(-EINVAL);
  2509	
  2510		if (*bts_offs &&
  2511		    check_add_overflow((__force unsigned long)shmti->base, *bts_offs,
  2512				       (__force unsigned long *)&bts_payld))
  2513			return IOMEM_ERR_PTR(-EPROTO);
  2514	
  2515		/* Check SHMTI overflow on returned offset */
  2516		if (bts_payld) {
> 2517			if (scmi_telemetry_shmti_overflow(SHMTI_EPLG(shmti), bts_payld)) {
  2518				trace_scmi_tlm_access(de_id, "SHMTI_OVERFLOW", 0, 0);
  2519				return IOMEM_ERR_PTR(-EINVAL);
  2520			}
  2521		} else {
  2522			dev_warn_once(dev, "Received BLK_TS with zero offset.\n");
  2523			trace_scmi_tlm_access(de_id, "BLKTS_WITH_ZERO_OFFSET", 0, 0);
  2524	
  2525			/*
  2526			 * Find the BLK_TS immediately preceding this DE payld by
  2527			 * scanning.
  2528			 */
  2529			bts_payld = scmi_telemetry_nearest_line_by_type(shmti, payld,
  2530									TDCF_BLK_TS_LINE);
  2531			if (WARN_ON(!bts_payld))
  2532				return IOMEM_ERR_PTR(-EPROTO);
  2533	
  2534			/* Calculate offset of found blkts */
  2535			*bts_offs = (void __iomem *)bts_payld - shmti->base;
  2536		}
  2537	
  2538		return bts_payld;
  2539	}
  2540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
