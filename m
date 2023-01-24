Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC3A8839
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674576191; x=1706112191;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4siWcjMMycVNx7r69gc//16E+gOhn6Nvano3ZcHJHw0=;
  b=D1ZY+XWrzRvK+iIW0oUC7GuYRXlp9oQ+Cv6zSh+eMdZFDs+2otO5MaBk
   70zC6hY3X0/HcPDXx8I9W9COXnZX70FsbUuBB57/FObEKN+/bC3zV3Sor
   8G/Qk6Tc5wJmCq2ZIxap3nd3cM1h+ttK5obwz3gwdF18Jn2q3xpgMOdMY
   vRXIVmttZ5+Wk15fS//O14qmLeG7hwzj6w+aoEo9ozHFuaB4sXHTDiYQv
   AvYQzHsbt2AvfvvQ0mt5Tvc7xLdQPXQNcXRIOqc3kdGKU6qauEyoKFiKl
   qgMestdEz1gVLaDAMmiYIE7hGj3nxIzElQpD4gSMBomPvT0IZld1YpVJ+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="325003916"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="325003916"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 08:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="664124177"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="664124177"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2023 08:03:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKLlJ-0006ay-1m;
	Tue, 24 Jan 2023 16:03:05 +0000
Date: Wed, 25 Jan 2023 00:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.15 121/122]
 drivers/gpu/drm/i915/i915_drv.c:989:34: warning: unused variable 'i915'
Message-ID: <202301242324.wPzOhX8S-lkp@intel.com>
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
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20230124/202301242324.wPzOhX8S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/3fb7d3522949e00f2711942ede083ef73aa2f6be
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.15
        git checkout 3fb7d3522949e00f2711942ede083ef73aa2f6be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_drv.c: In function 'i915_driver_lastclose':
>> drivers/gpu/drm/i915/i915_drv.c:989:34: warning: unused variable 'i915' [-Wunused-variable]
     989 |         struct drm_i915_private *i915 = to_i915(dev);
         |                                  ^~~~


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
