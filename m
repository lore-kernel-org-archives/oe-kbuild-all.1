Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239842253FF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766013681; cv=none; b=J+NhPxHXCSn5kc0ZiI3nSdT9evcBO7GgdzwkrYABRKWSilW5MuKltuf4EwlPw3fyVXZVxkVCYhreFHisYXNdgoa2O4InqURO+in4Skky/6J1tBvdpDTLguBBD8dGrLXltQa0lSu2l6hmyFuTvdqBa1s1yF9UnupEvitf+tYBtsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766013681; c=relaxed/simple;
	bh=1R5MlS/eyiTSZ3EvVrskBwhoAYMnTp75hadJbgkUsuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kuJYxbibvlYLX4cT0X1dBZjPCbVHKM+3eV1wI9S5deNaUG7ezQsOnuigZ0cG0oj8SNedefrjFScpHMhMeyq/wNs1tGMj6gopkG/6Hf9jlZ+GcPoYpk01y6wmsg4I6OH875E9gfJs75RMroPcqpfh2F5ZgjBNBY9V5JrAVOmfqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H48uFYR3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H48uFYR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766013680; x=1797549680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1R5MlS/eyiTSZ3EvVrskBwhoAYMnTp75hadJbgkUsuY=;
  b=H48uFYR3L1CGeEnzArwSEKkZgJdDah60RRyALk1b+W7rpXU0KUZM5W+1
   /HS4L2Dy9NG1Idac1QRs4kmKvSvT8x1aAU3d6zI9FONRkBlc8ffvEVOWG
   tVL5tIPOYi2LZd3oYbOUv73NBurvdkh3LrukdeYSWXsjaMrEryj6/Tcue
   Q/hmbSUElQMbfrFEZxFFFd+6UYcTMg5kQJHU85xV7KKuFP0oGozdrf4aA
   JqPUmUJ4b4oxQUA9sqHA37/ZqTuiI/wgaYXwawXi9t8pMX5uFDd3jL39g
   7p2FAE3tVCh/lxZ0NEDLYyHk7EOTKMskYdRIWgAR709bGlq3YiyDfzGx1
   g==;
X-CSE-ConnectionGUID: KvsOJcHNSLGJMUt4sAUj9Q==
X-CSE-MsgGUID: Ic3rIzeXSVO1JuXHM9+4bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67157972"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67157972"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:21:19 -0800
X-CSE-ConnectionGUID: TAU5Zv85R6KdpCONIOy/Uw==
X-CSE-MsgGUID: vJssHdiRROmHg/3oLJFUIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198041305"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 15:21:19 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW0pY-000000001Kz-3fDj;
	Wed, 17 Dec 2025 23:21:16 +0000
Date: Thu, 18 Dec 2025 07:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp/nvhe/modules.c:43:10: sparse: sparse: symbol
 'num_dynamic_hcalls' was not declared. Should it be static?
Message-ID: <202512180716.S0q7ZfSp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: e2eb8807e6b795dfcef162f7c4a45954077401c5 [43/43] ANDROID: KVM: arm64: Add support for custom hypercall registration
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180716.S0q7ZfSp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180716.S0q7ZfSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180716.S0q7ZfSp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/modules.c:43:10: sparse: sparse: symbol 'num_dynamic_hcalls' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:44:1: sparse: sparse: symbol 'dyn_hcall_lock' was not declared. Should it be static?

vim +/num_dynamic_hcalls +43 arch/arm64/kvm/hyp/nvhe/modules.c

    42	
  > 43	atomic_t num_dynamic_hcalls = ATOMIC_INIT(0);
  > 44	DEFINE_HYP_SPINLOCK(dyn_hcall_lock);
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
