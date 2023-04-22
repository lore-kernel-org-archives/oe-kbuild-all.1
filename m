Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042C18F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 00:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682122305; x=1713658305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nz30TyRNXSTRLym9b0JavOE1kR/agt99TH+kkfzAvqM=;
  b=QCW+REWCUbTb68J+bTJfdD79hB/zu91O3gVjaAgX0iQCNdbSfX3h8Zj2
   TH8riDOKzMtY3E+0g5QoYX17mdMyD27VbG/rDBoTtGOoAC0npvZ0DDGVA
   pZ7ld5J3WBm0wobNbPx0WfymdIj0T+n5CsFmkJPnMfs1IWK/f1Jn1AlDx
   mv+f8uAflG5smplrXTorHaXNotoC+XrtMljw9BASl6QJ6vJqKqa/ZPWoN
   zfr+irmdEqxZK+txDyTkzUerepcqT3sGeuZHc5VuAsa9KiuLIkGPjtg+V
   PZz8uS/f9E5hkvMjWwhPR4T11xBuDFbM/GrZ9Yc5pZJcdiKiCbMsQQ9gg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348020622"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="348020622"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 17:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642689891"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="642689891"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 17:11:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq0qd-000gwo-2n;
	Sat, 22 Apr 2023 00:11:27 +0000
Date: Sat, 22 Apr 2023 08:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 1/4] include/linux/debugobjects.h:34:42:
 error: 'CONFIG_DEBUG_OBJECTS_EXTRA_SIZE' undeclared here (not in a function)
Message-ID: <202304220837.1juTlodD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   bb4ed72d010d114a825cba50a2f910b8a6bdadf7
commit: 96ffcf4468d55cf44750a267aa5e54c4de560a5b [1/4] debugobjects: Add obj_data to a debug_obj
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230422/202304220837.1juTlodD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=96ffcf4468d55cf44750a267aa5e54c4de560a5b
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 96ffcf4468d55cf44750a267aa5e54c4de560a5b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220837.1juTlodD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/timer.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:21,
                    from include/linux/notifier.h:16,
                    from arch/x86/include/asm/uprobes.h:13,
                    from include/linux/uprobes.h:49,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/debugobjects.h:34:42: error: 'CONFIG_DEBUG_OBJECTS_EXTRA_SIZE' undeclared here (not in a function)
      34 |         char                    obj_data[CONFIG_DEBUG_OBJECTS_EXTRA_SIZE];
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/CONFIG_DEBUG_OBJECTS_EXTRA_SIZE +34 include/linux/debugobjects.h

    19	
    20	/**
    21	 * struct debug_obj - representation of an tracked object
    22	 * @node:	hlist node to link the object into the tracker list
    23	 * @state:	tracked object state
    24	 * @astate:	current active state
    25	 * @object:	pointer to the real object
    26	 * @descr:	pointer to an object type specific debug description structure
    27	 */
    28	struct debug_obj {
    29		struct hlist_node	node;
    30		enum debug_obj_state	state;
    31		unsigned int		astate;
    32		void			*object;
    33		const struct debug_obj_descr *descr;
  > 34		char			obj_data[CONFIG_DEBUG_OBJECTS_EXTRA_SIZE];
    35	};
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
