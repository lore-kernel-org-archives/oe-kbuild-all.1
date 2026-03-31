Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA8226C38C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 04:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931592; cv=none; b=Xq0oublPwZayGp70S3rygXE7DWm6Bpf9BJPT5GeYL8YKxihoJKM2TiEYoWanrB9Q3YyPiGcwIc1mF24M2GNv+F+/bjiKFuWqmyF5YW/k9kfLL5mCbpeMEJ9oXK4Ulvz1WlvLK8kTHaaedYk+ngwksAN3s3NX3Wf8lCbFkfMSAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931592; c=relaxed/simple;
	bh=E+lV3a8V7p3T0H2OGEu46Yrjuv1laABVsGTsPeF3TJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TGM36l0seg5+TOFxIylU92kvpoCasJFaGvlx74V6J9DK8I0Kt95UWYZ54t+n8qQes9lt8Ec/lPQ+vcwh2nbn3+Pu3PZ2J7yhSBBotk9dz4os60juHc+D6vtIpB4QZp++dkbYZBzSZ6/PPqcnCK2lelH1sQfYQ/dwWjTKWiFJXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnkwEbiK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnkwEbiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774931591; x=1806467591;
  h=date:from:to:cc:subject:message-id;
  bh=E+lV3a8V7p3T0H2OGEu46Yrjuv1laABVsGTsPeF3TJ0=;
  b=WnkwEbiK1+KkqlVoC15jYfJM4DzD+tEl/Bbd1NrDLP0gb9KE0xoAz2Ww
   SfFKO7XMT3iBssR9uVpluM9Y3zV/vIZ2s4v9UJ6i6LC4yW3/IhIxqzxVW
   YIAC3CbDeDokJt2782muMTqXl3HEAJHDYGtHq3rEzi2qsY9uCt1/REvLy
   oGZdZXYQbecxtWx1XqQU2DpaFSfbB+Vf9u86jv5Yn0JnfZ1mh/8es9dB7
   80GUVhSQy56nn6gm83v/KnLxWkos7Zw55nYZ+97TbY0NaXLD4KJOAcn3O
   YtSJbYqSc0i9rCDO2IUDmPNzF1nPq8PR6oqTdi6hJjXYVxmZFSuW7qp09
   Q==;
X-CSE-ConnectionGUID: 5cnrx5qOTHG2OW9uq3qKRg==
X-CSE-MsgGUID: an+NiRKHRTC5MW4OdLdNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75107266"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75107266"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 21:33:09 -0700
X-CSE-ConnectionGUID: e0RGt+wLT2iCs/eiDGUVkw==
X-CSE-MsgGUID: mO/j8bs2QtSF6elO23hkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="227867971"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 21:33:08 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Qmn-000000002E1-3Q6p;
	Tue, 31 Mar 2026 04:33:05 +0000
Date: Tue, 31 Mar 2026 12:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for
 '__pkvm_register_guest_smc_handler'
Message-ID: <202603311207.TrsAxm4F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: 340ef6cb4081cb305235a059f1c142345ac1a71d [0/2] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260331/202603311207.TrsAxm4F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311207.TrsAxm4F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311207.TrsAxm4F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for '__pkvm_register_guest_smc_handler' [-Wmissing-prototypes]
    1725 | int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_guest_smc_handler +1725 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1724	
> 1725	int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
  1726							 struct arm_smccc_res *res,
  1727							 pkvm_handle_t handle),
  1728					      pkvm_handle_t handle)
  1729	{
  1730		int ret = -EINVAL;
  1731		struct pkvm_hyp_vm *vm;
  1732	
  1733		if (!cb)
  1734			return ret;
  1735	
  1736		hyp_read_lock(&vm_table_lock);
  1737		vm = get_vm_by_handle(handle);
  1738		if (vm)
  1739			ret = cmpxchg_release(&vm->smc_handler, NULL, cb) ? -EBUSY : 0;
  1740		hyp_read_unlock(&vm_table_lock);
  1741	
  1742		return ret;
  1743	}
  1744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
