Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62602ECEAE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765649356; cv=none; b=gz8GlfaeQoafZZoV+N+3aBeQEdoTbYJvY2M7h7K5+HQ7KmzrwNIyVnN7diBdgFi3lvUoW+Dmg3/hKigdBL/M5BiIMrh5ZMlNRyZg7HeI2C28KSiqy7P3FSYDF7GucNQ5MSk+Ui+b+4xezYh0N5wL+wwYC+f/EzrU/+6cX1KPNI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765649356; c=relaxed/simple;
	bh=3A7HUlXm5bqktmyixDHBcpsgMmY4/luz8h31Q6upu6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fc9J6EjH64I2nOeUzDkEIbqjK11yYTCnEPyJYrgpGFJysk57uz7XEasech/hKn9dbrefA2W0AvHQICciaerwa/CmSNVhHYa+lckfexc0i3erQu7h7I6i/qAHCl/J9CDqltXAPMnxibiTDqiEip/RAdWQn7SmqSFENzKSL3RQKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6JZ5TnX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6JZ5TnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765649355; x=1797185355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3A7HUlXm5bqktmyixDHBcpsgMmY4/luz8h31Q6upu6g=;
  b=U6JZ5TnXCry5C3QmVB9rN5/upATRh2TSAb2n/dvx3YOKJwDGANa69cJc
   AWXka0UsotXuvvzIFum9mRncNsoH69uUoFzyJvUEP5jsIipRzu+YBHyMY
   O8iLUIMGG3/y+pk4PdijSQrcaMV8G8hATd9ELLoyod0qCIFb3DVfGffvd
   g0K/Vt5uDAck4uPKH4CyYHYZK1A9qKwjg08wqyPpgDz7vwAgnhf6hez9f
   So5hZTxOrRISLbeGdgAeSQD0oIwmwmAAgWnzrjOYZXq9HbO0Ge7HjecUi
   lQy1sgG0WJXAKGnZOLT1shJGkL5whZsEfRWHmlfGg8w5VV8FkTFxfNLi6
   w==;
X-CSE-ConnectionGUID: eVbGCj+MRnenQdFbzx8WDQ==
X-CSE-MsgGUID: 8WS18UAsRLe7CbPxbOunLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67775005"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67775005"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:09:11 -0800
X-CSE-ConnectionGUID: uZiWPBUlTz20i+Mw6ijoew==
X-CSE-MsgGUID: sqaWK8AFQ7KJcy0CO7YOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197344299"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 10:09:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUU3H-0000000081z-1att;
	Sat, 13 Dec 2025 18:09:07 +0000
Date: Sun, 14 Dec 2025 02:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/42]
 drivers/mmc/core/mmc.c:1541:5: warning: no previous prototype for function
 'mmc_select_timing'
Message-ID: <202512140248.usQ5kVAC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: a3a743e67f3ded182826a65262af30ec11ec5bbe [0/42] ANDROID: mmc: core: Export core functions for kernel modules usage
config: i386-buildonly-randconfig-004-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140248.usQ5kVAC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140248.usQ5kVAC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140248.usQ5kVAC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/core/mmc.c:1006:5: warning: no previous prototype for function 'mmc_select_bus_width' [-Wmissing-prototypes]
    1006 | int mmc_select_bus_width(struct mmc_card *card)
         |     ^
   drivers/mmc/core/mmc.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1006 | int mmc_select_bus_width(struct mmc_card *card)
         | ^
         | static 
   drivers/mmc/core/mmc.c:1076:5: warning: no previous prototype for function 'mmc_select_hs' [-Wmissing-prototypes]
    1076 | int mmc_select_hs(struct mmc_card *card)
         |     ^
   drivers/mmc/core/mmc.c:1076:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1076 | int mmc_select_hs(struct mmc_card *card)
         | ^
         | static 
   drivers/mmc/core/mmc.c:1095:5: warning: no previous prototype for function 'mmc_select_hs_ddr' [-Wmissing-prototypes]
    1095 | int mmc_select_hs_ddr(struct mmc_card *card)
         |     ^
   drivers/mmc/core/mmc.c:1095:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1095 | int mmc_select_hs_ddr(struct mmc_card *card)
         | ^
         | static 
   drivers/mmc/core/mmc.c:1166:5: warning: no previous prototype for function 'mmc_select_hs400' [-Wmissing-prototypes]
    1166 | int mmc_select_hs400(struct mmc_card *card)
         |     ^
   drivers/mmc/core/mmc.c:1166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1166 | int mmc_select_hs400(struct mmc_card *card)
         | ^
         | static 
>> drivers/mmc/core/mmc.c:1541:5: warning: no previous prototype for function 'mmc_select_timing' [-Wmissing-prototypes]
    1541 | int mmc_select_timing(struct mmc_card *card)
         |     ^
   drivers/mmc/core/mmc.c:1541:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1541 | int mmc_select_timing(struct mmc_card *card)
         | ^
         | static 
>> drivers/mmc/core/mmc.c:1582:5: warning: no previous prototype for function 'mmc_hs200_tuning' [-Wmissing-prototypes]
    1582 | int mmc_hs200_tuning(struct mmc_card *card)
         |     ^
   drivers/mmc/core/mmc.c:1582:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1582 | int mmc_hs200_tuning(struct mmc_card *card)
         | ^
         | static 
   6 warnings generated.


vim +/mmc_select_timing +1541 drivers/mmc/core/mmc.c

  1537	
  1538	/*
  1539	 * Activate High Speed, HS200 or HS400ES mode if supported.
  1540	 */
> 1541	int mmc_select_timing(struct mmc_card *card)
  1542	{
  1543		int err = 0;
  1544	
  1545		if (!mmc_can_ext_csd(card))
  1546			goto bus_speed;
  1547	
  1548		if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400ES) {
  1549			err = mmc_select_hs400es(card);
  1550			goto out;
  1551		}
  1552	
  1553		if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS200) {
  1554			err = mmc_select_hs200(card);
  1555			if (err == -EBADMSG)
  1556				card->mmc_avail_type &= ~EXT_CSD_CARD_TYPE_HS200;
  1557			else
  1558				goto out;
  1559		}
  1560	
  1561		if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS)
  1562			err = mmc_select_hs(card);
  1563	
  1564	out:
  1565		if (err && err != -EBADMSG)
  1566			return err;
  1567	
  1568	bus_speed:
  1569		/*
  1570		 * Set the bus speed to the selected bus timing.
  1571		 * If timing is not selected, backward compatible is the default.
  1572		 */
  1573		mmc_set_bus_speed(card);
  1574		return 0;
  1575	}
  1576	EXPORT_SYMBOL_GPL(mmc_select_timing);
  1577	
  1578	/*
  1579	 * Execute tuning sequence to seek the proper bus operating
  1580	 * conditions for HS200 and HS400, which sends CMD21 to the device.
  1581	 */
> 1582	int mmc_hs200_tuning(struct mmc_card *card)
  1583	{
  1584		struct mmc_host *host = card->host;
  1585	
  1586		/*
  1587		 * Timing should be adjusted to the HS400 target
  1588		 * operation frequency for tuning process
  1589		 */
  1590		if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400 &&
  1591		    host->ios.bus_width == MMC_BUS_WIDTH_8)
  1592			if (host->ops->prepare_hs400_tuning)
  1593				host->ops->prepare_hs400_tuning(host, &host->ios);
  1594	
  1595		return mmc_execute_tuning(card);
  1596	}
  1597	EXPORT_SYMBOL_GPL(mmc_hs200_tuning);
  1598	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
