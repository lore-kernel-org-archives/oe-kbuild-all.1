Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0690F155A55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 23:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714087225; cv=none; b=I3bHCj0L3n3VImSlxrfVaW90SvsH750LeG8hQcQ3suYESlr1zBC+yIiCXs04inF+SIw6bAga2/U7a+LDTjb8FRtR8hsreI1FiK8B5xA1wjW97tyACFk3qZbSTKKGe8S+FrSWmnyDlLHat8nnj9kZNHaXmJKH7XEaYbTB+w1oiDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714087225; c=relaxed/simple;
	bh=WjlF56RFbDOf+RoflDg7tRDXeNBVD2Pqa7QsXHwguNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASvmetOQzbADocrOV+g+m0973htIBJDXCwSWlYBYNWNzIy+8ZlT/YmWoYuyT7lk0Ug3M9sPoXEtSOPzW46eOC6/NmxyafCs6pS3K6H/vuduOZqP4HyxDM2Yw9ZIBLARFv0b/QH0taboUTZ59P9e0ZXhtmfk9Sh29BNikznCuFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAx4Qb1x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAx4Qb1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714087224; x=1745623224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjlF56RFbDOf+RoflDg7tRDXeNBVD2Pqa7QsXHwguNU=;
  b=nAx4Qb1xQTw2TI2RDW7rvhn84YmQL0d5JzU+ewcrGWDw0kS3nqBZG8ww
   ivQ+bb8fXDK6TBKvcLAA80/ShdI5K6bvn7a9fE1zNleWf2QbRB3oSL2/1
   BiU7B38n17s6wV8uJhiMMmPqQ/MmPBP2m7KgtzMry5/yBSsJJKhZsXj+D
   LpNCE7jeqTRj4NCCdIgPjBQLq0hrT5dcagyfShJMxS0Psueu3bT2+h4vO
   C7h1vRzm1hv4WXdzmnE2oQYULHSro8dsPqGUbGQ0BI/FVbZTmueUsHRBw
   hMdZfCI53l57tf7FtEiJYG8GR48krGO6YW2/zlD8lzowqbtA2QxWHUFVb
   g==;
X-CSE-ConnectionGUID: f8FqyJjBRcGE3IW/vPAbpA==
X-CSE-MsgGUID: ZSdaQa5cT6KK3CV/tdBKAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9663402"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9663402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 16:20:23 -0700
X-CSE-ConnectionGUID: WF6yYGYiQj+q4bVAiA936A==
X-CSE-MsgGUID: YRwjelBWTkajVIHD9jWMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="30043368"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Apr 2024 16:20:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s08O2-00030O-2X;
	Thu, 25 Apr 2024 23:20:18 +0000
Date: Fri, 26 Apr 2024 07:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [drm-misc:for-linux-next 1/2]
 drivers/gpu/drm/i915/i915_debugfs.c:739:9: error: implicit declaration of
 function 'debugfs_create_file'; did you mean 'bus_create_file'?
