Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131262BE02B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 04:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755060373; cv=none; b=kRY2YqSN0vsj+pltKvrn+/zv4QAoE+spmztEdfSniQgJipx53ywuusvlBQrKNi/Cs0xBLBm2sj28BQNZx5w+hqFdX3N/pmAiZ53HPc672UbBdeNHknKJyy8QDfStzEcD4Ze/PT4fEiqTJkj5hNhMxxZsS35ZpkekdRhxNHF2bfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755060373; c=relaxed/simple;
	bh=C3p1MAeKKhHgU6H24FjZvmawZCWNaR9fx3jjSZgDQTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hzs/kCVM1FEuvHfC5I3NppKH43zgSjh/YwsSCKAyWgrxxfU88Xrb95lPM3i2ZeRDkGmECK1PYrzvthQ+XSl1/g82x6gfjN7REbB7db8PTuuKHLLKRULQvSsseKH+rseRx4Kba68NK1O6TtmLZdnYD5szf7xjZB5Dd80j1NqBPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+D2N33Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+D2N33Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755060371; x=1786596371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C3p1MAeKKhHgU6H24FjZvmawZCWNaR9fx3jjSZgDQTI=;
  b=a+D2N33ZZXXWLRin5qo1js06m93zvE9Jozewyb/16Y1nPn9Ji3ETjfaV
   x0xKhE0F+MEkom5cUPQR0YXA5QaXNTR5qkYw+V/4PozOPyV223cDCIi26
   GAMWYEiFKQ78Osmt1HZ6c4Gh8MeFhkACewVrGT4np+2UVdTdK9QYlinqH
   1IX1mOnuN1As8QgTniXeU5Qm4gvq7tUCrEq5TFdqD51YCW/Q2ITV1lP7I
   MLZ2AguxLTlmT7Lx4o3o2Q9ywORV9+vRD1PcemTC+E2SEDpgBTBQIZRK/
   P7VPMoUtuL55JxgffBrrL5nIMYAsjQXvebE/2Y43FNh/ZqztahMdTo2An
   A==;
X-CSE-ConnectionGUID: PQRjlIJITZybdBUhe3APjw==
X-CSE-MsgGUID: Hp0HUdJMTryBW50rja3MBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56553143"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56553143"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 21:46:10 -0700
X-CSE-ConnectionGUID: BuvUxbFPSKKGL+10LDSjTQ==
X-CSE-MsgGUID: aRIKg5kTTAuPBj4zHbfxjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170573342"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Aug 2025 21:46:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um3NG-0009XI-38;
	Wed, 13 Aug 2025 04:46:06 +0000
Date: Wed, 13 Aug 2025 12:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2665/2665] arch/arm64/kvm/virtcca_cvm.c:992:5:
 warning: no previous prototype for function 'kvm_cvm_vgic_nr_lr'
