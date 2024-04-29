Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE8810971
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714396844; cv=none; b=L3FCUpDZEiAr4Av7UMOtPmdPvEKF40yX6mUEBEAjYRZDFt5jtsNFD/pIchBNmbvUEymGDkqj3b7zC750YLpyrYKzpEgpcm9OEAoVTT6ZokmMgm/H0AYhE40Ff76yI3Juwt+thB94DVIUXApue7Sn5p1ktZ3EvzCvlBNnC+X1Slc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714396844; c=relaxed/simple;
	bh=uXgychcX6bo0qufVNZEQufWHftfPKkcANYO+wuV/0Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxqFkvUJtYNPP7Gl+WGCBjcuWo4HvpBfvNhvswdPNYABaM+lFP8I7YHXZOtEGXKdUnNl/q0Q/RqO3UOoqARarKU5SsjphxUx9SI96aI1zXeaDlPz5xTpv+af17iOES9r6iYsPK/BHtGSp57u7pWXpB2knUU0Sp034QR9mBXXqDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJtQuBg2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJtQuBg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714396842; x=1745932842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXgychcX6bo0qufVNZEQufWHftfPKkcANYO+wuV/0Lk=;
  b=EJtQuBg2uO5yWnhsMAUumZ9BEj6HzpNZVVuuYCJVFByui4+SfenN21+x
   5zWnf2Q8zf03LfS+alhcC9KMqrrL91Tgyg7Xofr+LYXaQrFef8KhHzEsM
   Oy1eeb+lQwSM/hW2gO3ocjSRmnaabm/6Qzldo0F+fsjYpKdQMtvJgxjHo
   g0/yjAXSoFi2FqyX1BlA06tpLPylmdtjxZzyIt3FFCQiBpZzzZ9+EIMDH
   xL21z2RUDLwpw2dDkUMJFTZILUlrPokSkyjFbQrQ06YiksoOz63MPfibb
   NInO3uBmqH/k0YGbzZhI8zYbsVI6Ha/VjwrUc6KBfHh4rineRSIB9+CQX
   Q==;
X-CSE-ConnectionGUID: X1ryrAXDRi6g8nGYQ2w0kg==
X-CSE-MsgGUID: bp4/DXM/RPGj0bVC4FlsNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9914840"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9914840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 06:20:42 -0700
X-CSE-ConnectionGUID: eL+4GJCNS36dlcC97FZKNQ==
X-CSE-MsgGUID: g2EHAnZdR+2Aq6dwwO+Z1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="49320067"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2024 06:20:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Qvu-0007C2-27;
	Mon, 29 Apr 2024 13:20:38 +0000
Date: Mon, 29 Apr 2024 21:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5024/11728]
 drivers/regulator/pf0900-regulator.c:217:5: warning: no previous prototype
 for 'pf0900_regulator_is_enabled_regmap'
Message-ID: <202404292104.NwdpI4AY-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404292104.NwdpI4AY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292104.NwdpI4AY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292104.NwdpI4AY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/pf0900-regulator.c:217:5: warning: no previous prototype for 'pf0900_regulator_is_enabled_regmap' [-Wmissing-prototypes]
     217 | int pf0900_regulator_is_enabled_regmap(struct regulator_dev *rdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/pf0900-regulator.c:310:5: warning: no previous prototype for 'pf0900_regulator_set_ramp_delay_regmap' [-Wmissing-prototypes]
     310 | int pf0900_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/pf0900-regulator.c:344:5: warning: no previous prototype for 'pf0900_regulator_get_voltage_sel_regmap' [-Wmissing-prototypes]
     344 | int pf0900_regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/regulator/pf0900-regulator.c:156: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf0900_regulator_enable_regmap for regmap users
   drivers/regulator/pf0900-regulator.c:182: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf0900_regulator_disable_regmap for regmap users
   drivers/regulator/pf0900-regulator.c:209: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf0900_regulator_is_enabled_regmap for regmap users
   drivers/regulator/pf0900-regulator.c:241: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf0900_regulator_set_voltage_sel_regmap for regmap users
>> drivers/regulator/pf0900-regulator.c:312: warning: Function parameter or member 'ramp_delay' not described in 'pf0900_regulator_set_ramp_delay_regmap'
   drivers/regulator/pf0900-regulator.c:336: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf0900_regulator_get_voltage_sel_regmap for regmap users


vim +/pf0900_regulator_is_enabled_regmap +217 drivers/regulator/pf0900-regulator.c

   154	
   155	/**
 > 156	 * pf0900_regulator_enable_regmap for regmap users
   157	 *
   158	 * @rdev: regulator to operate on
   159	 *
   160	 * Regulators that use regmap for their register I/O can set the
   161	 * enable_reg and enable_mask fields in their descriptor and then use
   162	 * this as their enable() operation, saving some code.
   163	 */
   164	static int pf0900_regulator_enable_regmap(struct regulator_dev *rdev)
   165	{
   166		unsigned int val;
   167		struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
   168	
   169		if (rdev->desc->enable_is_inverted) {
   170			val = rdev->desc->disable_val;
   171		} else {
   172			val = rdev->desc->enable_val;
   173			if (!val)
   174				val = rdev->desc->enable_mask;
   175		}
   176	
   177		return pf0900_pmic_write(pf0900, rdev->desc->enable_reg, val,
   178					 rdev->desc->enable_mask);
   179	}
   180	
   181	/**
   182	 * pf0900_regulator_disable_regmap for regmap users
   183	 *
   184	 * @rdev: regulator to operate on
   185	 *
   186	 * Regulators that use regmap for their register I/O can set the
   187	 * enable_reg and enable_mask fields in their descriptor and then use
   188	 * this as their disable() operation, saving some code.
   189	 */
   190	static int pf0900_regulator_disable_regmap(struct regulator_dev *rdev)
   191	{
   192		unsigned int val;
   193	
   194		struct pf0900 *pf0900 = dev_get_drvdata(rdev->dev.parent);
   195	
   196		if (rdev->desc->enable_is_inverted) {
   197			val = rdev->desc->enable_val;
   198			if (!val)
   199				val = rdev->desc->enable_mask;
   200		} else {
   201			val = rdev->desc->disable_val;
   202		}
   203	
   204		return pf0900_pmic_write(pf0900, rdev->desc->enable_reg, val,
   205					 rdev->desc->enable_mask);
   206	}
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
 > 312	{
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
