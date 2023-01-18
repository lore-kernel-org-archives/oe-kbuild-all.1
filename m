Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3360F2F34
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 22:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674081742; x=1705617742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1seZwJJ5fjHzmEGGMsg+2W0Ii9vh1jkN8H3OpnOyVUk=;
  b=CxzHHNTaozckDpL2Dtd8T2UVC9PU6yr7PXc9WT8B3mbY4xf4epHj2MoO
   R7hkcuUKENLG4pAHzHsDVzO555gCEaXlLC8ed1C8/UBPrEnnlth+jpJn9
   g1Z8QK7ijrqmCg5AbbXXYQvLtGeljw99iFpX4cTmWIC9RYsFgEtCgGtaX
   AWFGxebIuwTjZgltRNkzYGKhT1OFTjUAgn88eUaoZF9Y2YeF43JvLZp5y
   qOPjnVIJHTkSKLe1Q5SHAY4xZVgd06ZBjcLPmhXZ4lxoldOrUzX0GGr8Z
   xAQlYIlyn5whtX1EluzcEcj/MYt8rSsqeryJ6R4vT96bJWrd9EAYlYJiB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="312998238"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="312998238"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 14:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833766911"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="833766911"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 14:42:18 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIH8L-0000mQ-11;
	Wed, 18 Jan 2023 22:42:17 +0000
Date: Thu, 19 Jan 2023 06:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [drm-misc:for-linux-next-fixes 1/2]
 drivers/gpu/drm/i915/i915_driver.c:1072:34: error: unused variable 'i915'
Message-ID: <202301190659.FxGwhJ82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next-fixes
head:   2293a73ad4f3b6c37c06713ff1b67659d92ef43d
commit: a273e95721e96885971a05f1b34cb6d093904d9d [1/2] drm/i915: Allow switching away via vga-switcheroo if uninitialized
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230119/202301190659.FxGwhJ82-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next-fixes
        git checkout a273e95721e96885971a05f1b34cb6d093904d9d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the drm-misc/for-linux-next-fixes HEAD 2293a73ad4f3b6c37c06713ff1b67659d92ef43d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_driver.c: In function 'i915_driver_lastclose':
>> drivers/gpu/drm/i915/i915_driver.c:1072:34: error: unused variable 'i915' [-Werror=unused-variable]
    1072 |         struct drm_i915_private *i915 = to_i915(dev);
         |                                  ^~~~
   cc1: all warnings being treated as errors


vim +/i915 +1072 drivers/gpu/drm/i915/i915_driver.c

71386ef9008817f drivers/gpu/drm/i915/i915_drv.c Oscar Mateo           2014-07-24  1057  
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1058  /**
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1059   * i915_driver_lastclose - clean up after all DRM clients have exited
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1060   * @dev: DRM device
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1061   *
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1062   * Take care of cleaning up after all DRM clients have exited.  In the
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1063   * mode setting case, we want to restore the kernel's initial mode (just
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1064   * in case the last client left us in a bad state).
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1065   *
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1066   * Additionally, in the non-mode setting case, we'll tear down the GTT
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1067   * and DMA structures, since the kernel won't be using them, and clea
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1068   * up any GEM state.
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1069   */
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1070  static void i915_driver_lastclose(struct drm_device *dev)
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1071  {
5df7bd130818dfd drivers/gpu/drm/i915/i915_drv.c José Roberto de Souza 2021-04-08 @1072  	struct drm_i915_private *i915 = to_i915(dev);
5df7bd130818dfd drivers/gpu/drm/i915/i915_drv.c José Roberto de Souza 2021-04-08  1073  
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1074  	intel_fbdev_restore_mode(dev);
5df7bd130818dfd drivers/gpu/drm/i915/i915_drv.c José Roberto de Souza 2021-04-08  1075  
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1076  	vga_switcheroo_process_delayed_switch();
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1077  }
2911a35b2e4eb87 drivers/gpu/drm/i915/i915_drv.c Ben Widawsky          2012-04-05  1078  

:::::: The code at line 1072 was first introduced by commit
:::::: 5df7bd130818dfdc9047c2a81b19737d66e55f9a drm/i915: skip display initialization when there is no display

:::::: TO: José Roberto de Souza <jose.souza@intel.com>
:::::: CC: José Roberto de Souza <jose.souza@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
