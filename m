Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF913FEE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 19:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755287736; cv=none; b=jvfjE1mpEHvfM2JtqD3HfMfyosUmHy3ejiYyUn/yY1nEzJ8aou44rvyLs3dohfSfGH1wVNP0LD02azE3VTX2OOLgDJMmxHWWHFZNJBGsuSnn+nJHTigG/SaZAAd4lN4jJY2Dhkk7tIjLCMgGWh3b59zwWJOCBLVcYtYqAujzwj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755287736; c=relaxed/simple;
	bh=ebzX6OeGgNPLX84H/SphJZXgNpMF7NbJZyVahdpPPlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j44LXtH6e4D5Y7NdqP+SMEDlOJieRGQ6/qxptQ5Zz7o7BgngqZYLDHj4PvA6jH7j0bvY4AofEH5QGPoAb2dWt5v8OF6/nT5FQxuFRkDZTTnvTQ9naMSbCFWn4DiHIuWw0xD3Bjx1PSuLcQEJ4aL+JhByVb7zlE6s5NgKwf1wxSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew9u5DQ0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew9u5DQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755287734; x=1786823734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ebzX6OeGgNPLX84H/SphJZXgNpMF7NbJZyVahdpPPlE=;
  b=ew9u5DQ04KxAPkupfkbscj7UAjjTLxL1EbL8rXfK6UT5QBcrMvP/7h3A
   u8oR9FEKh1G5+7KNue7pd+vSLFpCFgM5x+2glx/7IAEmTkk7cbdQ+8M6p
   BbR++1faAFrsG8Obz+vnQcJc8eCPWFC40qZts2phnjP63HxqS4dmN17AM
   fMUbXUKtOsNLHTyElcbJCU5V0QEfjkeXxGRwbjHqJ3jbL3YgE+WkAHS8d
   FmEi38anCbqbctJAdcdTdQ7fUj8kVRNlIimk3qjemMOnbQLkgiFwRRSvc
   9qcjeoe8CMm9+hSvOgKAaGMN0ZaF1aw2Cx3y+pjBV8e1ZM/LKM9Y+HGdD
   A==;
X-CSE-ConnectionGUID: r9nGfn9ZRJiCskx4TDp1Ug==
X-CSE-MsgGUID: XGidn8hBQ8qUs5bcLjYw/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57326007"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57326007"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 12:55:30 -0700
X-CSE-ConnectionGUID: KN5Y0V+mS+G6MSTzAkOKKw==
X-CSE-MsgGUID: 5kLS2scpRL2ieX4xTtUvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167464362"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2025 12:55:29 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un0WM-0000Zj-35;
	Fri, 15 Aug 2025 19:55:26 +0000
Date: Fri, 15 Aug 2025 21:54:26 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3121/3121] arch/arm64/kvm/reset.c:102:20: error:
 implicit declaration of function 'sve_max_virtualisable_vl'
Message-ID: <202508152110.zhlXpUfJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ba1cb5cd91532ae2be2a0db5d153889580453f5f
commit: 68da302c8ae30331c8917f1dc7b0f1682f696d71 [3121/3121] arm64/sve: Put system wide vector length information into structs
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250815/202508152110.zhlXpUfJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152110.zhlXpUfJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152110.zhlXpUfJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/reset.c: In function 'kvm_arm_init_sve':
>> arch/arm64/kvm/reset.c:102:20: error: implicit declaration of function 'sve_max_virtualisable_vl' [-Werror=implicit-function-declaration]
      kvm_sve_max_vl = sve_max_virtualisable_vl();
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sve_max_virtualisable_vl +102 arch/arm64/kvm/reset.c

    98	
    99	int kvm_arm_init_sve(void)
   100	{
   101		if (system_supports_sve()) {
 > 102			kvm_sve_max_vl = sve_max_virtualisable_vl();
   103	
   104			/*
   105			 * The get_sve_reg()/set_sve_reg() ioctl interface will need
   106			 * to be extended with multiple register slice support in
   107			 * order to support vector lengths greater than
   108			 * SVE_VL_ARCH_MAX:
   109			 */
   110			if (WARN_ON(kvm_sve_max_vl > SVE_VL_ARCH_MAX))
   111				kvm_sve_max_vl = SVE_VL_ARCH_MAX;
   112	
   113			/*
   114			 * Don't even try to make use of vector lengths that
   115			 * aren't available on all CPUs, for now:
   116			 */
   117			if (kvm_sve_max_vl < sve_max_vl())
   118				pr_warn("KVM: SVE vector length for guests limited to %u bytes\n",
   119					kvm_sve_max_vl);
   120		}
   121	
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
