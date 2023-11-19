Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94CEA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijfevOIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700379847; x=1731915847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHo4/52JBWJa1h9hhmVdl6CiUDy2DObLOFGxSwA7/Nw=;
  b=ijfevOIiRcReW1/Cwk45pz2o6SIWHI5aIOEB1xplHm6WKC6E01BhkTf9
   2cXEGLGPgmgCV7eCLoNwrBwDtSOXptvbkb6a6ox5qjslZ0R4EwBCn75HO
   6iO6uC9+AgZidzaLJnhW/lv8fJ4EQpK/WNrhnEXvReWFJoYLQFVg5EuAu
   SOuXDUOejMltErJzm89f7ypdeYwNXYGhQu1ZzRZGUe92cUkuDdoMHdHB0
   zcPGZWwhm/FANQqz7uoy+akvzayoCqsxSC0BpHjZccR1cSTwRC/mkK/9R
   rLgeJN0uXlk9htlZPdEUGZG1yFKXm80TBFVFkrsm38tLXIKxd3TpyJy44
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="394324434"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="394324434"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 23:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="14281867"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2023 23:44:06 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4cSL-0004ml-0a;
	Sun, 19 Nov 2023 07:43:52 +0000
Date: Sun, 19 Nov 2023 15:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-mnt_idmap 4/4] include/linux/uidgid.h:199:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202311191515.kToPd9Gl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-mnt_idmap
head:   1b6b49eaff556483d349d5ea1154ad7aacf82785
commit: 1b6b49eaff556483d349d5ea1154ad7aacf82785 [4/4] mnt_idmapping: decouple from namespaces
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231119/202311191515.kToPd9Gl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191515.kToPd9Gl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191515.kToPd9Gl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/stat.h:20,
                    from include/linux/module.h:13,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/linux/uidgid.h:199:1: error: expected identifier or '(' before '{' token
     199 | {
         | ^
>> include/linux/uidgid.h:198:19: warning: 'map_id_up' declared 'static' but never defined [-Wunused-function]
     198 | static inline u32 map_id_up(struct uid_gid_map *map, u32 id);
         |                   ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +199 include/linux/uidgid.h

   197	
 > 198	static inline u32 map_id_up(struct uid_gid_map *map, u32 id);
 > 199	{
   200		return id;
   201	}
   202	#endif /* CONFIG_USER_NS */
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
