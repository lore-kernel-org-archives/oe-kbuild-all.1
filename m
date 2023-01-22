Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D17E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 01:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674350640; x=1705886640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a2qp4YGhnz9pZiTWQqKciS0QWqa4+IxqE0w7ye8iCSs=;
  b=P3tEw1Cf93NgJ68AxNHGLxbZtr/OD0ga6ETeA+ktnMS9wYL5Wj/29s2M
   77DYDEBL6r5POdJXqFjIKwQ22EZl5wUpC3lUuGlTyqf3qnduqXIABuzyN
   pmEKixs53fCw2p9EXkcMoWN/WWjXAsUz+Zj+Rg9mUwkj9kqU18qha0jMJ
   46d7Mn84J1AEdfj3FNTiAMR3d2dhk9Hc5MZLPheWZKdwWqL2U/FTHVkkq
   K9sNbLq6QS2NjbSplBJ9nHezU7twGghxdyNNl3sCCer89V82SRcXrS+Eq
   J42Du8tfw18GnCLyaIh3Wf+Y3XGsUNyFCWRmEIGcYAuLWc2KtXPFDethz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="325895117"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="325895117"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 17:23:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="749771661"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="749771661"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2023 17:23:58 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJP5S-0004dq-0J;
	Sun, 22 Jan 2023 01:23:58 +0000
Date: Sun, 22 Jan 2023 09:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:hf-5k-rc4 11/19] lib/dynamic_debug.c:745:8: error:
 incompatible pointer to integer conversion assigning to 'char' from 'char
 *'; dereference with *
Message-ID: <202301220946.M5GI0hRL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git hf-5k-rc4
head:   48929cba46c42bcd6ec804dbf36593d7ba44579d
commit: 743b6f7cb1c6e9c941453f31df1db33c1479788b [11/19] dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
config: riscv-randconfig-r034-20230122 (https://download.01.org/0day-ci/archive/20230122/202301220946.M5GI0hRL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/jimc/linux/commit/743b6f7cb1c6e9c941453f31df1db33c1479788b
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc hf-5k-rc4
        git checkout 743b6f7cb1c6e9c941453f31df1db33c1479788b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/dynamic_debug.c:745:8: error: incompatible pointer to integer conversion assigning to 'char' from 'char *'; dereference with * [-Wint-conversion]
                           *nl = strchr(instr, '\n');
                               ^ ~~~~~~~~~~~~~~~~~~~
                                 *
   lib/dynamic_debug.c:1269:6: warning: variable 'totct' set but not used [-Wunused-but-set-variable]
           int totct = 0;
               ^
   1 warning and 1 error generated.


vim +745 lib/dynamic_debug.c

   722	
   723	static int param_set_dyndbg_module_classes(const char *instr,
   724						   const struct kernel_param *kp,
   725						   const char *modnm)
   726	{
   727		const struct ddebug_class_param *dcp = kp->arg;
   728		const struct ddebug_class_map *map = dcp->map;
   729		unsigned long inrep, new_bits, old_bits;
   730		int rc, totct = 0;
   731		char *nl;
   732	
   733		switch (map->map_type) {
   734	
   735		case DD_CLASS_TYPE_DISJOINT_NAMES:
   736		case DD_CLASS_TYPE_LEVEL_NAMES:
   737			/* handle [+-]classnames list separately, we are done here */
   738			return param_set_dyndbg_classnames(instr, kp);
   739	
   740		case DD_CLASS_TYPE_DISJOINT_BITS:
   741		case DD_CLASS_TYPE_LEVEL_NUM:
   742			/* numeric input, accept and fall-thru */
   743			rc = kstrtoul(instr, 0, &inrep);
   744			if (rc) {
 > 745				*nl = strchr(instr, '\n');
   746				if (nl)
   747					*nl = '\0';
   748				pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
   749				return -EINVAL;
   750			}
   751			break;
   752		default:
   753			pr_err("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
   754			return -EINVAL;
   755		}
   756	
   757		/* only _BITS,_NUM (numeric) map-types get here */
   758		switch (map->map_type) {
   759		case DD_CLASS_TYPE_DISJOINT_BITS:
   760			/* expect bits. mask and warn if too many */
   761			if (inrep & ~CLASSMAP_BITMASK(map->length)) {
   762				pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
   763					KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
   764				inrep &= CLASSMAP_BITMASK(map->length);
   765			}
   766			v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
   767			totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
   768			*dcp->bits = inrep;
   769			break;
   770		case DD_CLASS_TYPE_LEVEL_NUM:
   771			/* input is bitpos, of highest verbosity to be enabled */
   772			if (inrep > map->length) {
   773				pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
   774					KP_NAME(kp), inrep, map->length);
   775				inrep = map->length;
   776			}
   777			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
   778			new_bits = CLASSMAP_BITMASK(inrep);
   779			v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
   780			totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
   781			*dcp->lvl = inrep;
   782			break;
   783		default:
   784			pr_warn("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
   785		}
   786		vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
   787		return 0;
   788	}
   789	/**
   790	 * param_set_dyndbg_classes - class FOO >control
   791	 * @instr: string echo>d to sysfs, input depends on map_type
   792	 * @kp:    kp->arg has state: bits/lvl, map, map_type
   793	 *
   794	 * Enable/disable prdbgs by their class, as given in the arguments to
   795	 * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
   796	 * levels by bitpos.
   797	 *
   798	 * Returns: 0 or <0 if error.
   799	 */
   800	int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
   801	{
   802		return param_set_dyndbg_module_classes(instr, kp, NULL);
   803	}
   804	EXPORT_SYMBOL(param_set_dyndbg_classes);
   805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
