Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAF7EC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 00:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682556960; x=1714092960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tt/SA8OfoHDvr4u++N3N7ObprgE8oILFWHQ07JC7b4s=;
  b=MNRjA8w+EetCTDKRMy94l7gWYxOG48IwDmGBcULijXxIFN6Cc5608lQK
   jfTBavyt8D38eMzgByyK7XrrDGJ4ZapplL40CX/REEnXHwIf9A+gSiZEk
   0Oe3RYbdnRQem7eMIQWLWFryWqUY5Jkz4q7aepVWs2zm+Iarvg2vEW9Ov
   FBIzhq3sqcHh+6BZ3PCYIi2ZyoEWgBRey7CXAzHeYvyx6TnLZqP5XkNVT
   j/o+4V8vNtY4UAu/pMxuhc/bG/1GzH3ERm52Upf5CEnlSiTGD3YhFTLJH
   o3MJ6FQBho/Gf0dV57GZEOhXAVGnr+kvWXtOlfpYWtr6F/n1I1u0heXk3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="326889039"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="326889039"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 17:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805743622"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="805743622"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 17:55:58 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prpvR-0000cM-0f;
	Thu, 27 Apr 2023 00:55:57 +0000
Date: Thu, 27 Apr 2023 08:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Jason Ekstrand <jason@jlekstrand.net>,
	Sean Paul <seanpaul@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
	"Kristian H. Kristensen" <hoegsberg@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 1074/6555]
 drivers/gpu/drm/drm_syncobj.c:125:6: warning: no previous prototype for
 'drm_syncobj_add_callback'
Message-ID: <202304270846.6tEEzXXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 8e82fa1ed837aefa829a82894a950e7abc393536 [1074/6555] UPSTREAM: drm/syncobj: Drop add/remove_callback from driver interface
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230427/202304270846.6tEEzXXp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/8e82fa1ed837aefa829a82894a950e7abc393536
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 8e82fa1ed837aefa829a82894a950e7abc393536
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270846.6tEEzXXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_syncobj.c:125:6: warning: no previous prototype for 'drm_syncobj_add_callback' [-Wmissing-prototypes]
     125 | void drm_syncobj_add_callback(struct drm_syncobj *syncobj,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_syncobj.c:134:6: warning: no previous prototype for 'drm_syncobj_remove_callback' [-Wmissing-prototypes]
     134 | void drm_syncobj_remove_callback(struct drm_syncobj *syncobj,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_syncobj_add_callback +125 drivers/gpu/drm/drm_syncobj.c

e7aca5031a2fb51 Jason Ekstrand 2017-08-25  124  
9c19fb10a5893d6 Jason Ekstrand 2017-08-28 @125  void drm_syncobj_add_callback(struct drm_syncobj *syncobj,
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  126  			      struct drm_syncobj_cb *cb,
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  127  			      drm_syncobj_func_t func)
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  128  {
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  129  	spin_lock(&syncobj->lock);
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  130  	drm_syncobj_add_callback_locked(syncobj, cb, func);
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  131  	spin_unlock(&syncobj->lock);
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  132  }
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  133  
9c19fb10a5893d6 Jason Ekstrand 2017-08-28 @134  void drm_syncobj_remove_callback(struct drm_syncobj *syncobj,
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  135  				 struct drm_syncobj_cb *cb)
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  136  {
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  137  	spin_lock(&syncobj->lock);
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  138  	list_del_init(&cb->node);
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  139  	spin_unlock(&syncobj->lock);
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  140  }
9c19fb10a5893d6 Jason Ekstrand 2017-08-28  141  

:::::: The code at line 125 was first introduced by commit
:::::: 9c19fb10a5893d6501df4d0fb93d954d5fc1d91b drm/syncobj: Add a callback mechanism for replace_fence (v3)

:::::: TO: Jason Ekstrand <jason@jlekstrand.net>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
