Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165FA28
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 04:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686975136; x=1718511136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W6JKW9zPoix4BiLHytf0ruLXlBN52JKVkQZgkfMPD18=;
  b=eMQqODnqV/CzSOdO/6zlSsayXdrrv/H/OC03Z/b+Y6864MzVIsw/1v+4
   lrAVn4MjJzUPYN2Mw6sCOkaru098gVyO0mvMruWsCnKeqWMo1ILSaEudC
   XKrAVmC/NuYbHlP4yG5GsbIGvMTlNR294a9TMkC9IbHM//v4kXSOXD476
   hQQxe0+wm09PMjZUoZwxcrkBWVaX4fP2BRKOaw7dQoWfJSNBRd/dm3nMJ
   M/MIU9nRyZCE/nNqfgTlaU7Ih0n+i9JJVauFl1b58VYVG92QfwUjI1KNe
   ql3s1bYjOIlq4i9dYs2DxeAx09VrqNVAjvvQGBGXDW2XbUf3+NVHur1hp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="349069417"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="349069417"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 21:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="713095470"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="713095470"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jun 2023 21:12:14 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qANIL-0002FY-1q;
	Sat, 17 Jun 2023 04:12:13 +0000
Date: Sat, 17 Jun 2023 12:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 19/59]
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:772:13: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202306171252.yTQ0sPbf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   58db187472cb7ae781c98a3aa05a790a2d4f8680
commit: 6bffcc8e8d40ca2b17197bee47338c1c35277eef [19/59] BACKPORT: drm/i915: Drop __rcu from gem_context->vm
config: i386-randconfig-s043-20230615 (https://download.01.org/0day-ci/archive/20230617/202306171252.yTQ0sPbf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171252.yTQ0sPbf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171252.yTQ0sPbf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:772:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:772:13: sparse:    struct i915_address_space [noderef] __rcu *
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:772:13: sparse:    struct i915_address_space *
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:798:49: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:798:49: sparse:    struct i915_address_space [noderef] __rcu *
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:798:49: sparse:    struct i915_address_space *

vim +772 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

4ff4b44cbb70c2 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  762  
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  763  static int eb_select_context(struct i915_execbuffer *eb)
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  764  {
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  765  	struct i915_gem_context *ctx;
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  766  
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  767  	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->rsvd1);
5158fb6ca4e595 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Jason Ekstrand 2021-07-08  768  	if (unlikely(IS_ERR(ctx)))
5158fb6ca4e595 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Jason Ekstrand 2021-07-08  769  		return PTR_ERR(ctx);
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  770  
8f2a1057d6ec21 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2019-04-25  771  	eb->gem_context = ctx;
a4e7ccdac38ec8 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson   2019-10-04 @772  	if (rcu_access_pointer(ctx->vm))
4f2c7337af638b drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2018-09-01  773  		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  774  
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  775  	return 0;
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  776  }
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson   2017-06-16  777  

:::::: The code at line 772 was first introduced by commit
:::::: a4e7ccdac38ec8335d9e4e2656c1a041c77feae1 drm/i915: Move context management under GEM

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
