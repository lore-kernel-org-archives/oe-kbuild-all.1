Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644B1C4A20
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 06:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771308562; cv=none; b=ThcmOkhpGVxpkG0dd3LFmhf0FQ4tMhyqFqpqOAHyD5TlaajIKucW+J67vW0K6CEG2aIjlAyP8NPi59hsSxKrLouw9oPBD75TYzKlnfkgZUAnhzEAS1c+ZUNFWn2/8/FHzrVeb5fRFep0W3zix2XZ/XLYzGapgQLPo+D33lVFM8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771308562; c=relaxed/simple;
	bh=24Fe7qKGhVAHzi8TGtNE5DlY27NUrgI4QfY8cDVk6pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lcbw1uBjDezbIKbykBdABDqeSKTU3fSvxQhX0IqOQsRR4Fm02Eku7mXutTJSjXoEbCcOiZ6wuvBHijcy1klRiOQ7rePe+K9xHFrae03CdgRtvAsXKaBVNLmkENUA/beSZdz9xWXUpc9QmDzezv/z7+2c3glu3579MvObHSYbuSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vegi7vvI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vegi7vvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771308561; x=1802844561;
  h=date:from:to:cc:subject:message-id;
  bh=24Fe7qKGhVAHzi8TGtNE5DlY27NUrgI4QfY8cDVk6pw=;
  b=Vegi7vvIylHdbrQiIu4g5g2jwmP2kzjIUs0L1ObPnpCkTFk1YCCO+C92
   eiOKCpReI8pYiUZq9zJ+NKAhBDEFbZrvY8qOXdHzD1LFRMJ9hiOjgtywn
   55h2caFoJ2NZF791Z+8oVXIn8fW9DZZ3BL26m8CMZNOdRtYPMaDpir+2C
   dYBnCXdSpBNIyzgECZ3h7juofHAzusDVVNrmrXQexaTO3/+gSoQfKu+SH
   Pa7GN02app9A0RHJuAurfwOpoJmeKGXokdAyKQQjOdcqCc6ZQCYpNQk4A
   6jBPdalAqVxBHBG42rduJe9TzzbXpUdB2l8Qn22dWaRteDI8cyhonevSe
   A==;
X-CSE-ConnectionGUID: 4op9jXKTQsufnyJsq0aaIw==
X-CSE-MsgGUID: Az7voItcQ4unn/v6JK0ROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="95004108"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="95004108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:09:21 -0800
X-CSE-ConnectionGUID: SlHXLk+XSz6BgtIFXEaTpQ==
X-CSE-MsgGUID: eTS11/CHSTyLWNVYhmWeig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213803522"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2026 22:09:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsEGr-000000010g0-21ZX;
	Tue, 17 Feb 2026 06:09:17 +0000
Date: Tue, 17 Feb 2026 14:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 53/53]
 arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has
 incomplete type
Message-ID: <202602171351.9jww4Mi7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   590a98f7b9783af3a52d4213d1f276148be94b4e
commit: 8ef015afc176a3d8627c1c1e6f561494d211e057 [53/53] ANDROID: pkvm: x86: Hypercalls for legacy mode context tables
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171351.9jww4Mi7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171351.9jww4Mi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171351.9jww4Mi7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
>> arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~


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
