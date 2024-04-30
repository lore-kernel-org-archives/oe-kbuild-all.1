Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA44DF58
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 03:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714447031; cv=none; b=i8dWYpMI5ENAhaM8D6lGB987QFWFpOzF/YF1wLUv+sm694IoWEv5NiQr8Csgy0V3czgTCWi1UZ/BLOVzX1RmmQbHwuKKjCLzBQ656mQu982HSxbg9AdI+VstlcyqhOLJzB0ANeKxnO4ISJYkrgDuWWD1ExmticiI70SQjRkN+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714447031; c=relaxed/simple;
	bh=oKyAoF0ikEnSaAY98ixBYFTFBQxqv1je/Su+iK8K7fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwl0r2UgOYCB8bwW95b0r0ji8BmFZlxkeKV/AyUaa7XFFWnokHqmWUsFZ0FP96zn1ynVvNjWiEijakoinKmUduZUjUaWX6xbl5iAEkYouoNYJdowXdjrpxsLYcd7q62zQo1sM1jHwydsoi5WX27SHEmb8DtMl/lWDzWbnDYY6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auxhrNcV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auxhrNcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714447029; x=1745983029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKyAoF0ikEnSaAY98ixBYFTFBQxqv1je/Su+iK8K7fg=;
  b=auxhrNcV2/tGbX6WHP5V7GcnlUuQa8iSA0NUrLRQxWZfFSZ/r0D+8NGs
   I52rWx6GLXuZvrDoq63ADdW+JSOjCi/KU1RO1Hfc/F9VKvtVKX0Xz5JC9
   j+FWVabTuZIORJco6Kq1sqzcb723lQvDLvLQiAcxbv3tkwf3vUPjqKs5Q
   ZjMlqHheqdZjHFya/X6dv2ADQ2jULeIPRCUGPRbvPA7AmMVf5dkf2u0aw
   agAz8tJbvQk8VVnAekp6X+GQ+ep7P0EXEAEVeumaAle5bBC23gyVJ390e
   wIrtjEXedZZPN38rP8gEn4vDP6MG53jP9FBTbxIxtw7xCpg3JWLcXc00G
   g==;
X-CSE-ConnectionGUID: wyyNYgMcQRiGo3BFIJwZXA==
X-CSE-MsgGUID: ktRS69/AQ4+xv5YZtxq+uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13958221"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13958221"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 20:17:09 -0700
X-CSE-ConnectionGUID: /smCABh/T7217g8JscqoLg==
X-CSE-MsgGUID: hUOf3St5QzyVbqKvyMVbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="57507455"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Apr 2024 20:17:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1dzN-0007fk-0t;
	Tue, 30 Apr 2024 03:17:05 +0000
Date: Tue, 30 Apr 2024 11:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5024/11728]
 drivers/regulator/pf0900-regulator.c:217:5: warning: no previous prototype
 for function 'pf0900_regulator_is_enabled_regmap'
Message-ID: <202404301148.4iTpF3Jm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: b34c9532bae667338e8361a582a8579991c8e733 [5024/11728] MLK-26139-2: regulator: pf0900: add new PMIC pf0900 driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404301148.4iTpF3Jm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301148.4iTpF3Jm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301148.4iTpF3Jm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/regulator/pf0900-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/regulator/pf0900-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/regulator/pf0900-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/regulator/pf0900-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/regulator/pf0900-regulator.c:217:5: warning: no previous prototype for function 'pf0900_regulator_is_enabled_regmap' [-Wmissing-prototypes]
     217 | int pf0900_regulator_is_enabled_regmap(struct regulator_dev *rdev)
         |     ^
   drivers/regulator/pf0900-regulator.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     217 | int pf0900_regulator_is_enabled_regmap(struct regulator_dev *rdev)
         | ^
         | static 
>> drivers/regulator/pf0900-regulator.c:310:5: warning: no previous prototype for function 'pf0900_regulator_set_ramp_delay_regmap' [-Wmissing-prototypes]
     310 | int pf0900_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
         |     ^
   drivers/regulator/pf0900-regulator.c:310:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     310 | int pf0900_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
         | ^
         | static 
