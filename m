Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E2C745C5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707193675; cv=none; b=SVoXoDxQQKRSH+rzPGFdWZc+m2jSF6fo8D9KXFPAOXUJTsNFuqgPjnrM0S+pdfSDwT8Ku+c0WSJxWomJYRG8ZI6CISAzBvEomD+qInhCPar9HA3XHf2Qmhj8Bq0E234RDadQZvwsAa2FgZN/h3SOCaTs5CjD67MMWifgigxec+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707193675; c=relaxed/simple;
	bh=cXFhSVtPZTJZAlDZfaEBhWuibtmf6r89TMZpR27H+F8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jjv/HSZDIHPhyXZkMtpCn1cchEy+4jeMM+Dpr/pZTZ+WX+z3RVf1cZ1yeD9XPZXepauoHmAW5Hz1QX0KZjzPrYBIsMilMchW9L9nDCf7vp4H39UYNrf8IGsCWoqWKMhez0f3d5z6DdcMY1+FHY7sPGitkK1pF3eScTv9Z+jBimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReZ/5LN1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReZ/5LN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707193673; x=1738729673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXFhSVtPZTJZAlDZfaEBhWuibtmf6r89TMZpR27H+F8=;
  b=ReZ/5LN1BQ2IMUgDsNZ0gsNKIWXWsOGd5PMNaikBPUn79nAjdp9HU8JX
   MBpRm8/zqvsrecRgvf5ynuK2rowzXhx6lLPJxIyRedMstTLnDUAoOoxs3
   oGxXdPMO/my1/9aASSADOOP5VSEFzpd/1e6chaZpW50aKJ8fA3B3KY+dk
   U/aR8RDHAeOp+sdPLi2SANsEHVeMu7Qn+d5cjJyvfhHkEZxT0TFv4YJjG
   F0BBW+hk4lE12v9fpo5ffp6oWWGEK2bO3DRMeBSPO5LgDJ1PWNJG2kSC2
   fe8UKyDb9KX91y+Kd5KdDKTZo9qZU5c+F2b06csRgRHSZLVWdOGTWOcxl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26108252"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="26108252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 20:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="901850"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2024 20:27:50 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXD3k-00014K-14;
	Tue, 06 Feb 2024 04:27:48 +0000
Date: Tue, 6 Feb 2024 12:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18194/21616] drivers/char/svm.c:249:20:
 sparse: sparse: symbol 'svm_find_mem_reg_node' was not declared. Should it
 be static?
