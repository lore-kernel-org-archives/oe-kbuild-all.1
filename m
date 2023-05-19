Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C77C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 06:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684477562; x=1716013562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZHcSynpIZ0TS/s1vUJs4eywCt3mEKWIK4I7gI762OY=;
  b=SO98p1Z8h2jxSYoDS/ZvlW3NL/yabSX4K86LUU/LtbZcwNlzDOW5RJHc
   15FQSSyZA7QSd9yxEupPOGvz6zqYoMkcy0VkRfC/eBEaHJgr5fBeCElig
   8QD5c/yhPfGgvsL7A+kixtAGyKezJWuoCLZFcbm4oBIDHnVLiDM4i3UYE
   JDna+MqkrBEJX32B+mb1TOXH4Qd9pYOTZLAAENE8NB9/V8cSxIhDr3rPf
   rATtnEZ1G72TOs8UvShslbSQgNlsOUtX1bXpuoqUoqx8/83Z08EIGx8l0
   87+LI1XsQbZWtiS7iiOoztBIWZHthlp78tfgE/RYd6cCBAJqDn9ZqMQAo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355519104"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="355519104"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 23:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="696594431"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="696594431"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 May 2023 23:26:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pztYu-000Aec-1U;
	Fri, 19 May 2023 06:26:00 +0000
Date: Fri, 19 May 2023 14:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 789/29704]
 security/commoncap.c:75:5: warning: no previous declaration for
 '__cap_capable'
Message-ID: <202305191454.st5yywVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   07aece9596e6840f57a14b428582a61c739228e0
commit: 2b02b4ab89b9cba5aec936046d8538962c5142fc [789/29704] ANDROID: net: paranoid: commoncap: Begin to warn users of implicit PARANOID_NETWORK capability grants
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230519/202305191454.st5yywVJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.14-stable
        git checkout 2b02b4ab89b9cba5aec936046d8538962c5142fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191454.st5yywVJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/commoncap.c:75:5: warning: no previous declaration for '__cap_capable' [-Wmissing-declarations]
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
https://github.com/intel/lkp-tests/wiki
