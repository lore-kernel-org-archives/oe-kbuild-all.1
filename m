Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55CB2FE575
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234797; cv=none; b=qXHCVODiL0t7TYEc1Ca/LWs4LHkrrTAKRnuTixT5qOVHut6V6l/Fyxd4Cfjy3eHrRBfIp+Akl/Ii6UsiFhH2hAqhV3J9sfKKEBTVpDO6F/Q71QrdpjlWTZ/TJ7UEjKGFzRD2pMedSVRWMMKKtzy9aEDXSYmk4XqNKvqONHf+eYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234797; c=relaxed/simple;
	bh=+rroxg7A5WxBoZNG7LUSTgsZoR8cGTsuNfMHhAtvNxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N6x5mB4EpDgulVXXCFm7qfH3Wjl/dxpUl+r5Bhtx6sslTaBq19j3C1mXAqTY26kiv+sKmyBmcXmiGS5cdJGQg4r2ss3fXNb9hCqXejD+M/2WHZPp2bLUAcNyXPG2o20th2T2JJJfycglzjEP45rkzYBI82jPqrQA8tf+G6cjlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g11+97/n; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g11+97/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773234794; x=1804770794;
  h=date:from:to:cc:subject:message-id;
  bh=+rroxg7A5WxBoZNG7LUSTgsZoR8cGTsuNfMHhAtvNxw=;
  b=g11+97/n4E/h+bjP62QGpoMpILwPCunWk9b6+0WRaGHLY+xRhw5aexwT
   abIRv6vW7BsIlN3cwyTWNMRgMJzE+waiVXqOykx/qpxTAp1H9mp5gufjO
   4xD7BuUoFvDGZi8e/tHE5Xu6i4Rd1/O9hL/y8cgcoPgJxm1v00BUqvAlb
   vA1bbl1v0ivxvAZTLxUFDajChDxZd47M5aAagshZ16MgOHd1sP3Sfo1D+
   gNHlGGY8fs3Jk+Btx6kU9AtDOC1ojF36Bg87GEcxSimhj2Nus6AqntFBb
   EmgDua0aIckpgjc+boVaB+8wFP4nsXbuzwlAi5ON+aQ5b3oAMnJaIFZei
   g==;
X-CSE-ConnectionGUID: Kt5QLu7JQ+SlzmPB4IzRtA==
X-CSE-MsgGUID: a7KqEFGCSV+V5RKfKO1uXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74380596"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74380596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:13:14 -0700
X-CSE-ConnectionGUID: Bc0MRlONQB2qiqak2OpWpw==
X-CSE-MsgGUID: uQHjcDh6TNCQL/p6rSTISA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224618875"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 06:13:12 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0JN7-000000001Bt-2smg;
	Wed, 11 Mar 2026 13:13:09 +0000
Date: Wed, 11 Mar 2026 21:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/virt/gunyah/vm_mgr.c:173:28: error: implicit declaration of function
 'module_refcount'
