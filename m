Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776EA82D66
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 19:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732737063; cv=none; b=D6KOuWYxJsineRrcx5q4ZSK1ls3SxJoXZE9Bsuse77uiUUOXsQAjX/6+34uU7iP0qUOWRUpKFxzpaYIAf5WLJe228QFGiTyrX3jI4oB8YSfDlz5Zo6ng2QgwM0b33KINwo/aZjuDmCWlzLi21L3aH2Rm1Zm/aPTVZSGgbi+ILws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732737063; c=relaxed/simple;
	bh=vrJO1wkuzgJfCDUQLlADHpSFcf//iN63EqgubUkiMWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgBHuzBYLIJ05w03WihuLHXNRlTLw0PvvEwJVmTQKM2/gged1m3GhCGzgS9X4k5jSRv/mMsIc5t7qcZ8Da94Br7EcMOPFdDZHynQ8LYXkp2k69Is6D6O7xYiq5Az3i5r28PaWnPTZoVRQpRcMJ8VhJbltF0eIwr+8mzvYvstR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5qUWd/B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5qUWd/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732737061; x=1764273061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vrJO1wkuzgJfCDUQLlADHpSFcf//iN63EqgubUkiMWs=;
  b=l5qUWd/BfMVPspRCm/nKt9BF6m/vp3I9mYiQyUUmZiGPWnhn55+xVapL
   uQzEt7oAK/GtqNZKps7L66PTBDX1zUNCpHwHvwoLu4Gl3Db+PPByCCMoN
   VguUYC95lhSXGEQrIedOVddW1cgKdJIhIjbSJ8clFemTN9PuzKEGScp9X
   sYlpjmC5Gfms4GLlKnkbrt5DphadCgsocDfl15G3Hn9deVYsABOUmrooW
   Gk9NzXvR1hOntM+E4S31QKWliY3Tn9yLjc19rKS0TU6CQMw7ru9sV7tMb
   evJG56e078PJ0Fn0HJo5thdCPpEJGLopON00Vm982i7PNo8QI3ks3YbJZ
   w==;
X-CSE-ConnectionGUID: kxNzOlkVTBKYM8UEiYBv1g==
X-CSE-MsgGUID: 6ZgYkjLiSIqjOeExorADbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32702984"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="32702984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 11:51:00 -0800
X-CSE-ConnectionGUID: cAEn0AVZSQK2zP8zuWj0eA==
X-CSE-MsgGUID: GM4gzX/bQ3KnKhk2BY1dZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="122994830"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2024 11:50:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGO3l-0008Jj-1U;
	Wed, 27 Nov 2024 19:50:49 +0000
Date: Thu, 28 Nov 2024 03:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: keith zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, william.qiu@starfivetech.com,
	xingyu.wu@starfivetech.com, kernel@esmil.dk,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
	keith.zhao@starfivetech.com, jack.zhu@starfivetech.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/9] drm/vs: Add Hardware Functions for VS DC8200
Message-ID: <202411280334.CDiErngI-lkp@intel.com>
References: <20241120061848.196754-5-keith.zhao@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-5-keith.zhao@starfivetech.com>

Hi keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12 next-20241127]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/keith-zhao/dt-bindings-display-bindings-for-starfive-JH7110-display-pipeline/20241121-145710
base:   linus/master
patch link:    https://lore.kernel.org/r/20241120061848.196754-5-keith.zhao%40starfivetech.com
patch subject: [PATCH v5 4/9] drm/vs: Add Hardware Functions for VS DC8200
config: xtensa-kismet-CONFIG_CMA-CONFIG_DRM_VERISILICON_DC8200-0-0 (https://download.01.org/0day-ci/archive/20241128/202411280334.CDiErngI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241128/202411280334.CDiErngI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280334.CDiErngI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CMA when selected by DRM_VERISILICON_DC8200
   WARNING: unmet direct dependencies detected for CMA
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_VERISILICON_DC8200 [=y] && HAS_IOMEM [=y] && DRM [=y] && HAVE_DMA_CONTIGUOUS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
