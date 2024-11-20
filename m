Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C21B200CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094969; cv=none; b=BNb09GRMb8Ya7hUrOsu/3PxTf7dQY5yeUWwbWfQDVN4SopEuMrhVKRgrKOflH8E6ebNNG95nqL6RToYFhVOha5GxgIFOKoIni/PQaBGnNQPmECvAAgF+ULXtFkrc6lJJSEPRZI0pENA3Z5RH8AfKKeNE4P2hmgoNA9RpqaQm/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094969; c=relaxed/simple;
	bh=MzWSaHpC2nQeSgrsAy4FHlSOSIMziy7A4PRTpSV1qNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sskYYv8hrphfoMz7ooakA49Z76E4V4oyeM+kmZuchmDcwevyB+JJTgOgtYw+msI+6sTrEUPxPdwr/wgt6p+D3/edx/gQe7qgEhlO/y3/w4YMSHcIwzTDx0lJZXANpUuji9ETkdNJUPXTC1EyTe/k3NLIPLvundpJhjy2YBezS5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2ngpd3m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2ngpd3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732094967; x=1763630967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MzWSaHpC2nQeSgrsAy4FHlSOSIMziy7A4PRTpSV1qNM=;
  b=n2ngpd3mFA4iBrGRI0Ks8Y3R7Juwv66276htsmal+BnY/zmphLFSIRpC
   TnTAMpM+XS9Kijnxn79d9KgCR3PaLwPh59kcjAynE0ir0JMAFvq4B5zw0
   0f9VB7Hyc/t22kYndrmouSj8sdMrKs2zQtgajAIAYgE3d1/34ZNYtXPbS
   hOuDlFDRAvsu/rYoJdKuL/nlo92bSziM8xNFcBJDzWUu+GG5r+w6yl1tt
   3kEzSxW7VIlE4qwXOyQ4ylR6FaZa4ojedh98MIPDIDAxuUPM1bPh9CNB4
   fiBuGJHSbOyuSPLEXJuho6CDvFMmBBVDFKw5ivAkrSHuX9ddwEzC3iJ0g
   Q==;
X-CSE-ConnectionGUID: 8wXITaz7Sfm+8SVQrC80VQ==
X-CSE-MsgGUID: zarZAJo2QMS5GUd/RPQ6OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32254724"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="32254724"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 01:29:26 -0800
X-CSE-ConnectionGUID: QBajfG85T++MERSZQMEioQ==
X-CSE-MsgGUID: Ssv8FQClTA2Edl9HdmXw/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89809713"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Nov 2024 01:29:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDh1X-0000jh-1H;
	Wed, 20 Nov 2024 09:29:23 +0000
Date: Wed, 20 Nov 2024 17:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 209/259]
 arch/x86/coco/pkvm/pkvm.c:50:6: warning: no previous prototype for
 'pkvm_get_ve_info'
Message-ID: <202411201740.8YJDJZAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: 0b97a4c41ed1bcb8f14bd5c08e1714877bb0c2a8 [209/259] ANDROID: pkvm: x86: Add pkvm guest virtualization exception (#VE)
config: x86_64-randconfig-073-20241120 (https://download.01.org/0day-ci/archive/20241120/202411201740.8YJDJZAm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201740.8YJDJZAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201740.8YJDJZAm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/pkvm/pkvm.c:50:6: warning: no previous prototype for 'pkvm_get_ve_info' [-Wmissing-prototypes]
      50 | void pkvm_get_ve_info(struct ve_info *ve)
         |      ^~~~~~~~~~~~~~~~
   arch/x86/coco/pkvm/pkvm.c: In function 'pkvm_guest_init_coco':
   arch/x86/coco/pkvm/pkvm.c:105:9: error: implicit declaration of function 'cc_set_vendor' [-Werror=implicit-function-declaration]
     105 |         cc_set_vendor(CC_VENDOR_PKVM);
         |         ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/pkvm_get_ve_info +50 arch/x86/coco/pkvm/pkvm.c

    49	
  > 50	void pkvm_get_ve_info(struct ve_info *ve)
    51	{
    52		/* Reuse the tdx output for pkvm. */
    53		struct tdx_module_output out;
    54	
    55		__pkvm_module_call(PKVM_GHC_GET_VE_INFO, &out);
    56	
    57		/* Transfer the output parameters */
    58		ve->exit_reason = out.rcx;
    59		ve->exit_qual   = out.rdx;
    60		ve->gla         = out.r8;
    61		ve->gpa         = out.r9;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
