Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF07946C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767470575; cv=none; b=kddOFBZl1edcqCCKkFbWBBCxgl2kPbvLDUTDz4BQz15BHesuy837Wxrpy8n/cxZihwy7/Nk5/eD3M+rSkrQBlTCdlr46s+THEuV9FAcZz9422vvqHFyE5vb3/8dqfJA5QVWBEEYiH86Md3jN5Kwad9OWVfC4Qv/c6NWe15pS0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767470575; c=relaxed/simple;
	bh=H55l+DDxlyijwSkRHDYLMOcHRMpEHgz2/NdY/qvcSnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eGKeUOmHU4S2PzQaMrtYYSYTnbDQv0b4POTajt0Wle5AfkvTQtaQaajeRBwakHChDP/9ztPyoH3mnrXmQ0itRR24pzuRehnT23BIMSFViwt8dRNvprd1RCfWq57CvA9/S5Mye8cTeQxeqSvwreOPBsxzak8kfGQEjuQvTSd08yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM7pQ2YJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM7pQ2YJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767470574; x=1799006574;
  h=date:from:to:cc:subject:message-id;
  bh=H55l+DDxlyijwSkRHDYLMOcHRMpEHgz2/NdY/qvcSnI=;
  b=RM7pQ2YJHbewyDY/9TqLEP0mo3inDuxDPT3kXvKobGmwBaRDobYtoMCp
   MWfg86L7Ku0DnUg6W4N00Xy3hlOpzrcX9VrvUItfwcJuPR6xwr5WlKb2u
   Okiwo8MSxjDAAr9K83xA6bvjnB0HCuNCnROn2XVPcb8CBlBwaI+PyI/a9
   YQ9zbAXp1fSM0dbTfDx5BRej8srdKxsjhn/0xT+oTOHWMNq4D/qQY6qjG
   U3bWZt3CLSDVMYPLFaWQBoFpqhVI5DZlyLrbNkwGPm48ZGOjM/2NkmG2i
   yKnjIj+RMkgly881ETXvc2l6R5iKvJrYVIKNKCqi792bVa0lACX3sUULk
   Q==;
X-CSE-ConnectionGUID: 9gUGfOhJSvmWSt2XtNSYHg==
X-CSE-MsgGUID: epyC52XUSP61WD45OrrgUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="79629505"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="79629505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 12:02:53 -0800
X-CSE-ConnectionGUID: J+jCWhzgRDCfoYGqmPobuw==
X-CSE-MsgGUID: 9ufMKiPkRiWNhRp1seBDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202300060"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2026 12:02:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc7pp-000000000EL-1Ngs;
	Sat, 03 Jan 2026 20:02:49 +0000
Date: Sun, 04 Jan 2026 04:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202601040303.lt0kVb1G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a0f93b828ee5433c5b427d8122a6dda0b514d985
commit: 35014985c266face161f6d107f8d8338e02a0b2d [1/1] ANDROID: vendor_hooks: Add hooks for binder proc transaction
config: arm64-randconfig-r122-20251224 (https://download.01.org/0day-ci/archive/20260104/202601040303.lt0kVb1G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040303.lt0kVb1G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040303.lt0kVb1G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:2508:41: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:4580:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/android/binder.c:4580:24: sparse:     expected restricted __poll_t
   drivers/android/binder.c:4580:24: sparse:     got int

vim +1373 drivers/android/binder.c

  1363	
  1364	/**
  1365	 * binder_free_ref() - free the binder_ref
  1366	 * @ref:	ref to free
  1367	 *
  1368	 * Free the binder_ref. Free the binder_node indicated by ref->node
  1369	 * (if non-NULL) and the binder_ref_death indicated by ref->death.
  1370	 */
  1371	static void binder_free_ref(struct binder_ref *ref)
  1372	{
> 1373		trace_android_vh_binder_del_ref(ref->proc ? ref->proc->tsk : 0, ref->data.desc);
  1374		if (ref->node)
  1375			binder_free_node(ref->node);
  1376		kfree(ref->death);
  1377		kfree(ref);
  1378	}
  1379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
