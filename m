Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8E01D416A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724798666; cv=none; b=SPSGal8Q8X6g+tK8goqT1DUaXnsemdGMy6G7+sGjZ1Ng0GsjxVoNR5aoqF/tDVPZ7ZYY5yaBQEMbLrlrIZK2hdm2TmJjN+YL/cxD1TvvpBzNeBwMk/4cGH2edGyA2OWNLi0fxR4IQ8iao4b2OwIzxFkIPuT3V9v0umz2pQgO9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724798666; c=relaxed/simple;
	bh=YgWUSPeK6BFSt/xE9BFNhvSZMrUFm5JsRJJ6sFnqzTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uu4h1J/STWX4KTvwjtNUrw0VpbxIsJdqfpmX+HOJPYpeWwofwCBWaGKCSpynCd7iYW/GJQ+u0f8ZHaCqxteKHAiPtuinODIxATswM4k3rirJ2gg8aGd8xyAd+a7chEGCc2Lvw1tvNIQvIdf+0SQBNt89yQXVroFfFcVFq+h4ugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPvA0oFY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPvA0oFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724798665; x=1756334665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YgWUSPeK6BFSt/xE9BFNhvSZMrUFm5JsRJJ6sFnqzTw=;
  b=jPvA0oFYsUI3lck4+jFfURqQF/a5fUPKypm94Ohj5dt+wPeL6M8IHkPs
   VXXfZ7L1/FQdmSLlHFk47Jj+Yo3rG6YN1vI2V2PBne5WgD3RxqZdw3SRI
   wYozUgFAO/oJ/a2+A++6bSmrvEJ9SgcdOVe48qL8IIPsQdIjsEfsfljza
   r7z2mQifMRJRdNUU+AiyaI5enmVveClqgCRSR6kwLmsBiSGWeDqkYQYEB
   qeS3RVCPihHl6A20pdontm9h8E5I4Xr707gcOESKQXNwsAkFBGBpDG6uv
   43rA8wjjhSe790mujhM9noIk5wUOn9TQsjGhQR0G6f1UAJcvxMt5r8Y8r
   g==;
X-CSE-ConnectionGUID: CcvKnAOEQU2rbAo5eBEpKQ==
X-CSE-MsgGUID: kK+fWuw3TqCwRP+uvqUbBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27098009"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="27098009"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 15:44:22 -0700
X-CSE-ConnectionGUID: R7wIFeYuQfOvCtImHad6Ag==
X-CSE-MsgGUID: WTlNluDOQla+iizW8L72lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63531614"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 15:44:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj4vB-000KA8-2V;
	Tue, 27 Aug 2024 22:44:17 +0000
Date: Wed, 28 Aug 2024 06:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Kolacinski <karol.kolacinski@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com
Subject: Re: [Intel-wired-lan] [PATCH v8 iwl-next 2/7] ice: Remove
 unncecessary ice_is_e8xx() functions
Message-ID: <202408280657.Z0MrIA15-lkp@intel.com>
References: <20240827130814.732181-11-karol.kolacinski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827130814.732181-11-karol.kolacinski@intel.com>

Hi Karol,

kernel test robot noticed the following build errors:

[auto build test ERROR on 025f455f893c9f39ec392d7237d1de55d2d00101]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Kolacinski/ice-Don-t-check-device-type-when-checking-GNSS-presence/20240827-211218
base:   025f455f893c9f39ec392d7237d1de55d2d00101
patch link:    https://lore.kernel.org/r/20240827130814.732181-11-karol.kolacinski%40intel.com
patch subject: [Intel-wired-lan] [PATCH v8 iwl-next 2/7] ice: Remove unncecessary ice_is_e8xx() functions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240828/202408280657.Z0MrIA15-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280657.Z0MrIA15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280657.Z0MrIA15-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "ice_is_generic_mac" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
>> ERROR: modpost: "ice_is_e825c" [drivers/net/ethernet/intel/ice/ice.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
