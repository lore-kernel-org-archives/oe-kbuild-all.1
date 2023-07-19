Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226351FC1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 15:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689779190; x=1721315190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8d47ZfpGxaJMsaUP6UwfL+ZvW9BEb9zK0wGzTXZ4JHY=;
  b=XfqLrWc5B5WZDnN5HI4UgG0ynELxfIkTGktBAct0BF/3WEMqHPjJZ0tC
   vYNBMczUSdnMvztENwJwdaVPeFonKouk7pUU5si192HRCF22/j1fXi+7S
   8+fhETrETswbliKstLjXDA1zF+OUp3RxwRpYI067hwucwAm8cNxrnRbaZ
   EAp4Y313Z3GrJd2Wj9rp7umZ6w+Qs20itPqU1LE51egRsMhadJY6jBtqL
   GigNdv4Yp18ZAJWJkATCZdv/thNSlm1PKfLrh/QzFpyaqpeiu2NOTYPty
   MCh43oudYcY+2K8IAR23KpfOuNVGrZmXL8mwV09KXkfV5//tE8pTmDWuO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370049647"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="370049647"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 08:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="718006206"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="718006206"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Jul 2023 08:06:28 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM8l1-00052d-28;
	Wed, 19 Jul 2023 15:06:27 +0000
Date: Wed, 19 Jul 2023 23:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/tc: move legacy code out of the
 main _max_lane_count() func
Message-ID: <202307192225.QnmiapXD-lkp@intel.com>
References: <20230719132822.305612-4-luciano.coelho@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719132822.305612-4-luciano.coelho@intel.com>

Hi Luca,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Coelho/drm-i915-tc-rename-mtl_tc_port_get_pin_assignment_mask/20230719-213204
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230719132822.305612-4-luciano.coelho%40intel.com
patch subject: [Intel-gfx] [PATCH 3/4] drm/i915/tc: move legacy code out of the main _max_lane_count() func
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230719/202307192225.QnmiapXD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192225.QnmiapXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192225.QnmiapXD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_tc.c: In function 'intel_tc_port_fia_max_lane_count':
>> drivers/gpu/drm/i915/display/intel_tc.c:354:21: error: 'struct intel_digital_port' has no member named 'tc_mode'
     354 |         if (dig_port->tc_mode != TC_PORT_DP_ALT)
         |                     ^~


vim +354 drivers/gpu/drm/i915/display/intel_tc.c

   349	
   350	int intel_tc_port_fia_max_lane_count(struct intel_digital_port *dig_port)
   351	{
   352		struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
   353	
 > 354		if (dig_port->tc_mode != TC_PORT_DP_ALT)
   355			return 4;
   356	
   357		if (DISPLAY_VER(i915) >= 14)
   358			return mtl_tc_port_get_max_lane_count(dig_port);
   359	
   360		return intel_tc_port_get_max_lane_count(dig_port);
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
