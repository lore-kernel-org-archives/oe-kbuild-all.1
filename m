Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D063CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeNc1rLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697698083; x=1729234083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+EclUDtcGVM7gLY01jKF5MJX5Gbyzk5nQ7IfqgLxdY=;
  b=KeNc1rLq052sCqYqW6HJNOsRmcUankkzmq7UbKco18XdAb6iaGydYIr7
   YHveMt2h0IU7RXbV3AnOQiUHVGAxqsGNPe/YKIQJXTDlZHK9ANz/ic4Al
   bVEQvncx20ag7HEGYbl+b2Qy2yddKZv8hc+6D0KjX0SX1mwwOobGopabj
   EdKmIlyrWHNGMHXj9vE2vSz+oJqljR8RdZusVL/0TGddfUbYFalEqPtDj
   PG/XsANj4ZqISzBUW3ReDY8bXlinsqbQI97nEM3cPuyrZAuyndVMdpu87
   Q2zRIA6nMmeqdrDbSvj/ufqyh5iwATl3AfJflxHkxv7EyyNfRGYxK0r5C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="366426328"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="366426328"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 23:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="847571625"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="847571625"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2023 23:47:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtMoz-0001la-1Z;
	Thu, 19 Oct 2023 06:47:53 +0000
Date: Thu, 19 Oct 2023 14:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tylor Yang <tylor_yang@himax.corp-partner.google.com>,
	dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jikos@kernel.org, benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	poyuan_chang@himax.corp-partner.google.com, jingyliang@chromium.org,
	hbarnor@chromium.org, wuxy23@lenovo.com, luolm1@lenovo.com,
	poyu_hung@himax.corp-partner.google.com,
	Tylor Yang <tylor_yang@himax.corp-partner.google.com>
Subject: Re: [PATCH v3 4/4] HID: touchscreen: Add initial support for Himax
 HID-over-SPI
Message-ID: <202310191454.v9qp5FPx-lkp@intel.com>
References: <20231017091900.801989-5-tylor_yang@himax.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017091900.801989-5-tylor_yang@himax.corp-partner.google.com>

Hi Tylor,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus robh/for-next linus/master v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tylor-Yang/dt-bindings-input-Introduce-Himax-HID-over-SPI-device/20231017-172156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20231017091900.801989-5-tylor_yang%40himax.corp-partner.google.com
patch subject: [PATCH v3 4/4] HID: touchscreen: Add initial support for Himax HID-over-SPI
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310191454.v9qp5FPx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191454.v9qp5FPx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191454.v9qp5FPx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/hx-hid/hx_core.c: In function 'himax_boot_upgrade':
   drivers/hid/hx-hid/hx_core.c:701:14: warning: variable 'fw_load_status' set but not used [-Wunused-but-set-variable]
     701 |         bool fw_load_status = false;
         |              ^~~~~~~~~~~~~~
   drivers/hid/hx-hid/hx_core.c: At top level:
   drivers/hid/hx-hid/hx_core.c:831:6: warning: no previous prototype for 'hx_hid_update' [-Wmissing-prototypes]
     831 | void hx_hid_update(struct work_struct *work)
         |      ^~~~~~~~~~~~~
   drivers/hid/hx-hid/hx_core.c:890:6: warning: no previous prototype for 'himax_report_data_deinit' [-Wmissing-prototypes]
     890 | void himax_report_data_deinit(struct himax_ts_data *ts)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hx-hid/hx_core.c:940:5: warning: no previous prototype for 'himax_chip_suspend' [-Wmissing-prototypes]
     940 | int himax_chip_suspend(struct himax_ts_data *ts)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/hid/hx-hid/hx_core.c: In function 'himax_chip_suspend':
   drivers/hid/hx-hid/hx_core.c:942:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     942 |         int ret = 0;
         |             ^~~
   drivers/hid/hx-hid/hx_core.c: At top level:
   drivers/hid/hx-hid/hx_core.c:983:5: warning: no previous prototype for 'himax_chip_resume' [-Wmissing-prototypes]
     983 | int himax_chip_resume(struct himax_ts_data *ts)
         |     ^~~~~~~~~~~~~~~~~
   drivers/hid/hx-hid/hx_core.c: In function 'himax_resume':
