Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416217E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691055043; x=1722591043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BT4CIGa+VXqSBBp4mkOZMefmGky/1xGE0ZpBtkAtB0w=;
  b=W0SUd9Gc99BI3eXdeH/jjv7l4JrhWeZb2+2ZsWBwwC7Vet6D4A4K9eTR
   ABKIx6uoYD0oytWSt5uMZbjibo6hZf3tHGXDx/qbDn4vsy5qG5YxV5KF8
   kdgVRjorWhrYUNJrdA+1JZXfsC3CVJh+kMKAPhV4qCgGuMZqq2c6tLl1H
   Lk6TmgV9G3hNCl1MU8UMeJ5OT0iiS0WjNFMW8nFyTAevguNKtO9Me0oVC
   jXgiYqWTraASDM/stROaGLjIGDZ4Eyd9AQrH9TgJAawgDr85I5MeaM8n8
   /ZFhclLpJRR0CbAmX9Zqy6t4glATla50q4XbtdeoHr4ZqM92g1OV5ei9w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="359864487"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="359864487"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="819577734"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="819577734"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 02:30:17 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRUeu-0001zp-1b;
	Thu, 03 Aug 2023 09:30:16 +0000
Date: Thu, 3 Aug 2023 17:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v5 3/8] drm/i915/vdsc: Add func to get no. of
 vdsc instances per pipe
Message-ID: <202308031703.dGZHhl6S-lkp@intel.com>
References: <20230803070346.3776690-4-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803070346.3776690-4-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-vdsc-Refactor-dsc-register-field-macro/20230803-151602
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230803070346.3776690-4-suraj.kandpal%40intel.com
patch subject: [Intel-gfx] [PATCH v5 3/8] drm/i915/vdsc: Add func to get no. of vdsc instances per pipe
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230803/202308031703.dGZHhl6S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031703.dGZHhl6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031703.dGZHhl6S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_vdsc.c:353:5: warning: no previous prototype for 'intel_dsc_get_no_vdsc_inst_per_pipe' [-Wmissing-prototypes]
     353 | int intel_dsc_get_no_vdsc_inst_per_pipe(const struct intel_crtc_state *crtc_state)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_dsc_get_no_vdsc_inst_per_pipe +353 drivers/gpu/drm/i915/display/intel_vdsc.c

   352	
 > 353	int intel_dsc_get_no_vdsc_inst_per_pipe(const struct intel_crtc_state *crtc_state)
   354	{
   355		return crtc_state->dsc.dsc_split ? 2 : 1;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
