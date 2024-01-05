Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307B566F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 05:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnnaLmSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704433592; x=1735969592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVlQN+k+4yRFeF2dgIS0I2ZJD4MKgn9ZOQSqD0WwYQo=;
  b=UnnaLmSbNANvsaVyAbmBSs0SLEIPPpQKaL+lI2EgxVusrOv4QyeTvPZU
   kB+zd6N7DzML5SqIhkwWMOaLeSvC+1bOaFUeGAv0O8800D0IV7JMqKc8a
   Q1qQcUphg8TQE9jYZRipcfbGGZRKlQj6THm1HoZgOd/6qnE/8TG417LI2
   djdZ/tPbm3mNLujhHd9HfXPTVhqri/H4tXBpRCA04Qor8d8MA1d24qk98
   +IeFrw76ZZWay+n1eGpZKUsxR6DU7odhJHZ2D12cNlW+UPfg8g0g2IRHP
   ff6swKk0LiDxfgZ1DazfTg6hcT2DBbbDrQ6txjTLPg1pOizyyVs8QfaeN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4544201"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="4544201"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 21:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871152519"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="871152519"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2024 21:46:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLd2G-0000pe-2m;
	Fri, 05 Jan 2024 05:46:24 +0000
Date: Fri, 5 Jan 2024 13:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, airlied@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
	noralf@tronnes.org
Cc: oe-kbuild-all@lists.linux.dev, gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 4/9] drm/panic: Add drm_panic_is_format_supported()
Message-ID: <202401051328.IW9dwjX4-lkp@intel.com>
References: <20240104160301.185915-5-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-5-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 50a3c772bd927dd409c484832ddd9f6bf00b7389]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20240105-001038
base:   50a3c772bd927dd409c484832ddd9f6bf00b7389
patch link:    https://lore.kernel.org/r/20240104160301.185915-5-jfalempe%40redhat.com
patch subject: [PATCH v7 4/9] drm/panic: Add drm_panic_is_format_supported()
config: hexagon-randconfig-r071-20240105 (https://download.01.org/0day-ci/archive/20240105/202401051328.IW9dwjX4-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051328.IW9dwjX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051328.IW9dwjX4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_drv.c:46:
>> include/drm/drm_panic.h:97:6: warning: no previous prototype for function 'drm_panic_is_format_supported' [-Wmissing-prototypes]
      97 | bool drm_panic_is_format_supported(u32 format) {return false; }
         |      ^
   include/drm/drm_panic.h:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | bool drm_panic_is_format_supported(u32 format) {return false; }
         | ^
         | static 
   7 warnings generated.


vim +/drm_panic_is_format_supported +97 include/drm/drm_panic.h

    96	
  > 97	bool drm_panic_is_format_supported(u32 format) {return false; }
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
