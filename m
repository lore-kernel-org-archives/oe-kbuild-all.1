Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303B033ADBA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236812; cv=none; b=IwBs3Z+PBUA4MEVbCh4xQ2Ia7ZKtcmQo49cFsxJXhywZuFLeuWNQDGrRpRNxap/xsLppfkyzNB24lXyh9NZ6W5HX/lPP/R8BgGurru6YCum9pGs7mqaUapEBSR+oZg6UfwsMxBMJ+JdXeCb4IGIxzIiY69rgXTnS/wT98ATzIII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236812; c=relaxed/simple;
	bh=OB7U3Rp/yq0JrrBkRbFF5mOWAEESjD6jnk/Vhwocm54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YC5omIl98E9ED0J4eEt8p2fCj5SJh+60UGnvst1KWGKBEkg3Y+iy7XDsdjiuWWUm66YKcH4Cu1wj52OzcI825/7iH+ImIRckvZ0iuVySCYSvGSHsZPjlNqBOVhZ8Q1UzEeKRpoWbGS0WJDYw/RaQrOLdcpMZ2alyjQZqmxDnNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6zgTSUD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6zgTSUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773236807; x=1804772807;
  h=date:from:to:cc:subject:message-id;
  bh=OB7U3Rp/yq0JrrBkRbFF5mOWAEESjD6jnk/Vhwocm54=;
  b=D6zgTSUDtJJIWu7PkzeQDHDE2+iglThjoZnHriHIxPd96958pdnx1/JJ
   YmS1kCz47AcGSSA84GUdE06J9v+1CakF2HhyDWSSCo20rrVhvWSv/sCoq
   jxLPgKQ5OIvHp3MmxZu0eOd/P0WftskHEK3gDl8PTZoGQV4BMRwyBQ28U
   7ppTr+VS8aiWWXGQjM8/jwR0GWp/fcNjIm0rI+qlN2IkiGfUiP7QPYHF/
   eXJLCdsn6xurlq4VypRJq1Z90IhlP8u20P/rzW4VrExraITgReKl0qAno
   j8bDv8RMPmn6cp6TV6xzIN4Qle8f72C81BHbYRcxkvGkAjVL049Mc0WOW
   A==;
X-CSE-ConnectionGUID: XNSL4xhlSlu9HoQLZfwZXQ==
X-CSE-MsgGUID: 2eqmJ4e6R76Tl895L83RGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78196489"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="78196489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:46:47 -0700
X-CSE-ConnectionGUID: XnKiMOmPRcSaFPwb9Q+gng==
X-CSE-MsgGUID: iH30SkCXSV2Zcv75xCwWhg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2026 06:46:45 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Jtb-000000001Fh-0VaT;
	Wed, 11 Mar 2026 13:46:43 +0000
Date: Wed, 11 Mar 2026 21:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17]
 arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has
 incomplete type
Message-ID: <202603112128.0A7bSXt3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6ca2c2288ee8399eaf9532746cdb562577e09565
commit: 8ef015afc176a3d8627c1c1e6f561494d211e057 [17/17] ANDROID: pkvm: x86: Hypercalls for legacy mode context tables
config: x86_64-randconfig-073-20260311 (https://download.01.org/0day-ci/archive/20260311/202603112128.0A7bSXt3-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603112128.0A7bSXt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603112128.0A7bSXt3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/intel/iommu_pkvm.h:9,
                    from drivers/iommu/intel/dmar.c:34:
>> arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/lm_context_param +266 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
 > 266		struct pkvm_lm_context_param lm_context_param;
 > 267		struct pkvm_clear_translation_param clear_translation_param;
   268	} __aligned(PAGE_SIZE);
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
