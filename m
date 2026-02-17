Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0958F48
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771318054; cv=none; b=H5hCZXwhnknFUzVZhqQhfNA+3S1b2TNfu5aIBayLVYarmJK+Hgh4fpeq4BM1vBmaDGNo5CC1c3DjQsOyXC/eSQS3ZCexftyhrXOyDzbQ3YwRM5LCpqEGknivClXiNHp+Q5l1WBGwpK0c33M9KeaLi0AW2iyG88696SCVB2eCeqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771318054; c=relaxed/simple;
	bh=6r+UY8it6sSkyBM8s7UXOxX26Vnjj7n0rJoQ4iyzL5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAiLJrk2BCr9yRJcSnNqMJmXslMESzF2YFAjM9zkovjr13FKzcFkrikj+9VZaCOUjGkhADtPiYihk+Ah11j51NFTV6wQYEIw6eIwb2cMYDA+t9et7m2T+AkZcJBSbJFC+PmlQVZTfz6ACWtFU5hpXycNaC1aLEtlvOg0msr7TyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9kzhqDE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9kzhqDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771318053; x=1802854053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6r+UY8it6sSkyBM8s7UXOxX26Vnjj7n0rJoQ4iyzL5E=;
  b=X9kzhqDEdEd8RTzcypQjkQT4ecjaE3iKSdTzzXtZHkHmGtMkG8NbH1mH
   0TcDaP13+GJZ714Dx+2/KLpBc6jlQPvoXZDulVsxzi0SQ9DQbzFjwqdeV
   mD/PviPH+plIIJGCoFMu/mZuSFvaX8cMLWspL5C3uWoSqwo4ES/zTOD8N
   ldu/t7UteqN2dRVYn//UwbUOpXH1FEhykXQ/VEy7DeJJA5j4xjXwDsifS
   TBtjJEo3KUyvjIEE1M93P/WMgAnYih7+8ykrEQ1XZDygS2I1pI0OsMVCo
   ZO8fXLeLyvSGYyMk4S0FKS6i+6CnMhvKLP4io5mC0W2AKfxDQqurNDTNz
   g==;
X-CSE-ConnectionGUID: 0X5SVPEiTSaMF7aqLx4dPQ==
X-CSE-MsgGUID: cOGni/8LRASCTvaEdUYfFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76236991"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="76236991"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:47:32 -0800
X-CSE-ConnectionGUID: Gtu4q1fASISpXNfavsgv9g==
X-CSE-MsgGUID: Xr8k71zqQvK84zCLjfnj0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218355730"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2026 00:47:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsGju-000000010lg-1hSs;
	Tue, 17 Feb 2026 08:47:26 +0000
Date: Tue, 17 Feb 2026 16:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sam Ravnborg <sam@ravnborg.org>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@puri.sm,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	"Oliver F. Brown" <oliver.brown@oss.nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync
 timing
Message-ID: <202602171616.QToUwfFa-lkp@intel.com>
References: <20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm>

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Krzyszkowiak/drm-bridge-nwl-dsi-Correct-MIPI-DSI-horizontal-sync-timing/20260217-015316
base:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
patch link:    https://lore.kernel.org/r/20260216-nwl-sync-timing-v1-1-b0ff6ecf204a%40puri.sm
patch subject: [PATCH] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing
config: arm-randconfig-r112-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171616.QToUwfFa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171616.QToUwfFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171616.QToUwfFa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by nwl-dsi.c
   >>>               drivers/gpu/drm/bridge/nwl-dsi.o:(nwl_dsi_bridge_mode_set) in archive vmlinux.a
   >>> referenced by nwl-dsi.c
   >>>               drivers/gpu/drm/bridge/nwl-dsi.o:(nwl_dsi_bridge_mode_set) in archive vmlinux.a
   >>> referenced by nwl-dsi.c
   >>>               drivers/gpu/drm/bridge/nwl-dsi.o:(nwl_dsi_bridge_mode_set) in archive vmlinux.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
