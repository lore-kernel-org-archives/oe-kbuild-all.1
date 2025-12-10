Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F8A244694
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350051; cv=none; b=cgVIq78K5Wm9Lk94Id8eFlfXMg853j/bj6XnCHuTWgOYl+F8ytsD2VWAzbLMoA6aohjAckGYOCa1MxQ91cbGbdbfD2XwB7EsQPqibmCsfIm2gU8N/lD+pyoNUOgkQJVHksUKhOxl1P2TfW/T4j4WfIbe792fdya5QhJtcf3F9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350051; c=relaxed/simple;
	bh=+Rx2QaMW+TkQl1YNju81OPGIFnEa0fLRwJzs63DxaXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTn9VDwgZCKZlu6nDeC5Dw1S1OCNAtE7kYHInitJG0pEGm6C0ycFnkO3vnJfExgAI6OX+RZLRuWfRYKFY/ofK8x2ZbZOogdJUM7iN14GnDmbaPJYXOPddmMF9nHwR07yLfwNN/zFIFG+UIRzm3MTbxuZSIJuR4LujHEd3gn3rtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LokZP1ds; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LokZP1ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765350049; x=1796886049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Rx2QaMW+TkQl1YNju81OPGIFnEa0fLRwJzs63DxaXc=;
  b=LokZP1dso16XemdJDLXpFhHCL+a5vFjOOZ3V7knpt2bAr51sRMhrnk++
   lj9nMOOZHb8uNTduBRa6UTs6gLrMbKRZ38n38GNyCBUN8LUrmCm1ynr76
   01oBrM+AzbKNLAjKcW8193ZQ4pIRR8Kbk/83W1h9BdFI3sWSGiRd8SQvL
   OjunAWBAJjQg0Wn4B+KjqH+2xw2MUWxp6KSyH7qSlH/e8eEzcoliYvEA0
   gsLMDvx5rx2zxnAxtdHtU3gAth1RG3fr3yX35JhIgaeHceEogogXd3pjj
   BobcMkY7d4q3w9EIY5G2Ry0093Sxtvetq2+qh5mtzaOhY2QUuVD8+8EAv
   Q==;
X-CSE-ConnectionGUID: 2zqKf72rShmrMsh+0kk/cQ==
X-CSE-MsgGUID: uw5ZfcHFRtCrQI280+N4Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78676757"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="78676757"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 23:00:48 -0800
X-CSE-ConnectionGUID: Z4oT7ACQS7Ormrxui6jPeg==
X-CSE-MsgGUID: ZiXTDMPTQ9imaVRibCHLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="201367059"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Dec 2025 23:00:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTEBp-000000002mf-01Ba;
	Wed, 10 Dec 2025 07:00:45 +0000
Date: Wed, 10 Dec 2025 14:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] arch/arm64/kvm/virtcca_cvm.c:992:5:
 warning: no previous prototype for 'kvm_cvm_vgic_nr_lr'
