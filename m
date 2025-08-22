Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A62E92CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858402; cv=none; b=SW6Yt+QKkb2ZjoD2uRvKa4EXHw2Unmeb1gc8XSv2PWOMsGYr4zAFnZsLFvQJnJsL4AbmW9rjvdEd9ysQ88unJCqFnzEJqT1JjAAzJhJ/nRQdQHwet3qd52sGMjBhJuV9LSXg4synQ3c9hu9DaAZIUowgzOlUTvVCDyT+Z8Majrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858402; c=relaxed/simple;
	bh=IszcF2RotSRuBvDTanERbXkAxWvKDlohtlHMO4orRSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9HEP3Tc0qbzEa5UG4mGRhsyOnLXNFn8a5faUBBvehburPikbNZ7+/qxzuJwxLl6ksLZn5yq8S4tlyn8x0xLX9mZoFro21C/fKbIOXivSTCQLK9dB+yx7TW19oKFONCRwTVzjCoYlEvc950M8j3Jr3mtzihVqwW54fdsH1kl8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljw6cBxg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljw6cBxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755858401; x=1787394401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IszcF2RotSRuBvDTanERbXkAxWvKDlohtlHMO4orRSA=;
  b=ljw6cBxg2MeHYXAaodefDtT7t7E/v1xa8NIpimQmgZSfXIkGFIShU/Zt
   spe3a8qV9F5ntUpseuIqKE3DldVvL3POSKg0uR9Lc5CBOfxTvIafJehkv
   H79kzQqWP+dhXyzvKTG4Yw/gRgjjM4BgPekc9D4/AbDFwm2+8RMrKlNau
   I7M/JCeMEgqB5Xb7RQTiMi+Dac+8riHvz+vgvygHZPD9/rCrrQVSEdlGR
   aeSkUXBxTxfdENs+oo/xl9dGszKWi08GWwGijSuUQo+qg0yo5ylULKGy+
   0gE9lMFrTCtcoQlNxGnwwv5N+RS6MlrxhF7OAY8F3Vs71gNJW/EXQ22Ug
   A==;
X-CSE-ConnectionGUID: hjLCU4zuSQGoZ+U6xIwLOQ==
X-CSE-MsgGUID: R+dLxETIT3muYVvG01NDXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68866994"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="68866994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 03:26:40 -0700
X-CSE-ConnectionGUID: TD9gkzKpQ9e59YgIqGGNpQ==
X-CSE-MsgGUID: 30NAFVU8TjmS9z+wz7lDuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169073002"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2025 03:26:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upOyi-000L9t-0x;
	Fri, 22 Aug 2025 10:26:36 +0000
Date: Fri, 22 Aug 2025 18:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Liu <liuye@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dev Jain <dev.jain@arm.com>
Subject: [linux-next:master 3830/4234] include/linux/mm.h:78: warning:
 "PAGES_TO_MB" redefined
Message-ID: <202508221819.lYpl8jIM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ye,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: b91db3a36f79ab7fb796fc3fbbe0950a04ff9589 [3830/4234] mm: replace (20 - PAGE_SHIFT) with common macros for pages<->MB conversion
config: arc-randconfig-001-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221819.lYpl8jIM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221819.lYpl8jIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221819.lYpl8jIM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:37,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
--
   In file included from include/sound/pcm.h:15,
                    from sound/usb/pcm.c:14:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from sound/usb/pcm.c:6:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
   during RTL pass: mach
   sound/usb/pcm.c: In function 'retire_capture_urb':
   sound/usb/pcm.c:1390:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9110
    }
    ^
   Please submit a full bug report,
   with preprocessed source if appropriate.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from include/sound/pcm.h:15,
                    from sound/usb/quirks.c:15:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from sound/usb/quirks.c:6:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
   during RTL pass: mach
   sound/usb/quirks.c: In function 'snd_usb_apply_boot_quirk':
   sound/usb/quirks.c:1675:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9110
    }
    ^
   Please submit a full bug report,
   with preprocessed source if appropriate.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from include/sound/pcm.h:15,
                    from sound/usb/clock.c:16:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:37,
                    from include/linux/delay.h:13,
                    from include/linux/usb.h:15,
                    from sound/usb/clock.c:9:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
   during RTL pass: mach
   sound/usb/clock.c: In function '__uac_clock_find_source':
   sound/usb/clock.c:435:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9110
    }
    ^
   Please submit a full bug report,
   with preprocessed source if appropriate.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from include/sound/pcm.h:15,
                    from pcm.c:14:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from pcm.c:6:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
   during RTL pass: mach
   pcm.c: In function 'retire_capture_urb':
   pcm.c:1390:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9110
    }
    ^
   Please submit a full bug report,
   with preprocessed source if appropriate.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from include/sound/pcm.h:15,
                    from quirks.c:15:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from quirks.c:6:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
   during RTL pass: mach
   quirks.c: In function 'snd_usb_apply_boot_quirk':
   quirks.c:1675:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9110
    }
    ^
   Please submit a full bug report,
   with preprocessed source if appropriate.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from include/sound/pcm.h:15,
                    from clock.c:16:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:37,
                    from include/linux/delay.h:13,
                    from include/linux/usb.h:15,
                    from clock.c:9:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    
   during RTL pass: mach
   clock.c: In function '__uac_clock_find_source':
   clock.c:435:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9110
    }
    ^
   Please submit a full bug report,
   with preprocessed source if appropriate.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
    #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    
   In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
                    from arch/arc/include/asm/irqflags.h:13,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:37,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
    #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
    


vim +/PAGES_TO_MB +78 include/linux/mm.h

    71	
    72	/*
    73	 * Convert between pages and MB
    74	 * 20 is the shift for 1MB (2^20 = 1MB)
    75	 * PAGE_SHIFT is the shift for page size (e.g., 12 for 4KB pages)
    76	 * So (20 - PAGE_SHIFT) converts between pages and MB
    77	 */
  > 78	#define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
    79	#define MB_TO_PAGES(mb)    ((mb) << (20 - PAGE_SHIFT))
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
