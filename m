Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2D15A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 03:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691810225; x=1723346225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7RnTUCbNGKezR9ZGviQERAcbisAQIBqbbdtJEIeUh40=;
  b=bYyiqB8jGkXdCa0jABlCvy4zLRO8YaK2xwJYLSyE+CNkEenvN1PpEpk1
   DibESwHdvluKqE8GtiJrMa5OuAHpxEL/I4f4l0AyNmvvjg2eVTdjVm5H5
   Le3Be+JF5g5p7lgp64/truszGo8LWMqgN8FuD2vG5sAi1CbjKu3DemwEI
   hPGDTgrXompAx6juwEW4XLLmfbxGUA8iDkbM0zpS3XY6WZjCIRZF5P0xn
   qHgxAh0KYFFv+5x4rvxV+KEI+o6xK3p4nRJhT25v4XzimWKqi7/CfPIQ1
   OAXUuIct/cJ+4hH6VifXct3zDpuul6tww9+FB6xd7ITYabhOi8vYF73Ah
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438133242"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="438133242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 20:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846976594"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="846976594"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 20:17:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUf7c-0008EB-27;
	Sat, 12 Aug 2023 03:17:00 +0000
Date: Sat, 12 Aug 2023 11:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915/gt/pxp: User PXP contexts
 requires runalone bit in lrc
Message-ID: <202308121007.jU4NvVxe-lkp@intel.com>
References: <20230811044310.944883-4-alan.previn.teres.alexis@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811044310.944883-4-alan.previn.teres.alexis@intel.com>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 51fec314404b6a360493f225481083b2a664e3e1]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-i915-pxp-mtl-Update-pxp-firmware-response-timeout/20230811-124534
base:   51fec314404b6a360493f225481083b2a664e3e1
patch link:    https://lore.kernel.org/r/20230811044310.944883-4-alan.previn.teres.alexis%40intel.com
patch subject: [Intel-gfx] [PATCH v2 3/3] drm/i915/gt/pxp: User PXP contexts requires runalone bit in lrc
config: i386-randconfig-r082-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121007.jU4NvVxe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121007.jU4NvVxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121007.jU4NvVxe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_lrc.c:851:34: sparse: sparse: dereference of noderef expression

vim +851 drivers/gpu/drm/i915/gt/intel_lrc.c

   847	
   848	static bool ctx_needs_runalone(const struct intel_context *ce)
   849	{
   850		if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
 > 851		    ce->gem_context && ce->gem_context->uses_protected_content &&
   852		    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS))
   853			return true;
   854	
   855		return false;
   856	}
   857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
