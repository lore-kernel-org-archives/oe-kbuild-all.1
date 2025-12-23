Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8B1F8AC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 01:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766451694; cv=none; b=I488wIF3ZJOB7R2mjKtLW3DDUfaWxhSiPWwNvBsIWfrQm9xO4kFg2vaUHYoLqBmQdgfjvAQdKYHjYCSM2onyk+0uXUjfWzoGb2QrHD3h/l3gz0sp8puSqlUDZx19hka5dsjKabS6/UezaGnP37Qs4Gr/HZwvBclCbLkeJRegv8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766451694; c=relaxed/simple;
	bh=XjIDb9uNLq1iGyrVNKgCjIHdLfX2vLHgSLa+wD2UtSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCcXOW9ACVuGOpbtf0ciFdP0redE4vLUgJf3W4FDs/T859QcFqRRXDhZk9dIgqvlbnbpbkpEMIFWS4FvxyufZkrfAY0RvtQYu030Q3OfWHkyB7n6A6l9wj4qxDEBsaj8vcLIN/qU+SlMedmtub/yATGZKSa9qMigaaJaOlKQJtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATS/pRg2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATS/pRg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766451693; x=1797987693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XjIDb9uNLq1iGyrVNKgCjIHdLfX2vLHgSLa+wD2UtSw=;
  b=ATS/pRg26nIHTeu5y3e4/Mn7sTT469ygUh15S2ukFrC9B7Oemk5RL59I
   XWWrABlK/5jFVZybR2+q5r619KF5/hSQwdWSVBwUEWXTiahNiwc81Efib
   Ua4AAw84DTydi5TaP0wLeSvMsJllsbzbGztL2VLnLY2VG2HkCIVTcT10n
   KngrNqSuTU08jTrj/d15RoeCGZWALbJryWEWozHYKkLcL9FxahUmvas3W
   N3Z8jZcPWyJp0Z4ouB2LyGAGLXV71kjofdHHZD8v50+r9R1FMepa4Ej3t
   J7bLHn1R4M/0hdkl0dy1XeWQSxQDyYK4Q1AnMB/r05cKQohy2a/T3wgot
   Q==;
X-CSE-ConnectionGUID: hwZlf+gkSNqW0AtycGKKCg==
X-CSE-MsgGUID: oNIsDgESRFy7enqRV6lTBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68350720"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68350720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:01:32 -0800
X-CSE-ConnectionGUID: 3NSC3j0xRIOcn/ncFk6Iww==
X-CSE-MsgGUID: kEnM13XhQp2T5kS78DVayw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="230664464"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2025 17:01:28 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqmE-000000005gW-1GX2;
	Tue, 23 Dec 2025 01:01:26 +0000
Date: Tue, 23 Dec 2025 02:00:41 +0100
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, victoria@system76.com,
	sebastian.wick@redhat.com, thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <202512230158.yEDymogC-lkp@intel.com>
References: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e7460eac786c72f48c4e04ce9be692b939428ce]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/Documentation-ABI-vkms-Add-current-VKMS-ABI-documentation/20251222-181426
base:   8e7460eac786c72f48c4e04ce9be692b939428ce
patch link:    https://lore.kernel.org/r/20251222-vkms-all-config-v3-18-ba42dc3fb9ff%40bootlin.com
patch subject: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251223/202512230158.yEDymogC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230158.yEDymogC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230158.yEDymogC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_configfs.c:676 expecting prototype for parse_next_format(). Prototype was for vkms_configfs_parse_next_format() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
