Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475750249
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 06:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710831090; cv=none; b=UQYTJw8lFzpj0cz8RnIfX46f/UXzkaoxlt05PHWtyaD4SQKYQIJhpJyXvBZDWL1emAfNr97vHwkHh1f/XlDoS+c4HpJSD/w2vHDEaBzfAT8c2T+SZJpQv9VE5FDJmt7NP8lDjDW16TerIJTMfw9wOLBBW6d4flhN5VLb+uDio+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710831090; c=relaxed/simple;
	bh=M18Ey8+UgHjkfpMuAZLere14/BhHnhq3DtKp0vtMgXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltqRridIIBNyLu0YLqxzeyPEXaChsGfw9YPi6p1B/mdunrRvh2GoXldjU4LC70F4zHmh3L4o/ozBMG1qJPFI3ZpW6M3lGdyEdigADgfv7nohxTbmPusSFIjA9pN8eTowwGRTBiMBrMlZQMR9CT/VniZgEaCMcpV8Uh/05wiu7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8lySAUV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8lySAUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710831088; x=1742367088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M18Ey8+UgHjkfpMuAZLere14/BhHnhq3DtKp0vtMgXc=;
  b=W8lySAUVCyc3qecyMqEpLJhNnYpNIdxJe2Fdgi8Bccsjy4PIY5+olFtp
   Km5Ru/dBJg1U6WEIvYLW2s6OyrGDM8u8RFZadCU0FguLslDqwbXBlk5or
   4W9OISpYfQi5eCIhJkPrEWIr3F23r4g7JbgaEO5uK2VdFyZvA0ogGsBzI
   L43wXhUKgczpWanIdoLRNUrWAe5fKbsLimI3LPDLw8PtfQsUD14BrTqur
   0ifAqNw4YS4AhGjo6zq7iZ2aCguAmt8VaLGPcLpfxxKriDdMVqqAbtU20
   fA97l83nxqHpvk92BH1SrXsU8jOxVY48kyOLBzmnyTT77CnG7xLMt3CI3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17128451"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="17128451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 23:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="36846851"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2024 23:51:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmTJi-000HXf-38;
	Tue, 19 Mar 2024 06:51:22 +0000
Date: Tue, 19 Mar 2024 14:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
	Sameer Lattannavar <sameer.lattannavar@intel.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Simon Ser <contact@emersion.fr>,
	Daniel Stone <daniels@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <202403191412.UTJldbq9-lkp@intel.com>
References: <20240318204408.9687-2-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318204408.9687-2-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8 next-20240319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Introduce-plane-SIZE_HINTS-property/20240319-044605
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240318204408.9687-2-ville.syrjala%40linux.intel.com
patch subject: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240319/202403191412.UTJldbq9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191412.UTJldbq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191412.UTJldbq9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_plane.c:1767: warning: expecting prototype for drm_plane_add_size_hint_property(). Prototype was for drm_plane_add_size_hints_property() instead


vim +1767 drivers/gpu/drm/drm_plane.c

  1751	
  1752	/**
  1753	 * drm_plane_add_size_hint_property - create a size hint property
  1754	 *
  1755	 * @plane: drm plane
  1756	 * @hints: size hints
  1757	 * @num_hints: number of size hints
  1758	 *
  1759	 * Create a size hints property for the plane.
  1760	 *
  1761	 * RETURNS:
  1762	 * Zero for success or -errno
  1763	 */
  1764	int drm_plane_add_size_hints_property(struct drm_plane *plane,
  1765					      const struct drm_plane_size_hint *hints,
  1766					      int num_hints)
> 1767	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