Message-ID: <202404260726.nyGuvl59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: 33d5ae6cacf46a043578d711ae7239bab55b4455 [1/2] drm/print: drop include debugfs.h and include where needed
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240426/202404260726.nyGuvl59-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260726.nyGuvl59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260726.nyGuvl59-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_debugfs.c: In function 'i915_debugfs_register':
>> drivers/gpu/drm/i915/i915_debugfs.c:739:9: error: implicit declaration of function 'debugfs_create_file'; did you mean 'bus_create_file'? [-Werror=implicit-function-declaration]
     739 |         debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
         |         ^~~~~~~~~~~~~~~~~~~
         |         bus_create_file
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/i915/i915_debugfs_params.c: In function 'i915_debugfs_create_int':
>> drivers/gpu/drm/i915/i915_debugfs_params.c:213:16: error: implicit declaration of function 'debugfs_create_file_unsafe'; did you mean 'sysfs_create_file_ns'? [-Werror=implicit-function-declaration]
     213 |         return debugfs_create_file_unsafe(name, mode, parent, value,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                sysfs_create_file_ns
>> drivers/gpu/drm/i915/i915_debugfs_params.c:213:16: warning: returning 'int' from a function with return type 'struct dentry *' makes pointer from integer without a cast [-Wint-conversion]
     213 |         return debugfs_create_file_unsafe(name, mode, parent, value,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     214 |                                           RO(mode) ? &i915_param_int_fops_ro :
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     215 |                                           &i915_param_int_fops);
         |                                           ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c: In function 'i915_debugfs_create_uint':
   drivers/gpu/drm/i915/i915_debugfs_params.c:222:16: warning: returning 'int' from a function with return type 'struct dentry *' makes pointer from integer without a cast [-Wint-conversion]
     222 |         return debugfs_create_file_unsafe(name, mode, parent, value,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     223 |                                           RO(mode) ? &i915_param_uint_fops_ro :
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     224 |                                           &i915_param_uint_fops);
         |                                           ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c: In function 'i915_debugfs_create_charp':
>> drivers/gpu/drm/i915/i915_debugfs_params.c:231:16: error: implicit declaration of function 'debugfs_create_file'; did you mean 'bus_create_file'? [-Werror=implicit-function-declaration]
     231 |         return debugfs_create_file(name, mode, parent, value,
         |                ^~~~~~~~~~~~~~~~~~~
         |                bus_create_file
   drivers/gpu/drm/i915/i915_debugfs_params.c:231:16: warning: returning 'int' from a function with return type 'struct dentry *' makes pointer from integer without a cast [-Wint-conversion]
     231 |         return debugfs_create_file(name, mode, parent, value,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     232 |                                    RO(mode) ? &i915_param_charp_fops_ro :
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     233 |                                    &i915_param_charp_fops);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c: In function 'i915_debugfs_params':
>> drivers/gpu/drm/i915/i915_debugfs_params.c:254:15: error: implicit declaration of function 'debugfs_create_dir'; did you mean 'kernfs_create_dir'? [-Werror=implicit-function-declaration]
     254 |         dir = debugfs_create_dir("i915_params", minor->debugfs_root);
         |               ^~~~~~~~~~~~~~~~~~
         |               kernfs_create_dir
>> drivers/gpu/drm/i915/i915_debugfs_params.c:254:13: warning: assignment to 'struct dentry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     254 |         dir = debugfs_create_dir("i915_params", minor->debugfs_root);
         |             ^
>> drivers/gpu/drm/i915/i915_debugfs_params.c:240:42: error: 'debugfs_create_bool' undeclared (first use in this function); did you mean 'kernfs_create_root'?
     240 |                                  bool *: debugfs_create_bool,           \
         |                                          ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c:264:43: note: in expansion of macro '_i915_param_create_file'
     264 | #define REGISTER(T, x, unused, mode, ...) _i915_param_create_file(dir, #x, mode, &params->x);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_params.h:49:9: note: in expansion of macro 'REGISTER'
      49 |         param(int, modeset, -1, 0400) \
         |         ^~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c:265:9: note: in expansion of macro 'I915_PARAMS_FOR_EACH'
     265 |         I915_PARAMS_FOR_EACH(REGISTER);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c:240:42: note: each undeclared identifier is reported only once for each function it appears in
     240 |                                  bool *: debugfs_create_bool,           \
         |                                          ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c:264:43: note: in expansion of macro '_i915_param_create_file'
     264 | #define REGISTER(T, x, unused, mode, ...) _i915_param_create_file(dir, #x, mode, &params->x);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_params.h:49:9: note: in expansion of macro 'REGISTER'
      49 |         param(int, modeset, -1, 0400) \
         |         ^~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c:265:9: note: in expansion of macro 'I915_PARAMS_FOR_EACH'
     265 |         I915_PARAMS_FOR_EACH(REGISTER);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_debugfs_params.c: At top level:
>> drivers/gpu/drm/i915/i915_debugfs_params.c:228:1: warning: 'i915_debugfs_create_charp' defined but not used [-Wunused-function]
     228 | i915_debugfs_create_charp(const char *name, umode_t mode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/i915_debugfs_params.c:219:1: warning: 'i915_debugfs_create_uint' defined but not used [-Wunused-function]
     219 | i915_debugfs_create_uint(const char *name, umode_t mode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/i915_debugfs_params.c:210:1: warning: 'i915_debugfs_create_int' defined but not used [-Wunused-function]
     210 | i915_debugfs_create_int(const char *name, umode_t mode,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/i915/i915_gpu_error.c: In function 'i915_gpu_error_debugfs_register':
>> drivers/gpu/drm/i915/i915_gpu_error.c:2485:9: error: implicit declaration of function 'debugfs_create_file'; did you mean 'bus_create_file'? [-Werror=implicit-function-declaration]
    2485 |         debugfs_create_file("i915_error_state", 0644, minor->debugfs_root, i915,
         |         ^~~~~~~~~~~~~~~~~~~
         |         bus_create_file
   cc1: some warnings being treated as errors


vim +739 drivers/gpu/drm/i915/i915_debugfs.c

34b9674c786c73 drivers/gpu/drm/i915/i915_debugfs.c     Daniel Vetter      2013-07-04  731  
f06b2052f74d7b drivers/gpu/drm/i915/i915_debugfs.c     Wambui Karuga      2020-03-10  732  void i915_debugfs_register(struct drm_i915_private *dev_priv)
2017263e9e7297 drivers/gpu/drm/i915/i915_gem_debugfs.c Ben Gamari         2009-02-17  733  {
91c8a326a19211 drivers/gpu/drm/i915/i915_debugfs.c     Chris Wilson       2016-07-05  734  	struct drm_minor *minor = dev_priv->drm.primary;
6cc42152b02b3f drivers/gpu/drm/i915/i915_debugfs.c     Maarten Lankhorst  2018-06-28  735  	int i;
f3cd474bb235f2 drivers/gpu/drm/i915/i915_debugfs.c     Chris Wilson       2009-10-13  736  
c43c5a8818d4c3 drivers/gpu/drm/i915/i915_debugfs.c     Jani Nikula        2019-12-05  737  	i915_debugfs_params(dev_priv);
c43c5a8818d4c3 drivers/gpu/drm/i915/i915_debugfs.c     Jani Nikula        2019-12-05  738  
0780f3b6f054ec drivers/gpu/drm/i915/i915_debugfs.c     Greg Kroah-Hartman 2019-06-13 @739  	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,

:::::: The code at line 739 was first introduced by commit
:::::: 0780f3b6f054ec6497a1a16edb9bf5832c0b92f4 drm/i915: no need to check return value of debugfs_create functions

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
