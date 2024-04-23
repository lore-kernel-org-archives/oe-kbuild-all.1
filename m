Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E2C5B1E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904127; cv=none; b=pRNHLhEq2GipD2gOEZhQFVlfjwkFnoCnU3wTyNCvREJ7LLtQqJHL1eLTgvOXIWnAdeOScw3SPlyu2kR2TqGtE/3fgLT5Xa9edhHjfCHB2ZNNnJJ7sLpr0Jdac5/G/hwL9FNe+5Q5p7ErzKcHyZ0Hq4UgfvIQr6Ox5hbGPhE/xro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904127; c=relaxed/simple;
	bh=bLYB6xmVl4qPUU3FjknyJE29osE7I510dba/nH7V7Xc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HP/uu+V/TR6ascnHDudL26uFjkJwGlPBzkELKGuf6+4imH5c451bIRTiyChTwLmb6iHJankRrFi+lw4ClJjM9eNi45GelXXgT4wjnGpE/YFxzXJnMszTMmFOVdvUfYxT4LC1QOG4/SKMWIZaD72q5Ot34W9kulFn4WGq4wvyIb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlXolny9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlXolny9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713904126; x=1745440126;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bLYB6xmVl4qPUU3FjknyJE29osE7I510dba/nH7V7Xc=;
  b=FlXolny9OM5+V5rKNT7DYosmSl7Pmi1ciqnwqY/mU6HbZ8Qm/7vYniKM
   Vbct93v9SbEh7TODVED0JA3X0nK4sWPyZHw4ThqLu/I1/TWuUhGgH0t9o
   5YwBDzm9axDj7FODqqibwmn+2Yn6uiwKmD8VNaFNu5a7XGGWktgy3Pv2j
   qgejc4B6Mhwn5fLf1X8hJuNDXHm1gQcAh/AhfnPFSABkOSOR6mvRsS+lD
   uVFa02nf/3B0dDOet0N+OznReL8FpYPyWP/4oHxhB8iHeasJDHccmJ657
   9lRfjuZzDXc9BTIjncvA4V0t9CAQHQz3UXUg8yvDX6O4sDIxjlDTUf0iV
   g==;
X-CSE-ConnectionGUID: dJPeNSVBQmmzJS0XX1ekpQ==
X-CSE-MsgGUID: zWxPnDh+TUmfpmRfrkq8Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="32002079"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="32002079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 13:28:45 -0700
X-CSE-ConnectionGUID: EF9EJpQERyquTFiOOMi0iA==
X-CSE-MsgGUID: WDk3F1qdRIyEtTAXq6ohow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28929558"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Apr 2024 13:28:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzMkr-0000VW-1r
	for oe-kbuild-all@lists.linux.dev;
	Tue, 23 Apr 2024 20:28:41 +0000
Date: Wed, 24 Apr 2024 04:27:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1059/6555]
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c:880:12: sparse: sparse: symbol
 'rcar_du_crtc_get_crc_sources' was not declared. Should it be static?
Message-ID: <202404240446.M0DwVrTQ-lkp@intel.com>
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
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240424/202404240446.M0DwVrTQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404240446.M0DwVrTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240446.M0DwVrTQ-lkp@intel.com/

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
