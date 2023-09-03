Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860B38A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693744616; x=1725280616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TiZgfUaWozQWgSUq+w4T64a2NJUG2dR0FLoyM2VzUY=;
  b=geUR6whmAU+n2UjA4xGpgbHxQikd+sx4AN9xLmdRKah5g1UlNpDAoB52
   eVMlkKr2F0N3qYJ41DF0/qnu6Xl2NqdZtWcxKirMHidxmgx3R2RrtRa/f
   ke0zQ3hE7tzhB3TjXkvfr2GTg1a3V2p0x3DgBDtQCFkr00anaD6T55Rfs
   LjpxF+RwPCcgMIVmsPbs+avPAx0OFCUAeTHuMTqtmF+c1n5stTT9I2+e/
   5xKqLYvQIKLOOlRA7AW1deIClVnvpFFwQnTHsGR7GQKqLVEEwnIbFXM8l
   84K/cbpEmZJbTAgOlwZ0mecQ+BGDcv9r8Tu9mgJg9R50/LMDODhNIK6D0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442849939"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="442849939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 05:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="769711206"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="769711206"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Sep 2023 05:36:54 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcmLU-00039j-1s;
	Sun, 03 Sep 2023 12:36:52 +0000
Date: Sun, 3 Sep 2023 20:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5e 24/24] lib/dynamic_debug.c:935:5: warning: no
 previous prototype for function '__dynamic_emit_prefix'
Message-ID: <202309032006.xllfGOxV-lkp@intel.com>
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
config: riscv-randconfig-001-20230903 (https://download.01.org/0day-ci/archive/20230903/202309032006.xllfGOxV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309032006.xllfGOxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309032006.xllfGOxV-lkp@intel.com/

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
