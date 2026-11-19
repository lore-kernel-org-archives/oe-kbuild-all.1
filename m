Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051793;
	b=YIXKUjJ5bpyO6Fkg7Ad9l7hJS1humY38sWgvAj2d0qN/PEG7IamB0SFA1bcFx/va3gWG
	 V+Fp7QMRPxwRi8jjNv3ecr9u5byTEWE+FaNmlLjMgzPQQQDucPycKJ3JNeLZPRUy7Hm+/
	 rlMighFqLhkUvsThGBMmXKfKppx3La35VgJUXlHYuUazUgp+QKJyUGAiRTMgVs97xEBcQ
	 LI1+9fyEIaji1f7RgrhtpSHDZyboK1/unVKbH4rxHJOTb4mH8zQrlEMmPF6mSTmjqmd2w
	 qgRMFN36WJZ2TkrEmcSy1YzzpnnonWb4SzyQFD5NHyy8xknZ9X0JNc8fB7h3ThClUSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051793;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EbfhgPTFFCgBhkRG6XV04wYw/cnWBHIe0xJRo0gNQyY=;
	b=OQNloxl2p4nunViyR6pz4Bm4GBywsKhvhZLuElrIHWKb0ZVHSzp6N/0eNpdsCADjfroY
	 +lgD8wdhQpmTdM6fUqlzDHNsW1DNpKMrFgwgRBNil0d4txmrXuintwEYYdc2KST4OUP1O
	 JMusf/8MWXxdnSdY1hCZWvoAkQvwue+b7W3zGvC1ePLB2QirqDGUk1pEJr22/hd6zd1uR
	 ua7nKS7QnqkWCMleMRlFSGArX1G58uQj1esJlomZAE++vXrXCsMjRxcu0fWltfjN9Xo33
	 y31LFateNvMktNXyPPMUP7FbT07/2CoGxuyQ/nQoZVK2ESptkVwnVS10+1XdZo4OaYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOcV8ZRP;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60A606A33D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 01:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B60A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOcV8ZRP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051793; x=1826587793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PSfxMbRtp5SghriBVjMcOCJYj/qGbZjDnmBthJkvrbk=;
  b=KOcV8ZRPQfd1EFY5LkC8hvBhhFSFlqr7V/oNhld4qZsviR2c2Vz6m0Sg
   Mx6izkf+Vy3J5oXZoqzZs28A8uG72nXqtVOka7H3may2ulWyQcF0SP0+Q
   UBKD3MJ0IfTXAcNcgm+kqnxSWBeK+jU7Vo/82cs14c1I32aGudCnhFynI
   YaHNbjZAQjun6hT+hKUy8taCQAoGna0iVt8+bsyVuWGCQU0FAE2Fb4zB/
   OkUzBzyYE7P4+zhBNk2nhjpuPeLhBqL+gjXhrEtVWH4/D1xhE1gLBH864
   3cgVXlTajnLohE8sVMZwFkPAC1Nfm2CSd0XKpp1i9t/pPyFO/TPRRn02o
   A==;
X-CSE-ConnectionGUID: LV9mE0KdQH2tY9sP5m/vIw==
X-CSE-MsgGUID: vp4nNzU8TPKhlrvyfWNQyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3775571"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3775571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:29:53 -0800
X-CSE-ConnectionGUID: TUvq6+FoS6eVdr+zGQCL3w==
X-CSE-MsgGUID: B9Y2d/QwS6SSzj7nu/u0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10431112"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2026 17:29:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqy8-00000001EjW-3STl;
	Thu, 19 Nov 2026 01:29:44 +0000
Date: Thu, 19 Nov 2026 09:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mark Yacoub <markyacoub@google.com>,
	Sean Paul <seanpaul@google.com>,
	Manasi Navare <navaremanasi@google.com>,
	Drew Davenport <ddavenport@google.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH 8/8] drm: Move DSC capability reading helper out of i915
Message-ID: <202611190948.JPHU15IB-lkp@intel.com>
References: <20261118-feat_move_i915_helper-v1-8-652177f3107a@bootlin.com>
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
In-Reply-To: <20261118-feat_move_i915_helper-v1-8-652177f3107a@bootlin.com>

Hi Kory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d5a6e2921e68b0cc42812376ca6c8095b6c941a2]

url:    https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent/drm-dp-Move-max-DPRX-link-rate-helper-out-of-i915/20261118-113628
base:   d5a6e2921e68b0cc42812376ca6c8095b6c941a2
patch link:    https://lore.kernel.org/r/20261118-feat_move_i915_helper-v1-8-652177f3107a%40bootlin.com
patch subject: [PATCH 8/8] drm: Move DSC capability reading helper out of i915
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261119/202611190948.JPHU15IB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190948.JPHU15IB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611190948.JPHU15IB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/display/drm_dp_helper.c:5158 expecting prototype for drm_dp_read_dsc_dpcd(). Prototype was for drm_dp_dsc_read_dpcd() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
