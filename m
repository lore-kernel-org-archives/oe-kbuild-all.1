Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73C22A7F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742509899; cv=none; b=M2cU86YjAwOYdymOJgo35NSmMs1rjdfXCEJxC8G33teoeHz811F6xEYrvSYtouKjvAu8Nc5bx0ZpiCdsi1Q0fb3CJwErxiCZzs0/zCXmD3Gdo3E+rxrZGgKOdA3Ao9hRZ5l5mkhzXFpLOMcyo29LtH0mQKExV+C2gv4svUtWH+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742509899; c=relaxed/simple;
	bh=0zzuDeUkEcxA9mfMgWrmQTo6mesEwDgulzSR6SmF5LY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9bpAozdjXQ05fPSMIdNp3x6cg8UyZihl3JEmIwPd0GhGV/2PCc9iwmaIRgya3l53xwdVcgGlGbFfY/WOTVGGkj6Yu5/geEdykE8EHWsDFmGNsqWYSjzC84ndvud80KBNkGTtk8xMbOP5VVMqOrRMrpwq0d8eq01SBRv5q+7K/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVeKqLaa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVeKqLaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742509898; x=1774045898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0zzuDeUkEcxA9mfMgWrmQTo6mesEwDgulzSR6SmF5LY=;
  b=JVeKqLaaNVy6QWPEU7rjUS2DR/VCPbslTGY0pAXdbDfecdfV5ZTLbSEe
   uOjLl9kU/tsZ6cG+2ClP7H2WnXM30BOg5i+KHp91P5lM4SlL38jcZ4XkV
   JgtPa7QLjTO7K5qlrBzFgaX/kRDVe3EObZnmOA0azWeR5XSIsLrIkvbRT
   66NLasINlS/2Fm/XnnblaChdRZMHtiV0AI2udCghXfcZ26SFncms1b1WT
   8RCCw+SoHCE3at/X/JJWb/f4Yf1Epatke4bepV09k1/UVDb0/tWYcAeTO
   cR83a0rhD5soT1mIV/cOVoue63uBvwDl0o6BljbndCwQcaCzxeuZmEB+J
   Q==;
X-CSE-ConnectionGUID: Jxz6R5ylRjac79Hkqs0kHg==
X-CSE-MsgGUID: zkAzPtiZR7aV5kkveLqnRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43651969"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43651969"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 15:31:37 -0700
X-CSE-ConnectionGUID: pdrleajFS+WuobMGKkHOSw==
X-CSE-MsgGUID: q8sNW5NXTYeu3EG54AfYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="128291980"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Mar 2025 15:31:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvOQH-0000pB-1g;
	Thu, 20 Mar 2025 22:31:33 +0000
Date: Fri, 21 Mar 2025 06:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20250319_ckeepax_tidy_up_asoc_control_get_and_put_handlers
 237/251] sound/soc/soc-ops-test.c:450:9: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202503210611.lDqWoKN0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20250319_ckeepax_tidy_up_asoc_control_get_and_put_handlers
head:   502a668fad12b6ca10bcbb615d62e61d3b669c99
commit: 7a24b876ad8cdd56457e881d384a038922b508c3 [237/251] ASoC: ops-test: Add some basic kunit tests for soc-ops
config: csky-randconfig-r131-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210611.lDqWoKN0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250321/202503210611.lDqWoKN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210611.lDqWoKN0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/soc-ops-test.c:450:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted snd_ctl_elem_type_t const __left @@
   sound/soc/soc-ops-test.c:450:9: sparse:     expected long long left_value
   sound/soc/soc-ops-test.c:450:9: sparse:     got restricted snd_ctl_elem_type_t const __left
>> sound/soc/soc-ops-test.c:450:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted snd_ctl_elem_type_t const __right @@
   sound/soc/soc-ops-test.c:450:9: sparse:     expected long long right_value
   sound/soc/soc-ops-test.c:450:9: sparse:     got restricted snd_ctl_elem_type_t const __right

vim +450 sound/soc/soc-ops-test.c

   431	
   432	static void soc_ops_test_info(struct kunit *test)
   433	{
   434		struct soc_ops_test_priv *priv = test->priv;
   435		const struct info_test_param *param = test->param_value;
   436		const struct snd_ctl_elem_info *target = &param->uinfo;
   437		struct snd_ctl_elem_info result;
   438		struct snd_kcontrol kctl = {
   439			.private_data = &priv->component,
   440			.private_value = (unsigned long)&param->mc,
   441		};
   442		int ret;
   443	
   444		strscpy(kctl.id.name, param->name, sizeof(kctl.id.name));
   445	
   446		ret = param->info(&kctl, &result);
   447		KUNIT_ASSERT_FALSE(test, ret);
   448	
   449		KUNIT_EXPECT_EQ(test, result.count, target->count);
 > 450		KUNIT_EXPECT_EQ(test, result.type, target->type);
   451		KUNIT_EXPECT_EQ(test, result.value.integer.min, target->value.integer.min);
   452		KUNIT_EXPECT_EQ(test, result.value.integer.max, target->value.integer.max);
   453	}
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
