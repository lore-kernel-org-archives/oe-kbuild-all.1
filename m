Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498DF3FB35
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS3Sfxly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702553682; x=1734089682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ud8cXZSP1WLnG538Q6VnkL1U861REyJ5R5GyjeJAGQ=;
  b=SS3SfxlyLPxcHo1f0aBdincrw8OerkInVYyqB0x9TOldSo3VaU+E8OJT
   ZvJ7IKEIgdjGPGf82jzIQ+xp65bDKLrXuGCxtCuhDEaLcfA76OMhb7M7U
   1cDdst9O56gOuawxsF7ermn6Zu9ISG/ZoqTAiAGlQ3CHmak2CgtZ5Ak9K
   mQtm4pcwRv6460vbobwMyOBXmuRTJUT581tcwvgwAEC8RUTwCj42XE2Y7
   x01HnzoW8S8HsfczQiPo7wdRPSlz6M6bbsv0NLTlke+neFwqcPtE/7TTI
   U3Y27UKfOwFHWLTHOxXSAQCmOk5vXPG9mMINgGzaNlc9aw9Gu79LV9nt1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16657373"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="16657373"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844675316"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="844675316"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Dec 2023 03:34:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDjzA-000LzZ-2L;
	Thu, 14 Dec 2023 11:34:36 +0000
Date: Thu, 14 Dec 2023 19:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, airlied@gmail.com,
	daniel.vetter@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Updates to Intel DRM
Message-ID: <202312141902.3smgOmnr-lkp@intel.com>
References: <20231213160915.1414733-1-rodrigo.vivi@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213160915.1414733-1-rodrigo.vivi@intel.com>

Hi Rodrigo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Vivi/MAINTAINERS-Updates-to-Intel-DRM/20231214-001056
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231213160915.1414733-1-rodrigo.vivi%40intel.com
patch subject: [PATCH] MAINTAINERS: Updates to Intel DRM
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141902.3smgOmnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141902.3smgOmnr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/gpu/xe/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
