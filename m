Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C310A1B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 05:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGDBfmb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701150990; x=1732686990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lD55ET0/D/PC4UMK+sBAL7mJYqk00KPnm98ys5j6Gs=;
  b=lGDBfmb/+TAnADVsxmuwOhZr/Ld0mQCl5FgaIkv6Vky460Zfn6eXVDhM
   hCnRNdMTkjuGl5o09nNVabK6m/7mj+ZfYkKPaPb7JlbFifLK7e5Ql+UKl
   lvemTV/9SJyUY818xLWNS27y8ARDyq0ATtKoyl8z6HZaoLBTxzHwhTky/
   5ZoW//GDDCEk3lUkYEBpS3nVbzYd0g2Q8V95LQn3aM232pIpw+QVrEF8M
   eAJ9FFK1oP/F6RI7M5U3XkXPAaVCpsusyxZrpYvY85NcyHZ+ZOZJf0T1A
   kIPrQQyu/URKcwVxgrm3wCuhsIFzw/rV0LefjbiUlnffvWt/CXTejJgd7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383239675"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="383239675"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 21:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1099989744"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1099989744"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2023 21:56:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7r54-00074W-2p;
	Tue, 28 Nov 2023 05:56:22 +0000
Date: Tue, 28 Nov 2023 13:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [drm-xe:drm-xe-next 3/3] drivers/gpu/drm/xe/xe_lrc.c:26: warning:
 "CTX_VALID" redefined
Message-ID: <202311281042.9kbU5vGV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lucas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   30f75cb8aa11ac361220d1491262254371302f9e
commit: 50846befe4ba5c1ce589dc88087d45991f8069ba [3/3] drm/xe: Remove GEN[0-9]*_ prefixes
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231128/202311281042.9kbU5vGV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311281042.9kbU5vGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311281042.9kbU5vGV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_lrc.c:26: warning: "CTX_VALID" redefined
      26 | #define CTX_VALID                               (1 << 0)
         | 
   In file included from arch/sparc/include/asm/mmu.h:5,
                    from include/linux/mm_types.h:23,
                    from arch/sparc/include/asm/uaccess_64.h:11,
                    from arch/sparc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/irq_work.h:6,
                    from drivers/gpu/drm/xe/xe_hw_fence_types.h:11,
                    from drivers/gpu/drm/xe/xe_lrc_types.h:9,
                    from drivers/gpu/drm/xe/xe_lrc.h:8,
                    from drivers/gpu/drm/xe/xe_lrc.c:6:
   arch/sparc/include/asm/mmu_64.h:57: note: this is the location of the previous definition
      57 | #define CTX_VALID(__ctx)        \
         | 

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/CTX_VALID +26 drivers/gpu/drm/xe/xe_lrc.c

    25	
  > 26	#define CTX_VALID				(1 << 0)
    27	#define CTX_PRIVILEGE				(1 << 8)
    28	#define CTX_ADDRESSING_MODE_SHIFT		3
    29	#define LEGACY_64B_CONTEXT			3
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
