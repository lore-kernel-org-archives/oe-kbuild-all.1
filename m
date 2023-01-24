Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE163BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674566940; x=1706102940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=589UTL6CW7hQ9r16YVl4P4x+xOEaDLy/Mv0V4+qlAzU=;
  b=HpC/yXis6p1oQ4TBRprxvvANcwqcgHsZxbbldy6BV91p5jUUldb5LpQf
   4y3x+uhPXNqAH3wuAE4U8ehkMrqA3n6jbiBC0PuePU/Bpm+zknsxTcJpm
   gOQ6O+SR1hQC2Xbe8I+qJ44rG5c6G7DjkRuArxATlygE9kSSO32HQemiy
   yrN1nDe7CnjcpS1fc1n/R34Ty5kcoPMnXIXQoHhix+baYC/d58NrztesJ
   RyMXeEnGToVygKhDb+mR1JEBd4ZOq3QhyMKM3ClkjVAit9QMQXaxVfM7T
   heaDg8CNwowc94ezcjvWS/R5QYD6sz1S8jZj8E1lOwpyZ79sjC7X3X4qn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305954910"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="305954910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 05:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692591774"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="692591774"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 05:28:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKJM8-0006Vb-2t;
	Tue, 24 Jan 2023 13:28:56 +0000
Date: Tue, 24 Jan 2023 21:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 238/238]
 drivers/gpu/drm/i915/i915_drv.c:989:27: warning: unused variable 'i915'
Message-ID: <202301242149.YuXdJg8g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   889a4ffa63de7a3b3073f13602ef12d4276cb138
commit: 889a4ffa63de7a3b3073f13602ef12d4276cb138 [238/238] drm/i915: Allow switching away via vga-switcheroo if uninitialized
config: x86_64-randconfig-r025-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242149.YuXdJg8g-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=889a4ffa63de7a3b3073f13602ef12d4276cb138
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 889a4ffa63de7a3b3073f13602ef12d4276cb138
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_drv.c:989:27: warning: unused variable 'i915' [-Wunused-variable]
           struct drm_i915_private *i915 = to_i915(dev);
                                    ^
   1 warning generated.


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
