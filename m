Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E246C1FC1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689778632; x=1721314632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=imLHucqXnYNO2yrIn348rM221RZ8KilGBPj8l7A1Kwk=;
  b=X46NA/KdVAUPn9nKsE59uOg8nRlbvi5QvvNSyCDzKDFauc05IDa54oIm
   MtAFyW/HztL9RQXgEWGVMbnfZLyAUDML8dRdhxMR+8XQD/SAqkiPUM4kf
   cOyqw1jHfjK9ds4CH2NVA3mvW4za+7t0LHUnySebSpCL4BuChEEpwwLR+
   TVAaKMTIKmF4eM9ZBLtpmYhuq3H5uA7MgkLUz/2F4KBea9EPUS/Vubqhr
   FdwB3RK6cY+Y3FeTvqyt9PF9sxr7Yh7B3mHrkR1ade6ELAsnnHyq7Yr5R
   xoUnwVmGg8l7iWJppwxxVVFqYD/Msgfq2Q8Uj8qbEs2DPXdMcE2fD6hix
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356441019"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356441019"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 07:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848073732"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848073732"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 07:57:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM8br-00052N-2r;
	Wed, 19 Jul 2023 14:57:03 +0000
Date: Wed, 19 Jul 2023 22:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
Message-ID: <202307192201.7i1HPQEe-lkp@intel.com>
References: <20230719095343.88359-2-otto.pflueger@abscue.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719095343.88359-2-otto.pflueger@abscue.de>

Hi Otto,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc2 next-20230719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Otto-Pfl-ger/drm-mipi-dbi-Lock-SPI-bus-before-setting-D-C-GPIO/20230719-180941
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230719095343.88359-2-otto.pflueger%40abscue.de
patch subject: [PATCH 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
config: arc-randconfig-r022-20230718 (https://download.01.org/0day-ci/archive/20230719/202307192201.7i1HPQEe-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192201.7i1HPQEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192201.7i1HPQEe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tiny/ili9225.c: In function 'ili9225_dbi_command':
>> drivers/gpu/drm/tiny/ili9225.c:321:15: error: too few arguments to function 'mipi_dbi_spi_transfer'
     321 |         ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1);
         |               ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/tiny/ili9225.c:30:
   include/drm/drm_mipi_dbi.h:187:5: note: declared here
     187 | int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/ili9225.c:331:16: error: too few arguments to function 'mipi_dbi_spi_transfer'
     331 |         return mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_mipi_dbi.h:187:5: note: declared here
     187 | int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/ili9225.c:332:1: error: control reaches end of non-void function [-Werror=return-type]
     332 | }
         | ^
   cc1: some warnings being treated as errors


vim +/mipi_dbi_spi_transfer +321 drivers/gpu/drm/tiny/ili9225.c

b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  310  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  311  static int ili9225_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *par,
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  312  			       size_t num)
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  313  {
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  314  	struct spi_device *spi = dbi->spi;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  315  	unsigned int bpw = 8;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  316  	u32 speed_hz;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  317  	int ret;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  318  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  319  	gpiod_set_value_cansleep(dbi->dc, 0);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  320  	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 1);
d23d4d4dac0119 drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-19 @321  	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  322  	if (ret || !num)
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  323  		return ret;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  324  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  325  	if (*cmd == ILI9225_WRITE_DATA_TO_GRAM && !dbi->swap_bytes)
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  326  		bpw = 16;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  327  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  328  	gpiod_set_value_cansleep(dbi->dc, 1);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  329  	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  330  
d23d4d4dac0119 drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-19  331  	return mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  332  }
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  333  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
