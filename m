Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435A41DA2F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455121; cv=none; b=HvvHb8J+7bqO1DsB/1Szez7jR5XBqX5e1jUZovE4KMNq7q3MibYe/0To6OdUEB6nvwXqcm2v5hoVOAnsePrwL+VRfRZaDlTRikabObEc03yLo+M5Q0WxL9a4n+1oXlxPAuzZRdi1gftelxRNhZaRBQr+cGrMakne9OKfW5IzOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455121; c=relaxed/simple;
	bh=EMsNwGf772/11di/DtcrxHQN/GCXw+wluRRe/ZoGqes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAIEU/xsAh8h4MazM2av+6Eilft1A3zlWPHEDchVLaTl1gXDQlGoyyjxw3OyD4YbnpCWx4uWHQOx7OLabtRPhTXz/3X5JlJj4heUWX4rKC1p0O4onKmyC1jKVCZx75rr/0m6Z8rZZbvy6Q4uMuutw9+zrliXc6OinLoMA51wtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svb7r8qM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svb7r8qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455119; x=1756991119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EMsNwGf772/11di/DtcrxHQN/GCXw+wluRRe/ZoGqes=;
  b=Svb7r8qMuVqoNKm7mTF1uGDjdBVlsqwnnai93aTKFLkAUU9IvEitf6YG
   33s1VyNRf8ioSLiXCjmgzNBnW87Yf34vBeYX1jQ37YXxv/OuWTd8SuXQ9
   3kN4s33bFmwuQe8DcfIFwT6qCla1YsoPZwnth9Z1AhIFkWcylcmdP1gnu
   j7oNK9HLwX18lcIxKjNV5hZp2YDFST+zWXcyTrAxzmV/+3WA5NEm1Fuu6
   pW85DXtJpsuxFTdG282zpA5OGefzaBNacF0RrJjXKk02y52Q31zvQ7IuZ
   FvzQ4JJJfiQEsVrmAkiw+WWDFSaytKc4bf96I8ivm1uVfzMVjqqcf9Mgu
   Q==;
X-CSE-ConnectionGUID: 4AZluytYRvWOnHUgQh9DPQ==
X-CSE-MsgGUID: OlsnNik7QRiv9mIaJeqL5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34714563"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="34714563"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:05:18 -0700
X-CSE-ConnectionGUID: +y85KcadSvaGJbXkeYckzg==
X-CSE-MsgGUID: RdM7ZK6gRBmaT4f8cVI7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="95998221"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Sep 2024 06:05:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slphC-00086B-3A;
	Wed, 04 Sep 2024 13:05:14 +0000
Date: Wed, 4 Sep 2024 21:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [PATCH 2/4] drm/i915/display: add intel_display_snapshot
 abstraction
Message-ID: <202409042024.IZDvOogv-lkp@intel.com>
References: <f2cc41111504e062c3ecb287daee6967078b73cc.1725372032.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2cc41111504e062c3ecb287daee6967078b73cc.1725372032.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on next-20240904]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-dump-display-parameters-captured-in-error-state-not-current/20240903-220614
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/f2cc41111504e062c3ecb287daee6967078b73cc.1725372032.git.jani.nikula%40intel.com
patch subject: [PATCH 2/4] drm/i915/display: add intel_display_snapshot abstraction
config: i386-randconfig-005-20240904 (https://download.01.org/0day-ci/archive/20240904/202409042024.IZDvOogv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042024.IZDvOogv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042024.IZDvOogv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_display_snapshot.o: in function `intel_display_snapshot_capture':
>> drivers/gpu/drm/i915/display/intel_display_snapshot.c:21: undefined reference to `intel_overlay_snapshot_capture'
   ld: drivers/gpu/drm/i915/display/intel_display_snapshot.o: in function `intel_display_snapshot_print':
>> drivers/gpu/drm/i915/display/intel_display_snapshot.c:32: undefined reference to `intel_overlay_snapshot_print'


vim +21 drivers/gpu/drm/i915/display/intel_display_snapshot.c

    12	
    13	struct intel_display_snapshot *intel_display_snapshot_capture(struct intel_display *display)
    14	{
    15		struct intel_display_snapshot *snapshot;
    16	
    17		snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
    18		if (!snapshot)
    19			return NULL;
    20	
  > 21		snapshot->overlay = intel_overlay_snapshot_capture(display);
    22	
    23		return snapshot;
    24	}
    25	
    26	void intel_display_snapshot_print(const struct intel_display_snapshot *snapshot,
    27					  struct drm_printer *p)
    28	{
    29		if (!snapshot)
    30			return;
    31	
  > 32		intel_overlay_snapshot_print(snapshot->overlay, p);
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
