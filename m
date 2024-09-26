Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9101D5AD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345169; cv=none; b=KuTTcp9ltV53YtzOHSKkhwZev3n2PK8uXlb8rs/kmd8hpo9ceACw/r3r1ljM/5DOQNlELOBhccEKuSDzjamC1Q+Mdc726ne6LX7Et6eWzi16DbM6zOHOkHVTmqOksVLvhS68IAK1XJsnHJyC8HWVuIGYYJs8WT0vLafg4AwIxK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345169; c=relaxed/simple;
	bh=V7XPtHRX1kzD0ndQLTwZcPlEOREjw8Mo4jsmb6mJYkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQolhQ+pg70U6PokAJtHKtuHEGtUExieBbq3kDQ4YLaKSC9cuJXNTpzQuZ7BVoYl1/A180de1z7I4fXu0H+RuronQHAtC2eOWUwy6k8aHPoRobl45vRwbLNNiReBIJ1u4CPeZdGFTrThUBNCEQtQh5LBxbgvep6v0fhd1hwxrgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1nTrmlC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1nTrmlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727345168; x=1758881168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V7XPtHRX1kzD0ndQLTwZcPlEOREjw8Mo4jsmb6mJYkE=;
  b=b1nTrmlCYPPKLneFcXfIYk6xALhJSwt+CWZVR3YquaridymSCUfDWhb9
   3JkUL4Uaar+VB3mxeeUzMKw0Qmr/AnFXNVpFP1kujjgWd+d0dZumDdE85
   O59AqN/HPjX4hQFfa9hJnQ7X8VJpYXpeVKkmjjfgrp6kN6Kl9pEnWsYOt
   lQK6ntALc3ZyeGMuk10JXBhn45sSNMVLTC8c/M8OS0CLmUTlLPztonmvh
   Y9Lk2Ew00YLzBI9sTRBe3VpQdZXULDMEiW5EJUKG3D3hJdPiBGgQxhG8g
   zM1XYb0nTa24TvMGkZg0sFuCt1hmSQvjDJx7uaBgVekBNchHzCaz6cJEs
   g==;
X-CSE-ConnectionGUID: LJJXevt6R06ATZvk1FmRSQ==
X-CSE-MsgGUID: EHR/nZyTRgWOvJMcmiReGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26294199"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="26294199"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:06:07 -0700
X-CSE-ConnectionGUID: hSoFOUDmSraIZFHV4mOsVg==
X-CSE-MsgGUID: p1pGaLjcSYWjnYbgUuthLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="109566746"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Sep 2024 03:06:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stlNs-000KXb-0X;
	Thu, 26 Sep 2024 10:06:04 +0000
Date: Thu, 26 Sep 2024 18:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 37/47]
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:32: warning: unused variable
 'phy'
Message-ID: <202409261743.bkGMujOB-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240926/202409261743.bkGMujOB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261743.bkGMujOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261743.bkGMujOB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c: In function 'sun20i_d1_hdmi_phy_config':
>> drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:32: warning: unused variable 'phy' [-Wunused-variable]
     406 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c: In function 'sun20i_d1_hdmi_phy_disable':
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:413:32: warning: unused variable 'phy' [-Wunused-variable]
     413 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~


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
