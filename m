Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B29CA42
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 04:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696049383; x=1727585383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=arr30aWpHmy7kMGrWqrx1XYiNq8pFh1ZTkAtiyJPmAg=;
  b=MJI6mgzMfWfHaFXg5yVIYTaZngnwL57r9JaySR0AhyG7L9/zorNh8+op
   BwBvX4lkIReKH+OFXOYfXEMZZQNYd2m1DF3R/G44C1nYqqalu4hZURcvS
   XZaYANGe5QjEi4f23t6+gCqzKFGNg28cHh7c//Huf2p15n8F0hZPtBXaN
   qpXDzaHRmdUR5PwxMsFaA8ixY99EeBC+FLBIR/U2aKSyLjCcH2okLw2yM
   DtS7EzcjNMvVpzjjGvvYAo79+YoLpahju2PnOL0cruDTuQS4L7D4l4LwA
   bEZxUTU/pMSiWERdG3zQjOmI9ciZQyRh1hDr6N2UL6tGBU1KYToYCb9Cq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="468700725"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="468700725"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 21:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726777810"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="726777810"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Sep 2023 21:49:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmRv6-0003iL-0g;
	Sat, 30 Sep 2023 04:49:36 +0000
Date: Sat, 30 Sep 2023 12:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Aisheng Dong <aisheng.dong@nxp.com>,
	linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH v3] backlight: pwm_bl: Disable PWM on shutdown and suspend
Message-ID: <202309301206.OT7dbPq7-lkp@intel.com>
References: <20230926150116.2124384-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926150116.2124384-1-u.kleine-koenig@pengutronix.de>

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8fff9184d1b5810dca5dd1a02726d4f844af88fc]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/backlight-pwm_bl-Disable-PWM-on-shutdown-and-suspend/20230926-230323
base:   8fff9184d1b5810dca5dd1a02726d4f844af88fc
patch link:    https://lore.kernel.org/r/20230926150116.2124384-1-u.kleine-koenig%40pengutronix.de
patch subject: [PATCH v3] backlight: pwm_bl: Disable PWM on shutdown and suspend
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230930/202309301206.OT7dbPq7-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301206.OT7dbPq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301206.OT7dbPq7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/pwm_bl.c: In function 'pwm_backlight_remove':
>> drivers/video/backlight/pwm_bl.c:632:33: error: 'state' undeclared (first use in this function); did you mean 'statx'?
     632 |         pwm_get_state(pb->pwm, &state);
         |                                 ^~~~~
         |                                 statx
   drivers/video/backlight/pwm_bl.c:632:33: note: each undeclared identifier is reported only once for each function it appears in


vim +632 drivers/video/backlight/pwm_bl.c

   624	
   625	static void pwm_backlight_remove(struct platform_device *pdev)
   626	{
   627		struct backlight_device *bl = platform_get_drvdata(pdev);
   628		struct pwm_bl_data *pb = bl_get_data(bl);
   629	
   630		backlight_device_unregister(bl);
   631		pwm_backlight_power_off(pb);
 > 632		pwm_get_state(pb->pwm, &state);
   633		state.duty_cycle = 0;
   634		state.enabled = false;
   635		pwm_apply_state(pb->pwm, &state);
   636	
   637		if (pb->exit)
   638			pb->exit(&pdev->dev);
   639	}
   640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
