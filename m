Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352CA20651E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 19:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731526373; cv=none; b=AaaCFIVSLlyKFtMrMX19H3to4NIRNhPnL8/qMsCxjl+cPf9eb/5ijZBIj5EWPCnwqz7pSvbSS+kcPk1vItCebNB5Ber0XfY5eCuejyYo7xr1A3CPhKS1B3CXxlP27ikYfVBlT8i0hsmJvRNrkIlMd1FUv3gXtrBGf1V+wW07DXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731526373; c=relaxed/simple;
	bh=Vq+Oo4sYfIuwXxkRwqWci1pNnCoTKHU/EQhCNsy2dnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HC4AvH1Pxh1R+7vRudIfbfQGX93TWps7GK+AOIlQt3GH6xTNXkR0w6UVJAG9gEJpR7Pg6HSRGVQuoZ4CX1g135ZXFOiL154NuM47o3xG8itd7jTXOWslQBKVaFhN2uEK/VjjdDoUMXTedGHyXpTXKBMfiDV9bYCho5ZM2peoaNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzcwP8Na; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzcwP8Na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731526372; x=1763062372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vq+Oo4sYfIuwXxkRwqWci1pNnCoTKHU/EQhCNsy2dnI=;
  b=AzcwP8NaJKpDyC1R/T8XDbG/2abKNBweicLJVHIypsWMqKRoK4Iam/2K
   m8XxrTQZJjpPBfPXk8jTaEKqZsVsDbYHLsu9HCHo5pTq/VOowD9dOuvJ6
   GWrDb9lY1F6fmS5XgqnQhZZQej5j/Q89cJlf+A5rzFCsl7IGwuLvwLjGb
   UD30Z+mAohzObywG/KP+qFhp2BEMLNIhQriOMuMgtLjzamk71d/xNHmL/
   D+5fe5g6roxHdvkWcyn1jewIXRSONBIBCWd02Awz/IqaF6kcQweCXUF1T
   h9V04QTVtF/1iYIJdy8ZQAq9VTuxMsUuWtLftQQ0DqU1y32eeVA5XxwUD
   w==;
X-CSE-ConnectionGUID: kHsewCT6Te2OCdw3Y0hyfw==
X-CSE-MsgGUID: YqKl/VZETpStjEwaWwqzZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="19043215"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="19043215"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 11:32:51 -0800
X-CSE-ConnectionGUID: 5fHnbzA0R++xw2RD8bs86Q==
X-CSE-MsgGUID: Z7BRdfJjTPG9JL7AOkEG6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="87955578"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 11:32:28 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBJ6H-0000ez-1B;
	Wed, 13 Nov 2024 19:32:25 +0000
Date: Thu, 14 Nov 2024 03:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2430/2430] arch/arm64/mm/quick_kexec.c:21:13:
 warning: no previous prototype for 'reserve_quick_kexec'
Message-ID: <202411140347.wBO44TXi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kefeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   53677a494016919c9c6715a90a425dc771e5ae26
commit: d61f4ca086e99bb481961b1120e10e7a4296c392 [2430/2430] arm64: quick_kexec: Move to stand-alone file
config: arm64-randconfig-003-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140347.wBO44TXi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140347.wBO44TXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140347.wBO44TXi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/quick_kexec.c:21:13: warning: no previous prototype for 'reserve_quick_kexec' [-Wmissing-prototypes]
      21 | void __init reserve_quick_kexec(void)
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/quick_kexec.c:47:13: warning: no previous prototype for 'request_quick_kexec_res' [-Wmissing-prototypes]
      47 | void __init request_quick_kexec_res(struct resource *res)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/reserve_quick_kexec +21 arch/arm64/mm/quick_kexec.c

    20	
  > 21	void __init reserve_quick_kexec(void)
    22	{
    23		unsigned long long mem_start, mem_len;
    24	
    25		mem_len = quick_kexec_res.end;
    26		if (mem_len == 0)
    27			return;
    28	
    29		/* Current arm64 boot protocol requires 2MB alignment */
    30		mem_start = memblock_find_in_range(0, arm64_dma_phys_limit,
    31				mem_len, SZ_2M);
    32		if (mem_start == 0) {
    33			pr_warn("cannot allocate quick kexec mem (size:0x%llx)\n",
    34				mem_len);
    35			quick_kexec_res.end = 0;
    36			return;
    37		}
    38	
    39		memblock_reserve(mem_start, mem_len);
    40		pr_info("quick kexec mem reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
    41			mem_start, mem_start + mem_len,	mem_len >> 20);
    42	
    43		quick_kexec_res.start = mem_start;
    44		quick_kexec_res.end = mem_start + mem_len - 1;
    45	}
    46	
  > 47	void __init request_quick_kexec_res(struct resource *res)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
