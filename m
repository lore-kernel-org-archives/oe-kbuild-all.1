Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CEC7C6DE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709207293; cv=none; b=RduJBvGb/lnEgaV3m4aSVYDNmLvnmhzRarsPTTwGGJyL6vylX2271nOvBVhsP8UZ9wS51qNXnG97l8GOO2eq/dTU90wMS1pAgDX1B0kyAvXaKPxYtjQZyTRraC1rnmePUk8+ve2wdJLjDwfrMHdcfS7QSQ4V77nECw1ZApvhcZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709207293; c=relaxed/simple;
	bh=FMzv0FtmUzxhyUrE/CNu+kff5l2BZLY3vQle/Lfv1Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g56Eaqe5IpJrApmE5Is4Ps4fKhNPo4Ku3d6GpvWrzANJBiHnMQQrHhEOz8uvIr9EFtY3VdJdZ+xFhhirmrpyOXsKDXHeUqvB5OM8KmQ0udsyT0J8hmm0uTZsp6AXxthQWiPCZZk/8zyAAPpG3pEQR6OMg3QpH4NtPxWIRZuRcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqniiIGK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqniiIGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709207291; x=1740743291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FMzv0FtmUzxhyUrE/CNu+kff5l2BZLY3vQle/Lfv1Hw=;
  b=bqniiIGKXsAJ4H3+0qnY4/F69id7jyEpnbbg46hRff6zu5JnecmJhSOn
   7ZzmkWN/iC1YmZNy3PX661FpV19HIRgUzmm7tA7ai8haW/3+cMPyQrrfD
   1X7en8V8wmBxCu2g2A2Vy+9m908UFUfd+NWFBKWMpkONEKymBQBeKRlsf
   G9GuTZUBr/tReKv0Kv2Jw6wVtppYlQNqLliZpBenW66nouZIhYdZ0BMHi
   lpN2ljUTjufVRqVI/EJ+AgFXYO5SXcXOJ6L/XFSnumfxmTl5kYKzM+s9a
   1X69/0xA/i7kzVrJghnA5tpdMUaPh8tnEBpLyMH0zT2jTtXIR4q1FynRn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14307063"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14307063"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 03:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12370575"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Feb 2024 03:48:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfetS-000Cu5-23;
	Thu, 29 Feb 2024 11:48:06 +0000
Date: Thu, 29 Feb 2024 19:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [drm-misc:drm-misc-next 4/5]
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:191:17: error: implicit declaration
 of function 'drm_atomic_get_new_connector_state'; did you mean
 'drm_atomic_helper_connector_reset'?
Message-ID: <202402291942.zVb1Vx4Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   be318d01a90366029e181068e8857c6252e1fadc
commit: 358e76fd613a762bdba18b6b9fb0469a481de3a3 [4/5] drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
config: xtensa-randconfig-002-20240229 (https://download.01.org/0day-ci/archive/20240229/202402291942.zVb1Vx4Y-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291942.zVb1Vx4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291942.zVb1Vx4Y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c: In function 'sun4i_hdmi_connector_atomic_check':
>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:191:17: error: implicit declaration of function 'drm_atomic_get_new_connector_state'; did you mean 'drm_atomic_helper_connector_reset'? [-Werror=implicit-function-declaration]
     191 |                 drm_atomic_get_new_connector_state(state, connector);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 drm_atomic_helper_connector_reset
>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:191:17: warning: initialization of 'struct drm_connector_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +191 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c

   186	
   187	static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
   188						     struct drm_atomic_state *state)
   189	{
   190		struct drm_connector_state *conn_state =
 > 191			drm_atomic_get_new_connector_state(state, connector);
   192		struct drm_crtc *crtc = conn_state->crtc;
   193		struct drm_crtc_state *crtc_state = crtc->state;
   194		struct drm_display_mode *mode = &crtc_state->adjusted_mode;
   195		enum drm_mode_status status;
   196	
   197		status = sun4i_hdmi_connector_clock_valid(connector, mode,
   198							  mode->clock * 1000);
   199		if (status != MODE_OK)
   200			return -EINVAL;
   201	
   202		return 0;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