Message-ID: <202603112157.1TTCB2vY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0104b0412b0a41935ece11bfd31b3b309c734cd7
commit: 93af311a26d2889a54d01bd27170ba59e0cc7536 [2/2] FROMLIST: gunyah: vm_mgr: Add framework for VM Functions
config: arm64-randconfig-r132-20260311 (https://download.01.org/0day-ci/archive/20260311/202603112157.1TTCB2vY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603112157.1TTCB2vY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603112157.1TTCB2vY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:24,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from drivers/virt/gunyah/vm_mgr.c:9:
   drivers/virt/gunyah/vm_mgr.c: In function 'gunyah_vm_function_unregister':
>> drivers/virt/gunyah/vm_mgr.c:173:28: error: implicit declaration of function 'module_refcount' [-Wimplicit-function-declaration]
     173 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


vim +/module_refcount +173 drivers/virt/gunyah/vm_mgr.c

     7	
     8	#include <linux/anon_inodes.h>
   > 9	#include <linux/compat.h>
    10	#include <linux/file.h>
    11	#include <linux/miscdevice.h>
    12	#include <linux/module.h>
    13	#include <linux/xarray.h>
    14	
    15	#include <uapi/linux/gunyah.h>
    16	
    17	#include "rsc_mgr.h"
    18	#include "vm_mgr.h"
    19	
    20	static DEFINE_XARRAY(gunyah_vm_functions);
    21	
    22	static void gunyah_vm_put_function(struct gunyah_vm_function *fn)
    23	{
    24		module_put(fn->mod);
    25	}
    26	
    27	static struct gunyah_vm_function *gunyah_vm_get_function(u32 type)
    28	{
    29		struct gunyah_vm_function *fn;
    30	
    31		fn = xa_load(&gunyah_vm_functions, type);
    32		if (!fn) {
    33			request_module("ghfunc:%d", type);
    34	
    35			fn = xa_load(&gunyah_vm_functions, type);
    36		}
    37	
    38		if (!fn || !try_module_get(fn->mod))
    39			fn = ERR_PTR(-ENOENT);
    40	
    41		return fn;
    42	}
    43	
    44	static void
    45	gunyah_vm_remove_function_instance(struct gunyah_vm_function_instance *inst)
    46		__must_hold(&inst->ghvm->fn_lock)
    47	{
    48		inst->fn->unbind(inst);
    49		list_del(&inst->vm_list);
    50		gunyah_vm_put_function(inst->fn);
    51		kfree(inst->argp);
    52		kfree(inst);
    53	}
    54	
    55	static void gunyah_vm_remove_functions(struct gunyah_vm *ghvm)
    56	{
    57		struct gunyah_vm_function_instance *inst, *iiter;
    58	
    59		mutex_lock(&ghvm->fn_lock);
    60		list_for_each_entry_safe(inst, iiter, &ghvm->functions, vm_list) {
    61			gunyah_vm_remove_function_instance(inst);
    62		}
    63		mutex_unlock(&ghvm->fn_lock);
    64	}
    65	
    66	static long gunyah_vm_add_function_instance(struct gunyah_vm *ghvm,
    67						    struct gunyah_fn_desc *f)
    68	{
    69		struct gunyah_vm_function_instance *inst;
    70		void __user *argp;
    71		long r = 0;
    72	
    73		if (f->arg_size > GUNYAH_FN_MAX_ARG_SIZE) {
    74			dev_err_ratelimited(ghvm->parent, "%s: arg_size > %d\n",
    75					    __func__, GUNYAH_FN_MAX_ARG_SIZE);
    76			return -EINVAL;
    77		}
    78	
    79		inst = kzalloc(sizeof(*inst), GFP_KERNEL);
    80		if (!inst)
    81			return -ENOMEM;
    82	
    83		inst->arg_size = f->arg_size;
    84		if (inst->arg_size) {
    85			inst->argp = kzalloc(inst->arg_size, GFP_KERNEL);
    86			if (!inst->argp) {
    87				r = -ENOMEM;
    88				goto free;
    89			}
    90	
    91			argp = u64_to_user_ptr(f->arg);
    92			if (copy_from_user(inst->argp, argp, f->arg_size)) {
    93				r = -EFAULT;
    94				goto free_arg;
    95			}
    96		}
    97	
    98		inst->fn = gunyah_vm_get_function(f->type);
    99		if (IS_ERR(inst->fn)) {
   100			r = PTR_ERR(inst->fn);
   101			goto free_arg;
   102		}
   103	
   104		inst->ghvm = ghvm;
   105		inst->rm = ghvm->rm;
   106	
   107		mutex_lock(&ghvm->fn_lock);
   108		r = inst->fn->bind(inst);
   109		if (r < 0) {
   110			mutex_unlock(&ghvm->fn_lock);
   111			gunyah_vm_put_function(inst->fn);
   112			goto free_arg;
   113		}
   114	
   115		list_add(&inst->vm_list, &ghvm->functions);
   116		mutex_unlock(&ghvm->fn_lock);
   117	
   118		return r;
   119	free_arg:
   120		kfree(inst->argp);
   121	free:
   122		kfree(inst);
   123		return r;
   124	}
   125	
   126	static long gunyah_vm_rm_function_instance(struct gunyah_vm *ghvm,
   127						   struct gunyah_fn_desc *f)
   128	{
   129		struct gunyah_vm_function_instance *inst, *iter;
   130		void __user *user_argp;
   131		void *argp __free(kfree) = NULL;
   132		long r = 0;
   133	
   134		if (f->arg_size) {
   135			argp = kzalloc(f->arg_size, GFP_KERNEL);
   136			if (!argp)
   137				return -ENOMEM;
   138	
   139			user_argp = u64_to_user_ptr(f->arg);
   140			if (copy_from_user(argp, user_argp, f->arg_size))
   141				return -EFAULT;
   142		}
   143	
   144		r = mutex_lock_interruptible(&ghvm->fn_lock);
   145		if (r)
   146			return r;
   147	
   148		r = -ENOENT;
   149		list_for_each_entry_safe(inst, iter, &ghvm->functions, vm_list) {
   150			if (inst->fn->type == f->type &&
   151			    inst->fn->compare(inst, argp, f->arg_size)) {
   152				gunyah_vm_remove_function_instance(inst);
   153				r = 0;
   154			}
   155		}
   156	
   157		mutex_unlock(&ghvm->fn_lock);
   158		return r;
   159	}
   160	
   161	int gunyah_vm_function_register(struct gunyah_vm_function *fn)
   162	{
   163		if (!fn->bind || !fn->unbind)
   164			return -EINVAL;
   165	
   166		return xa_err(xa_store(&gunyah_vm_functions, fn->type, fn, GFP_KERNEL));
   167	}
   168	EXPORT_SYMBOL_GPL(gunyah_vm_function_register);
   169	
   170	void gunyah_vm_function_unregister(struct gunyah_vm_function *fn)
   171	{
   172		/* Expecting unregister to only come when unloading a module */
 > 173		WARN_ON(fn->mod && module_refcount(fn->mod));
   174		xa_erase(&gunyah_vm_functions, fn->type);
   175	}
   176	EXPORT_SYMBOL_GPL(gunyah_vm_function_unregister);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
