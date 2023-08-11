Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36791A46
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691754344; x=1723290344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0SHWUsBL+l+FINkszsmoirXX24Uif7OCwhJ2C5knGk=;
  b=k9bbggtevtD0cZGvI446ayZxwPWKbQZPgzYUEc6LdndKCe4YY4IfjcaF
   PUT/6fV4ysbrccQBGthy0RP4z+CzCLaSm+TBeOG3gJUMsBUZkaeLqntvj
   N6i1XhAqh0WF11ztjwz7sF8CCwQGqYQJR/xhxDJprICFJoXcAzLo3Fgz6
   WTFrTpt3xzj4OemO1Cyp7z1FCD/MNAUDzizvYnvnORS0rFnquSSqEKlJa
   lA+1qpVy2yHI1mGdZj+RSqezZSoOxFC0ef7EAwBQOYMElvZZXkS+vsTrq
   bxABNJIrxaQgh6z8tJvYb8+1jLPOIzMpHI9t5SYXjvJEzGQ6d2hFHNzxt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351261285"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="351261285"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="798017962"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="798017962"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2023 04:45:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUQaK-0007lY-1T;
	Fri, 11 Aug 2023 11:45:40 +0000
Date: Fri, 11 Aug 2023 19:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 17/22] ERROR: modpost: module dax
 uses symbol inode_init_once from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202308111957.xf3BLSQQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   ec3f57af0ad99e19bbbfb9c6c94e1f3044c37fc9
commit: d4eef93a9dbf860c43e813be8412ceb01958fcd5 [17/22] ANDROID: vendor_hooks: Add hooks to extend struct swap_slots_cache
config: i386-buildonly-randconfig-r006-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111957.xf3BLSQQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111957.xf3BLSQQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111957.xf3BLSQQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module dax uses symbol inode_init_once from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module dax uses symbol unlock_new_inode from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module dax uses symbol iget5_locked from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
