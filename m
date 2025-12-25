Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4B92D879E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 06:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766644013; cv=none; b=DSQyE75WHsQs+hWWVB4uE2HIRZ7njpERP7Ytr5gTZwwJcoVsH8Y+YL6kW7Noocfek16blIlxaAfNFDxZjEaF9xg4s9xQBRg83oQNdp0VOWDvA6ge2OjaRYBKYKWNHfJSSOKAiy/JwmCRrfbcfV1dsxPhVWGRHdXcz8SMfpi8Lwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766644013; c=relaxed/simple;
	bh=G7DWSOB9fPpBxa7DXoXilHYnQeeepH0vpFzNouz+8bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUg903sOBY1+l+jpJxhFLw6YyQKErh1Lr4ydISfdFx5uAzGYqkOXvLukqCPJkPJ6t3NlMhIks0PhOKn5AyJqzGDxhcqbXL/ZY1keCGnXwDF+vthfsP40UAbZx308czxCh/h3io7dUnic01NfGLcN5tYsMkN8u0HTDI2Xng5DEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNIq/pzG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNIq/pzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766644011; x=1798180011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7DWSOB9fPpBxa7DXoXilHYnQeeepH0vpFzNouz+8bg=;
  b=kNIq/pzG+Cnu6j6ByJ+CTB030RenGF/3K94Qco7FmX8i8RE3xUa4WXTb
   hSH+MWw5eNLmac+rHgYa82eEaDpfhN9GIiWNHbwj6JhxCZQd6gnW+jQoP
   8wvXpzmHwpTXKvPVqvUbpU0kau8/xIVo6Q6CU+nRGDnCT0+kXU0gZmWcQ
   y0xx9sx5Q35E7Axh2ij1s9Wb03nJHoKR1mZtLlYHkst5YkVBJdDtcCvCS
   Xtw+Z2zm1u2D2wKyKBY4v7RFnE46Xo3Cmnck4+832bmErAs2/yk3JznGI
   mzTF5MG+TxNlJtn17AOIqJtFObDegb6TfDblPK6U46feC5I1ICFF9MkfY
   w==;
X-CSE-ConnectionGUID: C2BUqIpzS0qBPdLvt93a0A==
X-CSE-MsgGUID: vNnXYxE0Qq6+9e4bf5asGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79089597"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="79089597"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:26:50 -0800
X-CSE-ConnectionGUID: Ad0S3tiVS+qUh3q9N8kLWg==
X-CSE-MsgGUID: Msg01NgwSkKvsVX+MGudxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199809963"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Dec 2025 22:26:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYeo7-000000003pB-2ymU;
	Thu, 25 Dec 2025 06:26:43 +0000
Date: Thu, 25 Dec 2025 14:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 09/21] drm/colorop: Factor out common paths from
 colorops helpers
Message-ID: <202512251442.dLlbaNp3-lkp@intel.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-9-7d969f9a37a0@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-9-7d969f9a37a0@collabora.com>

Hi Ariel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b96bcfba104c65db41378a04f5ccac186f79578f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariel-D-Alessandro/drm-crtc-Add-color-pipeline-to-CRTC-state/20251224-020551
base:   b96bcfba104c65db41378a04f5ccac186f79578f
patch link:    https://lore.kernel.org/r/20251223-mtk-post-blend-color-pipeline-v3-9-7d969f9a37a0%40collabora.com
patch subject: [PATCH v3 09/21] drm/colorop: Factor out common paths from colorops helpers
config: openrisc-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251442.dLlbaNp3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251442.dLlbaNp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251442.dLlbaNp3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_colorop.c:227 expecting prototype for drm_plane_colorop_curve_1d_init(). Prototype was for drm_common_colorop_curve_1d_init() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
