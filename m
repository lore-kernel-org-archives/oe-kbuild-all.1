Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24C18638
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335865; cv=none; b=f1kabvwolcL+/ZdWunHxzJgc4/+LBwH/wa8tbyXgSZCTUEmATQ4M+2zdATMnJckICUHzlIZrQaryCUaEgp6LuyQjtdvPmoOP/MGmEbhzS+QkaaDzv2fwwIoEzF3RknDtxidSrllul0GDJoTfk7UdV81PKyY4R3XNGsrQ/QADpd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335865; c=relaxed/simple;
	bh=WfZoA/YcIHYwNSz/fcmUJBghFZBd7vsGUl5yY1bcykI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2dalkZWfOk0QM5X+88fIO2ZssrDvXxNsV63MmvhsxJTlEx+nBDclRFTfydMaq10qpajtfBquZ9Yxyi+pw5d6E81m+E4uPTsXxd2yVVSW1xWdfveH5vdQJQVUO6GM7NA/oq2Q2cGZsMcL6teeBD4fkOTDGjzaTlzne0kcvK2E6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THWV6XQ2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THWV6XQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727335864; x=1758871864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfZoA/YcIHYwNSz/fcmUJBghFZBd7vsGUl5yY1bcykI=;
  b=THWV6XQ2vnb6FT+LdFC2ayZk65E43zrOJ/kwD2DRGKzulrZhEzkxECy9
   xLiAsin5tARWFxgpIC1CvreYIatjnbaOUhtS/bvnEMww/Kv1il26L+Bro
   4rMqo0hU/qg/euJkJydeBkZwOov8t1oXsqarniG15AXADAU0Yy9BuLJGN
   3JPqDoPrNIZ1CnOa/f9RLvkOvZM70E0Wz5FRW//cCjCbPlC2rkTBwojCZ
   LyTortkWpVvCFCmQ+M4xe75OPnp7DuJRvhtMHbqe7poS3+yo068ed91nd
   5ud+0p33NL176XpnOgYs+F7ncwldpmXLJ3sYwTcXxCYj5QXuA3m4Dppvx
   g==;
X-CSE-ConnectionGUID: mMChgeu2TmyhPhHWsWAbIQ==
X-CSE-MsgGUID: VyCxezN1TequL7VQ+l5reg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="29305094"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="29305094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 00:31:03 -0700
X-CSE-ConnectionGUID: Ro584LZQRwKm5GSTpfFt1g==
X-CSE-MsgGUID: mjEiRXIrT5KKItReOB05SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="76546040"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2024 00:31:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stixn-000KOl-1V;
	Thu, 26 Sep 2024 07:30:59 +0000
Date: Thu, 26 Sep 2024 15:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 37/47]
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:32: error: unused variable 'phy'
Message-ID: <202409261521.vHfZemoy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 8705ad3ca11f0f918d05cc9949aea3b6de588beb [37/47] drm/sun4i: sun8i-hdmi-phy: Add support for D1 PHY
config: nios2-randconfig-001-20240926 (https://download.01.org/0day-ci/archive/20240926/202409261521.vHfZemoy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261521.vHfZemoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261521.vHfZemoy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c: In function 'sun20i_d1_hdmi_phy_config':
>> drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:32: error: unused variable 'phy' [-Werror=unused-variable]
     406 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c: In function 'sun20i_d1_hdmi_phy_disable':
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:413:32: error: unused variable 'phy' [-Werror=unused-variable]
     413 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~
   cc1: all warnings being treated as errors


vim +/phy +406 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c

   401	
   402	static int sun20i_d1_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
   403					     const struct drm_display_info *display,
   404					     const struct drm_display_mode *mode)
   405	{
 > 406		struct sun8i_hdmi_phy *phy = data;
   407	
   408		return 0;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
