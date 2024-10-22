Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946E1CC8AA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729634724; cv=none; b=k31wcO/fmok45ts2vLjheYlpC/LYaqw2Pupzy4U1Ok+Bh34z7UoaOcNIddkz/2E0hWf8SrqWeMiJGR3Bj1uR1utdkB+dJ4tfjrt4UDpRzkXj4YUzKGOV9xPuc/0Q+dgcDe7smEH8t/+m7JbVPAJoSDrdUg6bumGJ02xMPw6oJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729634724; c=relaxed/simple;
	bh=EmOh5ru8aIytD4v8gme1QI2oaFN3qYEoqUWRF9rWnjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbGa0fa+qKqXgpRvUKm+HbJgR4aN7DZHVnZsdNcqWSnY6JbLxuzaiXYB2ZupOJALnJiyLbUVi5MuGpbSou4rtbkxjKGIQBy0NPPUEtDRSM+jZBRYS1zwfIn4fQKELXeSZ9yrFf4xRnyFvw5bh0z1HgyWVX8WxftHzNcTSMrQt3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1Fd8gcm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1Fd8gcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729634723; x=1761170723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmOh5ru8aIytD4v8gme1QI2oaFN3qYEoqUWRF9rWnjQ=;
  b=m1Fd8gcmsODgy0AtZzNsfHqvPytZcKc2R5hCUs6Up58a75HEDsvZiLib
   /6gL0IWMqPPO6BYn1gx1s0DYC85ilcnkGsJjFFWJ5uzFpvqEq+A6uayER
   RwZzNzgMMZDyqMizbjyxWiT0v1XY1migJRTagqoP6Y0qAiB3PNZuR9e1f
   2v+j/xsOhekOTcUx6iaBZIbxM2QdEsZmrM9p8kIRe7Lr2ClBjCLxCorba
   hDxUDYpNx7Klg91M4orvZFQWO3Ll4LqjeZbgAz4Zk0gmIacKVRIwcy2uc
   nT/SyohEdDbPUNzwyTBY9N7j1/P++E6hA5EMq4yfNX6g2jUPbd6FZF/z2
   A==;
X-CSE-ConnectionGUID: x2Nb1c6qQr2a1MbcxVsjhw==
X-CSE-MsgGUID: vL3rfNmuSL65twZuNDicOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29091805"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29091805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 15:05:09 -0700
X-CSE-ConnectionGUID: cX3HrYTlT2WhYImx9SjtBg==
X-CSE-MsgGUID: rEPsJ7S7SXOu3HViBXSOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80191776"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Oct 2024 15:05:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Mzx-000U9m-1L;
	Tue, 22 Oct 2024 22:05:05 +0000
Date: Wed, 23 Oct 2024 06:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/xe/hdcp: Add check to remove hdcp2 compatibilty
Message-ID: <202410230526.VIha5RQI-lkp@intel.com>
References: <20241022055655.1902-1-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022055655.1902-1-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on next-20241022]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-xe-hdcp-Add-check-to-remove-hdcp2-compatibilty/20241022-135748
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20241022055655.1902-1-suraj.kandpal%40intel.com
patch subject: [PATCH] drm/xe/hdcp: Add check to remove hdcp2 compatibilty
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241023/202410230526.VIha5RQI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230526.VIha5RQI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230526.VIha5RQI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:20,
                    from drivers/gpu/drm/xe/xe_device_types.h:31,
                    from drivers/gpu/drm/xe/xe_vm_types.h:16,
                    from drivers/gpu/drm/xe/xe_bo.h:13,
                    from drivers/gpu/drm/xe/display/xe_hdcp_gsc.c:13:
   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c: In function 'intel_hdcp_gsc_cs_required':
>> drivers/gpu/drm/i915/display/intel_display_device.h:199:33: error: implicit declaration of function 'IP_VER' [-Werror=implicit-function-declaration]
     199 | #define DISPLAY_VER_FULL(i915)  IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
         |                                 ^~~~~~
   drivers/gpu/drm/xe/display/xe_hdcp_gsc.c:36:17: note: in expansion of macro 'DISPLAY_VER_FULL'
      36 |                 DISPLAY_VER_FULL(display) != IP_VER(14, 1);
         |                 ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/IP_VER +199 drivers/gpu/drm/i915/display/intel_display_device.h

5e72e75d30fcff Jani Nikula 2023-10-03  197  
5e72e75d30fcff Jani Nikula 2023-10-03  198  #define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
5e72e75d30fcff Jani Nikula 2023-10-03 @199  #define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
5e72e75d30fcff Jani Nikula 2023-10-03  200  				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
5e72e75d30fcff Jani Nikula 2023-10-03  201  #define IS_DISPLAY_VER(i915, from, until) \
5e72e75d30fcff Jani Nikula 2023-10-03  202  	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
5e72e75d30fcff Jani Nikula 2023-10-03  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
