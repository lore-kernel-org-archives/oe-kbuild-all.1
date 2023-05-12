Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088EAA32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683909654; x=1715445654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oV0JhkKVmpNSSvVUozPEAq1Tnu6iaI9N7nrauyST0Ho=;
  b=cFt/Exf4YArAh2cugbqSBMOi9nlIcLomvbI4gS/MVo3ymOfxqXy0IVoi
   Skm21lhiE+kISgo1rq1r+y6WtZenWyLgfw1yL6K9ahsYASsgPo7q2sGsR
   wZc41E1wqL8n0mUWbkNM1rV45/1+JsYrpHMa01xdO9XIQ086VhnpU3N4F
   7Wl8jMbJs1zCR4Flbe/sZSqkN7Fhxth/WATKkcxWk9RU/7U8IPP9aMs5w
   MC6XyHs2I/KfimMlKsGRM1ZiSQKJaXCEDmpjcllWExWldfxFbgRWwoTLE
   0OgRYlWZBsqZKghaKQ6P+17qHb1jkO7hCtdmq/iWitA7+P2SyCH6tFK0B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353965517"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353965517"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 09:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="824416403"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824416403"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2023 09:40:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxVp5-0004yU-01;
	Fri, 12 May 2023 16:40:51 +0000
Date: Sat, 13 May 2023 00:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 419/436]
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c:61:5: error: no previous
 prototype for 'intel_hdcp_gsc_hdcp2_init'
Message-ID: <202305130054.uHfR8TFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   89aeb67f3dee3da8107e9d989b8a59345a18fbb2
commit: 50736b651cab854f2cc3aa6c0c0b4623a4aa5cc5 [419/436] UPSTREAM: drm/i915/mtl: Add function to send command to GSC CS
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230513/202305130054.uHfR8TFq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 50736b651cab854f2cc3aa6c0c0b4623a4aa5cc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130054.uHfR8TFq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_hdcp_gsc.c:61:5: error: no previous prototype for 'intel_hdcp_gsc_hdcp2_init' [-Werror=missing-prototypes]
      61 | int intel_hdcp_gsc_hdcp2_init(struct drm_i915_private *i915)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_hdcp_gsc.c:84:6: error: no previous prototype for 'intel_hdcp_gsc_free_message' [-Werror=missing-prototypes]
      84 | void intel_hdcp_gsc_free_message(struct drm_i915_private *i915)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
