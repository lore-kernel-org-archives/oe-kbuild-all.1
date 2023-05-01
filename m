Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155AF7E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682932926; x=1714468926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLyDp8LmL6X83W0AELaCHmaEQnFw07P3c1UhInTBaUY=;
  b=bxT7mKWPylaxUuPy2vorSrv/KJMhTZdZ1ZTqIVnKDoyQzW3bKnOvkpU1
   NZ+QZqv78pH+MElPA3XG7Gh5PiauPa6Znu+xb7H/T9YgnKr9N2hvjKRRC
   pFoDMWP6jR2p/zQe1wW7QElUua3Bhy0RvgjcmPLJYcPCxNi/AKrQGKpKo
   BdWuVXPGsPo41D0CAI1mBC/UR3p1Smdbw5ruKb/9Ok45qWtNXWW0LgPEr
   bkScsYJx+zZg2MdEtUzLV7bSrP7ahKCpTVrJ9Fh5uwAZF90UOWCCl5QDC
   +oNr5VISwjnRTRI9Ql6kGSCtjrhzYtSW8cuywGYXjN7YJ7bUq/yslTlYt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350187629"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350187629"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 02:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="689828183"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="689828183"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 May 2023 02:22:02 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptPjO-0000Nt-0E;
	Mon, 01 May 2023 09:22:02 +0000
Date: Mon, 1 May 2023 17:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will.deacon@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [linux-stable-rc:queue/4.14 10724/26142] include/linux/bits.h:6:19:
 error: initialized field overwritten
