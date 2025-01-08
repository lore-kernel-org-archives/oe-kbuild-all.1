Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC351F9EAB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334426; cv=none; b=ZUGJ3yON/+kJqsE8xwxhCrWiA1JaB5bkRNv7u9taysFqR/rZsqlaNU7bnsGjnRLrybtsjwSr1ZrAzeDEIBCH6gVAxB9n98LMC+90ZA8wwphXuAFBTtVhDhB2fbP2vv3ER1gY/T1b1b39AF6OAuDoHQkviJqfg51hN7zc00qZ3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334426; c=relaxed/simple;
	bh=xp6QZHV6zibdHS0nBJ0Boy7cKOd/avjWk7kz0FVsG5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrtKnbIS0B/ewK9fiPta5q8V5XXVS2+vhDpHmCItD5p7+lAqgz+BhtYiY8kITVUu23mK9WtZNvS1t2WUEznzRP8pAZ0PawnUMww8naVcmw0ewRIGG7PsHCZvubXRUsGmTyoyYjJ2I/JQhklyKrWQrAgiWsXcu6nMZGM8jeY6U2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IumX/blQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IumX/blQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736334424; x=1767870424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xp6QZHV6zibdHS0nBJ0Boy7cKOd/avjWk7kz0FVsG5k=;
  b=IumX/blQBZWxbcUQ8lTIEfZQBmKdDz2vvwTVnRvrgi0AeJ3md5xcF8x9
   KNM2EunoCQwIj8oHQMqm/S71p6yO/HuZ/Hf01szYquIYE0vSb74UOL8sn
   oNHBTbGpxQLDwrDTVxjtkzPPNwYH8Zc7Zt5zI+OB8pNXnlu7ZgfMf62jJ
   GGUaQGSWdhEF9F4phvvSPZvwsDkJg0XrsAWTi4Sb+9LTQtQZZbQ9wsjiS
   /OAEcDhZC42En2yIQa8hDJVYfs/FEug6GeVdDknf/hjEfL43GYDwHDeW/
   rwB3HLVg5UQSv/E3JRK0aGnEFGh+HVwVSpjoNdNPZD3jux/a6Svyxc8sV
   w==;
X-CSE-ConnectionGUID: rrftlcMEQPeVN13+5qyRYw==
X-CSE-MsgGUID: HjfngBWySWi9QO5JljPDJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36437706"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36437706"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:07:04 -0800
X-CSE-ConnectionGUID: 7qI0G0H1SCu7Zq0T0ueB+A==
X-CSE-MsgGUID: 5iFvmyP+Qpeih8X7QxizGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103548146"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 03:07:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVTtq-000Fyh-31;
	Wed, 08 Jan 2025 11:06:58 +0000
Date: Wed, 8 Jan 2025 19:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_ptp.c:1375:27: warning: '%s'
 directive output may be truncated writing up to 287 bytes into a region of
 size 64
Message-ID: <202501081838.MgriAIka-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 1050713026a08d605b61f039700b67aab646371f i40e: add support for PTP external synchronization clock
date:   3 years, 6 months ago
config: alpha-randconfig-p001-20211207 (https://download.01.org/0day-ci/archive/20250108/202501081838.MgriAIka-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081838.MgriAIka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081838.MgriAIka-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/i40e/i40e_ptp.c: In function 'i40e_ptp_init':
>> drivers/net/ethernet/intel/i40e/i40e_ptp.c:1375:27: warning: '%s' directive output may be truncated writing up to 287 bytes into a region of size 64 [-Wformat-truncation=]
    1375 |                          "%s", sdp_desc[i].name);
         |                           ^~
   In function 'i40e_init_pin_config',
       inlined from 'i40e_ptp_create_clock' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1414:13,
       inlined from 'i40e_ptp_init' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1519:8:
   drivers/net/ethernet/intel/i40e/i40e_ptp.c:1373:17: note: 'snprintf' output between 1 and 288 bytes into a destination of size 64
    1373 |                 snprintf(pf->ptp_caps.pin_config[i].name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1374 |                          sizeof(pf->ptp_caps.pin_config[i].name),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1375 |                          "%s", sdp_desc[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~


vim +1375 drivers/net/ethernet/intel/i40e/i40e_ptp.c

  1349	
  1350	/**
  1351	 * i40e_init_pin_config - initialize pins.
  1352	 * @pf: private board structure
  1353	 *
  1354	 * Initialize pins for external clock source.
  1355	 * Return 0 on success or error code on failure.
  1356	 **/
  1357	static int i40e_init_pin_config(struct i40e_pf *pf)
  1358	{
  1359		int i;
  1360	
  1361		pf->ptp_caps.n_pins = 3;
  1362		pf->ptp_caps.n_ext_ts = 2;
  1363		pf->ptp_caps.pps = 1;
  1364		pf->ptp_caps.n_per_out = 2;
  1365	
  1366		pf->ptp_caps.pin_config = kcalloc(pf->ptp_caps.n_pins,
  1367						  sizeof(*pf->ptp_caps.pin_config),
  1368						  GFP_KERNEL);
  1369		if (!pf->ptp_caps.pin_config)
  1370			return -ENOMEM;
  1371	
  1372		for (i = 0; i < pf->ptp_caps.n_pins; i++) {
  1373			snprintf(pf->ptp_caps.pin_config[i].name,
  1374				 sizeof(pf->ptp_caps.pin_config[i].name),
> 1375				 "%s", sdp_desc[i].name);
  1376			pf->ptp_caps.pin_config[i].index = sdp_desc[i].index;
  1377			pf->ptp_caps.pin_config[i].func = PTP_PF_NONE;
  1378			pf->ptp_caps.pin_config[i].chan = sdp_desc[i].chan;
  1379		}
  1380	
  1381		pf->ptp_caps.verify = i40e_ptp_verify;
  1382		pf->ptp_caps.enable = i40e_ptp_feature_enable;
  1383	
  1384		pf->ptp_caps.pps = 1;
  1385	
  1386		return 0;
  1387	}
  1388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
