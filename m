Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA918BBAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363587; cv=none; b=swjV7KNvfSdk/mo3DiaYlaiO3fUJBQTdbZ6uDCpX9tvhC1VzfiWgOrKUCPeMWf2BQe8TWnnm3E/Xtc6fexXX1shOvwsjmeuXPOp2miki5r4/T+uSNCtlaVDtRnt3sH6Lw50K8NfNRxXmqgdYlUpjybC/Hqr2FuLrnTD97iXng9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363587; c=relaxed/simple;
	bh=BONCuIj0OZbfq4deEgFIDHlrOYG5hhBlZlc7cAnuUl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAdK8mgYtG5NLtoN3qVBykGGPs69k+q245rg9BRm8Og7kj8Fut6ZFZWmnnZDhJ7cf0MPhKd9JsSCxrYlk6FHti6rDFKTLAwCHyERG14OAevCtwvhSwui5oU7t1QaVjlro8GyswJesgOMxWx+Z7dQkwoX8yLHpGzq1HfFMV1La8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OX1c4/hr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OX1c4/hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737363586; x=1768899586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BONCuIj0OZbfq4deEgFIDHlrOYG5hhBlZlc7cAnuUl8=;
  b=OX1c4/hr4l7jo4pEgPQ+SaWXwMUFyDEE7AHWH/y8x58R+3aNDDnVM2H9
   /UxPtTdUwIqHwaxV14rZDf5kgFzT5Yrx5FeR5BQDuVIfTEf+TaaiPQx+9
   K3JMg3Cuk0CSw2jQAVuqa3b2s4Gm1E++WVu8nFfs17zqmEHg6bHY5/ERG
   woQgf/9xHUThl7wMyINFFoe4HqumevRL4vx4yqlgA+pbrZDK3n9o6qn2H
   9YO/V1j6l6QhUQxXhNJ1U85j8yBx7H6ykFFYvFbQZET30b5J2lxZ4F/RR
   tBV+LYcLmRooiem0ls2S7qr1uRk3+nl8DLu06fHGNa6f5sl40Z2PmndCV
   w==;
X-CSE-ConnectionGUID: iWUwQgwQSba755+6/vyKTQ==
X-CSE-MsgGUID: W6Z98FyaTZenE+QqfdgBiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="63102142"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="63102142"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 00:59:42 -0800
X-CSE-ConnectionGUID: KD7XsNyYTsGpOBqJHAOSWA==
X-CSE-MsgGUID: f4s9Po0KSMuN1MAmP/uV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111420513"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 00:59:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZndD-000WNp-21;
	Mon, 20 Jan 2025 08:59:39 +0000
Date: Mon, 20 Jan 2025 16:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333] drivers/rtc/rtc-mt6685.c:22:6:
 warning: no previous prototype for 'power_on_mclk'
Message-ID: <202501201649.DA7bAd0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   57406f61d18c1c4fd302b7f258dbf947062f55c9
commit: 2fd541a9d43eceddbb3b4bfd2872a1655f335e09 [333/333] CHROMIUM: rtc: mediatek: Add mt6685 RTC driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250120/202501201649.DA7bAd0g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201649.DA7bAd0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201649.DA7bAd0g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-mt6685.c:22:6: warning: no previous prototype for 'power_on_mclk' [-Wmissing-prototypes]
      22 | void power_on_mclk(struct mt6685_rtc *rtc)
         |      ^~~~~~~~~~~~~
   In file included from drivers/rtc/rtc-mt6685.c:15:
>> include/linux/mfd/mt6685/rtc.h:276:13: warning: 'rtc_time_mask' defined but not used [-Wunused-variable]
     276 | static char rtc_time_mask[MASK_COUNT] = {
         |             ^~~~~~~~~~~~~
>> include/linux/mfd/mt6685/rtc.h:254:20: warning: 'rtc_time_reg_name' defined but not used [-Wunused-variable]
     254 | static const char *rtc_time_reg_name[RTC_OFFSET_COUNT] = {
         |                    ^~~~~~~~~~~~~~~~~


vim +/power_on_mclk +22 drivers/rtc/rtc-mt6685.c

    21	
  > 22	void power_on_mclk(struct mt6685_rtc *rtc)
    23	{
    24		guard(mutex)(&rtc->clk_lock);
    25		/* Power on RTC MCLK and 32k clk before write RTC register */
    26		regmap_write(rtc->regmap, RG_RTC_32K_CK_PDN_CLR, RG_RTC_32K_CK_PDN_MASK);
    27		regmap_write(rtc->regmap, RG_RTC_MCLK_PDN_CLR, RG_RTC_MCLK_PDN_MASK);
    28	
    29		rtc->clk_cnt++;
    30	
    31		mdelay(1);
    32	}
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