Message-ID: <202305011742.5gUEiTiE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.14
head:   6b8a28969656b6c0e1831a4c34afe8d75ce1e9b3
commit: 29499dae76101591b3c5f6050954a702b298a93f [10724/26142] locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file
config: i386-randconfig-a004-20230501 (https://download.01.org/0day-ci/archive/20230501/202305011742.5gUEiTiE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=29499dae76101591b3c5f6050954a702b298a93f
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.14
        git checkout 29499dae76101591b3c5f6050954a702b298a93f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011742.5gUEiTiE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_pci.c:73:15: error: initialized field overwritten [-Werror=override-init]
     .num_pipes = 2, /* legal, last one wins */
                  ^
   drivers/gpu/drm/i915/i915_pci.c:73:15: note: (near initialization for 'intel_i830_info.num_pipes')
   drivers/gpu/drm/i915/i915_pci.c:84:15: error: initialized field overwritten [-Werror=override-init]
     .num_pipes = 2, /* legal, last one wins */
                  ^
   drivers/gpu/drm/i915/i915_pci.c:84:15: note: (near initialization for 'intel_i85x_info.num_pipes')
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:183:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING,
                  ^~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_g45_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:183:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING,
                  ^~~~~~~~~~~
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:192:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING,
                  ^~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_gm45_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:192:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING,
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:306:15: error: initialized field overwritten [-Werror=override-init]
     .num_pipes = 0, /* legal, last one wins */
                  ^
   drivers/gpu/drm/i915/i915_pci.c:306:15: note: (near initialization for 'intel_ivybridge_q_info.num_pipes')
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:346:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_haswell_gt1_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:346:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:346:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_haswell_gt1_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:346:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:351:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_haswell_gt2_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:351:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:351:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_haswell_gt2_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:351:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:356:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_haswell_gt3_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:356:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:356:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_haswell_gt3_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:341:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:356:2: note: in expansion of macro 'HSW_PLATFORM'
     HSW_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:374:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_broadwell_gt1_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:374:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:374:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_broadwell_gt1_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:374:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:374:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: note: (near initialization for 'intel_broadwell_gt1_info.gen')
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:374:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:379:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_broadwell_gt2_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:379:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:379:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_broadwell_gt2_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:379:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:379:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: note: (near initialization for 'intel_broadwell_gt2_info.gen')
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:379:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:384:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_broadwell_rsvd_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:384:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:384:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_broadwell_rsvd_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:384:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:384:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: note: (near initialization for 'intel_broadwell_rsvd_info.gen')
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:384:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:392:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_broadwell_gt3_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:392:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:392:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_broadwell_gt3_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:369:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:392:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:392:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:370:9: note: (near initialization for 'intel_broadwell_gt3_info.gen')
     .gen = 8, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:392:2: note: in expansion of macro 'BDW_PLATFORM'
     BDW_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:394:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING,
                  ^~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_broadwell_gt3_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:394:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING,
                  ^~~~~~~~~~~
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:429:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_skylake_gt1_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:429:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:429:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_skylake_gt1_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:429:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:429:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: note: (near initialization for 'intel_skylake_gt1_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:429:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:434:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_skylake_gt2_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:434:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:434:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_skylake_gt2_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:434:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:434:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: note: (near initialization for 'intel_skylake_gt2_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:434:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_skylake_gt3_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_skylake_gt3_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: note: (near initialization for 'intel_skylake_gt3_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:440:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_skylake_gt3_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:440:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:444:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_skylake_gt4_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_skylake_gt4_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:421:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:422:9: note: (near initialization for 'intel_skylake_gt4_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:439:2: note: in expansion of macro 'SKL_PLATFORM'
     SKL_PLATFORM, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:440:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_skylake_gt4_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:440:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:449:2: note: in expansion of macro 'SKL_GT3_PLUS_PLATFORM'
     SKL_GT3_PLUS_PLATFORM,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:484:22: error: initialized field overwritten [-Werror=override-init]
     .has_reset_engine = false,
                         ^~~~~
   drivers/gpu/drm/i915/i915_pci.c:484:22: note: (near initialization for 'intel_broxton_info.has_reset_engine')
   drivers/gpu/drm/i915/i915_pci.c:491:11: error: initialized field overwritten [-Werror=override-init]
     .color = { .degamma_lut_size = 0, .gamma_lut_size = 1024 }
              ^
   drivers/gpu/drm/i915/i915_pci.c:491:11: note: (near initialization for 'intel_geminilake_info.color')
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:503:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_kabylake_gt1_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:503:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:503:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_kabylake_gt1_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:503:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:496:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:503:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:496:9: note: (near initialization for 'intel_kabylake_gt1_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:503:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:508:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_kabylake_gt2_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:508:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:508:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_kabylake_gt2_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:508:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:496:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:508:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:496:9: note: (near initialization for 'intel_kabylake_gt2_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:508:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:513:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_kabylake_gt3_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:513:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:513:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_kabylake_gt3_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:495:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:513:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:496:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:513:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:496:9: note: (near initialization for 'intel_kabylake_gt3_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:513:2: note: in expansion of macro 'KBL_PLATFORM'
     KBL_PLATFORM,
     ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:16,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from include/video/vga.h:21,
                    from include/linux/vgaarb.h:34,
                    from drivers/gpu/drm/i915/i915_pci.c:26:
>> include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:515:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING,
                  ^~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_kabylake_gt3_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:515:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING | BSD2_RING,
                  ^~~~~~~~~~~
   include/linux/bits.h:6:19: error: initialized field overwritten [-Werror=override-init]
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:520:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:528:2: note: in expansion of macro 'CFL_PLATFORM'
     CFL_PLATFORM,
     ^~~~~~~~~~~~
   include/linux/bits.h:6:19: note: (near initialization for 'intel_coffeelake_gt1_info.ring_mask')
    #define BIT(nr)   (1UL << (nr))
                      ^
   drivers/gpu/drm/i915/i915_drv.h:2983:25: note: in expansion of macro 'BIT'
    #define ENGINE_MASK(id) BIT(id)
                            ^~~
   drivers/gpu/drm/i915/i915_drv.h:2984:21: note: in expansion of macro 'ENGINE_MASK'
    #define RENDER_RING ENGINE_MASK(RCS)
                        ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:331:15: note: in expansion of macro 'RENDER_RING'
     .ring_mask = RENDER_RING | BSD_RING | BLT_RING | VEBOX_RING, \
                  ^~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:520:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:528:2: note: in expansion of macro 'CFL_PLATFORM'
     CFL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: error: initialized field overwritten [-Werror=override-init]
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:520:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:528:2: note: in expansion of macro 'CFL_PLATFORM'
     CFL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:337:14: note: (near initialization for 'intel_coffeelake_gt1_info.has_rc6p')
     .has_rc6p = 0 /* RC6p removed-by HSW */, \
                 ^
   drivers/gpu/drm/i915/i915_pci.c:361:2: note: in expansion of macro 'HSW_FEATURES'
     HSW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:520:2: note: in expansion of macro 'BDW_FEATURES'
     BDW_FEATURES, \
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:528:2: note: in expansion of macro 'CFL_PLATFORM'
     CFL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:521:9: error: initialized field overwritten [-Werror=override-init]
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:528:2: note: in expansion of macro 'CFL_PLATFORM'
     CFL_PLATFORM,
     ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_pci.c:521:9: note: (near initialization for 'intel_coffeelake_gt1_info.gen')
     .gen = 9, \
            ^
   drivers/gpu/drm/i915/i915_pci.c:528:2: note: in expansion of macro 'CFL_PLATFORM'
     CFL_PLATFORM,


vim +6 include/linux/bits.h

     5	
   > 6	#define BIT(nr)			(1UL << (nr))
     7	#define BIT_ULL(nr)		(1ULL << (nr))
     8	#define BIT_MASK(nr)		(1UL << ((nr) % BITS_PER_LONG))
     9	#define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
    10	#define BIT_ULL_MASK(nr)	(1ULL << ((nr) % BITS_PER_LONG_LONG))
    11	#define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
    12	#define BITS_PER_BYTE		8
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
