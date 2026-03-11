Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CAE2D877B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234174; cv=none; b=j7QdtIp8QnD3XcL8LeKZHpeqAZ30urYv1K7am8N4QRNOl2r+5yIjzZd6NUDuRdIW+tpEnNYpbZnNkr4yFjCL1g4JIQrpZiMYXgJB+D7yfB3MelEh8KQUjAka1/BX2DanoH5e37eGi7gCv7NAlBNIYO/kjCjVXWYM5PljwNSBUOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234174; c=relaxed/simple;
	bh=libA7FGY9iv9/Fcasc1nui1VJ8y8z7Crftn3C89XSuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RZjljH3+ayf3tmsHnlGn8cuhfm/J/MnFbrH1TthxncgRJNeDFGIcPGSZ379h+Z588l1y78lAoJrkxxENvaqm5S8jEdipjZozopza6HMCvWsXzFJFZgsLciAbcMvxdKEyPibKC9AmLtMrMLlAX0mLaV+g3l+STruu2LQ16yRVF30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSNKyDW8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSNKyDW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773234171; x=1804770171;
  h=date:from:to:cc:subject:message-id;
  bh=libA7FGY9iv9/Fcasc1nui1VJ8y8z7Crftn3C89XSuI=;
  b=XSNKyDW8RIAAaBEq/Z8KLpVEKEqGwPg8pu3UHavJ3ed2/Hd4ZNPcTfU6
   g3Ud/SqgV8ZusH5LFV6VG0WIE2r/Hf/Ba5UVDewc07OTZ2gogsUgfJq+C
   eodebSdAfRYJXsogTIsaIjiYD6Xe3pwVg1BMIiQnCClQjiys1r6CSSrTh
   umJ6CV58x9ND6QQm104VQa4oIfrbnyHxsMWLGWHrtEibKU9SxnA5uiiA8
   RcN4aoqUSBw7a8XpDsXTNO9InVbTCYR9z8aJ+Zstm1gsdoWpQ9kFWXF+i
   QIBQGX5HUkHnyfz0Fxzd1oF6/7ztxwrbt5uygbZI8w7/lZTSyVHPUd2vr
   A==;
X-CSE-ConnectionGUID: J+47+fFPRGamHab+nB0lQg==
X-CSE-MsgGUID: 2ZkIOMlXRCuEIbOca/MbWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85776249"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85776249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:02:45 -0700
X-CSE-ConnectionGUID: ouB7IINeTBeweXGWyMzevw==
X-CSE-MsgGUID: PPJ5qh71RHeBTSnQY66+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220408706"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2026 06:02:42 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0JCy-0000000019t-143k;
	Wed, 11 Mar 2026 13:02:40 +0000
Date: Wed, 11 Mar 2026 21:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Li <fei1.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Yifan Liu <yifan1.liu@intel.com>,
 Zhangwei6 <wei6.zhang@intel.com>, Haoyu Tang <haoyu.tang@intel.com>
Subject: [acrn:6.17/linux 5/9] drivers/virt/acrn/hvlog.c:393:33:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202603112056.8hRIlEeF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   d2ae39d099178698dc32d2165a32f4d6d13d107b
commit: f8aee7a312dbbc04e1f182a7a43bd55dfb092292 [5/9] virt: acrn: add acrn hypervisor log back
config: x86_64-randconfig-123-20260311 (https://download.01.org/0day-ci/archive/20260311/202603112056.8hRIlEeF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603112056.8hRIlEeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603112056.8hRIlEeF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/acrn/hvlog.c:393:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [toplevel] hvlog_buf_virtaddr_base @@     got void [noderef] __iomem * @@
   drivers/virt/acrn/hvlog.c:393:33: sparse:     expected void *static [toplevel] hvlog_buf_virtaddr_base
   drivers/virt/acrn/hvlog.c:393:33: sparse:     got void [noderef] __iomem *

vim +393 drivers/virt/acrn/hvlog.c

   377	
   378	int acrn_hvlog_init(void)
   379	{
   380		int idx, ret = 0;
   381		uint64_t cur_logbuf, last_logbuf;
   382	
   383		if (x86_hyper_type != X86_HYPER_ACRN) {
   384			pr_err("acrn_trace: not support acrn hypervisor!\n");
   385			return -EINVAL;
   386		}
   387	
   388		if (!hvlog_buf_phyaddr_base || !hvlog_buf_size) {
   389			pr_warn("no fixed memory reserve for hvlog.\n");
   390			return 0;
   391		}
   392	
 > 393		hvlog_buf_virtaddr_base = ioremap(hvlog_buf_phyaddr_base, hvlog_buf_size);
   394		if(!hvlog_buf_virtaddr_base) {
   395			pr_info("%s: Error ioremap hvlog memblock.\n", __func__);
   396			return 0;
   397		}
   398	
   399		pcpu_nr = total_cpus;;
   400		foreach_hvlog_type(idx, SBUF_HVLOG_TYPES) {
   401			acrn_hvlog_devs[idx] = kcalloc(pcpu_nr,
   402				sizeof(struct acrn_hvlog), GFP_KERNEL);
   403			if (!acrn_hvlog_devs[idx])
   404				return -ENOMEM;
   405		}
   406	
   407		assign_hvlog_buf_base(&cur_logbuf, &last_logbuf);
   408		ret = init_hvlog_dev(cur_logbuf, SBUF_CUR_HVLOG);
   409		if (ret) {
   410			pr_err("Failed to init cur hvlog devs, errno %d\n", ret);
   411			return ret;
   412		}
   413	
   414		/* If error happens for last hvlog devs setup, just print out an warn */
   415		ret = init_hvlog_dev(last_logbuf, SBUF_LAST_HVLOG);
   416		if (ret)
   417			pr_warn("Failed to init last hvlog devs, errno %d\n", ret);
   418	
   419		pr_info("Initialized hvlog module with %u cpu\n", pcpu_nr);
   420		return 0;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
