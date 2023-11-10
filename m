Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4713D38C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 22:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLR13mey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699655740; x=1731191740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Klh4h1xcyRnH17nCmMFHY0B9BwdSFW05Trom1eslzyg=;
  b=TLR13meyZSR1WCCyBrvmc9IcqvK7/+t1jQHuRXgb5rH9kLeS318XF82P
   r+9ArazCBWTqkMG/j0AYBQehdk445skRuklp7diP6QWlT6V3ThsDOkynf
   5xYYtrqBpi6ePq0xWHtRSmZ0y99lFEQ/BX9Eqhla1mtaruLz00LJqeiK5
   Tn7qzc0Taj7k/BWrPHrZ5gICGw20m0/6MAbVbHya9IZUg+pJ/2JVXHfhz
   eFWKmWeCDYsk9JCJ/wk7T+2ExStnuamZx81f3VxzF/bOiFIsDbzWTPGMb
   dRQJpAAT6yRznMdWX2fDv6gqeH1DsQwmqtAi120wVQoTEaQ7Ek3WO9Piw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369570980"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="369570980"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 14:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763844164"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="763844164"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 14:35:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1a6B-0009zA-1f;
	Fri, 10 Nov 2023 22:35:35 +0000
Date: Sat, 11 Nov 2023 06:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [drm-intel:drm-intel-gt-next 6/6]
 drivers/gpu/drm/i915/i915_drm_client.c:92:9: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202311110610.h0m6ydI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   968853033d8aa4dbb80fbafa6f5d9b6a0ea21272
commit: 968853033d8aa4dbb80fbafa6f5d9b6a0ea21272 [6/6] drm/i915: Implement fdinfo memory stats printing
config: x86_64-randconfig-122-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110610.h0m6ydI5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110610.h0m6ydI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110610.h0m6ydI5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_drm_client.c:92:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/gpu/drm/i915/i915_drm_client.c:92:9: sparse:    struct list_head [noderef] __rcu *
>> drivers/gpu/drm/i915/i915_drm_client.c:92:9: sparse:    struct list_head *
>> drivers/gpu/drm/i915/i915_drm_client.c:92:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/gpu/drm/i915/i915_drm_client.c:92:9: sparse:    struct list_head [noderef] __rcu *
>> drivers/gpu/drm/i915/i915_drm_client.c:92:9: sparse:    struct list_head *

vim +92 drivers/gpu/drm/i915/i915_drm_client.c

    72	
    73	static void show_meminfo(struct drm_printer *p, struct drm_file *file)
    74	{
    75		struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
    76		struct drm_i915_file_private *fpriv = file->driver_priv;
    77		struct i915_drm_client *client = fpriv->client;
    78		struct drm_i915_private *i915 = fpriv->i915;
    79		struct drm_i915_gem_object *obj;
    80		struct intel_memory_region *mr;
    81		struct list_head *pos;
    82		unsigned int id;
    83	
    84		/* Public objects. */
    85		spin_lock(&file->table_lock);
    86		idr_for_each_entry(&file->object_idr, obj, id)
    87			obj_meminfo(obj, stats);
    88		spin_unlock(&file->table_lock);
    89	
    90		/* Internal objects. */
    91		rcu_read_lock();
  > 92		list_for_each_rcu(pos, &client->objects_list) {
    93			obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
    94								 client_link));
    95			if (!obj)
    96				continue;
    97			obj_meminfo(obj, stats);
    98			i915_gem_object_put(obj);
    99		}
   100		rcu_read_unlock();
   101	
   102		for_each_memory_region(mr, i915, id)
   103			drm_print_memory_stats(p,
   104					       &stats[id],
   105					       DRM_GEM_OBJECT_RESIDENT |
   106					       DRM_GEM_OBJECT_PURGEABLE,
   107					       mr->uabi_name);
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
