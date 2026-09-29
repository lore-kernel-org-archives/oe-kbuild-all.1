Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C873530E04
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706019; cv=none; b=k74fE4/7G1TBSelRPUvzX+cHu8hGtgQA9RMfbbVH51Xm+bYwgWLJeodfeJgr1hPoOEB7/uYCfJyDbxRVyoh5D2EYsiOkHRSISFCu07FIoeW/7jHHKVWRjQjLIbwNdAoyyVH0YCMFEzaCctRkEdNWHvVFq0cNq/aGCS2yrlkfncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706019; c=relaxed/simple;
	bh=wZLO5KXRsu8G21MiWe2Icx6Fu5zsWekzyV77mfXokWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XVAEZBpi8JdGV8w50lbecEb8ibR0TCQaZ9Xos4p7uv6kabqvw2XuJ3K4zNegfo081mOvZuzQgaILnhH57ZpAfHIqTEh7zx0LM3g4G1TXThbpO7vXvVqDnFxRQ2PTZmxFDuGS0T+00p+M3SDIIKdR9GBNIBCggwGOWXWZuuezWOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daBIz6i2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daBIz6i2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790706016; x=1822242016;
  h=date:from:to:cc:subject:message-id;
  bh=wZLO5KXRsu8G21MiWe2Icx6Fu5zsWekzyV77mfXokWk=;
  b=daBIz6i2DSjY1UN3yr1k6TShKIVDtqe8K8E9XKlgrKkIAw1m5BkbJjKB
   KtvctTmJib7Y5iSPQrjhfF7xNjar6m1+IvPJrQHoThPyQo4ODyUfLrtYt
   UreKQappweP25yiPf3Y7xeVyc0p6biBGwXcrwxZ4ipR7BjBAGqFRXdoo/
   Xz6B8l4o0IzabZ2KYC34ZSTA+Wpts+a8jWZR9x1oK1FeHXhfXhe+ajR4q
   862yZPo74T2iqpAbi0z+TPp63Czl7ukoShmJRDwkaxsFI5tJh0fr+wXzs
   YDsyvoOKeQMz/MOA4JJC8rgKoe8TKy3TcIJfs7EfHE8yo0t8pPY55jQke
   Q==;
X-CSE-ConnectionGUID: zdgl14mqRoOY/yI7/1uiOA==
X-CSE-MsgGUID: stoY3X54QBWsHmvw95aNfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91294167"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91294167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:20:14 -0700
X-CSE-ConnectionGUID: jMKjyYA4SHy196M7Mx2RdQ==
X-CSE-MsgGUID: h5c2Y4BDTWy0HiXzNQhHgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279256957"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 11:20:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBcQz-000000001VN-3Qp5;
	Tue, 29 Sep 2026 18:20:09 +0000
Date: Tue, 29 Sep 2026 20:19:37 +0200
From: kernel test robot <lkp@intel.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/wireless/realtek/rtw88/rtw8723b.c:887:14: error:
 implicit declaration of function 'rtw_is_8723bs'
Message-ID: <202609292014.G35KdjRb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Luka,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Luka-Gejak/wifi-rtw88-8723b-add-the-RTL8723B-register-definitions/20260923-233552
head:   da9184c2d6b833c71a23457725f59bc53d1e701c
commit: 14821f5031bac6af26d9c7e87a1398dbc32b8be4 wifi: rtw88: 8723bs: enable building the RTL8723BS driver
date:   6 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260929/202609292014.G35KdjRb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609292014.G35KdjRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609292014.G35KdjRb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtw88/rtw8723b.c: In function 'rtw8723b_sdio_restore_pad_ctrl':
>> drivers/net/wireless/realtek/rtw88/rtw8723b.c:887:14: error: implicit declaration of function 'rtw_is_8723bs' [-Wimplicit-function-declaration]
     887 |         if (!rtw_is_8723bs(rtwdev))
         |              ^~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/rtw8723b.c: At top level:
>> drivers/net/wireless/realtek/rtw88/rtw8723b.c:2733:15: error: 'RTW_CHIP_TYPE_8723B' undeclared here (not in a function); did you mean 'RTW_CHIP_TYPE_8703B'?
    2733 |         .id = RTW_CHIP_TYPE_8723B,
         |               ^~~~~~~~~~~~~~~~~~~
         |               RTW_CHIP_TYPE_8703B


vim +/rtw_is_8723bs +887 drivers/net/wireless/realtek/rtw88/rtw8723b.c

515ac37e9b3b7d5 Luka Gejak 2026-09-23  880  
515ac37e9b3b7d5 Luka Gejak 2026-09-23  881  static void rtw8723b_sdio_restore_pad_ctrl(struct rtw_dev *rtwdev,
515ac37e9b3b7d5 Luka Gejak 2026-09-23  882  					   bool keep_pta_owner)
515ac37e9b3b7d5 Luka Gejak 2026-09-23  883  {
515ac37e9b3b7d5 Luka Gejak 2026-09-23  884  	u32 before;
515ac37e9b3b7d5 Luka Gejak 2026-09-23  885  	u32 after;
515ac37e9b3b7d5 Luka Gejak 2026-09-23  886  
515ac37e9b3b7d5 Luka Gejak 2026-09-23 @887  	if (!rtw_is_8723bs(rtwdev))
515ac37e9b3b7d5 Luka Gejak 2026-09-23  888  		return;
515ac37e9b3b7d5 Luka Gejak 2026-09-23  889  
515ac37e9b3b7d5 Luka Gejak 2026-09-23  890  	before = rtw_read32(rtwdev, REG_PAD_CTRL1);
515ac37e9b3b7d5 Luka Gejak 2026-09-23  891  	after = before & ~(BIT_LNAON_WLBT_SEL | BIT_SW_DPDT_SEL_DATA);
515ac37e9b3b7d5 Luka Gejak 2026-09-23  892  	if (keep_pta_owner)
515ac37e9b3b7d5 Luka Gejak 2026-09-23  893  		after |= BIT_PAPE_WLBT_SEL;
515ac37e9b3b7d5 Luka Gejak 2026-09-23  894  	else
515ac37e9b3b7d5 Luka Gejak 2026-09-23  895  		after &= ~BIT_PAPE_WLBT_SEL;
515ac37e9b3b7d5 Luka Gejak 2026-09-23  896  	if (after == before)
515ac37e9b3b7d5 Luka Gejak 2026-09-23  897  		return;
515ac37e9b3b7d5 Luka Gejak 2026-09-23  898  
515ac37e9b3b7d5 Luka Gejak 2026-09-23  899  	rtw_write32(rtwdev, REG_PAD_CTRL1, after);
515ac37e9b3b7d5 Luka Gejak 2026-09-23  900  }
515ac37e9b3b7d5 Luka Gejak 2026-09-23  901  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
