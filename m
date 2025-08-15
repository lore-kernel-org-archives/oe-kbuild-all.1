Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9A2242D6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755293234; cv=none; b=nQIPTuM3EeEITtmiLZkYLwhsv6RpGeoKt/nWPWJlcj31B2VOAoCBYwQizvFft6HDcbfxMx6oQYbsShbDmbNVaXmQ8j4lK8iMx/nldSsOxsa7zVBtDtdslGh0Wqc9I1wwkhNj3ko4AnJBR93rGuNQlYFN46xOl/Mkb12gbkSihA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755293234; c=relaxed/simple;
	bh=W+iJZ8mIwM4LaGWVzRYS4QRICacEzWGFxppv6fyATdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZckxECAYy3LU81agaUbPsWLZf2l/nm2s8zQaIOOmdDJkUyaIzyRAlMLSu6zu0Q7QMAzqcnNUlPtU3UVx43gODBC9Ladr43L3OHOIAjibBIoCtRTer825oesPYSfm7nTuYgkBfjzs1OUDsWVQaJOnv4ND5iTJbh9rcj68m/NCNto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAWrFie2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAWrFie2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755293233; x=1786829233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W+iJZ8mIwM4LaGWVzRYS4QRICacEzWGFxppv6fyATdw=;
  b=OAWrFie2tgdUHnFT8D7sW18hNG6UtYNkgjgwtt7XLWBNsxMy+RlXq9M3
   enC87vuBVT/RhsDR2p4zJde6eN0ExBoG8r1fvJF43xzbKHLMDhZm4BFnV
   xgT/LXvkAKlZDLh8TFD8KkGT0Wh4LjTzwWvIzZ0S0/150vbSLYHyUl9ey
   mnX7ESGF5KPfC/aX9AeuReDjswIFFM3cFH9VIFvtqaaDEPUW4kFa1b0XF
   Db7+eD/xVzHyhZ85cINlnJ29WZh1i13UfRu2eLcBBgD5pIZ5cP3HYVCgg
   hbGoH56XYh9oG87kq4mygYbFLYhDLVdXLs/MCvzDPj2UmnDRQpdkAA5vc
   w==;
X-CSE-ConnectionGUID: ONRHoeAxTfCHnTRiZT3E2A==
X-CSE-MsgGUID: uHPzFLSoSRSIcxGaOQ/7vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57765679"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57765679"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 14:27:13 -0700
X-CSE-ConnectionGUID: FtVEo0nuSH+urWSQRMNpIw==
X-CSE-MsgGUID: v/rMKRBpRtyAiiI65uPZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167482332"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2025 14:27:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un1x2-000CM8-0A;
	Fri, 15 Aug 2025 21:27:04 +0000
Date: Sat, 16 Aug 2025 05:26:58 +0800
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
	mcanal@igalia.com
Subject: Re: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
Message-ID: <202508160509.6y6RZQYI-lkp@intel.com>
References: <20250815035047.3319284-3-alex.hung@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815035047.3319284-3-alex.hung@amd.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250815-120435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250815035047.3319284-3-alex.hung%40amd.com
patch subject: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
config: x86_64-randconfig-074-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160509.6y6RZQYI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160509.6y6RZQYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160509.6y6RZQYI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/tests/vkms-kunit-tests.o: warning: objtool: file already has .orc_unwind section, skipping

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
