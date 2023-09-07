Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA53211
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694089985; x=1725625985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h0ZAS0ooycexcJzTgzfkvOae232JgIUTqc8wvjM9sZg=;
  b=XFWGqcGytHTMtpzS52nSc1whws3IZ+XDRBDxFgAtUnDOkwlYravtW50Q
   aceOFaKtlkDVETH3ml+wxk6om75vqaWQmQ3/i3Ld7FUos1fm9YtcpWKfE
   yj8WiZdERiuYvG+6aXR0TuQgwXbjqnH1OgU/yjOxPTDSd171Qo2G/gSqY
   IUCQZ+S+5oYT7oYmjCX0zCKbDy14t//wUQhGCw5doPKgS3qI6khCSg9Oa
   4iutwIFeyEcGrAvRwXEcaBz5RtZdTFAOxKpo4+z4tUDOm5dK2jGYct5YD
   i4Mq0eHzXvSbH0sCZrAi9NzXigyTCKwckm49dAK24Rk1DMd2iaEgP0qQi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408339315"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="408339315"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 05:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="745134410"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="745134410"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Sep 2023 05:33:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeEBx-0001Dh-1N;
	Thu, 07 Sep 2023 12:33:01 +0000
Date: Thu, 7 Sep 2023 20:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-lvts 24/24]
 drivers/thermal/mediatek/lvts_thermal.c:754:26: error: assigning to 'struct
 lvts_data *' from 'const struct lvts_data *' discards qualifiers
Message-ID: <202309072057.LjBB5Jdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-lvts
head:   4065720f58a070dbfd56a13045f1bb7d1d1cd26a
commit: 1affb3be71472b0de8f8d6e0bf69be8c8e5e057b [24/24] lvts: add lvts_data to lvts_ctrl instead of only the coeff
config: arm-randconfig-001-20230907 (https://download.01.org/0day-ci/archive/20230907/202309072057.LjBB5Jdf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309072057.LjBB5Jdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309072057.LjBB5Jdf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/mediatek/lvts_thermal.c:754:26: error: assigning to 'struct lvts_data *' from 'const struct lvts_data *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   lvts_ctrl[i].lvts_data = lvts_data;
                                          ^ ~~~~~~~~~
   drivers/thermal/mediatek/lvts_thermal.c:1215:6: warning: unused variable 'irq' [-Wunused-variable]
           int irq, ret;
               ^
   1 warning and 1 error generated.


vim +754 drivers/thermal/mediatek/lvts_thermal.c

   724	
   725	static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
   726						const struct lvts_data *lvts_data)
   727	{
   728		size_t size = sizeof(*lvts_td->lvts_ctrl) * lvts_data->num_lvts_ctrl;
   729		struct lvts_ctrl *lvts_ctrl;
   730		int i, ret;
   731	
   732		/*
   733		 * Create the calibration bytes stream from efuse data
   734		 */
   735		ret = lvts_calibration_read(dev, lvts_td, lvts_data);
   736		if (ret)
   737			return ret;
   738	
   739		/*
   740		 * The golden temp information is contained in the first chunk
   741		 * of efuse data.
   742		 */
   743		ret = lvts_golden_temp_init(dev, (u32 *)lvts_td->calib);
   744		if (ret)
   745			return ret;
   746	
   747		lvts_ctrl = devm_kzalloc(dev, size, GFP_KERNEL);
   748		if (!lvts_ctrl)
   749			return -ENOMEM;
   750	
   751		for (i = 0; i < lvts_data->num_lvts_ctrl; i++) {
   752	
   753			lvts_ctrl[i].base = lvts_td->base + lvts_data->lvts_ctrl[i].offset;
 > 754			lvts_ctrl[i].lvts_data = lvts_data;
   755	
   756			ret = lvts_sensor_init(dev, &lvts_ctrl[i],
   757					       &lvts_data->lvts_ctrl[i]);
   758			if (ret)
   759				return ret;
   760	
   761			ret = lvts_calibration_init(dev, &lvts_ctrl[i],
   762						    &lvts_data->lvts_ctrl[i],
   763						    lvts_td->calib);
   764			if (ret)
   765				return ret;
   766	
   767			/*
   768			 * The mode the ctrl will use to read the temperature
   769			 * (filtered or immediate)
   770			 */
   771			lvts_ctrl[i].mode = lvts_data->lvts_ctrl[i].mode;
   772	
   773			/*
   774			 * The temperature to raw temperature must be done
   775			 * after initializing the calibration.
   776			 */
   777			lvts_ctrl[i].hw_tshut_raw_temp =
   778				lvts_temp_to_raw(lvts_data->lvts_ctrl[i].hw_tshut_temp,lvts_data->coeff);
   779	
   780			lvts_ctrl[i].low_thresh = INT_MIN;
   781			lvts_ctrl[i].high_thresh = INT_MIN;
   782		}
   783	
   784		/*
   785		 * We no longer need the efuse bytes stream, let's free it
   786		 */
   787		devm_kfree(dev, lvts_td->calib);
   788	
   789		lvts_td->lvts_ctrl = lvts_ctrl;
   790		lvts_td->num_lvts_ctrl = lvts_data->num_lvts_ctrl;
   791	
   792		return 0;
   793	}
   794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
