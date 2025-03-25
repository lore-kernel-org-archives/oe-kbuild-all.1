Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FEB5228
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 04:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742878122; cv=none; b=JPT9V2bYQACJdq1PlSmj/JitOxH771EpcrjMVC3k9ZO7mRvegm5/5FuCwbaP42PXxNxoqYwXno40PTTn0FwgGy5kKUNdPrPpvWcsCp7DBCeNFiFgHobwPmcAymOex9SvxO4dih8pGaQJw7p93Jc90F+KbntJSIf45dHAxI10Jmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742878122; c=relaxed/simple;
	bh=mAjipZaiPs+8a5EU3mzH59Ptu66SQyL6uPKRwFfIbg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKX9CzpCsSPPNJnPm5ByVnHN49Vy/d+pSsQfXmoF+CXKb9WKFn7zYrilAc4uavz/bbQL9Sg2t6gGqQx32fr7FbK4G4u2gNlicCpa+PrH8XMayKT4EAjeo6GlrjeTdNDaO79vxtuwESci8gWrnTMemkBdbbaGlvetar8iwiIIE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwO+8kIY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwO+8kIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742878120; x=1774414120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAjipZaiPs+8a5EU3mzH59Ptu66SQyL6uPKRwFfIbg0=;
  b=SwO+8kIYPwkQq+bJRiTaLf5DpkJDHHX9pRRVkI9YX2gOrOTFrTcxdoYv
   MFEib/nwXDD0Wxnh2HgZRMWreSJ6U4ONLK0vZSPgf69f0WTVetPwc6rSQ
   APyo1WUW9xH61X8l4Uv80zYvdeZ7DwbFvuxOXbF854XIk9DNlS/MDVIqh
   hs4E5VxkSM5IEexgHrfvVNuVqtv52/YVJ6TYvDkOB+ayaTGm9a6AKctUA
   d46Bb64gne51SKGY1OB6aBmSqATUa0nNQmUs+vAVnfsy4bsEODoSTH0PG
   OzzN3OoAi9RVOBM1TAMWa97W8GDjTrV9hzeGMWQIgn6suHrwYzEhZ8rrR
   w==;
X-CSE-ConnectionGUID: vzIU85CqQpCLwhf9/F2fsw==
X-CSE-MsgGUID: 7JCaOOa8Tty83mVwM3rpnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55488346"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="55488346"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 21:48:39 -0700
X-CSE-ConnectionGUID: GsAiT6zkT4WX29M+vOiDJg==
X-CSE-MsgGUID: mQcHSnsDQq23djitK1ZAIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124434401"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2025 21:48:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twwCf-000499-24;
	Tue, 25 Mar 2025 04:48:16 +0000
Date: Tue, 25 Mar 2025 12:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 16/16]
 drivers/gpu/drm/bridge/analogix/anx7625.c:2789:24: warning: variable 'dev'
 set but not used
Message-ID: <202503251239.pjXlbVph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   699322c13fb8c58442ef1b7956a600d27be2a27a
commit: 699322c13fb8c58442ef1b7956a600d27be2a27a [16/16] CHROMIUM: drm/bridge: anx7625: Fix bandwidth mismatch issue
config: x86_64-buildonly-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251239.pjXlbVph-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251239.pjXlbVph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251239.pjXlbVph-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/analogix/anx7625.c: In function 'lt_check_work_func':
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2789:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    2789 |         struct device *dev;
         |                        ^~~


vim +/dev +2789 drivers/gpu/drm/bridge/analogix/anx7625.c

  2784	
  2785	static void lt_check_work_func(struct work_struct *work)
  2786	{
  2787		struct delayed_work *dwork;
  2788		struct anx7625_data *ctx;
> 2789		struct device *dev;
  2790		int ret;
  2791		u8 lanes, rate;
  2792		u32 downstream_max_pixel_clock;
  2793		u8 data[2];
  2794		struct drm_connector *conn;
  2795	
  2796		dwork = to_delayed_work(work);
  2797		ctx = container_of(dwork, struct anx7625_data, lt_check_work);
  2798		dev = ctx->dev;
  2799	
  2800		if (!ctx->connector)
  2801			return;
  2802	
  2803		conn = ctx->connector;
  2804	
  2805		ret = anx7625_reg_block_read(ctx, ctx->i2c.tx_p0_client, 0xa0, 2, data);
  2806		if (ret < 0)
  2807			return;
  2808	
  2809		lanes = data[1] & 0x1F;
  2810		rate = data[0];
  2811		/*
  2812		 * Lane rate equals 0x19 and lane count equals 1
  2813		 * indicate OCM failed to do link training, then just
  2814		 * reset lane count and lane speed to 0.
  2815		 */
  2816		if (lanes == 1 && rate == 0x19) {
  2817			lanes = 0;
  2818			rate = 0;
  2819		}
  2820	
  2821		downstream_max_pixel_clock = anx7625_get_pixel_clock(lanes, rate);
  2822	
  2823		if (downstream_max_pixel_clock > ctx->dt.pixelclock.min)
  2824			return;
  2825	
  2826		/* Grab the locks before changing connector property */
  2827		mutex_lock(&conn->dev->mode_config.mutex);
  2828		/*
  2829		 * Set connector link status to BAD and send a Uevent to notify
  2830		 * userspace to do a modeset.
  2831		 */
  2832		drm_connector_set_link_status_property(conn, DRM_MODE_LINK_STATUS_BAD);
  2833		mutex_unlock(&conn->dev->mode_config.mutex);
  2834		/* Send Hotplug uevent so userspace can reprobe */
  2835		drm_kms_helper_hotplug_event(ctx->bridge.dev);
  2836	}
  2837	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
