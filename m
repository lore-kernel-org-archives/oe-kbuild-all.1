Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA830AAD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755192776; cv=none; b=WD0S2NfmZ/5SmjnMU42hJbduJ8oJcsFZyqrQAr/PzEvImdYjZocGIqXJBm8PKMk7bqEEjYRTMiuJrcLfmOZF4unxeI/nqHI3JoGDEl1VGctEFNpAL+rdY7O+DLiC8Tai5I5ydd/vF9ZT6VqEWMuF+UM0bP5nCfyGhafotfDolkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755192776; c=relaxed/simple;
	bh=u33CFwapfPQUW3dtVpinqRmLyB1TsBLW+OfUhOqS9lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlnO3fOqV6U+9uISVDOIqysbDHC8XrnjYAz2z1B5+PHbEhbIc6BYLfk7afjJLf36oDXENAPj40TXHTeMOIUR4sIbFmjF4W4B3s7YCgexLHtR38oYnvm8/SI0GeBFRImYALSa9oHflVVfX/7J6+qVncsPMbA4Ne73Tfze6WLpwFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3EZ1mQm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3EZ1mQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755192775; x=1786728775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u33CFwapfPQUW3dtVpinqRmLyB1TsBLW+OfUhOqS9lM=;
  b=d3EZ1mQmiFBiC8yiOtvVGc4HYckz5U4JNRSJbQkGCnR2Xivn/FbrpVvI
   rk7VknftQGUzpvcv31MUhfx3wh6r35ZtPTbQo9KuDt2JrooJKR5M8f7lt
   HHomn47dw/1nTWkd4DUvOdRSBtNyff6yvtZH0aiDOIrQ45NPO5k6aH7Kz
   ix0sZNMhqnfYWaMGhvtyZHAJ6cpvw1WhwOE+ypQK05w2o8w7dm5L9MSjn
   elddpyxRPb54A0d7GX828c0VH8vqvB0zBVAaphq4fbuTU7WYo+mM82Vgu
   mVkXICoCqzElby50GTnRzLqGJlDXhY/tYzEo07/n6vo8emWy1/2/7KLcH
   g==;
X-CSE-ConnectionGUID: R9KFqEwQQC2iZ/ftwF3XKg==
X-CSE-MsgGUID: Cm2USw8fRqiruxur1lfuHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68217338"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68217338"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 10:32:54 -0700
X-CSE-ConnectionGUID: 3eO+YrmBRP+Z+Pteg2Svyw==
X-CSE-MsgGUID: Rvz2JtC2Rnu4WGwRxfIg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197664046"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 10:32:54 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umbop-0000J9-2a;
	Thu, 14 Aug 2025 17:32:51 +0000
Date: Thu, 14 Aug 2025 19:32:00 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/nvhe/switch.c:391:5: warning: no previous prototype for
 function '__pkvm_register_hyp_panic_notifier'
Message-ID: <202508141942.Fs8FOjug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: 4b5a009cd21622260e1f19afbd0ff7440102b6d8 [4/4] ANDROID: KVM: arm64: Introduce a hyp panic module notifier
config: arm64-randconfig-2002-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141942.Fs8FOjug-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141942.Fs8FOjug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141942.Fs8FOjug-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/switch.c:391:5: warning: no previous prototype for function '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     391 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^
   arch/arm64/kvm/hyp/nvhe/switch.c:391:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     391 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         | ^
         | static 
   1 warning generated.


vim +/__pkvm_register_hyp_panic_notifier +391 arch/arm64/kvm/hyp/nvhe/switch.c

   389	
   390	static void (*hyp_panic_notifier)(struct user_pt_regs *regs);
 > 391	int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
   392	{
   393		return cmpxchg(&hyp_panic_notifier, NULL, cb) ? -EBUSY : 0;
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