Message-ID: <202508131219.yqnWOPOr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   aa3c277f9483def562baa4e43778762d2a8141c2
commit: befbde867291b5bb068a97b17086ad20484b6068 [2665/2665] VirtCCA: Adapt virtcca operations by cca_base.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250813/202508131219.yqnWOPOr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131219.yqnWOPOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131219.yqnWOPOr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/virtcca_cvm.c:825:5: warning: no previous prototype for function 'virtcca_get_tmi_version' [-Wmissing-prototypes]
     825 | u64 virtcca_get_tmi_version(void)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:825:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     825 | u64 virtcca_get_tmi_version(void)
         | ^
         | static 
   arch/arm64/kvm/virtcca_cvm.c:885:15: error: no member named 'data_start' in 'struct kvm_user_data'
     885 |                         (user_data.data_start + user_data.data_size < user_data.data_start))
         |                          ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:885:60: error: no member named 'data_start' in 'struct kvm_user_data'
     885 |                         (user_data.data_start + user_data.data_size < user_data.data_start))
         |                                                                       ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:885:38: error: no member named 'data_size' in 'struct kvm_user_data'; did you mean 'ram_size'?
     885 |                         (user_data.data_start + user_data.data_size < user_data.data_start))
         |                                                           ^~~~~~~~~
         |                                                           ram_size
   include/uapi/linux/kvm.h:1557:8: note: 'ram_size' declared here
    1557 |         __u64 ram_size;
         |               ^
   arch/arm64/kvm/virtcca_cvm.c:888:45: error: no member named 'dtb_info' in 'struct kvm_user_data'
     888 |                 if (is_dtb_info_has_extend_data(user_data.dtb_info)) {
         |                                                 ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:890:18: error: no member named 'data_start' in 'struct kvm_user_data'
     890 |                         if (user_data.data_start + user_data.data_size > ipa_end)
         |                             ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:890:41: error: no member named 'data_size' in 'struct kvm_user_data'; did you mean 'ram_size'?
     890 |                         if (user_data.data_start + user_data.data_size > ipa_end)
         |                                                              ^~~~~~~~~
         |                                                              ram_size
   include/uapi/linux/kvm.h:1557:8: note: 'ram_size' declared here
    1557 |         __u64 ram_size;
         |               ^
   arch/arm64/kvm/virtcca_cvm.c:897:18: error: no member named 'data_start' in 'struct kvm_user_data'
     897 |                         if (user_data.data_start + user_data.data_size > user_data.loader_start)
         |                             ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:897:41: error: no member named 'data_size' in 'struct kvm_user_data'; did you mean 'ram_size'?
     897 |                         if (user_data.data_start + user_data.data_size > user_data.loader_start)
         |                                                              ^~~~~~~~~
         |                                                              ram_size
   include/uapi/linux/kvm.h:1557:8: note: 'ram_size' declared here
    1557 |         __u64 ram_size;
         |               ^
   arch/arm64/kvm/virtcca_cvm.c:907:44: error: no member named 'dtb_info' in 'struct kvm_user_data'
     907 |         if (is_dtb_info_has_extend_data(user_data.dtb_info))
         |                                         ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:908:28: error: no member named 'data_start' in 'struct kvm_user_data'
     908 |                 cvm->dtb_end = user_data.data_start + user_data.data_size;
         |                                ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:908:51: error: no member named 'data_size' in 'struct kvm_user_data'; did you mean 'ram_size'?
     908 |                 cvm->dtb_end = user_data.data_start + user_data.data_size;
         |                                                                 ^~~~~~~~~
         |                                                                 ram_size
   include/uapi/linux/kvm.h:1557:8: note: 'ram_size' declared here
    1557 |         __u64 ram_size;
         |               ^
   arch/arm64/kvm/virtcca_cvm.c:910:53: error: no member named 'dtb_info' in 'struct kvm_user_data'
     910 |                 cvm->dtb_end = user_data.loader_start + user_data.dtb_info;
         |                                                         ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:911:31: error: no member named 'data_start' in 'struct kvm_user_data'
     911 |                 cvm->mmio_start = user_data.data_start;
         |                                   ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:912:29: error: no member named 'data_start' in 'struct kvm_user_data'
     912 |                 cvm->mmio_end = user_data.data_start + user_data.data_size;
         |                                 ~~~~~~~~~ ^
   arch/arm64/kvm/virtcca_cvm.c:912:52: error: no member named 'data_size' in 'struct kvm_user_data'; did you mean 'ram_size'?
     912 |                 cvm->mmio_end = user_data.data_start + user_data.data_size;
         |                                                                  ^~~~~~~~~
         |                                                                  ram_size
   include/uapi/linux/kvm.h:1557:8: note: 'ram_size' declared here
    1557 |         __u64 ram_size;
         |               ^
>> arch/arm64/kvm/virtcca_cvm.c:992:5: warning: no previous prototype for function 'kvm_cvm_vgic_nr_lr' [-Wmissing-prototypes]
     992 | u32 kvm_cvm_vgic_nr_lr(void)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:992:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     992 | u32 kvm_cvm_vgic_nr_lr(void)
         | ^
         | static 
   arch/arm64/kvm/virtcca_cvm.c:1311:5: warning: no previous prototype for function 'cvm_arm_smmu_domain_set_kvm' [-Wmissing-prototypes]
    1311 | int cvm_arm_smmu_domain_set_kvm(struct device *dev, void *data)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:1311:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1311 | int cvm_arm_smmu_domain_set_kvm(struct device *dev, void *data)
         | ^
         | static 
   3 warnings and 15 errors generated.


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
