Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F682C9A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 03:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735268644; cv=none; b=TOcFIOZir3HqGwO4QCeVOvu8NIPJ6RPo7gNsUpjOZgPoBXDKSnbahyRoiM44vVoWdbMpsElXLtw0wMsoHLSQK4XwFwFFUOBtBbQMhMRUiRPkRWwn5lInMB4Q/LWFQHhN45w/dkp586Oj1nu5wSPNlw96t8Qoe/nAN0FDQ8ydqwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735268644; c=relaxed/simple;
	bh=UtuQfpbHjt7R0fwmMuLIOhjOCrprsBcIzZYsqP1GqCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEJOx8j8aknkyy++66H7BxuiDExY983gNMlQGgvE0zwi3ir9cSk+ZMCLNMj93fNbUXESBEhpg8Gyb5Ykj3Qhg8gC9bvdEzNcaucTGlnOfW/wf05PY3w1V4PxAYjy00UTj89IiP1HKKCyDyi7b83xa38s7uxPd63AFQXDXokeFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEynUQxd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEynUQxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735268642; x=1766804642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtuQfpbHjt7R0fwmMuLIOhjOCrprsBcIzZYsqP1GqCA=;
  b=lEynUQxd8p5sGInElrjb7p+Lh3nYN2QNY8vjku4ckGHFNnH9F4FSbFAz
   bFBB25hXC+anRHbjoAgxQ8ZpdG6VSNeYh4suGjHxLKScCgzAhtEWofIwo
   snpUX9PPdjnBrzTmAyzu034H3ZI3gtlCKRQWGKlBoQ2uvBd9xTElR8HQf
   r0jkLqvju5QTuVRh3rLqY5W1o5vhWaHcYEEp6S7tuJM4WufAEl8drxRGM
   o7jxtTFjvuZPv3r1qC0wBTjPJmEeM7E4t4KfKoKZwekeZ8YvdSdiJk/cw
   v33l1tydDmcoFrQjd+H9DHoIpiHTyTjREBF0Ph7/coQlHnMjBeGlYjUXJ
   Q==;
X-CSE-ConnectionGUID: FJV85CMlQpKBt6NZ9kITIQ==
X-CSE-MsgGUID: 48eDUA+eTwizfM3kHnKPsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="47103158"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="47103158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 19:04:01 -0800
X-CSE-ConnectionGUID: 4GJre4BcRQmcnjKP0ECIog==
X-CSE-MsgGUID: 3v15Gwd/S5qTs+eMkOdsHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131044634"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Dec 2024 19:03:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR0dp-0002wF-2n;
	Fri, 27 Dec 2024 03:03:57 +0000
Date: Fri, 27 Dec 2024 11:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1667/1667] drivers/iommu/loongarch_iommu.c:101:1:
 sparse: sparse: symbol 'la_rlookup_iommu_list' was not declared. Should it
 be static?
Message-ID: <202412271142.yFd4x2L2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: 72fe4978ee346c10869113410da1b61710dd8d8f [1667/1667] LoongArch: add iommu support
config: loongarch-randconfig-r121-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271142.yFd4x2L2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412271142.yFd4x2L2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271142.yFd4x2L2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/loongarch_iommu.c: note: in included file:
   drivers/iommu/loongarch_iommu.h:137:3: sparse: sparse: symbol 'loongarch_iommu' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.h:152:3: sparse: sparse: symbol 'iommu_info' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.h:161:3: sparse: sparse: symbol 'dom_info' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.h:166:3: sparse: sparse: symbol 'dom_entry' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:101:1: sparse: sparse: symbol 'la_rlookup_iommu_list' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:108:9: sparse: sparse: symbol 'la_iommu_last_bdf' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:112:5: sparse: sparse: symbol 'loongarch_iommu_disable' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:130:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:130:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:130:15: sparse:     got void *
>> drivers/iommu/loongarch_iommu.c:132:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:132:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:132:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:135:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:135:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:135:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:137:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:137:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:137:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:150:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:150:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:150:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:152:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:152:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:152:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:155:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:155:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:155:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:157:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:157:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:157:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:160:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:160:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:160:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:162:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:162:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:162:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:190:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:190:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:190:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:193:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:193:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:193:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:196:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:196:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:196:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:199:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:199:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:199:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:206:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:206:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:206:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:306:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:306:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:306:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:310:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:310:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:310:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:312:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:312:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:312:23: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:314:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:314:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:314:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:322:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:322:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:322:23: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:325:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:325:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:325:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:327:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:327:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:327:23: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:329:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:329:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:329:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:349:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:349:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:349:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:352:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:352:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:352:9: sparse:     got void *
>> drivers/iommu/loongarch_iommu.c:610:6: sparse: sparse: symbol 'domain_deattach_iommu' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:651:28: sparse: sparse: symbol 'lookup_rlooptable' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:662:24: sparse: sparse: symbol 'find_iommu_by_dev' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:721:21: sparse: sparse: symbol 'la_iommu_probe_device' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:752:19: sparse: sparse: symbol 'get_iommu_info_from_dom' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:794:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:794:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:794:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:795:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:795:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:795:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:796:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:796:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:796:9: sparse:     got void *
>> drivers/iommu/loongarch_iommu.c:1178:24: sparse: sparse: symbol 'la_iommu_ops' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:1197:24: sparse: sparse: symbol 'loongarch_get_iommu_by_devid' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:1215:6: sparse: sparse: symbol 'check_device_compat' was not declared. Should it be static?
>> drivers/iommu/loongarch_iommu.c:1259:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *confbase @@     got void [noderef] __iomem * @@
   drivers/iommu/loongarch_iommu.c:1259:25: sparse:     expected void *confbase
   drivers/iommu/loongarch_iommu.c:1259:25: sparse:     got void [noderef] __iomem *
>> drivers/iommu/loongarch_iommu.c:1344:28: sparse: sparse: symbol 'create_rlookup_entry' was not declared. Should it be static?

vim +/la_rlookup_iommu_list +101 drivers/iommu/loongarch_iommu.c

   100	
 > 101	LIST_HEAD(la_rlookup_iommu_list);
   102	LIST_HEAD(la_iommu_list);			/* list of all loongarch
   103							 * IOMMUs in the system
   104							 */
   105	
   106	static u32 rlookup_table_size;			/* size if the rlookup table */
   107	static int la_iommu_target_ivhd_type;
 > 108	u16	la_iommu_last_bdf;			/* largest PCI device id
   109							 *  we have to handle
   110							 */
   111	
 > 112	int loongarch_iommu_disable;
   113	
   114	#define iommu_write_regl(iommu, off, val) \
   115		writel(val, iommu->confbase + off)
   116	#define iommu_read_regl(iommu, off)	readl(iommu->confbase + off)
   117	
   118	static void switch_huge_to_page(unsigned long *ptep, unsigned long start);
   119	
   120	static void iommu_translate_disable(struct loongarch_iommu *iommu)
   121	{
   122		u32 val;
   123	
   124		if (iommu == NULL) {
   125			pr_err("%s iommu is NULL", __func__);
   126			return;
   127		}
   128	
   129		/* Disable */
 > 130		val = iommu_read_regl(iommu, LA_IOMMU_PFM_CNT_EN);
   131		val &= ~(1 << 31);
 > 132		iommu_write_regl(iommu, LA_IOMMU_PFM_CNT_EN, val);
   133	
   134		/* Write cmd */
   135		val = iommu_read_regl(iommu, LA_IOMMU_CMD);
   136		val &= 0xfffffffc;
   137		iommu_write_regl(iommu, LA_IOMMU_CMD, val);
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
