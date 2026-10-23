Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747507;
	b=GIda7mNFe6XQpdHo8qktO4zyW0YRjE+NT4POF3VytGdpw72uzsGMxcSWn2aPMIY3EvnP
	 CKOFfla8hpkT5uW3RrxMlOM5x5/t4QDXt4VoZyB6PnJTx8iH2lJNmVUa3B3gTTyog9MnK
	 N/Sz+BX8elAJnmTuPN4j0q7b4zSoTSBCxBNF6mPkOJTnFZ3GMuPAl9EII5dYrzH4Qj5hS
	 kn7NLsKqB46po6hHRMHep8ikcwdp6M3MdfptQCrBA12mq0ySpSz56vqYBzHbDDcgzOl57
	 MMmldIVejKK3f7X4NHimSZm8FDgbpJAxgVTzTwBUqHGn7wNwa3NUw5WENlkmK7WR//g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XFLNKc5fFc4SfenpIJiEgB32jbSumrs6u2Va6rnaxTE=;
	b=YTyQz12tejJkTf15JQCr1r63H2ZlTo70voZeBJnHKZOm8Viwz4poybldXyOYZNlMYZyI
	 1SExX9C9J9ZpqteUUYEnXaPYt29oSemk4fd2jjuvlkK+bC3m/iGoAfnnol8yN6Rj6tjur
	 2GUmfYznpTZzBB/th/ywMBcKXBquyabA5DKY8vmaphBBIrjp7Bl3AKkmoOrWcUhYtB9yO
	 MzDNJ/b+ZMk7vCuz1CSx7VAG6cayIUYRgx8ImYQVEJzQhtxcYWz42aT2wEySRDnmTW20H
	 Jme+wJb5FIk5EY4hNU4dBAbwyyHlGNB6s2z9iezNZ7N5jC+2JYVXyn4b8bbMgaDJ92g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z182YNy+;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A2F606A325
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 09:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A2F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z182YNy+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792747506; x=1824283506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JoygkqHw7xzmTZl/jvkkO7IWEjX281PTl99LYMTUAHA=;
  b=Z182YNy+CrJaTsJk5RC4/oTUIsXl7qOK4sxk77ibXyAjm2VYj1zca/Vr
   +h9qw1/wLsGp7Qi3GH1nZpn0viGpiPxhDYE7e3K/VFeoDF+AJjevZYRa7
   Htw6rhFleRblWJ4fyrp5pealPxKxi0I/z8wWoCa5AWai+KcN6LHzcCXt7
   hAsT2HtxoHD5yh15hvF8mRByv8SjfkrH/oBcjj4cxoJ/ysvzYM5IIFPjd
   GV+/v8J88LyyZ4kXWYqGSnIfIXCeeS+VMwszqzQeg+Wy2OuKPpSPgyreX
   gCxCHtQUc5Sc1PhNW6hQMtwXUSJPzcEAXZSah9wGd+TA6EiR4wCOtIV+0
   g==;
X-CSE-ConnectionGUID: Odkn43UKS1ODQjko/1zPwg==
X-CSE-MsgGUID: 4yBmJP4hS4iexqZgNiBdrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1400986"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1400986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:25:05 -0700
X-CSE-ConnectionGUID: ihRWZ605RjqtJQr5nkBHAw==
X-CSE-MsgGUID: JxtKHfczSYmGFiQWEMqKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3707992"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2026 02:24:59 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKBWA-00000000STO-3Flk;
	Fri, 23 Oct 2026 09:24:54 +0000
Date: Fri, 23 Oct 2026 17:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Francesco Dolcini <francesco@dolcini.it>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
Message-ID: <202610231730.zagAxTfc-lkp@intel.com>
References: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 725953d4da85cfb97a4c309fad6346b72f8529e7]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-connector-report-out-of-band-IRQ_HPD-events/20261022-162756
base:   725953d4da85cfb97a4c309fad6346b72f8529e7
patch link:    https://lore.kernel.org/r/20261022-hpd-irq-events-v6-7-337ea3ddaa62%40oss.qualcomm.com
patch subject: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported by USB-C
config: i386-buildonly-randconfig-1003-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231730.zagAxTfc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231730.zagAxTfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231730.zagAxTfc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_display.c: In function 'msm_dp_bridge_hpd_notify':
>> drivers/gpu/drm/msm/dp/dp_display.c:1581:1: error: expected declaration or statement at end of input
    1581 | }
         | ^


