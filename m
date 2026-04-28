Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75017313537
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361680; cv=none; b=V6VsTaeEa3N2DewCjHJa3XG+CgMUbvWOXfWVzfl7nrlOemgmZ/Zz4U6nRCcj/2Vgr8I3n1+NCcOw7gX8ay13nBV5XEeneHv1YzKSbAa47UDaukuiKMGOKgVG1Q1v2qv7TZjHYaplzqm/F54AdnLT/wx0I3eSApEAQQkWIhIXteE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361680; c=relaxed/simple;
	bh=k2ZnGNK+xMPJ+OplR/tI5YKak9hOfgDfLfZCnIAGSEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ThyqFiSt8KzyanayLsK1y4NgZSUBElF1NIITpx6ro7EnoVrqSZL2bYc/LVD0rlRCADJPGbWrYVD2Cf7Rbv5b+bwebbGyK8QX/Ty2LxVHtxWLmVLKqZSRIINuy8mEVvGbBvF120JUOe8g11ifJyNslxcbCPnnRhysNXpQEasxRgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaeTMNyX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaeTMNyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777361680; x=1808897680;
  h=date:from:to:cc:subject:message-id;
  bh=k2ZnGNK+xMPJ+OplR/tI5YKak9hOfgDfLfZCnIAGSEY=;
  b=HaeTMNyX/CpclWBlkbVbMvX581GHIg1CHGpvnoSTkiWt+3H942EosmdJ
   JXm2O6ajM0hoQJpZk1yeaAqzsbx1F+6ardwx+JzfKWGT77fhsA69QjQBH
   y1hCfUYhWkVvSvxDbvpWkDYCox2CY28tLIs7dTJOZJjl2Yzq7yXJyhnQ3
   cLnrcupPwUxu4XaOPuqqQluLejWCT26kqKdmrP5kiJNz44lHIu31Zk7dF
   1NPCMyCdAy9K5DXmJiTlZEuc9zYpO8tAP3kn5dDzRUi1Ret3uO/Ese2rl
   8+8UoOYcVBX0sUQDkwq1TrLr9xnNmFGSiNOOtSBTdZKdKGVRpUP5a/sUA
   w==;
X-CSE-ConnectionGUID: zOHfj2BKTCqJqeZ4pWTGWA==
X-CSE-MsgGUID: P3pNrbv4Q0a0DUnIQVBqlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95676854"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="95676854"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:34:39 -0700
X-CSE-ConnectionGUID: WSm56KfDTlC4ViXtTT1BXA==
X-CSE-MsgGUID: y7fDs72XSPOQTHXbZVxMig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="233806622"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2026 00:34:38 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHcxm-000000009cG-2hsh;
	Tue, 28 Apr 2026 07:34:34 +0000
Date: Tue, 28 Apr 2026 15:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:41: error: initializer
 element is not constant
Message-ID: <202604281547.R60B2cxV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f3cda89ca9993ed3ee84e88d1b50d227c00ca68d
commit: f4c9f74c6bf846c2a77b25a8d93509e9ea00192a [1/1] ANDROID: BACKPORT: KVM: arm64: Zero protected guest pages on teardown
config: arm64-randconfig-004-20260428 (https://download.01.org/0day-ci/archive/20260428/202604281547.R60B2cxV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604281547.R60B2cxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604281547.R60B2cxV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/include/nvhe/iommu.h:8:0,
                    from arch/arm64/kvm/hyp/nvhe/mem_protect.c:19:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:41: error: initializer element is not constant
    static const pkvm_id pkvm_host_poison = pkvm_hyp_id + 1;
                                            ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_reclaim_page':
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1804:2: error: case label does not reduce to an integer constant
     case pkvm_host_id:
     ^~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1807:2: error: case label does not reduce to an integer constant
     case pkvm_host_poison:
     ^~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:19:0:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:41: error: initializer element is not constant
    static const pkvm_id pkvm_host_poison = pkvm_hyp_id + 1;
                                            ^~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:57:22: warning: 'pkvm_host_poison' defined but not used [-Wunused-const-variable=]
    static const pkvm_id pkvm_host_poison = pkvm_hyp_id + 1;
                         ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:55:22: warning: 'pkvm_host_id' defined but not used [-Wunused-const-variable=]
    static const pkvm_id pkvm_host_id = 0;
                         ^~~~~~~~~~~~


vim +57 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

    53	
    54	typedef u32 pkvm_id;
    55	static const pkvm_id pkvm_host_id	= 0;
    56	static const pkvm_id pkvm_hyp_id	= (1 << 16);
  > 57	static const pkvm_id pkvm_host_poison	= pkvm_hyp_id + 1;
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
