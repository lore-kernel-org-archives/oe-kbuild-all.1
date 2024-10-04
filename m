Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3958158214
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728055468; cv=none; b=P94Is1mJJjuY09UUfo/MFBGgNzKDTSQwkAxyPHNrFjneMa8RFxcV/TNXAWLfBf95xIjKmK0yTQ44z3Y6Cx/jopAjyE0h/6+oWU2lMD/xSHX24kh4x/YC67BB+/l6nwpx0qalHnAJRfpa/CGKq/ei+g1OpY7JabYxK27xaGK37kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728055468; c=relaxed/simple;
	bh=kfqow9P/ST84X0OVlrkZ0GDkq4uNaGarTmBWG7WzvtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtW4G9oyH32sQ9hOUNghnHAbJkCVhQsuD2jMVD//IHXGzzYeqnbQIoFlYYEREwcxRvoN0B4DNkEnOh7b89EfrcdvpDffnbf/DKcqYqdHgPPxC2slpigkXGLg6aNhT72vecGEVeO2LRp8xlsMnPGYEWeXTYyNTRQB+tXUPX9rOq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAv87+1Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAv87+1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728055466; x=1759591466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kfqow9P/ST84X0OVlrkZ0GDkq4uNaGarTmBWG7WzvtI=;
  b=fAv87+1YVKx3zT19B6uG1P6HwaA+/DrQc+s3lE6m0g72RlIyPY070468
   AzZYu3Wx/ZiYDKjGnYyvC1ZDb0UZzdbcvnH8AuQ8iSvvg1zSKMVOy1m9N
   1doJ8l+xFNVvlv7xBTlq28LEEr7eqXsyMz3+2JKIJSAHTmK47ou5UaCw2
   F7FK8t7yUmRa6wcFRk71vviDCC2X/rRILC6eolP+bO9NRiCgQmRgfJ2hv
   V1dZOjx2R1aKARP4JLXb5iXiIQ2dFKL1lJuRYk8SHjgfvqvC0KO9cbTse
   i+Jjpv/P7dzoA8ccVruEs9hhojUvcCnnBJTZDsPMPEqMSORvYcKbo2haI
   g==;
X-CSE-ConnectionGUID: jntYTEoDQvW6dYRkhGb6RQ==
X-CSE-MsgGUID: na/P/PVcRZqmA+Tv+2q14g==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31166408"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="31166408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 08:24:26 -0700
X-CSE-ConnectionGUID: Z351U+pwR3ejRpWbJul4AA==
X-CSE-MsgGUID: +Ba/OpTyRV2V2Rvx7dsWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74726410"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Oct 2024 08:24:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swkAI-0001pS-0w;
	Fri, 04 Oct 2024 15:24:22 +0000
Date: Fri, 4 Oct 2024 23:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Jyri Sarha <jyri.sarha@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 02/10] drm/tilcdc: Allow build with COMPILE_TEST=y
Message-ID: <202410042345.cQDnF4wd-lkp@intel.com>
References: <20241003111851.10453-3-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241003111851.10453-3-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241003]
[cannot apply to shawnguo/for-next linus/master rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes v6.12-rc1 v6.11 v6.11-rc7 v6.12-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-tilcdc-Allow-build-without-__iowmb/20241003-192043
base:   next-20241003
patch link:    https://lore.kernel.org/r/20241003111851.10453-3-ville.syrjala%40linux.intel.com
patch subject: [PATCH v2 02/10] drm/tilcdc: Allow build with COMPILE_TEST=y
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410042345.cQDnF4wd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042345.cQDnF4wd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042345.cQDnF4wd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_crtc.c:24:
   drivers/gpu/drm/tilcdc/tilcdc_regs.h: In function 'tilcdc_write64':
>> drivers/gpu/drm/tilcdc/tilcdc_regs.h:126:25: warning: passing argument 2 of 'iowrite64' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     126 |         iowrite64(data, addr);
         |                         ^~~~
   In file included from arch/alpha/include/asm/io.h:15,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:11,
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
d5b0aa96231c76 Ville Syrjälä   2024-10-03  128  	/* allow compilation without __iowmb() for COMPILE_TEST */
d5b0aa96231c76 Ville Syrjälä   2024-10-03  129  #ifdef __iowmb
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  130  	__iowmb();
d5b0aa96231c76 Ville Syrjälä   2024-10-03  131  #endif
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  132  	/* This compiles to strd (=64-bit write) on ARM7 */
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  133  	*(volatile u64 __force *)addr = __cpu_to_le64(data);
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  134  #endif
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  135  }
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
