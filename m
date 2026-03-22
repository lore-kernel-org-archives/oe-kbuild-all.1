Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381032860F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774185956; cv=none; b=OSYWcBhkrtH8tUVOf51w7WijFy59xnMVZh7viSMg0/yrcFyLlxLLK+lsfxGfOLG2XZgIfNDy9LuamdfuWRuMD2NRk6RP7QEo/gx4jUIY6PHoqO6jFzYcZXjSs8NLr1tZrnOlx3g5YNJ5lZUVquemz85LpwzqAsjDZ4QBBe2IaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774185956; c=relaxed/simple;
	bh=tXmbjanna8jwNI1OUqxIulxJ1F9340+85/yv+vfrl2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s88aqTnvPisFDwqrMs9p9e4xiSAKOQobY/rw8ixUQEndrUBPzzw/iv1ExQ2a8YNj6IrhUCOZpAPQT6MYGUVNnER/JFZoMgUYshxjU3tR73HFjOzGRpxUxWS6xbhJpIqsx/caRVqMw70Zp9jamsdSj90etgTVITA5HHyldhPMWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYV/qftf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYV/qftf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774185954; x=1805721954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXmbjanna8jwNI1OUqxIulxJ1F9340+85/yv+vfrl2w=;
  b=GYV/qftfwCP5cis4lwxdoflXYYARhOgLLQ2eZafct30TURcIRna/S1cN
   K30qGzAudwhA5hO79z26VXjFos8z7TaNuff9gFIGuh7mIbKlXa5ADAgQR
   siWln/od480YND203j3giyoTaiHWRP2stKbmx99BjZP1V128sgIV12JoG
   6GofjDOONu2ON91OfrDhZ3Dd6FdoZLbmXPsVrwwIsb+FNjJ7vnrL9Rg0z
   ifhH1zbeDFEOiKDWGWc/VX32DxMLKrVl7FD8NMG8aYLZ2R3GYMeovRLdL
   xb6kIMbLkNgK57Uw7sZoixF2DDzO/E1Zo8AyzdDnNbyc9XfCPNTi51b6S
   A==;
X-CSE-ConnectionGUID: 3/sIoM6HQhe+S0dPvBMptg==
X-CSE-MsgGUID: 8Bp/s4bAT6WAnVDFsYdimQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75088376"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75088376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 06:25:53 -0700
X-CSE-ConnectionGUID: f30IYCVEQfuVxUMCuiJpfg==
X-CSE-MsgGUID: 3N59DuJCQ+eUTTnvUhPUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="246798722"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2026 06:25:48 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4IoM-000000006Mr-2Eas;
	Sun, 22 Mar 2026 13:25:46 +0000
Date: Sun, 22 Mar 2026 14:25:40 +0100
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: Change gfp_t to unsigned long
Message-ID: <202603221419.9kAfrwc5-lkp@intel.com>
References: <20260319-gfp64-v1-5-2c73b8d42b7f@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-gfp64-v1-5-2c73b8d42b7f@google.com>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/drm-managed-Use-special-gfp_t-format-specifier/20260322-145930
base:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
patch link:    https://lore.kernel.org/r/20260319-gfp64-v1-5-2c73b8d42b7f%40google.com
patch subject: [PATCH 5/5] mm: Change gfp_t to unsigned long
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260322/202603221419.9kAfrwc5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221419.9kAfrwc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221419.9kAfrwc5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:23,
                    from lib/test_lockup.c:8:
>> lib/test_lockup.c:133:47: error: expected ';' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:175:23: note: in definition of macro 'module_param_named_unsafe'
     175 |         param_check_##type(name, &(value));                             \
         |                       ^~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:175:32: error: expected ')' before ',' token
     175 |         param_check_##type(name, &(value));                             \
         |                                ^
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:176:39: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |                                       ^~~~~~~~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:47: error: expected '}' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:305:11: note: to match this '{'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
   include/linux/moduleparam.h:192:9: note: in expansion of macro '__module_param_call'
     192 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:23,
                    from test_lockup.c:8:
   test_lockup.c:133:47: error: expected ';' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:175:23: note: in definition of macro 'module_param_named_unsafe'
     175 |         param_check_##type(name, &(value));                             \
         |                       ^~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:175:32: error: expected ')' before ',' token
     175 |         param_check_##type(name, &(value));                             \
         |                                ^
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/moduleparam.h:176:39: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |                                       ^~~~~~~~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:47: error: expected '}' before 'long'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         |                                               ^~~~
   include/linux/moduleparam.h:305:46: note: in definition of macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |                                              ^~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:305:11: note: to match this '{'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
   include/linux/moduleparam.h:192:9: note: in expansion of macro '__module_param_call'
     192 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1,    \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:176:9: note: in expansion of macro 'module_param_cb_unsafe'
     176 |         module_param_cb_unsafe(name, &param_ops_##type, &value, perm);  \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:149:9: note: in expansion of macro 'module_param_named_unsafe'
     149 |         module_param_named_unsafe(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   test_lockup.c:133:1: note: in expansion of macro 'module_param_unsafe'
     133 | module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
         | ^~~~~~~~~~~~~~~~~~~


vim +133 lib/test_lockup.c

   131	
   132	static gfp_t alloc_pages_gfp = GFP_KERNEL;
 > 133	module_param_unsafe(alloc_pages_gfp, unsigned long, 0400);
   134	MODULE_PARM_DESC(alloc_pages_gfp, "allocate pages with this gfp_mask, default GFP_KERNEL");
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
