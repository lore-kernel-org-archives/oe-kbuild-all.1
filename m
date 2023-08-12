Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660DEA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 03:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691811620; x=1723347620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3e8UWjRyD7TMc8JN9BE3d5AMWcNiHqAGc5NZLfA/Pw=;
  b=WD3qYDSsr0OtxT4PwxA/gazXBytUU0BCy7NXGsRsTYIKiIA2/IEMDTas
   PqaoXyWleWOU539d9olI3r0GpMxKNQlJy7wwVxwwdkZuSCyDO2WZbYi7L
   v2/UQiFYYHMURdlfAZ5rZhsGncrsg+6Qy0wmIRoSZ3xenUSFnfzLuV448
   QFkiGbyfiiZlbGxzGlbmRSBVlCa2fQgvSbkbl3CHI1She7NWMRn9vJTEC
   fkFCSG0ueHnWYIvs3fPE5EgrXWAPojElHoEwH/dM0H53J+O+8NWxfDF86
   R2pgZsOsxcDEJ3pqpP+6pjPqmT3vCZqXGwTT/0oQauEEbw1emc8/iWdC0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435694525"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="435694525"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 20:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767862578"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="767862578"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 20:39:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUfSv-0008Ek-01;
	Sat, 12 Aug 2023 03:39:01 +0000
Date: Sat, 12 Aug 2023 11:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4 7928/8003]
 drivers/net/phy/mediatek-ge-soc.c:1167:68: warning: ordered comparison of
 pointer with integer zero
Message-ID: <202308121113.j2xPfEUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4
head:   33ae06cdbe7cdded20d1ac549403343243272109
commit: 4925a0544e38db9487984608af613ce54c49ba3b [7928/8003] net: phy: mediatek-ge-soc: implement LED control API
config: m68k-randconfig-r013-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121113.j2xPfEUY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121113.j2xPfEUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121113.j2xPfEUY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/mediatek-ge-soc.c: In function 'mt798x_phy_led_blink_set':
>> drivers/net/phy/mediatek-ge-soc.c:1167:68: warning: ordered comparison of pointer with integer zero [-Wextra]
    1167 |         if (delay_on && delay_off && *delay_on > 0 && & *delay_off > 0) {
         |                                                                    ^


vim +1167 drivers/net/phy/mediatek-ge-soc.c

  1156	
  1157	static int mt798x_phy_led_blink_set(struct phy_device *phydev, u8 index,
  1158					  unsigned long *delay_on,
  1159					  unsigned long *delay_off)
  1160	{
  1161		bool blinking = false;
  1162		int err = 0;
  1163	
  1164		if (index > 1)
  1165			return -EINVAL;
  1166	
> 1167		if (delay_on && delay_off && *delay_on > 0 && & *delay_off > 0) {
  1168			blinking = true;
  1169			*delay_on = 50;
  1170			*delay_off = 50;
  1171		}
  1172	
  1173		err = mt798x_phy_hw_led_blink_set(phydev, index, blinking);
  1174		if (err)
  1175			return err;
  1176	
  1177		return mt798x_phy_hw_led_on_set(phydev, index, false);
  1178	}
  1179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
