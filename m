Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC68839
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 16:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674576811; x=1706112811;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QPWmDmkDRkvMCcvxtLjxXQ/1XP2zalAlv1VGPidSKr4=;
  b=SFp8dWMvgNWc7Nd5YeUhHJ313/1LISuT5re6mtp9Cjl1gUtoNhLsxexS
   8mEaI/qwPQg0JFiClI1PKkMdreVeFGlBcqWdykHJeLsH1pqN3S6l92ZY4
   N6uqg+kv213HWlek3KPEugVXfcdG9fsk1OcyEj4EQeH42Q7WRVDyiL1qZ
   /Z7UsLEugztX3jPsHOriApmE4NSc4NcHSuLIGfXsKYdrsP45t9rGFA44h
   G4bPd2XzL0I6HuZg2AdY8F+mK8ut7NGK/NzcCPwCBjUI7/SuYwtr/GZEu
   EynNgZISqeQyxvq4gtbANxcsU5fKHAgxeIdBygE7pjCh6BpfiIlJ+bXkM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="314232464"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="314232464"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 08:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="664130110"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="664130110"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2023 08:13:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKLv0-0006br-1v;
	Tue, 24 Jan 2023 16:13:06 +0000
Date: Wed, 25 Jan 2023 00:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.15 121/122]
 drivers/gpu/drm/i915/i915_drv.c:989:34: error: unused variable 'i915'
Message-ID: <202301250014.r4jHLfda-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.15
head:   7cc9dd6506b6dba986366c8ef94cf8e92a6437d1
commit: 3fb7d3522949e00f2711942ede083ef73aa2f6be [121/122] drm/i915: Allow switching away via vga-switcheroo if uninitialized
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230125/202301250014.r4jHLfda-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/3fb7d3522949e00f2711942ede083ef73aa2f6be
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.15
        git checkout 3fb7d3522949e00f2711942ede083ef73aa2f6be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_drv.c: In function 'i915_driver_lastclose':
>> drivers/gpu/drm/i915/i915_drv.c:989:34: error: unused variable 'i915' [-Werror=unused-variable]
     989 |         struct drm_i915_private *i915 = to_i915(dev);
         |                                  ^~~~
   cc1: all warnings being treated as errors


vim +/i915 +989 drivers/gpu/drm/i915/i915_drv.c

71386ef9008817 Oscar Mateo           2014-07-24  974  
0673ad472b9849 Chris Wilson          2016-06-24  975  /**
0673ad472b9849 Chris Wilson          2016-06-24  976   * i915_driver_lastclose - clean up after all DRM clients have exited
0673ad472b9849 Chris Wilson          2016-06-24  977   * @dev: DRM device
0673ad472b9849 Chris Wilson          2016-06-24  978   *
0673ad472b9849 Chris Wilson          2016-06-24  979   * Take care of cleaning up after all DRM clients have exited.  In the
0673ad472b9849 Chris Wilson          2016-06-24  980   * mode setting case, we want to restore the kernel's initial mode (just
0673ad472b9849 Chris Wilson          2016-06-24  981   * in case the last client left us in a bad state).
0673ad472b9849 Chris Wilson          2016-06-24  982   *
0673ad472b9849 Chris Wilson          2016-06-24  983   * Additionally, in the non-mode setting case, we'll tear down the GTT
0673ad472b9849 Chris Wilson          2016-06-24  984   * and DMA structures, since the kernel won't be using them, and clea
0673ad472b9849 Chris Wilson          2016-06-24  985   * up any GEM state.
0673ad472b9849 Chris Wilson          2016-06-24  986   */
0673ad472b9849 Chris Wilson          2016-06-24  987  static void i915_driver_lastclose(struct drm_device *dev)
0673ad472b9849 Chris Wilson          2016-06-24  988  {
5df7bd130818df José Roberto de Souza 2021-04-08 @989  	struct drm_i915_private *i915 = to_i915(dev);
5df7bd130818df José Roberto de Souza 2021-04-08  990  
0673ad472b9849 Chris Wilson          2016-06-24  991  	intel_fbdev_restore_mode(dev);
5df7bd130818df José Roberto de Souza 2021-04-08  992  
0673ad472b9849 Chris Wilson          2016-06-24  993  	vga_switcheroo_process_delayed_switch();
0673ad472b9849 Chris Wilson          2016-06-24  994  }
2911a35b2e4eb8 Ben Widawsky          2012-04-05  995  

:::::: The code at line 989 was first introduced by commit
:::::: 5df7bd130818dfdc9047c2a81b19737d66e55f9a drm/i915: skip display initialization when there is no display

:::::: TO: José Roberto de Souza <jose.souza@intel.com>
:::::: CC: José Roberto de Souza <jose.souza@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
