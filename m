Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77B1FAA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 05:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680326248; x=1711862248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qe5YQmBy6JiuD2SFWD335bK1/XLd/LkYkrn4i1M8DjE=;
  b=Ow/BM0VtgrhitIeav5x1D5Jpt9BEDyVnJqOtZO2Q/RHusTDDNDnyAuKp
   /Le3UonqaACifwH0BYkPcVuGakQetUg4kB0b7qcpi1Lv8nl9q4uBGP356
   a7yeitfOImUAQtR9tNjEcQhsMbqv9jhuskL60jLHG2O5giCySHHTwebhe
   zlLvqJxFEp5u/+wIoNo+5GmHCFYd07nYxtr3SAbsYk4R5KKgNwno0bRW6
   dyi/sEbY07EiN/WXESPFCqEO9kciTw5czpegx176CHiiM2tMi0XqLMQb8
   sc3svySq4hp9mDuLrfJ9mSV9ZVpwCuPqDRbue7ayEu9ZYRiO5D/jGK0PA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="427902169"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="427902169"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 22:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="931430206"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="931430206"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2023 22:17:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piTc1-000MUn-0t;
	Sat, 01 Apr 2023 05:17:13 +0000
Date: Sat, 1 Apr 2023 13:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Zhu <jack.zhu@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Eugen Hristev <eugen.hristev@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jack.zhu@starfivetech.com, changhuang.liang@starfivetech.com
Subject: Re: [PATCH v3 9/9] media: starfive: Add Starfive Camera Subsystem
 driver
Message-ID: <202304011300.mT9MprJK-lkp@intel.com>
References: <20230331121826.96973-10-jack.zhu@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331121826.96973-10-jack.zhu@starfivetech.com>

Hi Jack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Zhu/media-dt-bindings-Add-bindings-for-JH7110-Camera-Subsystem/20230331-202001
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230331121826.96973-10-jack.zhu%40starfivetech.com
patch subject: [PATCH v3 9/9] media: starfive: Add Starfive Camera Subsystem driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230401/202304011300.mT9MprJK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/421adbf9815b633e8bac5da7146c33aac01e283c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jack-Zhu/media-dt-bindings-Add-bindings-for-JH7110-Camera-Subsystem/20230331-202001
        git checkout 421adbf9815b633e8bac5da7146c33aac01e283c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011300.mT9MprJK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/starfive/stf_vin.c: In function 'stf_vin_map_isp_pad':
   drivers/media/platform/starfive/stf_vin.c:99:24: warning: implicit conversion from 'enum isp_line_id' to 'enum isp_pad_id' [-Wenum-conversion]
      99 |                 pad_id = vin_map_isp_line(line);
         |                        ^
   drivers/media/platform/starfive/stf_vin.c: In function 'vin_output_init_addrs':
   drivers/media/platform/starfive/stf_vin.c:683:20: warning: variable 'pong_addr' set but not used [-Wunused-but-set-variable]
     683 |         dma_addr_t pong_addr;
         |                    ^~~~~~~~~
   At top level:
>> drivers/media/platform/starfive/stf_vin.c:33:32: warning: 'vin_formats_raw' defined but not used [-Wunused-const-variable=]
      33 | static const struct vin_format vin_formats_raw[] = {
         |                                ^~~~~~~~~~~~~~~


vim +/vin_formats_raw +33 drivers/media/platform/starfive/stf_vin.c

    32	
  > 33	static const struct vin_format vin_formats_raw[] = {
    34		{ MEDIA_BUS_FMT_SBGGR12_1X12, 12},
    35		{ MEDIA_BUS_FMT_SRGGB12_1X12, 12},
    36		{ MEDIA_BUS_FMT_SGRBG12_1X12, 12},
    37		{ MEDIA_BUS_FMT_SGBRG12_1X12, 12},
    38	};
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
