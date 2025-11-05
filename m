Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C51FA272
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 23:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762386619; cv=none; b=O5KqdcJbcvkpI0CnqL6A/Vn5VrANGQy5KBx3IQ7MYoyUvi6J36eDbvMrOx/VdNCnPbzWqrqZIw94W/YjB8dBhynu+uWCn+vDnDX4s67h7oNf9HQxDQ1mqP2aHPfbmUboFjXWYCHSqLvuOfj7v8ekyWFH3d0J/NmI7BemlA8LJ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762386619; c=relaxed/simple;
	bh=lLXdAU+na/neF/4x+JN5DyGU6jsBuldvi6xxJtrzThk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHx8Db2juu+FzigAuBckAZIqIPosD4AHpAuPKCSpyDVHQH6Ja52/8lNfg+uB0ntPg6PWxcwXRUwooX4UfgPOgAO8rT0zSiO0yu6OLWoZqc0qCl0U23QBiaFngsF4MrV7/h3+hrNHM/Fl0nzuQPX6YM0rykUxkreztU8QuDOw74E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3sMsAmM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3sMsAmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762386618; x=1793922618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lLXdAU+na/neF/4x+JN5DyGU6jsBuldvi6xxJtrzThk=;
  b=V3sMsAmMsBMihE/IjzQkfzXfapgbokTkCeU/E0LMZEvcQ/yLEI09WHe+
   RipJz5Z2SWbrPziHtAHuUTv2qqZImwv/bRjvEv2CeGRzPq1jD5q25at6G
   sMF/ORDCB2RDYeJbDkuuZCD5dQQ6kkVMt2EK4NyuxxCDhdA5v5wuc3rVK
   Pv4mmWNCm7P6qO5wZ6T0XuSCsUmovZunUrm6XdH90WjEVHEVS1Wt7zGLM
   DKTWviwIJgPmikUscRXRMfiQtX7djdOu17Uxv1GA/PrqtW2iASTQoTIu8
   yeTGjaJrBtkfcmanSW6Dq39gMsXrjjfZD8f/9aabaqzBXd2t74EL3ZZBQ
   w==;
X-CSE-ConnectionGUID: XrxslLQTRaiLQ6Q3EwdPTw==
X-CSE-MsgGUID: 2x9dVfV8QX27J0Ibl7lzqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52084129"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="52084129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 15:50:16 -0800
X-CSE-ConnectionGUID: /KDwu5oHQTqtzMp7vZMz5w==
X-CSE-MsgGUID: z28gBDOKT7KRj/w2OIaBFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="191953682"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2025 15:50:15 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGnGW-000TFw-0m;
	Wed, 05 Nov 2025 23:50:12 +0000
