Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04525A933
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 02:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751421822; cv=none; b=ot+X6Sqt396aV/DccLZ3Bl6/wD3EhwFA72yY+5LsnJqflzm413IO+/oPAq4aYBjekqQefPtePZMmToa+jnRigTCg4hRa8OhTuAykv7PwDjha9hllw96eRBraUS30vkYeJfThkNNUl+EQO5bu2ejVKCEe90YLSuCycjE8P5rpFrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751421822; c=relaxed/simple;
	bh=8so+wXQLSyFyWzSJlqJW73+2VIvH3BXl2W6eUkBK/Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e84mAzuyTX4cGHzk+oPDSQj5YVYNmuRvYFV0EQDZCjlLnZ4prAxR42LE3wbJgguKv6a7EXusccdSzMJaJ+HBx/tEBEjI1SgtD7ryh9umlhLpmY3n7uZTJt9B3TjCnkknRUnbvLd1MnDoeWK/hQUFWVcflJyaobW5TDhh4+xGJy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEG4RuON; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEG4RuON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751421820; x=1782957820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8so+wXQLSyFyWzSJlqJW73+2VIvH3BXl2W6eUkBK/Wg=;
  b=BEG4RuONRPUIUgfmW4eLYnDLj01UN0j7pPGm4d3eJ1b1i0ITDRj7Knyg
   8AshBytwK59LPkQk07EoVHM0nXZfASZwpPGXCTe2eSJKh/vYASUFzIMLD
   ovTJ8rne2MTDiX43JJUHKbBhekyiolkmU0NA6EJnSRGdZsu25AAdqXQxa
   bPhKSQfOEsOV1+jI1hgz11b4q5+trQHYETsxCkycx378JY1hVAJJn9A/3
   lnYE7bWt79fXa5qqf0IrD6wHXjQpfTd4/b74xkhSVrbavIx//ck+h2++l
   /3Eb/RPwpCIG6gV7ntsiHImybhVbYFKX5l/5MFwseK1unbzBQLCCwgYJD
   g==;
X-CSE-ConnectionGUID: 2RzNL7hlSHKQM0dx6GzEww==
X-CSE-MsgGUID: mjZGN1k1SbenLvCgFEfZZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53636844"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53636844"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 19:03:39 -0700
X-CSE-ConnectionGUID: FWLm3fM7TN6ESXK19sciVg==
X-CSE-MsgGUID: r9TfTbRiQlaHizdBgz71OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="177605509"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 19:03:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWmoy-00001r-15;
	Wed, 02 Jul 2025 02:03:36 +0000
Date: Wed, 2 Jul 2025 10:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_dir_access 9/10] include/linux/fsnotify.h:292:16:
 error: 'FSNOTIFY_NO_WATCHERS' undeclared
Message-ID: <202507020921.DX8XJe1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_dir_access
head:   6a42bd7aac47832a5399a63b14cbf15892602b42
commit: 9778e3603f15187bd80baff011a30190aa4d6d2a [9/10] fsnotify: optimize out multiple pre-dir-content events during path walk
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250702/202507020921.DX8XJe1o-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020921.DX8XJe1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020921.DX8XJe1o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:12:
   include/linux/fsnotify.h: In function 'fsnotify_lookup_perm':
>> include/linux/fsnotify.h:292:16: error: 'FSNOTIFY_NO_WATCHERS' undeclared (first use in this function)
     292 |         return FSNOTIFY_NO_WATCHERS;
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify.h:292:16: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from fs/namei.c:27:
   include/linux/fsnotify.h: In function 'fsnotify_lookup_perm':
>> include/linux/fsnotify.h:292:16: error: 'FSNOTIFY_NO_WATCHERS' undeclared (first use in this function)
     292 |         return FSNOTIFY_NO_WATCHERS;
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify.h:292:16: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from fs/namei.c:18:
   fs/namei.c: In function 'lookup_slow_notify':
>> fs/namei.c:1856:35: error: 'FSNOTIFY_NO_WATCHERS' undeclared (first use in this function)
    1856 |                 if (likely(ret == FSNOTIFY_NO_WATCHERS))
         |                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^


vim +/FSNOTIFY_NO_WATCHERS +292 include/linux/fsnotify.h

   287	
   288	static inline int fsnotify_lookup_perm(struct path *path,
   289					       struct inode *dir,
   290					       const struct qstr *name)
   291	{
 > 292		return FSNOTIFY_NO_WATCHERS;
   293	}
   294	#endif
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
