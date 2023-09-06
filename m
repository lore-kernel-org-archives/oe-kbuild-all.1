Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1862FB3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694032265; x=1725568265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aQVbaW6/3M8uf6uol+p+JCvrqdyWDtFRnx68Qf2ZZug=;
  b=Fr9ZlMu0OHOSld2Wz9Up99F8zt1J9yb3tYsOtQ84NHRsuRsvd9vTVQcL
   KSI+MZJgQEKz7oteUKEHnr0OpIveg/pwOHfU9WEfgGJ0ee05Zby3taVuZ
   KHovi9mB4L5iCKa+5xLwuBbGDQ2RPnz5IZSrPCkphVrMMfYWonEuNM576
   rpfrnjuAgILQHRcsH+KSchPlNZS18GosOK3PrjgP4U97whAtPxOOMg7K5
   KBo81in6MWQBcmgjFb2UGYZIOhDh7k69S2dbY/srINUo/s9Nkmziz/Jlt
   Eocr6csTxun9mBxDXNHk4MKhl80mDBX0sMZdzE2yWwLIFfZqoe/lLWYku
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356656426"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="356656426"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 13:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="735203357"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="735203357"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Sep 2023 13:31:02 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzAy-0000ZK-03;
	Wed, 06 Sep 2023 20:31:00 +0000
Date: Thu, 7 Sep 2023 04:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-lvts 23/23]
 drivers/thermal/mediatek/lvts_thermal.c:755:36: warning: assignment discards
 'const' qualifier from pointer target type
Message-ID: <202309070430.IebjTo1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-lvts
head:   56b32a71c49870ed59217656f5d978f97bc64379
commit: 56b32a71c49870ed59217656f5d978f97bc64379 [23/23] WIP: pass coeff from lvts_data struct into the lvts_ctrl to access from thermal_zone_device
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230907/202309070430.IebjTo1I-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070430.IebjTo1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070430.IebjTo1I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/mediatek/lvts_thermal.c: In function 'lvts_ctrl_init':
>> drivers/thermal/mediatek/lvts_thermal.c:755:36: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     755 |                 lvts_ctrl[i].coeff = &lvts_data->coeff;
         |                                    ^
   drivers/thermal/mediatek/lvts_thermal.c: In function 'lvts_probe':
   drivers/thermal/mediatek/lvts_thermal.c:1216:13: warning: unused variable 'irq' [-Wunused-variable]
    1216 |         int irq, ret;
         |             ^~~
   drivers/thermal/mediatek/lvts_thermal.c: At top level:
   drivers/thermal/mediatek/lvts_thermal.c:531:20: warning: 'lvts_irq_handler' defined but not used [-Wunused-function]
     531 | static irqreturn_t lvts_irq_handler(int irq, void *data)
         |                    ^~~~~~~~~~~~~~~~


vim +/const +755 drivers/thermal/mediatek/lvts_thermal.c

   725	
   726	static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
   727						const struct lvts_data *lvts_data)
   728	{
   729		size_t size = sizeof(*lvts_td->lvts_ctrl) * lvts_data->num_lvts_ctrl;
   730		struct lvts_ctrl *lvts_ctrl;
   731		int i, ret;
   732	
   733		/*
   734		 * Create the calibration bytes stream from efuse data
   735		 */
   736		ret = lvts_calibration_read(dev, lvts_td, lvts_data);
   737		if (ret)
   738			return ret;
   739	
   740		/*
   741		 * The golden temp information is contained in the first chunk
   742		 * of efuse data.
   743		 */
   744		ret = lvts_golden_temp_init(dev, (u32 *)lvts_td->calib);
   745		if (ret)
   746			return ret;
   747	
   748		lvts_ctrl = devm_kzalloc(dev, size, GFP_KERNEL);
   749		if (!lvts_ctrl)
   750			return -ENOMEM;
   751	
   752		for (i = 0; i < lvts_data->num_lvts_ctrl; i++) {
   753	
   754			lvts_ctrl[i].base = lvts_td->base + lvts_data->lvts_ctrl[i].offset;
 > 755			lvts_ctrl[i].coeff = &lvts_data->coeff;
   756	
   757			ret = lvts_sensor_init(dev, &lvts_ctrl[i],
   758					       &lvts_data->lvts_ctrl[i]);
   759			if (ret)
   760				return ret;
   761	
   762			ret = lvts_calibration_init(dev, &lvts_ctrl[i],
   763						    &lvts_data->lvts_ctrl[i],
   764						    lvts_td->calib);
   765			if (ret)
   766				return ret;
   767	
   768			/*
   769			 * The mode the ctrl will use to read the temperature
   770			 * (filtered or immediate)
   771			 */
   772			lvts_ctrl[i].mode = lvts_data->lvts_ctrl[i].mode;
   773	
   774			/*
   775			 * The temperature to raw temperature must be done
   776			 * after initializing the calibration.
   777			 */
   778			lvts_ctrl[i].hw_tshut_raw_temp =
   779				lvts_temp_to_raw(lvts_data->lvts_ctrl[i].hw_tshut_temp,lvts_data->coeff);
   780	
   781			lvts_ctrl[i].low_thresh = INT_MIN;
   782			lvts_ctrl[i].high_thresh = INT_MIN;
   783		}
   784	
   785		/*
   786		 * We no longer need the efuse bytes stream, let's free it
   787		 */
   788		devm_kfree(dev, lvts_td->calib);
   789	
   790		lvts_td->lvts_ctrl = lvts_ctrl;
   791		lvts_td->num_lvts_ctrl = lvts_data->num_lvts_ctrl;
   792	
   793		return 0;
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