Message-ID: <202402061249.86c5Hf3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 9469d1759c2905dcef49df7e6240ad5c32b66296 [18194/21616] ascend: share_pool: enable svm to use share pool memory
config: arm64-randconfig-r131-20240130 (https://download.01.org/0day-ci/archive/20240206/202402061249.86c5Hf3Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240206/202402061249.86c5Hf3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061249.86c5Hf3Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/svm.c:240:24: sparse: sparse: symbol 'va2pa_trunk' was not declared. Should it be static?
>> drivers/char/svm.c:249:20: sparse: sparse: symbol 'svm_find_mem_reg_node' was not declared. Should it be static?
>> drivers/char/svm.c:320:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svm_va2pa_slot *slot @@     got void [noderef] __iomem * @@
   drivers/char/svm.c:320:14: sparse:     expected struct svm_va2pa_slot *slot
   drivers/char/svm.c:320:14: sparse:     got void [noderef] __iomem *
   drivers/char/svm.c:338:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct svm_va2pa_slot *[addressable] [assigned] [toplevel] slots @@
   drivers/char/svm.c:338:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/char/svm.c:338:28: sparse:     got struct svm_va2pa_slot *[addressable] [assigned] [toplevel] slots
   drivers/char/svm.c:419:6: sparse: sparse: symbol 'sysrq_sched_debug_show_export' was not declared. Should it be static?
   drivers/char/svm.c:1242:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/char/svm.c:1502:5: sparse: sparse: symbol '__svm_get_mpam' was not declared. Should it be static?
   drivers/char/svm.c:249:21: warning: no previous prototype for 'svm_find_mem_reg_node' [-Wmissing-prototypes]
     249 | struct device_node *svm_find_mem_reg_node(struct device *dev, const char *compat)
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:419:6: warning: no previous prototype for 'sysrq_sched_debug_show_export' [-Wmissing-prototypes]
     419 | void sysrq_sched_debug_show_export(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1429:5: warning: no previous prototype for 'svm_get_pasid' [-Wmissing-prototypes]
    1429 | int svm_get_pasid(pid_t vpid, int dev_id __maybe_unused)
         |     ^~~~~~~~~~~~~
   drivers/char/svm.c:1502:5: warning: no previous prototype for '__svm_get_mpam' [-Wmissing-prototypes]
    1502 | int __svm_get_mpam(struct svm_mpam *mpam)
         |     ^~~~~~~~~~~~~~
   drivers/char/svm.c:2437:36: warning: 'svm_acpi_match' defined but not used [-Wunused-const-variable=]
    2437 | static const struct acpi_device_id svm_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from arch/arm64/include/asm/memory.h:27,
                    from arch/arm64/include/asm/esr.h:21,
                    from drivers/char/svm.c:10:
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1967:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   44-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1958:25: note: object 'l2buf_load_flag' of size 4
    1958 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1967:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   57-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1958:25: note: object 'l2buf_load_flag' of size 4
    1958 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~

vim +/svm_find_mem_reg_node +249 drivers/char/svm.c

   248	
 > 249	struct device_node *svm_find_mem_reg_node(struct device *dev, const char *compat)
   250	{
   251		int index = 0;
   252		struct device_node *tmp = NULL;
   253		struct device_node *np = dev->of_node;
   254	
   255		for (; ; index++) {
   256			tmp = of_parse_phandle(np, "memory-region", index);
   257			if (!tmp)
   258				break;
   259	
   260			if (of_device_is_compatible(tmp, compat))
   261				return tmp;
   262	
   263			of_node_put(tmp);
   264		}
   265	
   266		return NULL;
   267	}
   268	
   269	static int svm_parse_trunk_memory(struct device *dev, phys_addr_t *base, unsigned long *size)
   270	{
   271		int err;
   272		struct resource r;
   273		struct device_node *trunk = NULL;
   274	
   275		trunk = svm_find_mem_reg_node(dev, SVM_MEM_REG);
   276		if (!trunk) {
   277			dev_err(dev, "Didn't find reserved memory\n");
   278			return -EINVAL;
   279		}
   280	
   281		err = of_address_to_resource(trunk, 0, &r);
   282		of_node_put(trunk);
   283		if (err) {
   284			dev_err(dev, "Couldn't address to resource for reserved memory\n");
   285			return -ENOMEM;
   286		}
   287	
   288		*base = r.start;
   289		*size = resource_size(&r);
   290	
   291		return 0;
   292	}
   293	
   294	static int svm_setup_trunk(struct device *dev, phys_addr_t base, unsigned long size)
   295	{
   296		int slot_total;
   297		unsigned long *bitmap = NULL;
   298		struct svm_va2pa_slot *slot = NULL;
   299	
   300		if (!IS_ALIGNED(base, SVM_VA2PA_MEMORY_ALIGN)) {
   301			dev_err(dev, "Didn't aligned to %u\n", SVM_VA2PA_MEMORY_ALIGN);
   302			return -EINVAL;
   303		}
   304	
   305		if ((size == 0) || (size > SVM_VA2PA_TRUNK_SIZE_MAX)) {
   306			dev_err(dev, "Size of reserved memory is not right\n");
   307			return -EINVAL;
   308		}
   309	
   310		slot_total = size / SVM_VA2PA_SLOT_SIZE;
   311		if (slot_total < BITS_PER_LONG)
   312			return -EINVAL;
   313	
   314		bitmap = kvcalloc(slot_total / BITS_PER_LONG, sizeof(unsigned long), GFP_KERNEL);
   315		if (!bitmap) {
   316			dev_err(dev, "alloc memory failed\n");
   317			return -ENOMEM;
   318		}
   319	
 > 320		slot = ioremap(base, size);
   321		if (!slot) {
   322			kvfree(bitmap);
   323			dev_err(dev, "Ioremap trunk failed\n");
   324			return -ENXIO;
   325		}
   326	
   327		va2pa_trunk.slots = slot;
   328		va2pa_trunk.slot_used = 0;
   329		va2pa_trunk.slot_total = slot_total;
   330		va2pa_trunk.bitmap = bitmap;
   331		mutex_init(&va2pa_trunk.mutex);
   332	
   333		return 0;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