Date: Thu, 6 Nov 2025 07:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1932/1932] drivers/char/svm.c:366:43:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202511060739.4h8XJsMM-lkp@intel.com>
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
commit: 51d0e1a742714b2599d54fd92a71bd2998b01084 [1932/1932] support multiple node for getting phys interface
config: arm64-randconfig-r132-20251106 (https://download.01.org/0day-ci/archive/20251106/202511060739.4h8XJsMM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060739.4h8XJsMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060739.4h8XJsMM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/svm.c:248:20: sparse: sparse: symbol 'svm_find_mem_reg_node' was not declared. Should it be static?
   drivers/char/svm.c:325:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svm_va2pa_slot *slot @@     got void [noderef] <asn:2> * @@
   drivers/char/svm.c:325:14: sparse:     expected struct svm_va2pa_slot *slot
   drivers/char/svm.c:325:14: sparse:     got void [noderef] <asn:2> *
>> drivers/char/svm.c:366:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got struct svm_va2pa_slot *slots @@
   drivers/char/svm.c:366:43: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/char/svm.c:366:43: sparse:     got struct svm_va2pa_slot *slots
   drivers/char/svm.c:449:6: sparse: sparse: symbol 'sysrq_sched_debug_show_export' was not declared. Should it be static?
   drivers/char/svm.c:1272:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/char/svm.c:248:21: warning: no previous prototype for 'svm_find_mem_reg_node' [-Wmissing-prototypes]
     248 | struct device_node *svm_find_mem_reg_node(struct device *dev, const char *compat)
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:449:6: warning: no previous prototype for 'sysrq_sched_debug_show_export' [-Wmissing-prototypes]
     449 | void sysrq_sched_debug_show_export(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1476:5: warning: no previous prototype for 'svm_get_pasid' [-Wmissing-prototypes]
    1476 | int svm_get_pasid(pid_t vpid, int dev_id __maybe_unused)
         |     ^~~~~~~~~~~~~
   drivers/char/svm.c:2269:36: warning: 'svm_acpi_match' defined but not used [-Wunused-const-variable=]
    2269 | static const struct acpi_device_id svm_acpi_match[] = {
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
     492 |         asm volatile(                                                   37-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c:1796:25: note: while referencing 'l2buf_load_flag'
    1796 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
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
     492 |         asm volatile(                                                   57-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c:1796:25: note: while referencing 'l2buf_load_flag'
    1796 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~

vim +366 drivers/char/svm.c

   247	
 > 248	struct device_node *svm_find_mem_reg_node(struct device *dev, const char *compat)
   249	{
   250		int index = 0;
   251		struct device_node *tmp = NULL;
   252		struct device_node *np = dev->of_node;
   253	
   254		for (; ; index++) {
   255			tmp = of_parse_phandle(np, "memory-region", index);
   256			if (!tmp)
   257				break;
   258	
   259			if (of_device_is_compatible(tmp, compat))
   260				return tmp;
   261	
   262			of_node_put(tmp);
   263		}
   264	
   265		return NULL;
   266	}
   267	
   268	static int svm_parse_trunk_memory(struct device *dev)
   269	{
   270		int err, count;
   271		struct resource r;
   272		struct device_node *trunk = NULL;
   273	
   274		trunk = svm_find_mem_reg_node(dev, SVM_MEM_REG);
   275		if (!trunk) {
   276			dev_err(dev, "Didn't find reserved memory\n");
   277			return -EINVAL;
   278		}
   279	
   280		for (count = 0; count < SVM_VA2PA_TRUNK_COUNT_MAX; count++) {
   281			err = of_address_to_resource(trunk, count, &r);
   282			if (err)
   283				break;
   284	
   285			va2pa_trunk[count].base = r.start;
   286			va2pa_trunk[count].size = resource_size(&r);
   287		}
   288	
   289		if (!count) {
   290			dev_err(dev, "Couldn't address to resource for reserved memory\n");
   291			return -ENODEV;
   292		}
   293	
   294		return 0;
   295	}
   296	
   297	static int __svm_setup_trunk(struct device *dev, struct svm_va2pa_trunk *trunk)
   298	{
   299		int slot_total;
   300		unsigned long *bitmap = NULL;
   301		struct svm_va2pa_slot *slot = NULL;
   302		phys_addr_t base = trunk->base;
   303		unsigned long size = trunk->size;
   304	
   305		if (!IS_ALIGNED(base, SVM_VA2PA_MEMORY_ALIGN)) {
   306			dev_err(dev, "Didn't aligned to %u\n", SVM_VA2PA_MEMORY_ALIGN);
   307			return -EINVAL;
   308		}
   309	
   310		if ((size == 0) || (size > SVM_VA2PA_TRUNK_SIZE_MAX)) {
   311			dev_err(dev, "Size of reserved memory is not right\n");
   312			return -EINVAL;
   313		}
   314	
   315		slot_total = size / SVM_VA2PA_SLOT_SIZE;
   316		if (slot_total < BITS_PER_LONG)
   317			return -EINVAL;
   318	
   319		bitmap = kvcalloc(slot_total / BITS_PER_LONG, sizeof(unsigned long), GFP_KERNEL);
   320		if (!bitmap) {
   321			dev_err(dev, "alloc memory failed\n");
   322			return -ENOMEM;
   323		}
   324	
   325		slot = ioremap(base, size);
   326		if (!slot) {
   327			kvfree(bitmap);
   328			dev_err(dev, "Ioremap trunk failed\n");
   329			return -ENXIO;
   330		}
   331	
   332		trunk->slots = slot;
   333		trunk->slot_used = 0;
   334		trunk->slot_total = slot_total;
   335		trunk->bitmap = bitmap;
   336		mutex_init(&trunk->mutex);
   337	
   338		return 0;
   339	}
   340	
   341	static int svm_setup_trunk(struct device *dev)
   342	{
   343		int err = 0;
   344		int count;
   345	
   346		for (count = 0; count < SVM_VA2PA_TRUNK_COUNT_MAX; count++) {
   347			if (!va2pa_trunk[count].base)
   348				break;
   349	
   350			err = __svm_setup_trunk(dev, &va2pa_trunk[count]);
   351			if (err)
   352				break;
   353		}
   354	
   355		return err;
   356	}
   357	
   358	static void svm_remove_trunk(struct device *dev)
   359	{
   360		int count;
   361	
   362		for (count = 0; count < SVM_VA2PA_TRUNK_COUNT_MAX; count++) {
   363			if (!va2pa_trunk[count].base)
   364				break;
   365	
 > 366			iounmap(va2pa_trunk[count].slots);
   367			kvfree(va2pa_trunk[count].bitmap);
   368			va2pa_trunk[count].slots = NULL;
   369			va2pa_trunk[count].bitmap = NULL;
   370		}
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
