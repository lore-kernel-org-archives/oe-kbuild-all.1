Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAAF19D07E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775388796; cv=none; b=awiljWSe2qzVPyui0lKppMQMp0swPjeeGNu7GZdJw9K59E8U1b54kn1emzAUzR+EAcFiZSQL2+up2M2bzozmji+P1hXnCrlvC3r3uoM8KUmdmqth33W0h4b8n8rjSMufc4uF3xlRxoOkSRDvhO//mN2iFql82rHIv4IlY07SSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775388796; c=relaxed/simple;
	bh=/R3qxzeMXpyD4RTwvc+cC5xS2OS6iPw9360rHfkSAdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYenbN+qi2feY7/5eNk8PqblUtzFXygrnlZrZ5UYA1n3tybuKIy81QXyg6/DeyoJpzAWAgb+3ciCv2CJtrlCs9KaeixM8ycCv11FdGCO6dTWImbfxOqqo05iiQy8BO2e4aYKym7HfSsXWSILLn4sdcWqjaeFCox2IeT6SwUXGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUbgjDKP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUbgjDKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775388795; x=1806924795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/R3qxzeMXpyD4RTwvc+cC5xS2OS6iPw9360rHfkSAdQ=;
  b=ZUbgjDKPvH8IoBT3CkcQRQPn/U7KAu1ywqXKzbXt93rJhnzpNdP0IERO
   Ly0rju3Ts79h2z3Xu+yIkWGkTTQ6knGG4OQ39r9JF51jsBibWT+ZCLTIn
   f+ttXIJEd+nhtX589Nhtm9g/vlSggK49z+vOuM3WT3jo+n/of4VpE6Hhi
   5pdgTyPWGV2ZKZyiZP6oU7zYdE8M1dU1Nzx6K4GJ0oLddZqW/ZG62MzrE
   z1bPsfK1mgNYk+GwLJLXc3jBnRc5SGd/l81hiPVcmYzMciPmk319HMeOD
   ZMzZnLTQYDPPqweLOW4VYNvyiapkeE3+dJGyTIrblpKmL9HCd/9/iWQMI
   g==;
X-CSE-ConnectionGUID: RnabxYcBSvuVphU3s5cbcg==
X-CSE-MsgGUID: hTLV6WYARj6EyufMhz5kBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76565395"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="76565395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 04:33:14 -0700
X-CSE-ConnectionGUID: x7IkFCwUQVGpkV2o2f7r3A==
X-CSE-MsgGUID: NlMhtsT/QD6p1Kzv6QwtOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="222843456"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Apr 2026 04:33:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9Lj1-000000009qf-1WTz;
	Sun, 05 Apr 2026 11:33:07 +0000
Date: Sun, 5 Apr 2026 13:32:50 +0200
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 2/2] Documentation: drm: Remove drm_atomic_state
 rename entry
Message-ID: <202604051325.jSSmpYZj-lkp@intel.com>
References: <20260402-drm-drm-atomic-update-v3-2-b826f51ac511@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-drm-drm-atomic-update-v3-2-b826f51ac511@kernel.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9bdbf7eb25b3121ef19533df4fb70f2c39fc0d6a]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-Rename-struct-drm_atomic_state-to-drm_atomic_commit/20260405-115623
base:   9bdbf7eb25b3121ef19533df4fb70f2c39fc0d6a
patch link:    https://lore.kernel.org/r/20260402-drm-drm-atomic-update-v3-2-b826f51ac511%40kernel.org
patch subject: [PATCH v3 2/2] Documentation: drm: Remove drm_atomic_state rename entry
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260405/202604051325.jSSmpYZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051325.jSSmpYZj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Examples
   ~~~~~~~~ [docutils]
>> Documentation/gpu/komeda-kms.rst:420: WARNING: Title underline too short.


vim +420 Documentation/gpu/komeda-kms.rst

557c37360eca86 james qian wang (Arm Technology China  2019-01-03  408) 
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  409)     struct komeda_component {
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  410)         struct drm_private_obj obj;
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  411)         ...
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  412)     }
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  413) 
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  414)     struct komeda_pipeline {
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  415)         struct drm_private_obj obj;
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  416)         ...
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  417)     }
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  418) 
77e56dfef2e28b Maxime Ripard                          2026-04-02  419  Tracking component_state/pipeline_state by drm_atomic_commit
557c37360eca86 james qian wang (Arm Technology China  2019-01-03 @420) -----------------------------------------------------------
557c37360eca86 james qian wang (Arm Technology China  2019-01-03  421) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
