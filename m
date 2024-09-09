Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51122098
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855628; cv=none; b=kZBy6+Rq4GOQ/iAam6nGrTCYAlIJKlTwLQhekDRFHh5BTL7pzzx2aXgZIVive1xGT/dA3ZQaTgOvjh6vuWxPu4nF0OVQWbJ0qBZGZ4GYxwJAyw3l78cRAxp9xmSVettHTeOxpiwPLYVfMX6PxEpvZGnvsrmr9NVMP2XizRvmd0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855628; c=relaxed/simple;
	bh=NaSTuZ29xtisfHK6oFsWaXwTGdnu0Y3RxdzbZTVcbRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9evPI6+NK0a3H5gq0KV8wsv29mbADFZad88iLn/DwNtPz86Rix/5lUN9AIn2d8nck+1rtIiNQ0aQtONFaUaqFHqaQ9gB9H7itXVnjD4K4W/55jHOTmsoqzWcGWYjLKxGyTdZxS3YLW2b9XAkg5wxNKA7irGUeKI8F/bQQdG/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcqpWlqs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcqpWlqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725855626; x=1757391626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NaSTuZ29xtisfHK6oFsWaXwTGdnu0Y3RxdzbZTVcbRk=;
  b=BcqpWlqsskoJwhieaL6xJoUJ2G+wi5eYGRMSsZHuzKscJaqBKwSwVihr
   VIIOJlnNyEtVJfeWz6KrsByVFr22Fk/U9/Rnsyvjczsz6bLbMNGqXI2YB
   65KmVm4KElYUemuxHFWRcFf1RBXAdhXYfozp9nT78Xt8H1PQURkw+0tdR
   5lVy91fKZNXQOH8Sfniix0awxGzRIgfyG5KdMG70FovndivzfyWySKDFY
   plRMdFwIbVZTEb3dv030OmrPjfVszg4tMCvr3GTMgpyJ1ysWgX8i4RjEx
   bbCCRgpwIbrqHmr1ePOsP3u9o0cxj95lockky0d2f4Pt93XUs+BLX/7bo
   w==;
X-CSE-ConnectionGUID: RaEtBgBnT8CvyyfFZGi7Lw==
X-CSE-MsgGUID: fxwlY16oQ36QJc8M9egKPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35904173"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35904173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 21:20:25 -0700
X-CSE-ConnectionGUID: mPbKn40jTMufi/M76P0qVA==
X-CSE-MsgGUID: SioWlhpvQnSLqpJ4Pq4FVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66578338"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2024 21:20:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snVsy-000EHT-1K;
	Mon, 09 Sep 2024 04:20:20 +0000
Date: Mon, 9 Sep 2024 12:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] drm/edid: add CTA Video Format Data Block support
Message-ID: <202409091135.VFcWIvXN-lkp@intel.com>
References: <20240906224307.423250-1-hamza.mahfooz@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906224307.423250-1-hamza.mahfooz@amd.com>

Hi Hamza,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc7 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/drm-edid-add-CTA-Video-Format-Data-Block-support/20240907-064359
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240906224307.423250-1-hamza.mahfooz%40amd.com
patch subject: [PATCH v3] drm/edid: add CTA Video Format Data Block support
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240909/202409091135.VFcWIvXN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091135.VFcWIvXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091135.VFcWIvXN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
>> ERROR: modpost: "__umoddi3" [drivers/gpu/drm/drm.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
