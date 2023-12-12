Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C642E660E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 22:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Henpis9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702419572; x=1733955572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pe9QZytcG3GTP5N6pG+4/bVBie7Rpj25AGGBDM1kB6c=;
  b=Henpis9Nxabbatd3S/SwWHTAcoyno7Y5zdMMAsmQVoROCGCxLX2wbUXG
   6zUuRFtTVYrllJDIBMLE369+ldIopyOMI+dk5C6j2ToPDp03zOwxcmJxq
   8Hyy1OmmIknrTbcHYgbuoc9f4LLUxwwFpQOdJAjxgDwfsWhZ4c7bXfbM0
   nsaqURV0TaLDfchxsLxclZTokVlWVrhbwLi90Roc3E9nW6kiCnFq/7f5W
   8Hu/hMg3nFo8b9ZSjDnJBaH7VoXZXl06JM0gwI8YoMC0XmGA98VlvBNVe
   5krdy3yCjafkadXQHJrHJ3KyoOalKarqf17u/zK/GNoOY1AGehjBjYjXN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398721493"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="398721493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 14:18:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749866802"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="749866802"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 14:18:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDB4n-000Jmx-0Z;
	Tue, 12 Dec 2023 22:18:05 +0000
Date: Wed, 13 Dec 2023 06:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 5/9] security/chromiumos/lsm.c:363:16:
 error: no member named 'path_mknod' in 'struct security_hook_heads'
Message-ID: <202312130647.qRhLaIvL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   551feb341e3983286656590b35b7d25d4c6f330c
commit: a3f9cabfd60ea603dab3d0d8bc864d97227a9069 [5/9] CHROMIUM: security: Add a DM LSM
config: x86_64-randconfig-075-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130647.qRhLaIvL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130647.qRhLaIvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130647.qRhLaIvL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/chromiumos/lsm.c:363:16: error: no member named 'path_mknod' in 'struct security_hook_heads'
           LSM_HOOK_INIT(path_mknod, chromiumos_security_path_mknod),
           ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:101:33: note: expanded from macro 'LSM_HOOK_INIT'
           { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
                      ~~~~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +363 security/chromiumos/lsm.c

   354	
   355	
   356	static struct security_hook_list chromiumos_security_hooks[] = {
   357		LSM_HOOK_INIT(sb_mount, chromiumos_security_sb_mount),
   358		LSM_HOOK_INIT(inode_follow_link, chromiumos_security_inode_follow_link),
   359		LSM_HOOK_INIT(file_open, chromiumos_security_file_open),
   360		LSM_HOOK_INIT(sb_eat_lsm_opts, chromiumos_sb_eat_lsm_opts),
   361		LSM_HOOK_INIT(bprm_creds_for_exec, chromiumos_bprm_creds_for_exec),
   362		LSM_HOOK_INIT(locked_down, chromiumos_locked_down),
 > 363		LSM_HOOK_INIT(path_mknod, chromiumos_security_path_mknod),
   364		LSM_HOOK_INIT(inode_mknod, chromiumos_security_inode_mknod),
   365	};
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
