Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2F415E5CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736200; cv=none; b=B/Q7UY/ySN3Od592aGgnzN//Pat6cQmXbnNKAwXVuIqEWYkjuN9s78XB4eqboUF3jw8p256FtIMPn/W3ACptvXYCoHNKiAvGANHNlabebOG47pkvRqi2DHdYiPxGHhWBarCF3Au0vbejPex2RHawon3LXvi3SumrqpHkaK+7py0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736200; c=relaxed/simple;
	bh=syPdddcvoJAv5ZV1H+1ZVDIWYhW3iUt4Xk6kLGSZgio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+VHIdl4MU+ibe4ZrBEzBrvDpLoMGbntSozejTj4VvAVGQfZhQNJ9jRW8xe24iUdDWqmUsy72iUrE+ywoq/HiBSJ47g8U8lQaM6auGU0TqBtwhbIp1N5DiNAiLP9rwz9QqXDnVn7ZSsXFsCpPTCKKzPipVEX/JPiqmyY5S4v1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNHd1ubx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNHd1ubx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718736198; x=1750272198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syPdddcvoJAv5ZV1H+1ZVDIWYhW3iUt4Xk6kLGSZgio=;
  b=hNHd1ubxiwxHnpGp/tbaC+sRurczsYdUiYWUUNwLhnvvODaQiiKH/Vlx
   sjjgrr1FFwRB2fm4fEWx6RFGcvVAB1E4w4Bihey8aGNz0YX3UcCtqPbUN
   ELo4JMTZlOIvIgWp19AErvSMB51AZf9FyyH860ObygVXieHwG5zYxZqnT
   ElChhlZFM/pduat2V/zYZBnU9VEiWrG3ZF2+TDJVu4TVSTDVi+1/oWixJ
   1TqrVFmWXslGDB4wZzw/flk/+RJUg4tBahmJODPx0bBIYHkwUnY3F8ldD
   9XEjfaHa0CHFc8UsszRv7yK8hzpyoIybmTvChqk6cErf9ZMl3C895Tnzm
   Q==;
X-CSE-ConnectionGUID: lhSPvdP+QzKCjK4tvDJOJg==
X-CSE-MsgGUID: fgBnuHd4QfGwupHZ/BBCBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33178212"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="33178212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 11:43:17 -0700
X-CSE-ConnectionGUID: LD8nGl8LSKuf/2w0lkHYOA==
X-CSE-MsgGUID: rPWjU4koTJC5wOxY7gkggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42362486"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jun 2024 11:43:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJdnV-0005pu-1p;
	Tue, 18 Jun 2024 18:43:13 +0000
Date: Wed, 19 Jun 2024 02:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 3099/6864] drivers/media/i2c/imx283.c:443:30:
 error: initializer element is not constant
Message-ID: <202406190227.5wktkZE2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
commit: ccb4eb4496fa94a9131c63ad0c412ebfe7f9ac35 [3099/6864] media: i2c: Add imx283 camera sensor driver
config: i386-buildonly-randconfig-006-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190227.5wktkZE2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190227.5wktkZE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190227.5wktkZE2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/imx283.c:443:30: error: initializer element is not constant
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
      .left = rect.left + ((rect.width - (_width)) / 2), \
              ^~~~
   drivers/media/i2c/imx283.c:443:30: note: (near initialization for 'supported_modes_12bit[0].crop.left')
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
      .left = rect.left + ((rect.width - (_width)) / 2), \
              ^~~~
