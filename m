Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF767F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 03:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694663877; x=1726199877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkinGvLx4Xgbm3dpjR6mOqWeUqahsqAa2lqDuixTi9M=;
  b=Zb3P7PjJQPYgtNYleLtE6kCJVDkZ1Vc+zIKFMLecSgln7VreBD6sOMpt
   9FjdRwpkYKEZ+KiclQlUbedQTroXMscOtSC0AWTL+w+d4AC0Qvzpi+2lo
   DNL3LJUoy+myGc3kr7oXDtEq49YBoNWhYs7kI28ppoe+v9TGlk/n66zJd
   VGK9W+ESe0QdVD0TO9x//+jSZPhKnl2If+KOU7H3T2lf4wLmCgnMh++hr
   jz/rdc6Nssxw8MdniF/DIOorTKlt+19/cGIs+nXa31h3Odl/ZoyZ2FoGe
   xMLW/wuoppVxC1tUu7GpPPPVYE9+NHAcI0hs1mzIFByHRb8UGVIupl7de
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369117672"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="369117672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694087086"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694087086"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 20:57:55 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgdUG-00017Z-1p;
	Thu, 14 Sep 2023 03:57:52 +0000
Date: Thu, 14 Sep 2023 11:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>
Subject: [kees:for-next/kspp 25/25] include/uapi/linux/stddef.h:59:2: error:
 #endif without #if
Message-ID: <202309141155.Zm72Q9KR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   366c47121bf68f7a43400df6c0acf828d9f7517d
commit: 366c47121bf68f7a43400df6c0acf828d9f7517d [25/25] uapi: stddef.h: Fix header guard location
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309141155.Zm72Q9KR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141155.Zm72Q9KR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141155.Zm72Q9KR-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/uapi/linux/capability.h:17,
                    from security/selinux/include/classmap.h:2,
                    from scripts/selinux/mdp/mdp.c:36:
>> include/uapi/linux/stddef.h:59:2: error: #endif without #if
      59 | #endif /* _UAPI_LINUX_STDDEF_H */
         |  ^~~~~
   In file included from security/selinux/include/initial_sid_to_string.h:3,
                    from scripts/selinux/mdp/mdp.c:37:
>> include/uapi/linux/stddef.h:59:2: error: #endif without #if
      59 | #endif /* _UAPI_LINUX_STDDEF_H */
         |  ^~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/uapi/linux/capability.h:17,
                    from security/selinux/include/classmap.h:2,
                    from scripts/selinux/genheaders/genheaders.c:18:
>> include/uapi/linux/stddef.h:59:2: error: #endif without #if
      59 | #endif /* _UAPI_LINUX_STDDEF_H */
         |  ^~~~~
   make[5]: *** [scripts/Makefile.host:110: scripts/selinux/mdp/mdp] Error 1
   make[5]: Target 'scripts/selinux/mdp/' not remade because of errors.
   In file included from security/selinux/include/initial_sid_to_string.h:3,
                    from scripts/selinux/genheaders/genheaders.c:19:
>> include/uapi/linux/stddef.h:59:2: error: #endif without #if
      59 | #endif /* _UAPI_LINUX_STDDEF_H */
         |  ^~~~~
   make[4]: *** [scripts/Makefile.build:477: scripts/selinux/mdp] Error 2
   make[5]: *** [scripts/Makefile.host:110: scripts/selinux/genheaders/genheaders] Error 1
   make[5]: Target 'scripts/selinux/genheaders/' not remade because of errors.
   make[4]: *** [scripts/Makefile.build:477: scripts/selinux/genheaders] Error 2
   make[4]: Target 'scripts/selinux/' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:477: scripts/selinux] Error 2
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1259: scripts] Error 2
>> unifdef: usr/include/linux/stddef.h.tmp: 59: Inappropriate #endif
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/stddef.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1371: headers] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +59 include/uapi/linux/stddef.h

    58	
  > 59	#endif /* _UAPI_LINUX_STDDEF_H */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