vim +1581 drivers/gpu/drm/msm/dp/dp_display.c

542b37efc20e64 Bjorn Andersson  2022-12-07  1544  
fb7d509b1710d1 Dmitry Baryshkov 2024-10-29  1545  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
8a717c16ddf261 Dmitry Baryshkov 2025-08-03  1546  			      struct drm_connector *connector,
5be7f4197260fc Dmitry Baryshkov 2026-10-22  1547  			      enum drm_connector_status status,
5be7f4197260fc Dmitry Baryshkov 2026-10-22  1548  			      enum drm_connector_dp_event event)
542b37efc20e64 Bjorn Andersson  2022-12-07  1549  {
fb7d509b1710d1 Dmitry Baryshkov 2024-10-29  1550  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
fb7d509b1710d1 Dmitry Baryshkov 2024-10-29  1551  	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
fb7d509b1710d1 Dmitry Baryshkov 2024-10-29  1552  	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
5043357e75ba7c Jessica Zhang    2026-05-24  1553  	u32 hpd_link_status = 0;
542b37efc20e64 Bjorn Andersson  2022-12-07  1554  
5043357e75ba7c Jessica Zhang    2026-05-24  1555  	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
5043357e75ba7c Jessica Zhang    2026-05-24  1556  		DRM_ERROR("failed to pm_runtime_resume\n");
542b37efc20e64 Bjorn Andersson  2022-12-07  1557  		return;
5043357e75ba7c Jessica Zhang    2026-05-24  1558  	}
542b37efc20e64 Bjorn Andersson  2022-12-07  1559  
5043357e75ba7c Jessica Zhang    2026-05-24  1560  	hpd_link_status = msm_dp_aux_is_link_connected(dp->aux);
542b37efc20e64 Bjorn Andersson  2022-12-07  1561  
3ea2d1c3d15476 Dmitry Baryshkov 2026-05-24  1562  	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
3ea2d1c3d15476 Dmitry Baryshkov 2026-05-24  1563  		   msm_dp_display->connector_type, hpd_link_status, status);
5043357e75ba7c Jessica Zhang    2026-05-24  1564  
5043357e75ba7c Jessica Zhang    2026-05-24  1565  	if (status == connector_status_connected) {
5043357e75ba7c Jessica Zhang    2026-05-24  1566  		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
5043357e75ba7c Jessica Zhang    2026-05-24  1567  			msm_dp_hpd_unplug_handle(dp);
5043357e75ba7c Jessica Zhang    2026-05-24  1568  			msm_dp_hpd_plug_handle(dp);
5043357e75ba7c Jessica Zhang    2026-05-24  1569  		} else {
5043357e75ba7c Jessica Zhang    2026-05-24  1570  			msm_dp_hpd_plug_handle(dp);
5043357e75ba7c Jessica Zhang    2026-05-24  1571  		}
b24625456ddceb Dmitry Baryshkov 2026-10-22  1572  
b24625456ddceb Dmitry Baryshkov 2026-10-22  1573  		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
b24625456ddceb Dmitry Baryshkov 2026-10-22  1574  		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
b24625456ddceb Dmitry Baryshkov 2026-10-22  1575  			msm_dp_irq_hpd_handle(dp);
5043357e75ba7c Jessica Zhang    2026-05-24  1576  	} else {
5043357e75ba7c Jessica Zhang    2026-05-24  1577  		msm_dp_hpd_unplug_handle(dp);
5043357e75ba7c Jessica Zhang    2026-05-24  1578  	}
5043357e75ba7c Jessica Zhang    2026-05-24  1579  
5043357e75ba7c Jessica Zhang    2026-05-24  1580  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
542b37efc20e64 Bjorn Andersson  2022-12-07 @1581  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