>> drivers/regulator/pf0900-regulator.c:344:5: warning: no previous prototype for function 'pf0900_regulator_get_voltage_sel_regmap' [-Wmissing-prototypes]
     344 | int pf0900_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
         |     ^
   drivers/regulator/pf0900-regulator.c:344:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     344 | int pf0900_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
         | ^
         | static 
   drivers/regulator/pf0900-regulator.c:941:15: warning: variable 'desc' is uninitialized when used here [-Wuninitialized]
     941 |                 if (!strcmp(desc->name, "ldo3") && ldo3_stby) {
         |                             ^~~~
   drivers/regulator/pf0900-regulator.c:937:36: note: initialize the variable 'desc' to silence this warning
     937 |                 const struct regulator_desc *desc;
         |                                                  ^
         |                                                   = NULL
   11 warnings generated.


vim +/pf0900_regulator_is_enabled_regmap +217 drivers/regulator/pf0900-regulator.c

   207	
   208	/**
   209	 * pf0900_regulator_is_enabled_regmap for regmap users
   210	 *
   211	 * @rdev: regulator to operate on
   212	 *
   213	 * Regulators that use regmap for their register I/O can set the
   214	 * enable_reg and enable_mask fields in their descriptor and then use
   215	 * this as their is_enabled operation, saving some code.
   216	 */
 > 217	int pf0900_regulator_is_enabled_regmap(struct regulator_dev *rdev)
   218	{
   219		unsigned int val;
   220		int ret;
   221		struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
   222	
   223		ret = pf0900_pmic_read(pf0900, rdev->desc->enable_reg, &val);
   224		if (ret != 0)
   225			return ret;
   226	
   227		val &= rdev->desc->enable_mask;
   228	
   229		if (rdev->desc->enable_is_inverted) {
   230			if (rdev->desc->enable_val)
   231				return val != rdev->desc->enable_val;
   232			return val == 0;
   233		} else {
   234			if (rdev->desc->enable_val)
   235				return val == rdev->desc->enable_val;
   236			return val != 0;
   237		}
   238	}
   239	
   240	/**
   241	 * pf0900_regulator_set_voltage_sel_regmap for regmap users
   242	 *
   243	 * @rdev: regulator to operate on
   244	 * @sel: Selector to set
   245	 *
   246	 * Regulators that use regmap for their register I/O can set the
   247	 * vsel_reg and vsel_mask fields in their descriptor and then use this
   248	 * as their set_voltage_vsel operation, saving some code.
   249	 */
   250	static int pf0900_regulator_set_voltage_sel_regmap(struct regulator_dev *rdev,
   251						    unsigned int sel)
   252	{
   253		int ret;
   254		struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
   255	
   256		sel <<= ffs(rdev->desc->vsel_mask) - 1;
   257		ret = pf0900_pmic_write(pf0900, rdev->desc->vsel_reg, sel,
   258					rdev->desc->vsel_mask);
   259		if (ret)
   260			return ret;
   261	
   262		if (rdev->desc->apply_bit)
   263			ret = pf0900_pmic_write(pf0900, rdev->desc->apply_reg,
   264						rdev->desc->apply_bit,
   265						rdev->desc->apply_bit);
   266		return ret;
   267	}
   268	
   269	static int find_closest_bigger(unsigned int target, const unsigned int *table,
   270				       unsigned int num_sel, unsigned int *sel)
   271	{
   272		unsigned int s, tmp, max, maxsel = 0;
   273		bool found = false;
   274	
   275		max = table[0];
   276	
   277		for (s = 0; s < num_sel; s++) {
   278			if (table[s] > max) {
   279				max = table[s];
   280				maxsel = s;
   281			}
   282			if (table[s] >= target) {
   283				if (!found || table[s] - target < tmp - target) {
   284					tmp = table[s];
   285					*sel = s;
   286					found = true;
   287					if (tmp == target)
   288						break;
   289				}
   290			}
   291		}
   292	
   293		if (!found) {
   294			*sel = maxsel;
   295			return -EINVAL;
   296		}
   297	
   298		return 0;
   299	}
   300	
   301	/**
   302	 * pf0900_regulator_set_ramp_delay_regmap
   303	 *
   304	 * @rdev: regulator to operate on
   305	 *
   306	 * Regulators that use regmap for their register I/O can set the ramp_reg
   307	 * and ramp_mask fields in their descriptor and then use this as their
   308	 * set_ramp_delay operation, saving some code.
   309	 */
 > 310	int pf0900_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
   311						   int ramp_delay)
   312	{
   313		int ret;
   314		unsigned int sel;
   315		struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
   316	
   317		if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_delay_table))
   318			return -EINVAL;
   319	
   320		ret = find_closest_bigger(ramp_delay, rdev->desc->ramp_delay_table,
   321					  rdev->desc->n_ramp_values, &sel);
   322	
   323		if (ret) {
   324			dev_warn(rdev_get_dev(rdev),
   325				 "Can't set ramp-delay %u, setting %u\n", ramp_delay,
   326				 rdev->desc->ramp_delay_table[sel]);
   327		}
   328	
   329		sel <<= ffs(rdev->desc->ramp_mask) - 1;
   330	
   331		return pf0900_pmic_write(pf0900, rdev->desc->ramp_reg, sel,
   332					 rdev->desc->ramp_mask);
   333	}
   334	
   335	/**
   336	 * pf0900_regulator_get_voltage_sel_regmap for regmap users
   337	 *
   338	 * @rdev: regulator to operate on
   339	 *
   340	 * Regulators that use regmap for their register I/O can set the
   341	 * vsel_reg and vsel_mask fields in their descriptor and then use this
   342	 * as their get_voltage_vsel operation, saving some code.
   343	 */
 > 344	int pf0900_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
   345	{
   346		unsigned int val;
   347		int ret;
   348		struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
   349	
   350		ret = pf0900_pmic_read(pf0900, rdev->desc->vsel_reg, &val);
   351		if (ret != 0)
   352			return ret;
   353	
   354		val &= rdev->desc->vsel_mask;
   355		val >>= ffs(rdev->desc->vsel_mask) - 1;
   356	
   357		return val;
   358	}
   359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
