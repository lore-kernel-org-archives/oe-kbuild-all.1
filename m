Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE3C1DE2A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 04:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750221785; cv=none; b=a49+pWCnIvIAWC57SjGAPqd1DaHMgAHXqlTo8T67DPaKtHq4ZeMU/bWkX0gZoHT0306EalrciyFTcRcHrco1r2v+XYTK1eDJ+oEgeMG1AwJ1c0pUkkSSamI0A2XYXOaydyrSkFS/rgp/PiXJeSUY08hMVe/7gRLeVWoafUAkymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750221785; c=relaxed/simple;
	bh=qrU4m+qS2uKsFAVLPzFUsoU7GsKUoi+c8a8uxpByx+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXCgm1x03uaV2a9xboBH4HfsBaNAu9SCxAM0+kFna1mmvaOuYJBlpW/s6myB8u1X2XpC6h2Mqknjxdb2SkqMyJmmYLXRl7Eks7V2ehAhszyR7cK2oko5olCgvkBZJdanKCbRZKnMOHxiFa5oZu5bClgmVPMeaGkj7wQlUbtsUrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQ36mqFv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ36mqFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750221784; x=1781757784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrU4m+qS2uKsFAVLPzFUsoU7GsKUoi+c8a8uxpByx+0=;
  b=HQ36mqFvffk9fF562v5+tflXIHYyNgBwPNIKfyMILhoMaqSNYm5mGVPc
   TymzF6gDiJGDxMfwfMEL+fwV81H7pg8O26xcxoNmgfO5OoCvZ5wE5IPx4
   XvbTcd5+thc24wYmChle+jhbKjNdHWJGgUeYwhHXbLwlMT8x396KhifrT
   gWVGlQ4+RlN0W9JN5a7FCOTES9n//UzVN7qvgDeJxN8dNVrPDRzDCUbZ0
   2j3sPngH6fBP/RqKXdKxPTjhVJ+Ss7P1JpAsD/Ek+Z6ldl6JkDcC/iPvf
   FqFjXUJQ4ZrNaL6W26WgSv7N8W7VNVAPD4fySY0Nmoqx1qlB7V2eFFdqf
   w==;
X-CSE-ConnectionGUID: F46su5DzRumSrDLKeXMoGQ==
X-CSE-MsgGUID: lGWWBYaATqymQX/TYihO8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51530989"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="51530989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:43:03 -0700
X-CSE-ConnectionGUID: 0Sv4k5lOTtOuGpIooWZmxg==
X-CSE-MsgGUID: PAaLcFaLRzGzbT6i8+zvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="154479972"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2025 21:42:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRkdS-000JOw-0u;
	Wed, 18 Jun 2025 04:42:54 +0000
Date: Wed, 18 Jun 2025 12:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
	harry.wentland@amd.com, alex.hung@amd.com, leo.liu@amd.com,
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
	sebastian.wick@redhat.com, shashank.sharma@amd.com,
	agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
	aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
	daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
	marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
	arthurgrillo@riseup.net
Subject: Re: [PATCH V10 35/46] drm/amd/display: add shaper and blend colorops
 for 1D Curve Custom LUT
Message-ID: <202506181213.S2kcNsRM-lkp@intel.com>
References: <20250617041746.2884343-36-alex.hung@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617041746.2884343-36-alex.hung@amd.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc2]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250617-123027
base:   linus/master
patch link:    https://lore.kernel.org/r/20250617041746.2884343-36-alex.hung%40amd.com
patch subject: [PATCH V10 35/46] drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
config: x86_64-buildonly-randconfig-006-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181213.S2kcNsRM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181213.S2kcNsRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181213.S2kcNsRM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:442 Excess function parameter 'is_legacy' description in '__drm_lut_32_to_dc_gamma'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
