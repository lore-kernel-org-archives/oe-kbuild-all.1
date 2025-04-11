Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB991F193C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380261; cv=none; b=SwJ/tMKPMrE1exwKqzRkr1WpK4NjQTC3LQBjMWGgfkGuYS7qWX09cqQOUEbUVB8tHubcMdtHNF86bqiU8XpxIoQfjLWC6ewMf4iHleK9rVPSi7Rfbs6AcDnqcOWk+bjMtNTu3D3rNWib/SR6iM+2i/6LKF+up6RJcsX69QSmDNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380261; c=relaxed/simple;
	bh=iXCJI7m7xgvcKn0BRQmCOU2n8OCNV7csusMxWXACsOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tC3fN5ccGgg2ynQ01ryWk/sCFi+fcVRkyw/TY/YE6nRbksFkZykacmNVbSnSuxijh2AXD3Wdx1dCtW8ghI23nUK96TisaIUL4lLXYUQ4GMMxqrcx3ATo5Rg3l058BqhiKkfISKgXJ6SlbKBHUyXrp9ixQCFeMXH+DEQJHI1XMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aq6cLBho; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aq6cLBho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744380260; x=1775916260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iXCJI7m7xgvcKn0BRQmCOU2n8OCNV7csusMxWXACsOo=;
  b=aq6cLBho+m56XJ4oAn6usknfplwjPVNzAjqpi2Egv5fbsReVwtFUKNAS
   vF5mS1EtK68UYu+h8OkO6KwmagKNKlSJruD58O5hsG8QIQ5gbnD9eHDMK
   zVwhNZvcWFo2nTA0ZbyXgv5sW5EIJXXpnh5E+EehBNbXkaz1Kx3Npe6M8
   7MUq7dlCaNIQApgrbL5i5l6aDLg75a00t8y2ysaBnm3AHxHhflMuyZVPQ
   z1+NvO9zqukcvkzO0AurRTHp0ougxUBjhUGFQVbrFgsgjvZfax9RfyfGC
   SxCWzuGE4EEagAwt38jCKCFiaH2yakQlCXzUi2fRiYdj2eSaJH+vcazi5
   Q==;
X-CSE-ConnectionGUID: pw9z4ECoQpWHSTq5UvIdvg==
X-CSE-MsgGUID: XYxaMnA7R5u6suNTpbHWDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45819839"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="45819839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 07:04:19 -0700
X-CSE-ConnectionGUID: 7ijj0isnTu+lupaetVaKRw==
X-CSE-MsgGUID: wxzYulREQbKT0gYTeC2zug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="130042139"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2025 07:04:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3EzP-000B8Q-2p;
	Fri, 11 Apr 2025 14:04:15 +0000
Date: Fri, 11 Apr 2025 22:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Jyri Sarha <jyri.sarha@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/6] drm/tilcdc: Allow build with COMPILE_TEST=y
Message-ID: <202504111847.8IHqTDBH-lkp@intel.com>
References: <20250410145904.25550-3-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410145904.25550-3-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-tilcdc-Allow-build-without-__iowmb/20250410-230042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250410145904.25550-3-ville.syrjala%40linux.intel.com
patch subject: [PATCH v3 2/6] drm/tilcdc: Allow build with COMPILE_TEST=y
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250411/202504111847.8IHqTDBH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111847.8IHqTDBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111847.8IHqTDBH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_crtc.c:24:
   drivers/gpu/drm/tilcdc/tilcdc_regs.h: In function 'tilcdc_write64':
>> drivers/gpu/drm/tilcdc/tilcdc_regs.h:126:25: warning: passing argument 2 of 'iowrite64' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     126 |         iowrite64(data, addr);
         |                         ^~~~
   In file included from arch/alpha/include/asm/io.h:15,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/gpu/drm/tilcdc/tilcdc_crtc.c:8:
   include/asm-generic/iomap.h:56:28: note: expected 'void *' but argument is of type 'volatile void *'
      56 | extern void iowrite64(u64, void __iomem *);
         |                            ^~~~~~~~~~~~~~


vim +126 drivers/gpu/drm/tilcdc/tilcdc_regs.h

16ea975eac671f Rob Clark       2013-01-08  119  
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  120  static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  121  {
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  122  	struct tilcdc_drm_private *priv = dev->dev_private;
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  123  	volatile void __iomem *addr = priv->mmio + reg;
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  124  
4e5ca2d930aa87 Logan Gunthorpe 2017-12-05  125  #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
7eb9f069ff5dd3 Jyri Sarha      2016-08-26 @126  	iowrite64(data, addr);
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  127  #else
752db4ea4759e8 Ville Syrjälä   2025-04-10  128  	/* allow compilation without __iowmb() for COMPILE_TEST */
752db4ea4759e8 Ville Syrjälä   2025-04-10  129  #ifdef __iowmb
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  130  	__iowmb();
752db4ea4759e8 Ville Syrjälä   2025-04-10  131  #endif
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  132  	/* This compiles to strd (=64-bit write) on ARM7 */
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  133  	*(volatile u64 __force *)addr = __cpu_to_le64(data);
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  134  #endif
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  135  }
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
