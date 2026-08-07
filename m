Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3082609FD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 22:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786142670; cv=none; b=fUYzeFfRFtiCwk6s9TPGKRhYhkrnIDwFSBL8W7vfkYR/2rwgkV28OxzMDptiHVuI4qu7LsXmSsstORvDHu8xzpUyr5B/4KBUI4ho34DhNgjWPKYCgLNtxQ5FQjyHNq0jvP1Gx1nOmD1kFLseIV3/Ye6SxgJ/rBLA2Y/fMAKTMMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786142670; c=relaxed/simple;
	bh=0YD45h2Wcu3EKYVoj0UsHOYdIzmRaJ+RhnXEFxZv4qg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UUAR5eHmtk7tRbwI2ASQWIZkpnWQ3Iv/tqQWoyDlc/8LRN7I0OKeoaD/MpA04wwcNIb1fwsqGYOT5PLvpk7XmU6BGtWCj8bC3Yf165WGI16ftqmMK3SNmDAHzQU5Rwof/mPuGHWnCJRio26FY8ex133Kj1oyG4h0l9/SUnTjlms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwgEPtMB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwgEPtMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786142668; x=1817678668;
  h=date:from:to:cc:subject:message-id;
  bh=0YD45h2Wcu3EKYVoj0UsHOYdIzmRaJ+RhnXEFxZv4qg=;
  b=dwgEPtMBiqBsi2XaZOzLR1TZzprJ4QI+TwAXsRor4nwtj6/eb5G9+Eus
   Ezeq3CLafNkYDefnTuIlb91TC4H0HRuD7q+pD4ndTsia1QrJAYPG/O2VC
   ytBQ7mJv4U7VghOWsDKj1pRWhpfSjMw40cJPA1wNqM6gqNL+pSwCZVlQh
   0t5gB/4dEZugn7Y1EOBc4xy/zdgrOLZbIxOrAgAkhlu8zCWpxvRM0KQel
   HzEYVyzNNFvKab2Q/LMEAeMsOmcSyIWWiL0llXFzIiv4L8g+JrCJ8U2y8
   T45H7GBLDLZNY3rhkW0IT3fq0Ll5ZCicdlB6cvyJpaPckk0fdHWayWlqW
   g==;
X-CSE-ConnectionGUID: JR8VMFXQQEqPYYQwhjNxAQ==
X-CSE-MsgGUID: oZp4G2nyRuqRjvQFzrAz7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86786465"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86786465"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 15:44:27 -0700
X-CSE-ConnectionGUID: RR5v4WIkSVOhPORl4jiuKA==
X-CSE-MsgGUID: 8NPIYRxSRmqlun/Gi/lgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="258208440"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2026 15:44:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsTId-00000000JQX-2jdD;
	Fri, 07 Aug 2026 22:44:23 +0000
Date: Sat, 08 Aug 2026 06:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 17/21] kernel/bpf/helpers.c:2407:18:
 sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be
 static?
Message-ID: <202608080601.EQNiPZ0Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   0ebfd4123c6b1719f428de91a4e4eeca34f557f6
commit: d291ea9d36a15dcf8e45bfe20d47b2bee5c59963 [17/21] bpf: Add PTR_TO_CORO_FRAME runtime and verifier support
config: csky-randconfig-r113-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080601.EQNiPZ0Z-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080601.EQNiPZ0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080601.EQNiPZ0Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1228:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1228:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1228:21: sparse:     got void [noderef] __rcu *
>> kernel/bpf/helpers.c:2407:18: sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be static?
   kernel/bpf/helpers.c:2865:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2895:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?

vim +/bpf_coro_frame_free +2407 kernel/bpf/helpers.c

  2406	
> 2407	__bpf_kfunc void bpf_coro_frame_free(void *p)
  2408	{
  2409		kfree_nolock(p);
  2410	}
  2411	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
