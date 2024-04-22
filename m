Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7638314F9E6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713794133; cv=none; b=ckJLBLO/eoXkWqRi/Eatq89OsWaZRiNRU/BzEwgJCBDkXxOEKAPnPBlSZXZ/4fu82zG48KuKeWTlsT2WPbzd6k1EXl5QC8pt3wZWMmhRGoqLoQd4ilDjzxSfMY1mwRV8R7dRBcsMC4dqaLwfaQ7rKjMFILfcT4K8YbBPQ2z6heo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713794133; c=relaxed/simple;
	bh=ZHi78+wfNUu5l3xe0CQLMD8MOwAYfkboGopi6wE0/2M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mf9b8AV+tmQSTnxMndV74MQYiyP8FIVaMn83TtGO/Y3sQJZYiNbBuPVsDQTBw6mIDozO5wJzaNp6A0imvOGmP5uiDLG5HhHfgTEYwcMjKGQia8kwqthfT/J+hWfHqYHZibz5IIFM5lONpWoHtFtN7jcpiU9AuqwbOkhlbBMzn6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8M560Sm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8M560Sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713794131; x=1745330131;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZHi78+wfNUu5l3xe0CQLMD8MOwAYfkboGopi6wE0/2M=;
  b=T8M560SmoXKJz5ZvaVHgISDvbLHg4SU7D1IN1ROI5y/vy+7N97t6O9im
   d9z/D3IjEuHRqM86HCXP6j82In8yMNCSsKyPwpbu1RFIs29RFU4DJ3XIN
   Mk+qMI2CFxpet7uzYOvHDOH8/F35Qwiga07Ajp7Wy6MuSYBJp+tW3v6JS
   vWn+RcJlJNEDUNSprOsCIKaEvVDuCOtwmrjqqdg/7+WhgikLFz0EQHJZy
   YroKUwoFYYdK4gwRfKKXxT8wnRv0YTUagu9FSz+XJUSiGVXJ04DrObMGG
   WVApjlb1YUx/GnzhBrFWc0EsPM1yaEbcAObwOXzJ3o2YJKqQZufCQnrSb
   w==;
X-CSE-ConnectionGUID: 1CJV0GzQQuinlUJPxI8fPg==
X-CSE-MsgGUID: T+ISxZQkTXqdK7OHRbIt9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34730655"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="34730655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 06:55:30 -0700
X-CSE-ConnectionGUID: yNm6iYO2TiySasWD7s60Sg==
X-CSE-MsgGUID: t5+E3HzuSX6uOr8GAPr/Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="28481302"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2024 06:55:30 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryu8m-00001M-0X
	for oe-kbuild-all@lists.linux.dev;
	Mon, 22 Apr 2024 13:55:28 +0000
Date: Mon, 22 Apr 2024 21:54:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1059/6555]
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c:880:12: sparse: sparse: symbol
 'rcar_du_crtc_get_crc_sources' was not declared. Should it be static?
Message-ID: <202404222159.5i8BaB8P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: c920b83dfd0cdd3ec642dc7699b9b67ccdc1567e [1059/6555] UPSTREAM: drm/rcar-du/crc: Implement get_crc_sources callback
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240422/202404222159.5i8BaB8P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240422/202404222159.5i8BaB8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404222159.5i8BaB8P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/rcar-du/rcar_du_crtc.c:880:12: sparse: sparse: symbol 'rcar_du_crtc_get_crc_sources' was not declared. Should it be static?
   drivers/gpu/drm/rcar-du/rcar_du_crtc.c:880:20: warning: no previous prototype for 'rcar_du_crtc_get_crc_sources' [-Wmissing-prototypes]
     880 | const char *const *rcar_du_crtc_get_crc_sources(struct drm_crtc *crtc,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/rcar_du_crtc_get_crc_sources +880 drivers/gpu/drm/rcar-du/rcar_du_crtc.c

   879	
 > 880	const char *const *rcar_du_crtc_get_crc_sources(struct drm_crtc *crtc,
   881							size_t *count)
   882	{
   883		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
   884	
   885		*count = rcrtc->sources_count;
   886		return rcrtc->sources;
   887	}
   888	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