>> drivers/hid/hx-hid/hx_core.c:1047:21: error: too few arguments to function 'himax_chip_init'
    1047 |                 if (himax_chip_init())
         |                     ^~~~~~~~~~~~~~~
   In file included from drivers/hid/hx-hid/hx_ic_core.h:6,
                    from drivers/hid/hx-hid/hx_core.c:16:
   drivers/hid/hx-hid/hx_core.h:485:5: note: declared here
     485 | int himax_chip_init(struct himax_ts_data *ts);
         |     ^~~~~~~~~~~~~~~
   drivers/hid/hx-hid/hx_core.c: At top level:
   drivers/hid/hx-hid/hx_core.c:1212:6: warning: no previous prototype for 'himax_chip_deinit' [-Wmissing-prototypes]
    1212 | void himax_chip_deinit(struct himax_ts_data *ts)
         |      ^~~~~~~~~~~~~~~~~
   drivers/hid/hx-hid/hx_core.c: In function 'himax_platform_init':
   drivers/hid/hx-hid/hx_core.c:1271:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1271 |         int err = PROBE_FAIL;
         |             ^~~
   drivers/hid/hx-hid/hx_core.c: At top level:
   drivers/hid/hx-hid/hx_core.c:1353:5: warning: no previous prototype for 'himax_spi_drv_probe' [-Wmissing-prototypes]
    1353 | int himax_spi_drv_probe(struct spi_device *spi)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/himax_chip_init +1047 drivers/hid/hx-hid/hx_core.c

66a3d0692ad03f Tylor Yang 2023-10-17  1034  
66a3d0692ad03f Tylor Yang 2023-10-17  1035  int himax_resume(struct device *dev)
66a3d0692ad03f Tylor Yang 2023-10-17  1036  {
66a3d0692ad03f Tylor Yang 2023-10-17  1037  	int ret = 0;
66a3d0692ad03f Tylor Yang 2023-10-17  1038  	struct himax_ts_data *ts = dev_get_drvdata(dev);
66a3d0692ad03f Tylor Yang 2023-10-17  1039  
66a3d0692ad03f Tylor Yang 2023-10-17  1040  	I("enter");
66a3d0692ad03f Tylor Yang 2023-10-17  1041  	/*
66a3d0692ad03f Tylor Yang 2023-10-17  1042  	 *	wait until device resume for TDDI
66a3d0692ad03f Tylor Yang 2023-10-17  1043  	 *	TDDI: Touch and display Driver IC
66a3d0692ad03f Tylor Yang 2023-10-17  1044  	 */
66a3d0692ad03f Tylor Yang 2023-10-17  1045  	if (!ts->initialized) {
66a3d0692ad03f Tylor Yang 2023-10-17  1046  #if !defined(CONFIG_FB)
66a3d0692ad03f Tylor Yang 2023-10-17 @1047  		if (himax_chip_init())
66a3d0692ad03f Tylor Yang 2023-10-17  1048  			return -ECANCELED;
66a3d0692ad03f Tylor Yang 2023-10-17  1049  #else
66a3d0692ad03f Tylor Yang 2023-10-17  1050  		E("init not ready, skip!");
66a3d0692ad03f Tylor Yang 2023-10-17  1051  		return -ECANCELED;
66a3d0692ad03f Tylor Yang 2023-10-17  1052  #endif
66a3d0692ad03f Tylor Yang 2023-10-17  1053  	}
66a3d0692ad03f Tylor Yang 2023-10-17  1054  	ret = himax_chip_resume(ts);
66a3d0692ad03f Tylor Yang 2023-10-17  1055  	if (ret < 0) {
66a3d0692ad03f Tylor Yang 2023-10-17  1056  		E("resume failed!");
66a3d0692ad03f Tylor Yang 2023-10-17  1057  		I("retry resume");
66a3d0692ad03f Tylor Yang 2023-10-17  1058  		schedule_delayed_work(&ts->work_resume_delayed_work,
66a3d0692ad03f Tylor Yang 2023-10-17  1059  				      msecs_to_jiffies(ts->pdata->ic_resume_delay));
66a3d0692ad03f Tylor Yang 2023-10-17  1060  		// I("try int rescue");
66a3d0692ad03f Tylor Yang 2023-10-17  1061  		// himax_int_enable(ts, 1);
66a3d0692ad03f Tylor Yang 2023-10-17  1062  	}
66a3d0692ad03f Tylor Yang 2023-10-17  1063  
66a3d0692ad03f Tylor Yang 2023-10-17  1064  	return ret;
66a3d0692ad03f Tylor Yang 2023-10-17  1065  }
66a3d0692ad03f Tylor Yang 2023-10-17  1066  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
