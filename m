Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40718155757
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765583383; cv=none; b=lcz9m0S7xBOEFf5K5F7jQ/IXB/0mTjov11Eg6sQe4Gu3+oihY+L3zZ3l5sUA4/jo6w2/zriPuxDwf9bB7jSUPS0Bn5Wc+HwW4tFR5k75S/dFa0fLGxPsDzjBPlO8ZJPEUZ3LYL4oc87YIizouETulbS5L74NVd86nJEwzfFiXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765583383; c=relaxed/simple;
	bh=pI2OQUvFbwV57ivPvqP2Kohz1FaE5WysRGnjJS6SNaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8nmxOY1y9MxTchalgf7MkfyZA6MIO/rfUcUJ2t7gqShwmtQZe8FehptVwp83sbSxiJnUma/bZxPptVpPOC2q4qH3IO3Qsr+sh347b6OebOjxg0zwROz933EYA3hmkb+csZ6Y0fuD296cR/aU5+LWlNTCHo8LjevmAjuM2CYBfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnXfdMfT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnXfdMfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765583383; x=1797119383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pI2OQUvFbwV57ivPvqP2Kohz1FaE5WysRGnjJS6SNaY=;
  b=DnXfdMfTc6euk5ipwuB/xliG9EbBJlzrqJXCdIl7Z58+QwtQ+c+9VygS
   vWAE+bLe+EkVzbiOq7sqq6jKCR93qFF5+qGRkXh7z5Lu/8R4UEOik2HVr
   6NDT5BwoTMwr95s8+0i2DTzEFydViLy5LxwOSFE/SOuqvWICBjIOSnMac
   0K/HVkBJlCbnxw5oPBA41ScIkVDhU5vDWN5D5P0Hrsy8WNNbe8BCJdMnL
   VAJOH+T/WnmXvlDHUWxbEEw+I/l0eO7p0SMdRywFz2Dt7QT2L14ByGFUX
   hqRtrYij2/mZ2/PbvpznKzhcRVI49a4A4PmMOxV3610DibNgt4YRJnc/+
   g==;
X-CSE-ConnectionGUID: xIgUk0/oROCETDZydRc6nQ==
X-CSE-MsgGUID: uYPf3Qw8S52BbuvSXEUH2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71217366"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="71217366"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:49:42 -0800
X-CSE-ConnectionGUID: r0V/YsqMS2uwL6F45wv6NA==
X-CSE-MsgGUID: 2tffMqeVTE2OXbcR+xIT6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196822694"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2025 15:49:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCtG-000000006n1-0W2L;
	Fri, 12 Dec 2025 23:49:38 +0000
Date: Sat, 13 Dec 2025 07:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 arch/x86/include/asm/kvm_pkvm.h:270:34: error: field 'domain_param' has
 incomplete type
Message-ID: <202512130745.vOl0ZL6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: f24cdadefceff37f8b2ffc66635ba5df50633b8c [18/18] ANDROID: pkvm: x86: Hypercalls for iommu domain management
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130745.vOl0ZL6U-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130745.vOl0ZL6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130745.vOl0ZL6U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:269:39: error: field 'pasid_table_param' has incomplete type
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:270:34: error: field 'domain_param' has incomplete type
     270 |         struct pkvm_domain_param domain_param;
         |                                  ^~~~~~~~~~~~


vim +/domain_param +270 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
   266		struct pkvm_lm_context_param lm_context_param;
   267		struct pkvm_clear_translation_param clear_translation_param;
   268		struct pkvm_sm_context_param sm_context_param;
   269		struct pkvm_pasid_table_param pasid_table_param;
 > 270		struct pkvm_domain_param domain_param;
   271	} __aligned(PAGE_SIZE);
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
