Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940841E1DE9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742192108; cv=none; b=U9ny4CdWH/58WG4/vFnsOXpW8oGjYy0Ph/cjQ4JSgkKFv5y/IqOu0f5eyCK5oWo1MWv/epQTV/rS4SB0pjXxih9ubRWDPif6SLApab6ixg6klQi1aaAkvNrshAUmPzHv8FEdGZxCpHaK+xMKQct9C27rzNQLC4l85QXc6KWcFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742192108; c=relaxed/simple;
	bh=pXF/iJJz+vsp8M46H6BTi0ubp/0ocir4fmCAlJpKDvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbbmBs6DanvVWgRzfPCDOBCGDxjtbQaC9F8kI9nD0dNzuzC0P4AkQMPekAXO1vrn2QwGLcyFi7ybrz1VjXWPX032JdUXN2BxyE1U3NqpyW18r911B/+7+m4FApBv9wRebzXU63/wj1ZeumJr7ChlTxGtZ0IsbvslHEkuaATGGGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biZzBujE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biZzBujE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742192107; x=1773728107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pXF/iJJz+vsp8M46H6BTi0ubp/0ocir4fmCAlJpKDvs=;
  b=biZzBujEW6WVA4eAKETbWD3DKO4D3nIAG4mt+jFtWuIaZz+wvxAX6tK8
   MxYI4GnPmHYx4USpmOxcI26jYxzFupfxV7ZSs6t8YHWxKZMTIgB56V2qE
   tj+Dygpjh7OC44ARejLuCj7du1DCpzasQop8VIjXaeDY2aqAQILCM935C
   ONTLthLjnGfIdBWBzr/MR/cLb8yOdjxD7FyTAJVvaxShIxtS55Q92aRUi
   MQDH+jW25U18sDNm0L72Wc/q8wBz1DypC4RtMZNiTgO9rVI0aVrfSVLLP
   PLcX9mbrTW3c0wFUJJFpTX4z9fCMx8e7e7zC+gPxSgZVZAu6V39EVzsGY
   w==;
X-CSE-ConnectionGUID: DOUZW/ttQfaLjXZJe8BBFQ==
X-CSE-MsgGUID: nGuJMfCFTOSI7+uxuevkzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="53935191"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="53935191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 23:15:05 -0700
X-CSE-ConnectionGUID: 5eZ+eJpNS9mUVcu6AUe0sw==
X-CSE-MsgGUID: 7BHnmQ31RLi0U9k7WLocjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="126875669"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Mar 2025 23:15:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu3ka-000CVj-18;
	Mon, 17 Mar 2025 06:15:00 +0000
Date: Mon, 17 Mar 2025 14:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-doc@vger.kernel.org
Subject: [broonie-ci:v5_20250314_frank_li_regulator_add_new_pmic_pf9453_support
 9/9] drivers/regulator/pf9453-regulator.c:304: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202503171400.UJKAoYR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v5_20250314_frank_li_regulator_add_new_pmic_pf9453_support
head:   0959b6706325bf147f253841eea312e27a3bf013
commit: 0959b6706325bf147f253841eea312e27a3bf013 [9/9] regulator: pf9453: add PMIC PF9453 support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250317/202503171400.UJKAoYR4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171400.UJKAoYR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171400.UJKAoYR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/pf9453-regulator.c:304: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf9453_regulator_enable_regmap for regmap users
   drivers/regulator/pf9453-regulator.c:329: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf9453_regulator_disable_regmap for regmap users
   drivers/regulator/pf9453-regulator.c:354: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * pf9453_regulator_set_voltage_sel_regmap for regmap users
>> drivers/regulator/pf9453-regulator.c:421: warning: Function parameter or struct member 'ramp_delay' not described in 'pf9453_regulator_set_ramp_delay_regmap'


