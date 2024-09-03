Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD3857CB1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373395; cv=none; b=jPm0c342rgID701Cka5lQoTSp/WqsiWNmyaLu5mkafA1G6lEaXpyEmUwhA2mnCvjqFNx2MJVLtjDuWwwucA93HiZx/BnGQg18MAXVzyVpKya31B2V7u1+bt+BjO/f+aAT4xBeA3Zxyszt9mMeI1GtMa5jZLBhkRtUmg3N3d80CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373395; c=relaxed/simple;
	bh=2RaY1NFH1hvjpQRQ4sFNy72s11vd1wRufJ5HghcWLE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNLobfxMJZUwhQBC6tbQPHw1LLucI49+3fYzLiyB/3MCmWXLf4Kgvauvl54mtDEepymKGLocziEEAMDgp3ZY7Zh/caM8RIGmQfvQayYNVVfeRLroF1X7C0niUKM6tgVfcO4+Cs/hTMh8+YZAVeCDDkVg1eHsUWzCdGoMo+WltjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlgUaDfv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlgUaDfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373393; x=1756909393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2RaY1NFH1hvjpQRQ4sFNy72s11vd1wRufJ5HghcWLE0=;
  b=NlgUaDfvFhyt8jrZEHb9i9YNW241TvvwuQQPaGqLpiaD5xcq2Xv0/7Oe
   8NZ7BGLfvcqRpKJPtJDmU87J67Aj0uQFXmFbFqTrMJynEdgYx1NMJ+oK6
   cZOTEaGLH04TJRfHY7zKE1FVgaAMr+g17r2VtUqOc3DCtYlsP9UHKmmMT
   45QKCbk+P9OuQLmEy0BYOtgaGn1S5vfvYcFLMktA26dtCbI8X1Fj9mTbn
   xh7wBcdw5cQ8gxWQh7LZbBdbOjD+SDA/V2wZ//8zXIBBoowTBvIwZG6xf
   zkrx6U2xzb1ObhRODVH2LD1PGEycrF8ggB3qA4JuuzDT0O1yewTihmNLA
   g==;
X-CSE-ConnectionGUID: SZAS4YDVSQCbfsKBlZnKHw==
X-CSE-MsgGUID: Er9ViIytT3yGbP3IYXv2Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27766966"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="27766966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:23:12 -0700
X-CSE-ConnectionGUID: 41on60BpStOseJopz1Xpew==
X-CSE-MsgGUID: fS6ZjtLuSy+G8sjfmYzEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64605341"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2024 07:23:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slUR2-0006ms-1y;
	Tue, 03 Sep 2024 14:23:08 +0000
Date: Tue, 3 Sep 2024 22:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [linux-next:master 8272/8795] ERROR: modpost:
 "drm_dsc_set_rc_buf_thresh" [drivers/gpu/drm/xe/xe.ko] undefined!
Message-ID: <202409032226.x6f4SWQl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: ca097d4d94d808409386fde414370900cc41adad [8272/8795] drm/display: split DSC helpers from DP helpers
config: parisc-randconfig-001-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032226.x6f4SWQl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032226.x6f4SWQl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032226.x6f4SWQl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
>> ERROR: modpost: "drm_dsc_set_rc_buf_thresh" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "drm_dsc_setup_rc_params" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "drm_dsc_dp_rc_buffer_size" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "drm_dsc_dump_config" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "drm_dsc_compute_rc_parameters" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "drm_dsc_dp_pps_header_init" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
