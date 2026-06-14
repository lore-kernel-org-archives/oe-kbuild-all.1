Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41733F360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473495; cv=none; b=nW8XRBawsTggJ7mL015U5/R0ZpC6Ke6s6ZJc8bPQlnpz3mxJUaD1ATBG0chK6r/0lcFvi7xoLXv2pZ6ZBNiXRzze5F/7y7TjzSuYFTbOBIFr/eh8oq1K8TTC4DuKIHVBK9B5BDXWU9ItjTjHqhl0yNuZefVR9ICk+GVnGbPZN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473495; c=relaxed/simple;
	bh=pl1IQAemOzv8bCvOQ1NLU8RZThERw+L2c+2Tb2hhtxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AHWZmhwn64/oDNu7lhKOG3JxD4j9xRt0QzQxX55aLN0T2kOUBxiXSYKspHb8mDuCyvsBT8wq/N4wYHepDKLl1XZEICANuM6o3mNrNQlNMLUmfHrcEsHOqa1IB/a2x3gIBaTPEmyq87nGNcLbgiH8nnUTnb6mmbDq3FCPZQBaADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duJRbQWP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duJRbQWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781473494; x=1813009494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pl1IQAemOzv8bCvOQ1NLU8RZThERw+L2c+2Tb2hhtxQ=;
  b=duJRbQWP8bbuQ/wTzgHfbneUDCn1j5asRS+/X3lXs2vxICkvE0On97cS
   XduXdXf4RZaZKAgZQqzLIrc8eSbexbhwnLaPuA98LreFpFzwmXL5UClpG
   Bet3+CNmJRvZ8DH0GyB6U58azltU3mp/4V15RHdG2lBREjPH5No8sGQ9U
   rgy8GCKUrvk08dUT95BVIisJIovDlPH0zT8s/DhAxVusxlxSNdcSwt5DS
   NJXzIrhPX0a4y5MkO6fYjMeS+yMJRic4BTw3R3RnE4KMngtVdqr1chKpz
   EjX8aqthB3EMPtlS7XNr4bjsVCGiaOZ3ALOFnK+ufr+9TT6hwmHMed2aY
   A==;
X-CSE-ConnectionGUID: Sm2nINw7RLSxg2qUDQW/YA==
X-CSE-MsgGUID: LkTo4dJ7RCOakL7l7rYspw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82253067"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82253067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 14:44:53 -0700
X-CSE-ConnectionGUID: 299MaWTWRJqxr345Q3iwkw==
X-CSE-MsgGUID: Tf4Zvv55Tn+Z8R8w+yjdzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="240956943"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2026 14:44:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYsdN-00000000RDs-285g;
	Sun, 14 Jun 2026 21:44:49 +0000
Date: Mon, 15 Jun 2026 05:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12]
 =?us-ascii?Q?drivers/accel/adla=5Flegacy/kmd/drv/port/platform/linux/adl?=
 =?us-ascii?Q?ak=5Fplatform=5Fconfig.c:378:19:?= error: implicit
 declaration of function 'of_parse_phandle'
Message-ID: <202606150517.pkWp6ql4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   db2e0f73cef8a993f240d9ea07ff72f5e99a7a9a
commit: db2e0f73cef8a993f240d9ea07ff72f5e99a7a9a [12/12] Temporary use Adla Legacy driver
config: parisc-randconfig-002-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150517.pkWp6ql4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150517.pkWp6ql4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150517.pkWp6ql4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c: In function 'adlak_platform_get_rsv_mem_size':
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:378:19: error: implicit declaration of function 'of_parse_phandle' [-Werror=implicit-function-declaration]
     378 |     res_mem_dev = of_parse_phandle(((struct device *)dev)->of_node, "memory-region", 0);
         |                   ^~~~~~~~~~~~~~~~
   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:378:17: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     378 |     res_mem_dev = of_parse_phandle(((struct device *)dev)->of_node, "memory-region", 0);
         |                 ^
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:382:11: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
     382 |     ret = of_address_to_resource(res_mem_dev, 0, &res);
         |           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:388:18: error: implicit declaration of function 'of_n_size_cells' [-Werror=implicit-function-declaration]
     388 |         nsize  = of_n_size_cells(res_mem_dev);
         |                  ^~~~~~~~~~~~~~~
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:389:18: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
     389 |         ranges = of_get_property(res_mem_dev, "size", NULL);
         |                  ^~~~~~~~~~~~~~~
   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:389:16: warning: assignment to 'const __be32 *' {aka 'const unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     389 |         ranges = of_get_property(res_mem_dev, "size", NULL);
         |                ^
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:394:16: error: implicit declaration of function 'of_read_number' [-Werror=implicit-function-declaration]
     394 |         size = of_read_number(ranges, nsize);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c: In function 'adlak_cma_deinit':
>> drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:39:5: error: implicit declaration of function 'of_reserved_mem_device_release' [-Werror=implicit-function-declaration]
      39 |     of_reserved_mem_device_release(dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c: In function 'adlak_cma_init':
>> drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:47:11: error: implicit declaration of function 'of_reserved_mem_device_init' [-Werror=implicit-function-declaration]
      47 |     ret = of_reserved_mem_device_init(dev);
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c: In function 'adlak_os_mmap':
   drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:439:34: warning: variable 'vm_page_prot' set but not used [-Wunused-but-set-variable]
     439 |     pgprot_t                     vm_page_prot;
         |                                  ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_parse_phandle +378 drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c

   369	
   370	int adlak_platform_get_rsv_mem_size(void *dev, uint64_t *mem_size) {
   371	    int                 ret = 0;
   372	    struct resource     res;
   373	    uint64_t            size;
   374	    const __be32 *      ranges = NULL;
   375	    int                 nsize;
   376	    struct device_node *res_mem_dev;
   377	    /* find a memory-region phandle */
 > 378	    res_mem_dev = of_parse_phandle(((struct device *)dev)->of_node, "memory-region", 0);
   379	    if (!res_mem_dev) {
   380	        goto err;
   381	    }
 > 382	    ret = of_address_to_resource(res_mem_dev, 0, &res);
   383	    if (!ret) {
   384	        AML_LOG_DEBUG("get cma memory region: [0x%lX, 0x%lX]", (uintptr_t)res.start,
   385	                      (uintptr_t)res.end);
   386	        size = res.end - res.start + 1;
   387	    } else {
 > 388	        nsize  = of_n_size_cells(res_mem_dev);
 > 389	        ranges = of_get_property(res_mem_dev, "size", NULL);
   390	        if (!ranges) {
   391	            AML_LOG_ERR("get cma size failed!\n");
   392	            goto err;
   393	        }
 > 394	        size = of_read_number(ranges, nsize);
   395	    }
   396	    AML_LOG_DEBUG("get cma size=0x%lX", (uintptr_t)size);
   397	    *mem_size = size;
   398	    return 0;
   399	err:
   400	    return -1;
   401	}
   402	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