vim +304 drivers/regulator/pf9453-regulator.c

   302	
   303	/**
 > 304	 * pf9453_regulator_enable_regmap for regmap users
   305	 *
   306	 * @rdev: regulator to operate on
   307	 *
   308	 * Regulators that use regmap for their register I/O can set the
   309	 * enable_reg and enable_mask fields in their descriptor and then use
   310	 * this as their enable() operation, saving some code.
   311	 */
   312	static int pf9453_regulator_enable_regmap(struct regulator_dev *rdev)
   313	{
   314		struct pf9453 *pf9453 = dev_get_drvdata(rdev->dev.parent);
   315		unsigned int val;
   316	
   317		if (rdev->desc->enable_is_inverted) {
   318			val = rdev->desc->disable_val;
   319		} else {
   320			val = rdev->desc->enable_val;
   321			if (!val)
   322				val = rdev->desc->enable_mask;
   323		}
   324	
   325		return pf9453_pmic_write(pf9453, rdev->desc->enable_reg, rdev->desc->enable_mask, val);
   326	}
   327	
   328	/**
   329	 * pf9453_regulator_disable_regmap for regmap users
   330	 *
   331	 * @rdev: regulator to operate on
   332	 *
   333	 * Regulators that use regmap for their register I/O can set the
   334	 * enable_reg and enable_mask fields in their descriptor and then use
   335	 * this as their disable() operation, saving some code.
   336	 */
   337	static int pf9453_regulator_disable_regmap(struct regulator_dev *rdev)
   338	{
   339		struct pf9453 *pf9453 = dev_get_drvdata(rdev->dev.parent);
   340		unsigned int val;
   341	
   342		if (rdev->desc->enable_is_inverted) {
   343			val = rdev->desc->enable_val;
   344			if (!val)
   345				val = rdev->desc->enable_mask;
   346		} else {
   347			val = rdev->desc->disable_val;
   348		}
   349	
   350		return pf9453_pmic_write(pf9453, rdev->desc->enable_reg, rdev->desc->enable_mask, val);
   351	}
   352	
   353	/**
   354	 * pf9453_regulator_set_voltage_sel_regmap for regmap users
   355	 *
   356	 * @rdev: regulator to operate on
   357	 * @sel: Selector to set
   358	 *
   359	 * Regulators that use regmap for their register I/O can set the
   360	 * vsel_reg and vsel_mask fields in their descriptor and then use this
   361	 * as their set_voltage_vsel operation, saving some code.
   362	 */
   363	static int pf9453_regulator_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned int sel)
   364	{
   365		struct pf9453 *pf9453 = dev_get_drvdata(rdev->dev.parent);
   366		int ret;
   367	
   368		sel <<= ffs(rdev->desc->vsel_mask) - 1;
   369		ret = pf9453_pmic_write(pf9453, rdev->desc->vsel_reg, rdev->desc->vsel_mask, sel);
   370		if (ret)
   371			return ret;
   372	
   373		if (rdev->desc->apply_bit)
   374			ret = pf9453_pmic_write(pf9453, rdev->desc->apply_reg,
   375						rdev->desc->apply_bit, rdev->desc->apply_bit);
   376		return ret;
   377	}
   378	
   379	static int find_closest_bigger(unsigned int target, const unsigned int *table,
   380				       unsigned int num_sel, unsigned int *sel)
   381	{
   382		unsigned int s, tmp, max, maxsel = 0;
   383		bool found = false;
   384	
   385		max = table[0];
   386	
   387		for (s = 0; s < num_sel; s++) {
   388			if (table[s] > max) {
   389				max = table[s];
   390				maxsel = s;
   391			}
   392			if (table[s] >= target) {
   393				if (!found || table[s] - target < tmp - target) {
   394					tmp = table[s];
   395					*sel = s;
   396					found = true;
   397					if (tmp == target)
   398						break;
   399				}
   400			}
   401		}
   402	
   403		if (!found) {
   404			*sel = maxsel;
   405			return -EINVAL;
   406		}
   407	
   408		return 0;
   409	}
   410	
   411	/**
   412	 * pf9453_regulator_set_ramp_delay_regmap
   413	 *
   414	 * @rdev: regulator to operate on
   415	 *
   416	 * Regulators that use regmap for their register I/O can set the ramp_reg
   417	 * and ramp_mask fields in their descriptor and then use this as their
   418	 * set_ramp_delay operation, saving some code.
   419	 */
   420	static int pf9453_regulator_set_ramp_delay_regmap(struct regulator_dev *rdev, int ramp_delay)
 > 421	{
   422		struct pf9453 *pf9453 = dev_get_drvdata(rdev->dev.parent);
   423		unsigned int sel;
   424		int ret;
   425	
   426		if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_delay_table))
   427			return -EINVAL;
   428	
   429		ret = find_closest_bigger(ramp_delay, rdev->desc->ramp_delay_table,
   430					  rdev->desc->n_ramp_values, &sel);
   431	
   432		if (ret) {
   433			dev_warn(rdev_get_dev(rdev),
   434				 "Can't set ramp-delay %u, setting %u\n", ramp_delay,
   435				 rdev->desc->ramp_delay_table[sel]);
   436		}
   437	
   438		sel <<= ffs(rdev->desc->ramp_mask) - 1;
   439	
   440		return pf9453_pmic_write(pf9453, rdev->desc->ramp_reg,
   441					 rdev->desc->ramp_mask, sel);
   442	}
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
