Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E59256C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J99twqf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698307873; x=1729843873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zKrpxgJ2w5X6Wj70FSWcImiZ5ECvwfPf1bbpeWxuMFw=;
  b=J99twqf73YbuQ5Ggx/QaH7m4mYAqkjsXLs8pwq8EF9g8wqbU9Mm5fbcD
   DwmCE9bAjMhiY9AQjHiLVxedvXoz8G0PMEE6P7O1Zgd4yUv/1/E7GEEAg
   ePPW94oEc5BnvpbXRMJ6SeqhPjwZ8z3braUBeS06qqfqx8vu48evK0vM2
   exoL0UhOGAA44N3gJUaGakcDQCpsvXhJQSJA7j9U7QyDcipTGdo6qhkiK
   MMl/t5sQMo7tKiUBR8NP39dFJZHI8RIztfNnXfNOM5wiY6QECVIRMSoDb
   dwvs6yQDu2QXwk6TUEythIXbrtXwtmrbdhQJLYv0JAmHnjHgZ+r+ryLZe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386367314"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="386367314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="7171625"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2023 01:11:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvvSP-0009cp-0J;
	Thu, 26 Oct 2023 08:11:09 +0000
Date: Thu, 26 Oct 2023 16:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/8] drm/cgroup: Track DRM clients per cgroup
Message-ID: <202310261557.6XCvtvTX-lkp@intel.com>
References: <20231024160727.282960-3-tvrtko.ursulin@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024160727.282960-3-tvrtko.ursulin@linux.intel.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next next-20231026]
[cannot apply to tj-cgroup/for-next drm-intel/for-linux-next-fixes linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/cgroup-Add-the-DRM-cgroup-controller/20231025-023533
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231024160727.282960-3-tvrtko.ursulin%40linux.intel.com
patch subject: [RFC 2/8] drm/cgroup: Track DRM clients per cgroup
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310261557.6XCvtvTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261557.6XCvtvTX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_file.h:388: warning: Function parameter or member '__css' not described in 'drm_file'
>> ./include/drm/drm_file.h:388: warning: Function parameter or member 'clink' not described in 'drm_file'

vim +388 ./include/drm/drm_file.h

75ea74733a1de0 Tvrtko Ursulin 2023-10-24  289  
b93658f83fa7f8 Daniel Vetter  2017-03-08  290  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  291  	 * @object_idr:
b93658f83fa7f8 Daniel Vetter  2017-03-08  292  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  293  	 * Mapping of mm object handles to object pointers. Used by the GEM
b93658f83fa7f8 Daniel Vetter  2017-03-08  294  	 * subsystem. Protected by @table_lock.
b93658f83fa7f8 Daniel Vetter  2017-03-08  295  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  296  	struct idr object_idr;
b93658f83fa7f8 Daniel Vetter  2017-03-08  297  
b93658f83fa7f8 Daniel Vetter  2017-03-08  298  	/** @table_lock: Protects @object_idr. */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  299  	spinlock_t table_lock;
a8f8b1d9b87014 Daniel Vetter  2017-03-08  300  
e9083420bbacce Dave Airlie    2017-04-04  301  	/** @syncobj_idr: Mapping of sync object handles to object pointers. */
e9083420bbacce Dave Airlie    2017-04-04  302  	struct idr syncobj_idr;
e9083420bbacce Dave Airlie    2017-04-04  303  	/** @syncobj_table_lock: Protects @syncobj_idr. */
e9083420bbacce Dave Airlie    2017-04-04  304  	spinlock_t syncobj_table_lock;
e9083420bbacce Dave Airlie    2017-04-04  305  
b93658f83fa7f8 Daniel Vetter  2017-03-08  306  	/** @filp: Pointer to the core file structure. */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  307  	struct file *filp;
b93658f83fa7f8 Daniel Vetter  2017-03-08  308  
b93658f83fa7f8 Daniel Vetter  2017-03-08  309  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  310  	 * @driver_priv:
b93658f83fa7f8 Daniel Vetter  2017-03-08  311  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  312  	 * Optional pointer for driver private data. Can be allocated in
b93658f83fa7f8 Daniel Vetter  2017-03-08  313  	 * &drm_driver.open and should be freed in &drm_driver.postclose.
b93658f83fa7f8 Daniel Vetter  2017-03-08  314  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  315  	void *driver_priv;
a8f8b1d9b87014 Daniel Vetter  2017-03-08  316  
a8f8b1d9b87014 Daniel Vetter  2017-03-08  317  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  318  	 * @fbs:
b93658f83fa7f8 Daniel Vetter  2017-03-08  319  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  320  	 * List of &struct drm_framebuffer associated with this file, using the
b93658f83fa7f8 Daniel Vetter  2017-03-08  321  	 * &drm_framebuffer.filp_head entry.
a8f8b1d9b87014 Daniel Vetter  2017-03-08  322  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  323  	 * Protected by @fbs_lock. Note that the @fbs list holds a reference on
b93658f83fa7f8 Daniel Vetter  2017-03-08  324  	 * the framebuffer object to prevent it from untimely disappearing.
a8f8b1d9b87014 Daniel Vetter  2017-03-08  325  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  326  	struct list_head fbs;
b93658f83fa7f8 Daniel Vetter  2017-03-08  327  
b93658f83fa7f8 Daniel Vetter  2017-03-08  328  	/** @fbs_lock: Protects @fbs. */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  329  	struct mutex fbs_lock;
a8f8b1d9b87014 Daniel Vetter  2017-03-08  330  
b93658f83fa7f8 Daniel Vetter  2017-03-08  331  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  332  	 * @blobs:
b93658f83fa7f8 Daniel Vetter  2017-03-08  333  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  334  	 * User-created blob properties; this retains a reference on the
b93658f83fa7f8 Daniel Vetter  2017-03-08  335  	 * property.
b93658f83fa7f8 Daniel Vetter  2017-03-08  336  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  337  	 * Protected by @drm_mode_config.blob_lock;
b93658f83fa7f8 Daniel Vetter  2017-03-08  338  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  339  	struct list_head blobs;
a8f8b1d9b87014 Daniel Vetter  2017-03-08  340  
b93658f83fa7f8 Daniel Vetter  2017-03-08  341  	/** @event_wait: Waitqueue for new events added to @event_list. */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  342  	wait_queue_head_t event_wait;
b93658f83fa7f8 Daniel Vetter  2017-03-08  343  
b93658f83fa7f8 Daniel Vetter  2017-03-08  344  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  345  	 * @pending_event_list:
b93658f83fa7f8 Daniel Vetter  2017-03-08  346  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  347  	 * List of pending &struct drm_pending_event, used to clean up pending
b93658f83fa7f8 Daniel Vetter  2017-03-08  348  	 * events in case this file gets closed before the event is signalled.
b93658f83fa7f8 Daniel Vetter  2017-03-08  349  	 * Uses the &drm_pending_event.pending_link entry.
b93658f83fa7f8 Daniel Vetter  2017-03-08  350  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  351  	 * Protect by &drm_device.event_lock.
b93658f83fa7f8 Daniel Vetter  2017-03-08  352  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  353  	struct list_head pending_event_list;
b93658f83fa7f8 Daniel Vetter  2017-03-08  354  
b93658f83fa7f8 Daniel Vetter  2017-03-08  355  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  356  	 * @event_list:
b93658f83fa7f8 Daniel Vetter  2017-03-08  357  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  358  	 * List of &struct drm_pending_event, ready for delivery to userspace
b93658f83fa7f8 Daniel Vetter  2017-03-08  359  	 * through drm_read(). Uses the &drm_pending_event.link entry.
b93658f83fa7f8 Daniel Vetter  2017-03-08  360  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  361  	 * Protect by &drm_device.event_lock.
b93658f83fa7f8 Daniel Vetter  2017-03-08  362  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  363  	struct list_head event_list;
b93658f83fa7f8 Daniel Vetter  2017-03-08  364  
b93658f83fa7f8 Daniel Vetter  2017-03-08  365  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  366  	 * @event_space:
b93658f83fa7f8 Daniel Vetter  2017-03-08  367  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  368  	 * Available event space to prevent userspace from
b93658f83fa7f8 Daniel Vetter  2017-03-08  369  	 * exhausting kernel memory. Currently limited to the fairly arbitrary
b93658f83fa7f8 Daniel Vetter  2017-03-08  370  	 * value of 4KB.
b93658f83fa7f8 Daniel Vetter  2017-03-08  371  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  372  	int event_space;
a8f8b1d9b87014 Daniel Vetter  2017-03-08  373  
b93658f83fa7f8 Daniel Vetter  2017-03-08  374  	/** @event_read_lock: Serializes drm_read(). */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  375  	struct mutex event_read_lock;
a8f8b1d9b87014 Daniel Vetter  2017-03-08  376  
b93658f83fa7f8 Daniel Vetter  2017-03-08  377  	/**
b93658f83fa7f8 Daniel Vetter  2017-03-08  378  	 * @prime:
b93658f83fa7f8 Daniel Vetter  2017-03-08  379  	 *
b93658f83fa7f8 Daniel Vetter  2017-03-08  380  	 * Per-file buffer caches used by the PRIME buffer sharing code.
b93658f83fa7f8 Daniel Vetter  2017-03-08  381  	 */
a8f8b1d9b87014 Daniel Vetter  2017-03-08  382  	struct drm_prime_file_private prime;
b93658f83fa7f8 Daniel Vetter  2017-03-08  383  
b93658f83fa7f8 Daniel Vetter  2017-03-08  384  	/* private: */
ee22f76306a683 Dave Airlie    2019-04-23  385  #if IS_ENABLED(CONFIG_DRM_LEGACY)
b93658f83fa7f8 Daniel Vetter  2017-03-08  386  	unsigned long lock_count; /* DRI1 legacy lock count */
ee22f76306a683 Dave Airlie    2019-04-23  387  #endif
a8f8b1d9b87014 Daniel Vetter  2017-03-08 @388  };
a8f8b1d9b87014 Daniel Vetter  2017-03-08  389  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
