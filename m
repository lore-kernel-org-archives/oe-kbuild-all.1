Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3537F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 00:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674345656; x=1705881656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SLG8lJDTorfG2vMiexcDxAHdeWD785vYYT1s9iOwp/M=;
  b=Wc7dK7xAJXZNEG69GRI/Dyf1aiEGN1F5pPBFv172/EVBMgirJ+pWxa8L
   B3qE3RJZwidM3eyjWpTnpDGgNtHgt1GtDLr7HcytoQMVwt0rluhVkgO2T
   j1LNefjlXICQIY0uFQzSyezd0kFUhYdm9c7bC91YSeK6vYJtNZe6ibvBU
   Xwj24o+RQDuRA+hWcj20Ca0upRZHbgSyIyscuayqVZbZp9+qpUIN+AIzp
   fdw/q80mMGJ8Bfmpqt8Wc4vRO7pAhLZaveIrf+EbxJ4iMaxW2aF7jgwZc
   D/dmEL+VPCRMZJcgG1SxaG7YIPfoHJen7ezw/yAV8bV2VCc1kG42f9TFJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="327938532"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="327938532"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 16:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="906369293"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="906369293"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jan 2023 16:00:54 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJNn3-0004aa-2I;
	Sun, 22 Jan 2023 00:00:53 +0000
Date: Sun, 22 Jan 2023 08:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:hf-5k-rc4 11/19] lib/dynamic_debug.c:745:29: warning:
 assignment to 'char' from 'char *' makes integer from pointer without a cast
Message-ID: <202301220717.pN0vmXU4-lkp@intel.com>
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
config: i386-randconfig-a014 (https://download.01.org/0day-ci/archive/20230122/202301220717.pN0vmXU4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jimc/linux/commit/743b6f7cb1c6e9c941453f31df1db33c1479788b
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc hf-5k-rc4
        git checkout 743b6f7cb1c6e9c941453f31df1db33c1479788b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'param_set_dyndbg_module_classes':
>> lib/dynamic_debug.c:745:29: warning: assignment to 'char' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     745 |                         *nl = strchr(instr, '\n');
         |                             ^


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
