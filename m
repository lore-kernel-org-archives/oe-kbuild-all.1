Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296A139D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 00:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683852033; x=1715388033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YU57sOGSEglZe5+qtudIbwsG7tB/HeeYgXmKiH2SZlY=;
  b=FWrAVLOTTGuFes47P6w1D52I0BpTYWvnfkLPriuXtVZPbbGeT4NL/wky
   ht+K+C/cLFzBICxC3LWKQiSaccpxm7W6zhkxDgrwoAzgP5QoIon/Qz3ym
   Pa+lPIqHn3sdL6LuHXeq2z6mtm187jt0SdP5vs+4fHrnC4gl6Mw6Q7cIM
   f0WCHX/Q0Xxgl2ff7QFL9xr7Rh0Dl5XSmFg9hFm/HyKAfh3M9iR0s1mgo
   PEcQ0PzqKRDZPGRBupsXGd+i4nEgW4yATOy29RCC9P0JRdKV/Jv7kxtuh
   W3ZuCMjx6XIIY7LVwPJXkHQzMIyChkQw4APe5wsCXS4IisYbEOJeTXHQ8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350698662"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="350698662"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 17:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789600381"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="789600381"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 17:40:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxGpi-0004L0-1F;
	Fri, 12 May 2023 00:40:30 +0000
Date: Fri, 12 May 2023 08:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 419/436]
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c:61:5: warning: no previous
 prototype for 'intel_hdcp_gsc_hdcp2_init'
Message-ID: <202305120814.YTjLtI33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   9263d42cea01307513da0d70336b7a44ca574a5b
commit: 50736b651cab854f2cc3aa6c0c0b4623a4aa5cc5 [419/436] UPSTREAM: drm/i915/mtl: Add function to send command to GSC CS
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230512/202305120814.YTjLtI33-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 50736b651cab854f2cc3aa6c0c0b4623a4aa5cc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120814.YTjLtI33-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_hdcp_gsc.c:61:5: warning: no previous prototype for 'intel_hdcp_gsc_hdcp2_init' [-Wmissing-prototypes]
      61 | int intel_hdcp_gsc_hdcp2_init(struct drm_i915_private *i915)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_hdcp_gsc.c:84:6: warning: no previous prototype for 'intel_hdcp_gsc_free_message' [-Wmissing-prototypes]
      84 | void intel_hdcp_gsc_free_message(struct drm_i915_private *i915)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_hdcp_gsc_hdcp2_init +61 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c

    60	
  > 61	int intel_hdcp_gsc_hdcp2_init(struct drm_i915_private *i915)
    62	{
    63		struct intel_hdcp_gsc_message *hdcp_message;
    64		int ret;
    65	
    66		hdcp_message = kzalloc(sizeof(*hdcp_message), GFP_KERNEL);
    67	
    68		if (!hdcp_message)
    69			return -ENOMEM;
    70	
    71		/*
    72		 * NOTE: No need to lock the comp mutex here as it is already
    73		 * going to be taken before this function called
    74		 */
    75		i915->display.hdcp.hdcp_message = hdcp_message;
    76		ret = intel_hdcp_gsc_initialize_message(i915, hdcp_message);
    77	
    78		if (ret)
    79			drm_err(&i915->drm, "Could not initialize hdcp_message\n");
    80	
    81		return ret;
    82	}
    83	
  > 84	void intel_hdcp_gsc_free_message(struct drm_i915_private *i915)
    85	{
    86		struct intel_hdcp_gsc_message *hdcp_message =
    87						i915->display.hdcp.hdcp_message;
    88	
    89		i915_vma_unpin_and_release(&hdcp_message->vma, I915_VMA_RELEASE_MAP);
    90		kfree(hdcp_message);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
