Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7241DF72C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 23:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783638610; cv=none; b=U2a36fUkP+rjIEjhlWk+3bRXWLva335l1nv2gZkattXVNg+NlmgGYpjp+WS5KNhIbc+XogFfkD+4yxrk6PV8BDfmuvoVWUJLRHKxX4v8B6sMZjj1i3AjwZuJhH+PSwTewWVsMpH5Bq7TGFnofn1Qw411HA9iEVuewcON45XNwv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783638610; c=relaxed/simple;
	bh=1JuDB7kAcdZIBmcxE+tn81F+ZS4baBxg7H4UxdNvjFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSlQ5EigjAz6WxKwCYvt2oH7Wiao61ZPgZUA/L6BunUUseucfXh3sONj72jZN8AYmPrZVq5yH1XZlWNgKXNGH0j1XyZ44hvHmHv6xdWXNLGENjK8R/dI9Exh16814C26E/DxU9stzsaZS5/xSGeaTi5iuSX5AxrTRkdzogd9dNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9q64HUP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9q64HUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783638608; x=1815174608;
  h=date:from:to:cc:subject:message-id;
  bh=1JuDB7kAcdZIBmcxE+tn81F+ZS4baBxg7H4UxdNvjFw=;
  b=f9q64HUPLfU3mIE+qShRXH2srajwT5ooOp3G7w4Lkx+wuVHFWOgpvmep
   RG66JhESGVXSpjAVDYsUuVNv2NInBhsmZjYQdR/Nu0l4H6UzZtEFXMEA4
   W4Fr4fEyI26gk7XiExsc+r9FsH2tKpDoqqid3geyKXxgfvRwe+CljtnLf
   P9s9kFIwiqpBrVEPBwFg+RYJxuOWuajcU3toncfdxMN2F5ePhdZiViuk2
   xb5w6J/IJ1Cjebtae4XmZn5ipKTdIJwiSkq0ovhlN4jAtXRPiJxQPWG9O
   w2qT7ioB8kT8q0RDVVShathGDysIwFTyKJjYhWr46rLrBWK+xiHcgJkj6
   A==;
X-CSE-ConnectionGUID: EQxw1e4NQMOgDexLhqbu2A==
X-CSE-MsgGUID: K/oVjmYHTfKpJrODpekJRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84358987"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84358987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 16:10:08 -0700
X-CSE-ConnectionGUID: n5aGg6+aT2awKddP6DrZag==
X-CSE-MsgGUID: qC1ffBaDSKmJ/WLy6MydBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258609728"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2026 16:10:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whxsZ-00000000IDz-3AZo;
	Thu, 09 Jul 2026 23:10:03 +0000
Date: Fri, 10 Jul 2026 07:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:15199:26: warning: shift
 count >= width of type
Message-ID: <202607100633.GHfvT07t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mike,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   19ff62385e4756eeaa050d84f3177ebf392c9a9e
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [1/1] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
config: x86_64-randconfig-013-20260710 (https://download.01.org/0day-ci/archive/20260710/202607100633.GHfvT07t-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100633.GHfvT07t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100633.GHfvT07t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:48:
   In file included from include/net/tcp.h:45:
   include/net/xfrm.h:2088:30: error: no member named 'xfrm' in 'struct dst_entry'
    2088 |         struct xfrm_state *x = dst->xfrm;
         |                                ~~~  ^
   include/net/xfrm.h:2095:46: error: no member named 'xfrm' in 'struct dst_entry'
    2095 |         if (!x->xso.offload_handle && !xdst->child->xfrm)
         |                                        ~~~~~~~~~~~  ^
   include/net/xfrm.h:2098:20: error: no member named 'xfrm' in 'struct dst_entry'
    2098 |             !xdst->child->xfrm)
         |              ~~~~~~~~~~~  ^
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:13110:49: warning: shift count >= width of type [-Wshift-count-overflow]
    13110 |         rc = dma_set_mask_and_coherent(&bp->pdev->dev, DMA_BIT_MASK(64));
          |                                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:15199:26: warning: shift count >= width of type [-Wshift-count-overflow]
    15199 |         bp->cyclecounter.mask = CYCLECOUNTER_MASK(64);
          |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/timecounter.h:14:59: note: expanded from macro 'CYCLECOUNTER_MASK'
      14 | #define CYCLECOUNTER_MASK(bits) (u64)((bits) < 64 ? ((1ULL<<(bits))-1) : -1)
         |                                                           ^ ~~~~~~
   3 warnings and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +15199 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c

eeed018cbfa30c0 Michal Kalderon         2014-08-17  15194  
eeed018cbfa30c0 Michal Kalderon         2014-08-17  15195  static void bnx2x_init_cyclecounter(struct bnx2x *bp)
eeed018cbfa30c0 Michal Kalderon         2014-08-17  15196  {
eeed018cbfa30c0 Michal Kalderon         2014-08-17  15197  	memset(&bp->cyclecounter, 0, sizeof(bp->cyclecounter));
eeed018cbfa30c0 Michal Kalderon         2014-08-17  15198  	bp->cyclecounter.read = bnx2x_cyclecounter_read;
f28ba401dbd9e9f Richard Cochran         2015-01-02 @15199  	bp->cyclecounter.mask = CYCLECOUNTER_MASK(64);
a6e2846cacf97d4 Sudarsana Reddy Kalluru 2016-10-21  15200  	bp->cyclecounter.shift = 0;
eeed018cbfa30c0 Michal Kalderon         2014-08-17  15201  	bp->cyclecounter.mult = 1;
eeed018cbfa30c0 Michal Kalderon         2014-08-17  15202  }
eeed018cbfa30c0 Michal Kalderon         2014-08-17  15203  

:::::: The code at line 15199 was first introduced by commit
:::::: f28ba401dbd9e9fe63d9a7f9101638ca709185b2 bnx2x: convert to CYCLECOUNTER_MASK macro.

:::::: TO: Richard Cochran <richardcochran@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
