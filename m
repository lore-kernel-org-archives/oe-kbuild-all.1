Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05411E47A5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 21:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762377439; cv=none; b=g9YaTyxJyLHBBEASL8An85q4kUMtqvieun22Wqtl+SVKLW2v49syI+Ddu07EsguumY3aL6MaLOF26530v2llH+FCXvvHriftiscZfs+pnHoKRG6pERTB3TIaxXgWFYfcOlNvIuZn9Og62gJ2Zf0L1SnBMjMIZRDR6jF9X5tvJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762377439; c=relaxed/simple;
	bh=LJ2GGNKAhrpK6pA+moMMwCo30pDwqTl/LtA+ytZeLeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErJhCafDcAO4Ildhmx5fH0c01HUfAhyv3ln8wG14UaVCuK+e9rX8N7TZg41O0zeN046dnB+WK1qs6gKwP0BZqPKRusdeBgzbaa9SDBTYtn758DHOSFvAc6l5WeF8/2123CGjxRDQ9rOIyYyUe5++cSHe+skfD3/J/xe2ijy0nBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AreGl8ts; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AreGl8ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762377437; x=1793913437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJ2GGNKAhrpK6pA+moMMwCo30pDwqTl/LtA+ytZeLeY=;
  b=AreGl8tsm1ji5pJXYFs7HYbr1+sLoP3hYXe8KBBVNxbzgNhfmsSrvaDq
   Qc0gq+J41YM2iAIFk45f+OG/4tgF/0I/7cgEMLX8gvrg5kpXI8ywJ957Y
   4kq2P2S0fzqtqHnyrvkKkCtbtq05AqXotjgLGDeKi+F0ucf9Nbc/ji7TK
   TiCuEjcBTglRiqTqf95N87qBbFKgQHaPlFTbYltHAcshIpZU9TcIJSBuH
   tZeEDx8QeKQhXgL7bZxCc18OlVYXe6+3zlW8fdw/RDNRckTPMqooFK7G2
   g6+LNN/hLjUFv+uH0BOAZnAB4bZ0kCdgxuWVwttsK5ka5S8CrjUkdtayL
   g==;
X-CSE-ConnectionGUID: kp3TYij9RPC8PmUiois0YA==
X-CSE-MsgGUID: 0bUO/OtoQpOQkZKzP0B1rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52073806"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="52073806"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 13:17:17 -0800
X-CSE-ConnectionGUID: XbszwmprRzuvnEGqB17geQ==
X-CSE-MsgGUID: 4v2VKAGPQiaEStBv5H8wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="191669079"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Nov 2025 13:17:15 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGksO-000T8m-1N;
	Wed, 05 Nov 2025 21:17:09 +0000
Date: Thu, 6 Nov 2025 05:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1932/1932] drivers/char/svm.c:320:14:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202511060514.zlUwipLt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   27e321784c005c852ca4b3a2d146547deac0698f
commit: 9469d1759c2905dcef49df7e6240ad5c32b66296 [1932/1932] ascend: share_pool: enable svm to use share pool memory
config: arm64-randconfig-r132-20251106 (https://download.01.org/0day-ci/archive/20251106/202511060514.zlUwipLt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060514.zlUwipLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060514.zlUwipLt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/svm.c:240:24: sparse: sparse: symbol 'va2pa_trunk' was not declared. Should it be static?
   drivers/char/svm.c:249:20: sparse: sparse: symbol 'svm_find_mem_reg_node' was not declared. Should it be static?
>> drivers/char/svm.c:320:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svm_va2pa_slot *slot @@     got void [noderef] <asn:2> * @@
   drivers/char/svm.c:320:14: sparse:     expected struct svm_va2pa_slot *slot
   drivers/char/svm.c:320:14: sparse:     got void [noderef] <asn:2> *
   drivers/char/svm.c:338:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got struct svm_va2pa_slot *[addressable] [assigned] [toplevel] slots @@
   drivers/char/svm.c:338:28: sparse:     expected void volatile [noderef] <asn:2> *addr
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
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds]
     492 |         asm volatile(                                                   42-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c:1958:25: note: while referencing 'l2buf_load_flag'
    1958 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~
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
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds]
     492 |         asm volatile(                                                   62-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c:1958:25: note: while referencing 'l2buf_load_flag'
    1958 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~

vim +320 drivers/char/svm.c

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
