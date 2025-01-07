Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FB1DFDB3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240330; cv=none; b=bOr7SfwAn1E+svaCWwwO7oR4EWqckWhnbjtpHVmiugz3luU7ufe9NV1sAtIfTqPQVkw4ZoWjDlg8JUdCLzJX+q6LKDYdQ9vVgnXyXm6ajLx+JHSmXxMEm7wJdMaWJpo+eoVUGps2xKGWqoyWyTM86Clz2znk5A7FVqNsTuBHV6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240330; c=relaxed/simple;
	bh=5ME6Y0/AppgPdOo+fIbQ8tnpkVQCmjs46C7IjU3C1xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J2KW7kZIuIT4ZDkpFdPK1nAl3loyo0qKwoeocxj6CrSB9hzISH+fMTfTNXbIrl9rbF3Bb3wu1AUaA3BqdLp2s27Hzxb5xQfrNLcq5524iXOJZEjYxMomKV2c0sKbDff/0dH6MisvtdlJTcdJuB978BSMODWiojX4lEVQEiDSdiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1zay0Yu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1zay0Yu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736240328; x=1767776328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ME6Y0/AppgPdOo+fIbQ8tnpkVQCmjs46C7IjU3C1xE=;
  b=c1zay0Yu/03EUraPO+V4dZyseOr3aqpQZMURhTZia+YXE3LhyzKhAtzs
   TG/PseGb0cgRxVkfDxvfOcCOjO7KYmYpVINef0YEHI+jlt/SMMyP0efm+
   k+jwoGxd14BSue5B4BAY8BO3N+/eZeRYcdo9MhHyIo3KAPdY74k9hR5WI
   KiYodEGPQtRHN9Guv2BavmJ/+tbW1jqE50OKvQYPDa09dNPtHgW2zz8P7
   cKMd3WyytO5q8hAMQ3ulQjxzBSr9NMcjnKRQNBvu7VBQnMOlkx8xHJ8GP
   4lcbCrRF+eZJ+MDo2rRJkw+fDeskv4n4ZlTzXTBkrgt9MR0LTKunbtzEn
   A==;
X-CSE-ConnectionGUID: XFMyoGZJT3aIiPUwTa8GWA==
X-CSE-MsgGUID: 8JqjRnN0SnWJUiMLmiaG9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36291940"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36291940"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 00:58:47 -0800
X-CSE-ConnectionGUID: SPjY2J+lRdym69kx2Faluw==
X-CSE-MsgGUID: 4CY/3ztuQW2sATV9Ax6UMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="103219628"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jan 2025 00:58:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV5QB-000ESZ-2I;
	Tue, 07 Jan 2025 08:58:43 +0000
Date: Tue, 7 Jan 2025 16:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: arch/m68k/include/asm/raw_io.h:39: warning: "__raw_readb" redefined
Message-ID: <202501071629.DNEswlm8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 7283f862bd991c8657e9bf1c02db772fcf018f13 drm: Implement DRM aperture helpers under video/
date:   2 years, 6 months ago
config: m68k-randconfig-m031-20211009 (https://download.01.org/0day-ci/archive/20250107/202501071629.DNEswlm8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071629.DNEswlm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071629.DNEswlm8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/vga.h:12,
                    from include/video/vga.h:22,
                    from include/linux/vgaarb.h:34,
                    from drivers/video/aperture.c:12:
>> arch/m68k/include/asm/raw_io.h:39: warning: "__raw_readb" redefined
      39 | #define __raw_readb in_8
         | 
   In file included from arch/m68k/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from include/linux/fb.h:6,
                    from drivers/video/aperture.c:5:
   arch/m68k/include/asm/io_no.h:16: note: this is the location of the previous definition
      16 | #define __raw_readb(addr) \
         | 
>> arch/m68k/include/asm/raw_io.h:40: warning: "__raw_readw" redefined
      40 | #define __raw_readw in_be16
         | 
   arch/m68k/include/asm/io_no.h:18: note: this is the location of the previous definition
      18 | #define __raw_readw(addr) \
         | 
>> arch/m68k/include/asm/raw_io.h:41: warning: "__raw_readl" redefined
      41 | #define __raw_readl in_be32
         | 
   arch/m68k/include/asm/io_no.h:20: note: this is the location of the previous definition
      20 | #define __raw_readl(addr) \
         | 
>> arch/m68k/include/asm/raw_io.h:46: warning: "__raw_writeb" redefined
      46 | #define __raw_writeb(val,addr) out_8((addr),(val))
         | 
   arch/m68k/include/asm/io_no.h:23: note: this is the location of the previous definition
      23 | #define __raw_writeb(b, addr) (void)((*(__force volatile u8 *) (addr)) = (b))
         | 
>> arch/m68k/include/asm/raw_io.h:47: warning: "__raw_writew" redefined
      47 | #define __raw_writew(val,addr) out_be16((addr),(val))
         | 
   arch/m68k/include/asm/io_no.h:24: note: this is the location of the previous definition
      24 | #define __raw_writew(b, addr) (void)((*(__force volatile u16 *) (addr)) = (b))
         | 
>> arch/m68k/include/asm/raw_io.h:48: warning: "__raw_writel" redefined
      48 | #define __raw_writel(val,addr) out_be32((addr),(val))
         | 
   arch/m68k/include/asm/io_no.h:25: note: this is the location of the previous definition
      25 | #define __raw_writel(b, addr) (void)((*(__force volatile u32 *) (addr)) = (b))
         | 


vim +/__raw_readb +39 arch/m68k/include/asm/raw_io.h

^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  35  
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  36  #define raw_inb in_8
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  37  #define raw_inw in_be16
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  38  #define raw_inl in_be32
f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @39  #define __raw_readb in_8
f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @40  #define __raw_readw in_be16
f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @41  #define __raw_readl in_be32
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  42  
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  43  #define raw_outb(val,port) out_8((port),(val))
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  44  #define raw_outw(val,port) out_be16((port),(val))
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  45  #define raw_outl(val,port) out_be32((port),(val))
f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @46  #define __raw_writeb(val,addr) out_8((addr),(val))
f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @47  #define __raw_writew(val,addr) out_be16((addr),(val))
f9569e1d154079 include/asm-m68k/raw_io.h Al Viro        2007-07-20 @48  #define __raw_writel(val,addr) out_be32((addr),(val))
^1da177e4c3f41 include/asm-m68k/raw_io.h Linus Torvalds 2005-04-16  49  

:::::: The code at line 39 was first introduced by commit
:::::: f9569e1d1540791f664aeb935b1ec11b6e56507c m68k iomem (based on Geert's tree + memcpy_... stuff)

:::::: TO: Al Viro <viro@ftp.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
