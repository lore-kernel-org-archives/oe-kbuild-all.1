Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC5812C462
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714474360; cv=none; b=sYua9tHMj+6+MUnh/V1/eRCL27oFPJe3eEzaweUX/Kcv0nhEvaNpInHgXdIESwazQUEvkKeupwnAx/5Cfe1Zg3/npaExKgEKFgOGJDO/u38amQfMGmpCtyjmpmmbVF11KcO+OaHDlO0a471qqhNZyMf1uyhz6DzdSDyddMP44h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714474360; c=relaxed/simple;
	bh=2m050/VLICjVJKDEGWICMx+pEWdZOLdY7WDLMAhLNho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCBbaUv6HEyAsmcw2bnSMvjorM6LVpGeLibD0F0uGXXnlkDLHb1nU6g8o/AccHMIw8Wf3l6wtvBVYcge9hwWWlAZDjJvjJlA3pq9sxfVbtRe2QcUiZQ/0Ti1C7v5Z/WWRUDiRfm7/vgPwQj78bQIPNOcUBsALpMiAoLeQQGzThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRqGtacN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRqGtacN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714474357; x=1746010357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2m050/VLICjVJKDEGWICMx+pEWdZOLdY7WDLMAhLNho=;
  b=ZRqGtacNIQDSm2859T36qkcLBlk3f3oussOzI59/w4Bq8sk92W766//9
   aLmnfaDMK8h2TxSYSwLtD9eeAuDiFAsduu7A8xeb+4YBRluv3BmXgtJr/
   hbsZ455Sz93xG5ai7BQ/zndi4T92xokfc/5kuFo3theAORV0+ryFrOWYa
   t7zpEneTAy+FETY1Q5PVL5krGB1tUfJNmjcrgYDcXD+FrDCZd3Sk1Cj+u
   YK9sS8B15sUNhhuea9D9i4/7p3TvuBP4PtqImqT7VFvfYDEbhrYe0JqH+
   r1iAMpma9f0YuWWQ4JYAiLHJT78kC/UsE6VkyuDqIFkc2tawIfCPmd24R
   Q==;
X-CSE-ConnectionGUID: s1Sn/3J6RmOCIgBFP70gBA==
X-CSE-MsgGUID: 2+YKMJvyRC6408XD26w0EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10395750"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10395750"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 03:52:36 -0700
X-CSE-ConnectionGUID: UJWxkcYqT2O9KpuA0COPxQ==
X-CSE-MsgGUID: /jgKmabKQyKTE0QNb4wbzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26286533"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2024 03:52:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1l68-00083f-1U;
	Tue, 30 Apr 2024 10:52:32 +0000
Date: Tue, 30 Apr 2024 18:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5026/11728]
 drivers/regulator/pf5300-regulator.c:215:5: warning: no previous prototype
 for function 'pf5300_regulator_is_enabled_regmap'
Message-ID: <202404301841.2VHy69Ug-lkp@intel.com>
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
commit: 4b8087234293eaf5a743dcb44493020df70b6e75 [5026/11728] MLK-26158-2: regulator: pf5300: add new PMIC pf5300 driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404301841.2VHy69Ug-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301841.2VHy69Ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301841.2VHy69Ug-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/regulator/pf5300-regulator.c:9:
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
   In file included from drivers/regulator/pf5300-regulator.c:9:
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
   In file included from drivers/regulator/pf5300-regulator.c:9:
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
   In file included from drivers/regulator/pf5300-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/regulator/pf5300-regulator.c:215:5: warning: no previous prototype for function 'pf5300_regulator_is_enabled_regmap' [-Wmissing-prototypes]
     215 | int pf5300_regulator_is_enabled_regmap(struct regulator_dev *rdev)
         |     ^
   drivers/regulator/pf5300-regulator.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     215 | int pf5300_regulator_is_enabled_regmap(struct regulator_dev *rdev)
         | ^
         | static 
>> drivers/regulator/pf5300-regulator.c:308:5: warning: no previous prototype for function 'pf5300_regulator_set_ramp_delay_regmap' [-Wmissing-prototypes]
     308 | int pf5300_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
         |     ^
   drivers/regulator/pf5300-regulator.c:308:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     308 | int pf5300_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
         | ^
         | static 
>> drivers/regulator/pf5300-regulator.c:342:5: warning: no previous prototype for function 'pf5300_regulator_get_voltage_sel_regmap' [-Wmissing-prototypes]
     342 | int pf5300_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
         |     ^
   drivers/regulator/pf5300-regulator.c:342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     342 | int pf5300_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
         | ^
         | static 
   10 warnings generated.