>> drivers/media/i2c/imx283.c:443:30: error: initializer element is not constant
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
      .top = rect.top + ((rect.height - (_height)) / 2), \
             ^~~~
   drivers/media/i2c/imx283.c:443:30: note: (near initialization for 'supported_modes_12bit[0].crop.top')
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
      .top = rect.top + ((rect.height - (_height)) / 2), \
             ^~~~
   drivers/media/i2c/imx283.c:471:30: error: initializer element is not constant
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
      .left = rect.left + ((rect.width - (_width)) / 2), \
              ^~~~
   drivers/media/i2c/imx283.c:471:30: note: (near initialization for 'supported_modes_12bit[1].crop.left')
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
      .left = rect.left + ((rect.width - (_width)) / 2), \
              ^~~~
   drivers/media/i2c/imx283.c:471:30: error: initializer element is not constant
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
      .top = rect.top + ((rect.height - (_height)) / 2), \
             ^~~~
   drivers/media/i2c/imx283.c:471:30: note: (near initialization for 'supported_modes_12bit[1].crop.top')
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
      .top = rect.top + ((rect.height - (_height)) / 2), \
             ^~~~
   drivers/media/i2c/imx283.c:492:30: error: initializer element is not constant
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
      .left = rect.left + ((rect.width - (_width)) / 2), \
              ^~~~
   drivers/media/i2c/imx283.c:492:30: note: (near initialization for 'supported_modes_10bit[0].crop.left')
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:412:11: note: in definition of macro 'CENTERED_RECTANGLE'
      .left = rect.left + ((rect.width - (_width)) / 2), \
              ^~~~
   drivers/media/i2c/imx283.c:492:30: error: initializer element is not constant
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
      .top = rect.top + ((rect.height - (_height)) / 2), \
             ^~~~
   drivers/media/i2c/imx283.c:492:30: note: (near initialization for 'supported_modes_10bit[0].crop.top')
      .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                                 ^
   drivers/media/i2c/imx283.c:413:10: note: in definition of macro 'CENTERED_RECTANGLE'
      .top = rect.top + ((rect.height - (_height)) / 2), \
             ^~~~


vim +443 drivers/media/i2c/imx283.c

   409	
   410	#define CENTERED_RECTANGLE(rect, _width, _height)			\
   411		{								\
   412			.left = rect.left + ((rect.width - (_width)) / 2),	\
   413			.top = rect.top + ((rect.height - (_height)) / 2),	\
   414			.width = (_width),					\
   415			.height = (_height),					\
   416		}
   417	
   418	/* Mode configs */
   419	static const struct imx283_mode supported_modes_12bit[] = {
   420		{
   421			/* 20MPix 21.40 fps readout mode 0 */
   422			.mode = IMX283_MODE_0,
   423			.bpp = 12,
   424			.width = 5472,
   425			.height = 3648,
   426			.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
   427			.min_vmax = 3793, /* Lines */
   428	
   429			.veff = 3694,
   430			.vst = 0,
   431			.vct = 0,
   432	
   433			.hbin_ratio = 1,
   434			.vbin_ratio = 1,
   435	
   436			/* 20.00 FPS */
   437			.default_hmax = 6000, /* 900 @ 480MHz/72MHz */
   438			.default_vmax = 4000,
   439	
   440			.min_shr = 11,
   441			.horizontal_ob = 96,
   442			.vertical_ob = 16,
 > 443			.crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
   444		},
   445		{
   446			/*
   447			 * Readout mode 2 : 2/2 binned mode (2736x1824)
   448			 */
   449			.mode = IMX283_MODE_2,
   450			.bpp = 12,
   451			.width = 2736,
   452			.height = 1824,
   453			.min_hmax = 2414, /* Pixels (362 * 480MHz/72MHz + padding) */
   454			.min_vmax = 3840, /* Lines */
   455	
   456			/* 50.00 FPS */
   457			.default_hmax = 2500, /* 375 @ 480MHz/72Mhz */
   458			.default_vmax = 3840,
   459	
   460			.veff = 1824,
   461			.vst = 0,
   462			.vct = 0,
   463	
   464			.hbin_ratio = 2,
   465			.vbin_ratio = 2,
   466	
   467			.min_shr = 12,
   468			.horizontal_ob = 48,
   469			.vertical_ob = 4,
   470	
   471			.crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
   472		},
   473	};
   474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
