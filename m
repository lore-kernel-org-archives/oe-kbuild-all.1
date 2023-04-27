Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9328827
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682632289; x=1714168289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZM86DHt+tuxA7vv3qc9vYG2AVm6OqKrUglVSO/Zvac=;
  b=AgYZAemfSMuhDlqzk745aAg3vtNRzd0UpCVc2OTQtd1eY4CYLnCRckdF
   1fzlgiK6V5ARDTziuDmvODAi2/mcrRZ2Hgi2CDHPaOSYGqEp2U1wlEbsI
   1ItWIDSahTMECl55a7XKoJDLsiATs/bgg+moxi05VEWm4LFU3g3fM6UOr
   TF4ieZPKX3invpnvbET4HPFDdsiRj9kr6w5+89vuDtlKMQDGvbNCLFRTi
   0Ghr0XaU+AjjWkvZh9jOFKz7BF8PZTQzZu+uuJxjtK+QDslBWZWcosYrv
   k7o9Jj8QIMNPwc1aIhcEQDNaNA7/PwZw05rTnb5soFVCoGTDV1cempc30
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346345779"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="346345779"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 14:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868892636"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="868892636"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 14:51:28 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps9WR-00008z-0q;
	Thu, 27 Apr 2023 21:51:27 +0000
Date: Fri, 28 Apr 2023 05:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2a 11/11] lib/dynamic_debug.c:1267:6: warning: variable
 'totct' set but not used
Message-ID: <202304280533.kq9SXUpY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2a
head:   4eb307867eecbffe77a3e958068dfa3ec7c94ec6
commit: 4eb307867eecbffe77a3e958068dfa3ec7c94ec6 [11/11] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP and CONFIG_DRM_USE_DYNAMIC_DEBUG
config: hexagon-buildonly-randconfig-r006-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280533.kq9SXUpY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/4eb307867eecbffe77a3e958068dfa3ec7c94ec6
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2a
        git checkout 4eb307867eecbffe77a3e958068dfa3ec7c94ec6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280533.kq9SXUpY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/dynamic_debug.c:35:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from lib/dynamic_debug.c:35:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from lib/dynamic_debug.c:35:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> lib/dynamic_debug.c:1267:6: warning: variable 'totct' set but not used [-Wunused-but-set-variable]
           int totct = 0;
               ^
   7 warnings generated.


vim +/totct +1267 lib/dynamic_debug.c

  1258	
  1259	#define vpr_cm_info(cm, _msg, ...)					\
  1260		v2pr_info(_msg " module:%s base:%d len:%d type:%d\n", ##__VA_ARGS__, \
  1261			  cm->mod_name, cm->base, cm->length, cm->map_type)
  1262	
  1263	static void ddebug_match_apply_kparam(const struct kernel_param *kp, struct ddebug_class_user *cli)
  1264	{
  1265		struct ddebug_class_param *dcp;
  1266		unsigned long new_bits, old_bits = 0;
> 1267		int totct = 0;
  1268	
  1269		if (kp->ops != &param_ops_dyndbg_classes)
  1270			return;
  1271	
  1272		dcp = (struct ddebug_class_param *)kp->arg;
  1273	
  1274		if (cli->map == dcp->map) {
  1275			v2pr_info("found kp:%s =0x%lx", kp->name, *dcp->bits);
  1276			vpr_cm_info(cli->map, "mapped to:");
  1277			/*
  1278			 * using apply-bitmap is too low.
  1279			 * param_set_dyndbg_classes uses map_type to sort
  1280			 * levels-to-bits.
  1281			 * param_set_dyndbg_classes is too high, it takes
  1282			 * string inputs.
  1283			 * de-union-ing levels/bits might solve it (partly),
  1284			 * at least simplifying the translation, and possibly
  1285			 * the apply-bitmap fn/iface
  1286			 */
  1287			new_bits = *dcp->bits;
  1288			totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits,
  1289							   cli->user_mod_name);
  1290		}
  1291	}
  1292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
