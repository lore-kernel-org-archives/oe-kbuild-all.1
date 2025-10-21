Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6ED350A2C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761075558; cv=none; b=TUaeMf2pCySJCvnIVor/yOKfFsLNOT9EWwmMq+azuEbru+lbPis0ml0lv6aaULYfRZATJ7uyhJ9/iLr87Q9yJFqdR4AOEfwL8DcXp0mVyUIb+mTzxTh3wKPPQiUC2ktMDdDG+Ju+nVeglUlfJns4yb0i2gGJWfBT+kSB8zxrQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761075558; c=relaxed/simple;
	bh=1Bgk+kLH0Uz53buxFurvoWz0+xMX7QMOhNifRKKFD2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipPLlHyl28kyIThbI2G5Z267PaGs7T99PGoueVt2poxX9efr9nQJi6klaVzYGlG57+ZbGatRg7kYj95FjFvpfLLVv3ptf2dr2AqUpNTaH9djAvXC69wwFRttQPIxe5inh+sd9+ngzmj8G12F17hwOC31pTZVpWcC6tzAEE0DHqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xp14zEMF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xp14zEMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761075557; x=1792611557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Bgk+kLH0Uz53buxFurvoWz0+xMX7QMOhNifRKKFD2k=;
  b=Xp14zEMF5bccrtHN6JctMF3K2z9bQivqMsDDiQX3/Oh2/6C12K60Tyiv
   52oObABKpGMiCiv4X9tARxOrcTmmQp5NJDTy+eUWnykDuuwORIS49BN7K
   AVVmhv7+ao3QDxIDVNn2VKhMBe7bngwhhkrLCcu2KVMTBJo7xHSjSxUit
   H7usGojsSjyQOvAljmIwlqyIXi6PQoPI8/hlVqdzHCegdzOe7ZykfBWdJ
   F1q39S0UYSRKn49dKquT5U8ePDSz2q4l0S6MrC/H5krDCnPEk7aKeHbW4
   SS48VzvTLjBLTBfS+TOHU4sCi/somqtiQrH5FK4Ygx01ebfM6gANXG5rW
   A==;
X-CSE-ConnectionGUID: YItDkrN0QaOMnyvZPDaz/w==
X-CSE-MsgGUID: YmTswwCBRuCfrdJJQo/EvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66854688"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="66854688"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 12:39:16 -0700
X-CSE-ConnectionGUID: UQVeR+0UQrqDVIjUPc3r6A==
X-CSE-MsgGUID: v2vT6jEMRiea39DiZv8HkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="182880735"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Oct 2025 12:39:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBICO-000BGT-0Q;
	Tue, 21 Oct 2025 19:39:12 +0000
Date: Wed, 22 Oct 2025 03:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 kernel/trace/trace_events.c:2807:6: warning: no previous prototype for
 function 'remove_event_from_tracers'
Message-ID: <202510220322.klaAqkp8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   40a0822d3077aa3125c0b421d5716271cf88e85b
commit: 43c26111cafa87d81570c63d96c497e13ec883da [0/1] ANDROID: binder: unload C Binder trace events
config: i386-buildonly-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220322.klaAqkp8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220322.klaAqkp8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220322.klaAqkp8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:2807:6: warning: no previous prototype for function 'remove_event_from_tracers' [-Wmissing-prototypes]
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         |      ^
   kernel/trace/trace_events.c:2807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         | ^
         | static 
   1 warning generated.


vim +/remove_event_from_tracers +2807 kernel/trace/trace_events.c

  2806	
> 2807	void remove_event_from_tracers(struct trace_event_call *call)
  2808	{
  2809		struct trace_event_file *file;
  2810		struct trace_array *tr;
  2811	
  2812		do_for_each_event_file_safe(tr, file) {
  2813			if (file->event_call != call)
  2814				continue;
  2815	
  2816			remove_event_file_dir(file);
  2817			/*
  2818			 * The do_for_each_event_file_safe() is
  2819			 * a double loop. After finding the call for this
  2820			 * trace_array, we use break to jump to the next
  2821			 * trace_array.
  2822			 */
  2823			break;
  2824		} while_for_each_event_file();
  2825	}
  2826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
