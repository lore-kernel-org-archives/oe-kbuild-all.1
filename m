Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35296225CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 20:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTmUTkic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696970374; x=1728506374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hthoB96/+FnELAgiQTKL2l3mk7b7DuiQSRhB7FU3LKQ=;
  b=cTmUTkicl5HoLwTmM13Pj1C8IpZmBwdIvRZnBxT69oUJN6jjpVXcEFzK
   nrIiE/S4N4Ry+xEzHy0PSlM4qYKv1ze3xMDM30daP1KlRDtWIRwUf1Zu0
   2/jdwqCqQ0ionAG+Qlt9ymlGQgfB6SEazmXVbUdrhFXgcA0qGSp45872w
   yHlHWTNcoKbsf6hhEDB0/LJElNcFg3ydYKufUzlAZgSrDKHlAW6mWdXc7
   id2sM3boMIYunHh9au2LlfhdL9U9Zp8spddEeGeYVPJdXgmTLZgr3Vrxk
   mKvkKDkZv8SdecnnUrXqvOeWvC6x91SV7SmNPEN4360vnLYdlXTzOKpqo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470766683"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="470766683"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 13:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703436939"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="703436939"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Oct 2023 13:39:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqJVU-00016G-22;
	Tue, 10 Oct 2023 20:39:13 +0000
Date: Wed, 11 Oct 2023 04:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5e 24/24] lib/dynamic_debug.c:935:5: warning: no
 previous prototype for function '__dynamic_emit_prefix'
Message-ID: <202310110453.N5azeDCc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5e
head:   69b58a07013be2ff9c21e29b48cce3de6d963f11
commit: 69b58a07013be2ff9c21e29b48cce3de6d963f11 [24/24] dyndbg: use assoc-array to cache prefixes
config: i386-buildonly-randconfig-004-20230903 (https://download.01.org/0day-ci/archive/20231011/202310110453.N5azeDCc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110453.N5azeDCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110453.N5azeDCc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:935:5: warning: no previous prototype for function '__dynamic_emit_prefix' [-Wmissing-prototypes]
   int __dynamic_emit_prefix(struct _ddebug *desc, char *buf, int pos)
       ^
   lib/dynamic_debug.c:935:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __dynamic_emit_prefix(struct _ddebug *desc, char *buf, int pos)
   ^
   static 
   lib/dynamic_debug.c:789:21: warning: unused function 'keyring_key_to_ptr' [-Wunused-function]
   static inline void *keyring_key_to_ptr(struct key *key)
                       ^
   2 warnings generated.


vim +/__dynamic_emit_prefix +935 lib/dynamic_debug.c

   934	
 > 935	int __dynamic_emit_prefix(struct _ddebug *desc, char *buf, int pos)
   936	{
   937		int pos_after_tid;
   938		char *prefix;
   939	        struct assoc_array_edit *edit;
   940	
   941		prefix = assoc_array_find(&ddebug_prefix_cache, &ddprefix_aa_ops, desc);
   942		if (prefix) {
   943	                pos += snprintf(buf + pos, remaining(pos), "%s:", prefix);
   944			return pos;
   945		}
   946		pos_after_tid = pos;
   947	
   948	        if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
   949			pos += snprintf(buf + pos, remaining(pos), "%s:",
   950					desc->modname);
   951		if (desc->flags & _DPRINTK_FLAGS_INCL_FUNCNAME)
   952			pos += snprintf(buf + pos, remaining(pos), "%s:",
   953					desc->function);
   954	
   955		prefix = kstrdup(buf + pos_after_tid, GFP_KERNEL);
   956		edit = assoc_array_insert(&ddebug_prefix_cache, &ddprefix_aa_ops, desc, prefix);
   957	
   958		v4pr_info("caching prefix: %s for %px\n", prefix, desc);
   959		desc->flags |= _DPRINTK_FLAGS_PREFIX_CACHED;
   960		assoc_array_apply_edit(edit);
   961	
   962		return pos;
   963	}
   964	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