vim +/pf5300_regulator_is_enabled_regmap +215 drivers/regulator/pf5300-regulator.c

   205	
   206	/**
   207	 * pf5300_regulator_is_enabled_regmap for regmap users
   208	 *
   209	 * @rdev: regulator to operate on
   210	 *
   211	 * Regulators that use regmap for their register I/O can set the
   212	 * enable_reg and enable_mask fields in their descriptor and then use
   213	 * this as their is_enabled operation, saving some code.
   214	 */
 > 215	int pf5300_regulator_is_enabled_regmap(struct regulator_dev *rdev)
   216	{
   217		unsigned int val;
   218		int ret;
   219		struct pf5300 *pf5300 = dev_get_drvdata(rdev->dev.parent);
   220	
   221		ret = pf5300_pmic_read(pf5300, rdev->desc->enable_reg, &val);
   222		if (ret != 0)
   223			return ret;
   224	
   225		val &= rdev->desc->enable_mask;
   226	
   227		if (rdev->desc->enable_is_inverted) {
   228			if (rdev->desc->enable_val)
   229				return val != rdev->desc->enable_val;
   230			return val == 0;
   231		} else {
   232			if (rdev->desc->enable_val)
   233				return val == rdev->desc->enable_val;
   234			return val != 0;
   235		}
   236	}
   237	
   238	/**
   239	 * pf5300_regulator_set_voltage_sel_regmap for regmap users
   240	 *
   241	 * @rdev: regulator to operate on
   242	 * @sel: Selector to set
   243	 *
   244	 * Regulators that use regmap for their register I/O can set the
   245	 * vsel_reg and vsel_mask fields in their descriptor and then use this
   246	 * as their set_voltage_vsel operation, saving some code.
   247	 */
   248	static int pf5300_regulator_set_voltage_sel_regmap(struct regulator_dev *rdev,
   249						    unsigned int sel)
   250	{
   251		int ret;
   252		struct pf5300 *pf5300 = dev_get_drvdata(rdev->dev.parent);
   253	
   254		sel <<= ffs(rdev->desc->vsel_mask) - 1;
   255		ret = pf5300_pmic_write(pf5300, rdev->desc->vsel_reg, sel,
   256					rdev->desc->vsel_mask);
   257		if (ret)
   258			return ret;
   259	
   260		if (rdev->desc->apply_bit)
   261			ret = pf5300_pmic_write(pf5300, rdev->desc->apply_reg,
   262						rdev->desc->apply_bit,
   263						rdev->desc->apply_bit);
   264		return ret;
   265	}
   266	
   267	static int find_closest_bigger(unsigned int target, const unsigned int *table,
   268				       unsigned int num_sel, unsigned int *sel)
   269	{
   270		unsigned int s, tmp, max, maxsel = 0;
   271		bool found = false;
   272	
   273		max = table[0];
   274	
   275		for (s = 0; s < num_sel; s++) {
   276			if (table[s] > max) {
   277				max = table[s];
   278				maxsel = s;
   279			}
   280			if (table[s] >= target) {
   281				if (!found || table[s] - target < tmp - target) {
   282					tmp = table[s];
   283					*sel = s;
   284					found = true;
   285					if (tmp == target)
   286						break;
   287				}
   288			}
   289		}
   290	
   291		if (!found) {
   292			*sel = maxsel;
   293			return -EINVAL;
   294		}
   295	
   296		return 0;
   297	}
   298	
   299	/**
   300	 * pf5300_regulator_set_ramp_delay_regmap
   301	 *
   302	 * @rdev: regulator to operate on
   303	 *
   304	 * Regulators that use regmap for their register I/O can set the ramp_reg
   305	 * and ramp_mask fields in their descriptor and then use this as their
   306	 * set_ramp_delay operation, saving some code.
   307	 */
 > 308	int pf5300_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
   309						   int ramp_delay)
   310	{
   311		int ret;
   312		unsigned int sel;
   313		struct pf5300 *pf5300 = dev_get_drvdata(rdev->dev.parent);
   314	
   315		if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_delay_table))
   316			return -EINVAL;
   317	
   318		ret = find_closest_bigger(ramp_delay, rdev->desc->ramp_delay_table,
   319					  rdev->desc->n_ramp_values, &sel);
   320	
   321		if (ret) {
   322			dev_warn(rdev_get_dev(rdev),
   323				 "Can't set ramp-delay %u, setting %u\n", ramp_delay,
   324				 rdev->desc->ramp_delay_table[sel]);
   325		}
   326	
   327		sel <<= ffs(rdev->desc->ramp_mask) - 1;
   328	
   329		return pf5300_pmic_write(pf5300, rdev->desc->ramp_reg, sel,
   330					 rdev->desc->ramp_mask);
   331	}
   332	
   333	/**
   334	 * pf5300_regulator_get_voltage_sel_regmap for regmap users
   335	 *
   336	 * @rdev: regulator to operate on
   337	 *
   338	 * Regulators that use regmap for their register I/O can set the
   339	 * vsel_reg and vsel_mask fields in their descriptor and then use this
   340	 * as their get_voltage_vsel operation, saving some code.
   341	 */
 > 342	int pf5300_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
   343	{
   344		unsigned int val;
   345		int ret;
   346		struct pf5300 *pf5300 = dev_get_drvdata(rdev->dev.parent);
   347	
   348		ret = pf5300_pmic_read(pf5300, rdev->desc->vsel_reg, &val);
   349		if (ret != 0)
   350			return ret;
   351	
   352		val &= rdev->desc->vsel_mask;
   353		val >>= ffs(rdev->desc->vsel_mask) - 1;
   354	
   355		return val;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
