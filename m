Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233D826FA5B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315532; cv=none; b=mAD4KG/l5dy0xUNIokvQqClYzWC9k0nB9R+66uQ4ZjqETy3nmr2PqPzoDZo4EtgyIh7QdbNch3AGCPGqtrcPkZs2xfboTqUcibQCD41XCQthRle2/ukFkBYISv7nJl4xUocJm719QOcChd010LbmgT+svfHPy0XysKb2dlJajWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315532; c=relaxed/simple;
	bh=X0DCxS6t6XQ7ErtQx4MpO6IACGzH8YgixomQToRVhf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K6GY7BeBACcN+gNMhWz71IfUjb4EL2W2xcNTQO/vG+NEoSLGaMgCl8YEfhUI4YWhN3RGBS+aFGaNln/9SZdvUtaAc3oDJn3Bz1MbPPQ6zvHCYPsZ8xIuAfuRdh3OBftuPzBGuXUNt7j99Ywr4kHejL/gFOQYa6xCEtz6EYTvqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQvRf3k/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQvRf3k/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771315529; x=1802851529;
  h=date:from:to:cc:subject:message-id;
  bh=X0DCxS6t6XQ7ErtQx4MpO6IACGzH8YgixomQToRVhf0=;
  b=PQvRf3k/ocgPOluw7yEm8DjS9B/UcbafvElucA4CqBt/E5E4i7BQfaxn
   HcvpJJGLnX4xWIpXnMeuhAxkW7pBWi/r1mf2dd21oCoqpyTwXRmQ0uIL3
   hyuajZWLr+SvHltwnfsPnUhN+4jbMIaJ56Kj/IIaeA8IGPQOT/rAfu2tY
   N7hlI990Ig8I5c5AJxal1WYp3zNHCcF0seNKy2tlkK7SlO1egenKMVMtb
   qOr2H3dpRp8iMrPwnBZvTBDavDKgT8QmgkTeteDjzoXYfVwbJlVeuEuE5
   8SU0KU+rTocr+FOkY1D49kjeWd/inV8sFD/L7GrHYP338ildSt0oq5d5H
   A==;
X-CSE-ConnectionGUID: ldrRF8YITd+XE2OswE5YVA==
X-CSE-MsgGUID: Org4Bna1TzCDtytRTzcpsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82709411"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82709411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:05:29 -0800
X-CSE-ConnectionGUID: PKBq5YYITAySlFieAW+dOQ==
X-CSE-MsgGUID: 6ccUhPNWQG+ZKVjd0JvJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212732768"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2026 00:05:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsG5F-000000010k0-0dkL;
	Tue, 17 Feb 2026 08:05:25 +0000
Date: Tue, 17 Feb 2026 16:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 53/53]
 arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has
 incomplete type
Message-ID: <202602171526.By2cr2Hc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Aashish,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   590a98f7b9783af3a52d4213d1f276148be94b4e
commit: f8ecd866e541b10a412882b8e0b0d02c1a17df8d [53/53] ANDROID: pkvm: x86: Hypercalls for scalable mode context update.
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171526.By2cr2Hc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171526.By2cr2Hc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171526.By2cr2Hc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~


vim +/sm_context_param +268 arch/x86/include/asm/kvm_pkvm.h

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
 > 268		struct pkvm_sm_context_param sm_context_param;
   269	} __aligned(PAGE_SIZE);
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
