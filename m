Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC6ED3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 05:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691644631; x=1723180631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EnSYzqifzvsagwFRy6FFx7PXyJJwVY1BT3a5fddqK50=;
  b=GOkxQ7oWHtqGIcm+vHyqN2Tocl0pIfoelq24xzFJ1ylRXZBnbUkMx+28
   6qG3M5S6xij7rtv7EcuFtkrlgET345q+VL4D9YMG1cZT1oIbis8CEzLNN
   FKYnj3KPHYfMc5m6o8Akf16ZagDQt2hvhnln1u5FYvZ33bDy9EEUDxO90
   BPi5wjOgWD8MkzHd9mrMFNWx6Ba7r/6tiZiQxbjK5UFZTa9wouySCU76c
   +JVd5ITl4PHGD5bxJ0M7RdeQduJCUQG9FQ33BAb54Z5lFrcDyhT0tqLAV
   OHplv/YkyAOwfOUAO9eDc2VOGmLxftm2VWBGW5qckYP91qPxQ7Uxm6lFr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="457657718"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="457657718"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 22:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="978649917"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="978649917"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2023 22:17:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTy2d-0006ji-1L;
	Thu, 10 Aug 2023 05:16:59 +0000
Date: Thu, 10 Aug 2023 13:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, airlied@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/2] drm/panic: Add a drm panic handler
Message-ID: <202308101307.hbEyAamN-lkp@intel.com>
References: <20230809192514.158062-2-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809192514.158062-2-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6995e2de6891c724bfeb2db33d7b87775f913ad1]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Add-a-drm-panic-handler/20230810-032733
base:   6995e2de6891c724bfeb2db33d7b87775f913ad1
patch link:    https://lore.kernel.org/r/20230809192514.158062-2-jfalempe%40redhat.com
patch subject: [PATCH 1/2] drm/panic: Add a drm panic handler
config: nios2-randconfig-r011-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101307.hbEyAamN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101307.hbEyAamN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101307.hbEyAamN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_panic.c:246:6: warning: no previous prototype for 'drm_panic_init_client' [-Wmissing-prototypes]
     246 | void drm_panic_init_client(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_panic.c:272:6: warning: no previous prototype for 'drm_panic_init' [-Wmissing-prototypes]
     272 | void drm_panic_init(void)
         |      ^~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_panic.c:282:6: warning: no previous prototype for 'drm_panic_exit' [-Wmissing-prototypes]
     282 | void drm_panic_exit(void)
         |      ^~~~~~~~~~~~~~
--
>> drivers/gpu/drm/drm_panic.c:28: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This module displays a user friendly message on screen when a kernel panic
   drivers/gpu/drm/drm_panic.c:36: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * List of drm clients
>> drivers/gpu/drm/drm_panic.c:283: warning: expecting prototype for drm_log_exit(). Prototype was for drm_panic_exit() instead


vim +/drm_panic_init_client +246 drivers/gpu/drm/drm_panic.c

   245	
 > 246	void drm_panic_init_client(struct drm_device *dev)
   247	{
   248		struct dpanic_drm_client *new;
   249		int ret;
   250	
   251		new = kzalloc(sizeof(*new), GFP_KERNEL);
   252		if (!new)
   253			return;
   254	
   255		ret = drm_client_init(dev, &new->client, "drm_panic", NULL);
   256		if (ret < 0) {
   257			kfree(new);
   258			return;
   259		}
   260		drm_client_register(&new->client);
   261		list_add_tail(&new->head, &dpanic_clients);
   262	
   263		drm_info(dev, "Registered with drm panic\n");
   264	}
   265	EXPORT_SYMBOL(drm_panic_init_client);
   266	
   267	/**
   268	 * drm_panic_init() - Initialize drm-panic subsystem
   269	 *
   270	 * register the panic notifier
   271	 */
 > 272	void drm_panic_init(void)
   273	{
   274		/* register panic handler */
   275		atomic_notifier_chain_register(&panic_notifier_list,
   276					       &drm_panic_notifier);
   277	}
   278	
   279	/**
   280	 * drm_log_exit() - Shutdown drm-panic subsystem
   281	 */
 > 282	void drm_panic_exit(void)
 > 283	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
