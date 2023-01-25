Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324410ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 03:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674617978; x=1706153978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jdvj/XuVKl8bbMan11kRs1epz2KpieNbR051GtFhH/0=;
  b=kUe+6+xFscqr7ZgpSosO8TRpjagA3hyWhG+BhMG5xzp48jKAqxH4SMcI
   5yBS72htwSKb5zY0sIur22m00VT3wKS/aJ7yDGFooxgRNWS6ebBFeO6Pz
   vuRXzq147aEMLr+/g0k22F8W3LQEAkd0LdGPaAOgi20+C9zDxaU1mVBC5
   b8Xui1ihTsLDgKJ/i4c47w9DUMlPEyUljJDKYAMVxSGG10rl1bhUL+rp8
   GOILvTM65nQxn/d5KLceAWUkavyJ+sSTDj9gtp1kEz0GDmFxzbvFMebw1
   IX+p+qOikuMjy8MMeKk/gZZNl2LqF8dpLD7XnU4qPsFAVK8UdfcoaGDKG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412706270"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="412706270"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 19:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="836221421"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="836221421"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2023 19:39:36 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKWdL-00070y-0p;
	Wed, 25 Jan 2023 03:39:35 +0000
Date: Wed, 25 Jan 2023 11:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/deprecated/android-4.14-p-release
 137/6167] security/commoncap.c:75:5: sparse: sparse: symbol '__cap_capable'
 was not declared. Should it be static?
Message-ID: <202301251126.7NYT8Ko2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/deprecated/android-4.14-p-release
head:   0ca5d5ac9152d01b3494fb2efb5390319eb9904a
commit: 2b02b4ab89b9cba5aec936046d8538962c5142fc [137/6167] ANDROID: net: paranoid: commoncap: Begin to warn users of implicit PARANOID_NETWORK capability grants
config: i386-randconfig-s002-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251126.7NYT8Ko2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/2b02b4ab89b9cba5aec936046d8538962c5142fc
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/deprecated/android-4.14-p-release
        git checkout 2b02b4ab89b9cba5aec936046d8538962c5142fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> security/commoncap.c:75:5: sparse: sparse: symbol '__cap_capable' was not declared. Should it be static?
   security/commoncap.c:474:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] magic @@     got int @@
   security/commoncap.c:474:31: sparse:     expected restricted __le32 [usertype] magic
   security/commoncap.c:474:31: sparse:     got int
   security/commoncap.c:475:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] nsmagic @@     got unsigned int [usertype] @@
   security/commoncap.c:475:33: sparse:     expected restricted __le32 [usertype] nsmagic
   security/commoncap.c:475:33: sparse:     got unsigned int [usertype]
   security/commoncap.c:476:29: sparse: sparse: restricted __le32 degrades to integer
   security/commoncap.c:477:39: sparse: sparse: invalid assignment: |=
   security/commoncap.c:477:39: sparse:    left side has type restricted __le32
   security/commoncap.c:477:39: sparse:    right side has type int
   security/commoncap.c:479:42: sparse: sparse: cast from restricted __le32
   security/commoncap.c:1226:41: sparse: sparse: dubious: !x | y
   security/commoncap.c:1307:27: sparse: sparse: symbol 'capability_hooks' was not declared. Should it be static?
   security/commoncap.c:75:5: warning: no previous declaration for '__cap_capable' [-Wmissing-declarations]
    int __cap_capable(const struct cred *cred, struct user_namespace *targ_ns,
        ^~~~~~~~~~~~~
   In file included from include/linux/capability.h:16:0,
                    from security/commoncap.c:10:
   security/commoncap.c: In function 'cap_prctl_drop':
   include/uapi/linux/capability.h:372:27: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
                              ^
   security/commoncap.c:1112:7: note: in expansion of macro 'cap_valid'
     if (!cap_valid(cap))
          ^~~~~~~~~
   security/commoncap.c: In function 'cap_task_prctl':
   include/uapi/linux/capability.h:372:27: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
                              ^
   security/commoncap.c:1142:8: note: in expansion of macro 'cap_valid'
      if (!cap_valid(arg2))
           ^~~~~~~~~
   include/uapi/linux/capability.h:372:27: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
                              ^
   security/commoncap.c:1226:10: note: in expansion of macro 'cap_valid'
      if (((!cap_valid(arg3)) | arg4 | arg5))
             ^~~~~~~~~

vim +/__cap_capable +75 security/commoncap.c

    59	
    60	/**
    61	 * __cap_capable - Determine whether a task has a particular effective capability
    62	 * @cred: The credentials to use
    63	 * @ns:  The user namespace in which we need the capability
    64	 * @cap: The capability to check for
    65	 * @audit: Whether to write an audit message or not
    66	 *
    67	 * Determine whether the nominated task has the specified capability amongst
    68	 * its effective set, returning 0 if it does, -ve if it does not.
    69	 *
    70	 * NOTE WELL: cap_has_capability() cannot be used like the kernel's capable()
    71	 * and has_capability() functions.  That is, it has the reverse semantics:
    72	 * cap_has_capability() returns 0 when a task has a capability, but the
    73	 * kernel's capable() and has_capability() returns 1 for this case.
    74	 */
  > 75	int __cap_capable(const struct cred *cred, struct user_namespace *targ_ns,
    76			int cap, int audit)
    77	{
    78		struct user_namespace *ns = targ_ns;
    79	
    80		/* See if cred has the capability in the target user namespace
    81		 * by examining the target user namespace and all of the target
    82		 * user namespace's parents.
    83		 */
    84		for (;;) {
    85			/* Do we have the necessary capabilities? */
    86			if (ns == cred->user_ns)
    87				return cap_raised(cred->cap_effective, cap) ? 0 : -EPERM;
    88	
    89			/*
    90			 * If we're already at a lower level than we're looking for,
    91			 * we're done searching.
    92			 */
    93			if (ns->level <= cred->user_ns->level)
    94				return -EPERM;
    95	
    96			/* 
    97			 * The owner of the user namespace in the parent of the
    98			 * user namespace has all caps.
    99			 */
   100			if ((ns->parent == cred->user_ns) && uid_eq(ns->owner, cred->euid))
   101				return 0;
   102	
   103			/*
   104			 * If you have a capability in a parent user ns, then you have
   105			 * it over all children user namespaces as well.
   106			 */
   107			ns = ns->parent;
   108		}
   109	
   110		/* We never get here */
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
