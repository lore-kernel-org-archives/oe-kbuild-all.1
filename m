Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69002EDD58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 03:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789790226; cv=none; b=rpWPfwohMWFHA2XU8nqlvvrxX3O3DC1ap6F5tTbq3Va/BEdAKDUWGR7IOM6Ggz2Y2ZBx3PMvmPf5nFr5oq2L22NBaE4SF9H8h2GcXFziY7QOazWEQYeDtSSLr+UR+0dcw0Z0KxYWn5oXQO8p3cBZUblWYJlkmhTiEP1z7IEm2Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789790226; c=relaxed/simple;
	bh=o6sBMwWJLzJrJ5SLDNjVZjvXz9InjgL/y16tAhefMNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m/Hi983RGOXQCpgl/o/owIyy+Ciyb2y7ey0zghMB+qYnhDbUGhSG3YSIeRWzy6cMxwQcUvWK8ZTz6hhlitjl3Wng21XPvzTJCxC7v1VLjBf2pC5FxSLwa/xpGRKP/twJ/LNIOMWNYD0FHrGXaUOapvvEUBGigXb4N/HrWVr2oNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAoPt5fq; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAoPt5fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789790224; x=1821326224;
  h=date:from:to:cc:subject:message-id;
  bh=o6sBMwWJLzJrJ5SLDNjVZjvXz9InjgL/y16tAhefMNI=;
  b=SAoPt5fq2aGRsgdTgL9w43BZthVerG4gVyvh/VigzjI2KQMb0k6XOfF8
   Ew7w3uBtHnF7PYYsG95IolRKvKFjPR6FTe2rkUMg/UzVFgJ2XBGEQJG5M
   f51u8T15ADUm32Eq/gpfpjrWhbHc609T22H7RwvPS3EvlL6EcTtqpYvBm
   mnfsGh7MSouTsPELAkKkmIwmAzo1uyY7T3/52uSLtzYTdd8YAPvBgH10I
   xINlitiM0I5olmaD1KtQKsrarDULBmcDv/5fhEgs5kopIC3vtpne94dLG
   jwZg2s8R76vBjBBsJJyeIfhhi+/YXPw+8lAdsjawwaD+/PDP88rcfaeuD
   g==;
X-CSE-ConnectionGUID: UdKCfOsFS7e7ch7T4JGblg==
X-CSE-MsgGUID: CErJNpZ0QHO+8HtSS+e6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="840970"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="840970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 20:57:03 -0700
X-CSE-ConnectionGUID: Sw7FsiA0QxKGn3vZoLko5Q==
X-CSE-MsgGUID: RK1C9mBsRfy1xrfW84CsZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="299781474"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2026 20:57:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7mCB-00000000AdV-1TgV;
	Sat, 19 Sep 2026 03:56:59 +0000
Date: Sat, 19 Sep 2026 11:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202609191123.4VCCJsjt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   428b47f4651829663d19455bcf5132040b155e86
commit: 35014985c266face161f6d107f8d8338e02a0b2d [1/1] ANDROID: vendor_hooks: Add hooks for binder proc transaction
config: i386-randconfig-r1307-20260917 (https://download.01.org/0day-ci/archive/20260919/202609191123.4VCCJsjt-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191123.4VCCJsjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191123.4VCCJsjt-lkp@intel.com/

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