Message-ID: <202512101452.vWsWIlEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d7d7f131569485a9b6737b85cd8144196135b1a1
commit: befbde867291b5bb068a97b17086ad20484b6068 [3508/3508] VirtCCA: Adapt virtcca operations by cca_base.
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101452.vWsWIlEF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101452.vWsWIlEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101452.vWsWIlEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/virtcca_cvm.c:825:5: warning: no previous prototype for 'virtcca_get_tmi_version' [-Wmissing-prototypes]
     825 | u64 virtcca_get_tmi_version(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/virtcca_cvm.c: In function 'kvm_load_user_data':
   arch/arm64/kvm/virtcca_cvm.c:885:35: error: 'struct kvm_user_data' has no member named 'data_start'
     885 |                         (user_data.data_start + user_data.data_size < user_data.data_start))
         |                                   ^
   arch/arm64/kvm/virtcca_cvm.c:885:59: error: 'struct kvm_user_data' has no member named 'data_size'; did you mean 'ram_size'?
     885 |                         (user_data.data_start + user_data.data_size < user_data.data_start))
         |                                                           ^~~~~~~~~
         |                                                           ram_size
   arch/arm64/kvm/virtcca_cvm.c:885:80: error: 'struct kvm_user_data' has no member named 'data_start'
     885 |                         (user_data.data_start + user_data.data_size < user_data.data_start))
         |                                                                                ^
   arch/arm64/kvm/virtcca_cvm.c:888:58: error: 'struct kvm_user_data' has no member named 'dtb_info'
     888 |                 if (is_dtb_info_has_extend_data(user_data.dtb_info)) {
         |                                                          ^
   arch/arm64/kvm/virtcca_cvm.c:890:38: error: 'struct kvm_user_data' has no member named 'data_start'
     890 |                         if (user_data.data_start + user_data.data_size > ipa_end)
         |                                      ^
   arch/arm64/kvm/virtcca_cvm.c:890:62: error: 'struct kvm_user_data' has no member named 'data_size'; did you mean 'ram_size'?
     890 |                         if (user_data.data_start + user_data.data_size > ipa_end)
         |                                                              ^~~~~~~~~
         |                                                              ram_size
   arch/arm64/kvm/virtcca_cvm.c:897:38: error: 'struct kvm_user_data' has no member named 'data_start'
     897 |                         if (user_data.data_start + user_data.data_size > user_data.loader_start)
         |                                      ^
   arch/arm64/kvm/virtcca_cvm.c:897:62: error: 'struct kvm_user_data' has no member named 'data_size'; did you mean 'ram_size'?
     897 |                         if (user_data.data_start + user_data.data_size > user_data.loader_start)
         |                                                              ^~~~~~~~~
         |                                                              ram_size
   arch/arm64/kvm/virtcca_cvm.c:907:50: error: 'struct kvm_user_data' has no member named 'dtb_info'
     907 |         if (is_dtb_info_has_extend_data(user_data.dtb_info))
         |                                                  ^
   arch/arm64/kvm/virtcca_cvm.c:908:41: error: 'struct kvm_user_data' has no member named 'data_start'
     908 |                 cvm->dtb_end = user_data.data_start + user_data.data_size;
         |                                         ^
   arch/arm64/kvm/virtcca_cvm.c:908:65: error: 'struct kvm_user_data' has no member named 'data_size'; did you mean 'ram_size'?
     908 |                 cvm->dtb_end = user_data.data_start + user_data.data_size;
         |                                                                 ^~~~~~~~~
         |                                                                 ram_size
   arch/arm64/kvm/virtcca_cvm.c:910:66: error: 'struct kvm_user_data' has no member named 'dtb_info'
     910 |                 cvm->dtb_end = user_data.loader_start + user_data.dtb_info;
         |                                                                  ^
   arch/arm64/kvm/virtcca_cvm.c:911:44: error: 'struct kvm_user_data' has no member named 'data_start'
     911 |                 cvm->mmio_start = user_data.data_start;
         |                                            ^
   arch/arm64/kvm/virtcca_cvm.c:912:42: error: 'struct kvm_user_data' has no member named 'data_start'
     912 |                 cvm->mmio_end = user_data.data_start + user_data.data_size;
         |                                          ^
   arch/arm64/kvm/virtcca_cvm.c:912:66: error: 'struct kvm_user_data' has no member named 'data_size'; did you mean 'ram_size'?
     912 |                 cvm->mmio_end = user_data.data_start + user_data.data_size;
         |                                                                  ^~~~~~~~~
         |                                                                  ram_size
   arch/arm64/kvm/virtcca_cvm.c: At top level:
>> arch/arm64/kvm/virtcca_cvm.c:992:5: warning: no previous prototype for 'kvm_cvm_vgic_nr_lr' [-Wmissing-prototypes]
     992 | u32 kvm_cvm_vgic_nr_lr(void)
         |     ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/kvm_cvm_vgic_nr_lr +992 arch/arm64/kvm/virtcca_cvm.c

   991	
 > 992	u32 kvm_cvm_vgic_nr_lr(void)
   993	{
   994		return kvm_vgic_global_state.nr_lr;
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
