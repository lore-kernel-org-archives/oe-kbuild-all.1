Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E1E23CE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 05:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgPlJ9SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700978256; x=1732514256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lanp09ZVtq5jbkTR/klKSK/YI2954WcKopynYqS/Xm8=;
  b=DgPlJ9SE3sASeH8XnA7K2J73gYUPZRF4lnbk3GFCqlWLQK2X3JyMqxlV
   Vve20azFDSSReXmgSyh5mnEvbc8YiDCY7q7U4BvIloxs9oXdkFUfdMEFi
   rIOYbs3KGnuRpPHVBhD0tDgBUh+9d2Ffw0K5/FaIziTc9EnII/GWQXcx2
   +8+mJrKavJ0ldFEauLwONVZRoPCDhGx+L3z5rh4mdv4Psiv9Wp2D26ruw
   TZOvCVSXUr427q6eZndcvLW20sOp16uP+ZiGqgxsRhIIVo5us8SwkH7Tb
   m3JmN1n0Lo/M39xPnmEYYG/lMLgg7Ftm6txqq52rPZ52YFe2seDNSvjs2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="396454411"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="396454411"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 21:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="885652113"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="885652113"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2023 21:57:34 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7895-0004uM-32;
	Sun, 26 Nov 2023 05:57:31 +0000
Date: Sun, 26 Nov 2023 13:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 2312/2351] htmldocs:
 ./include/drm/drm_file.h:218: warning: Incorrect use of kernel-doc format:
          * This is to enable advance degamma modes using
Message-ID: <202311261008.VqTfZ1vy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   b375c3f82247ffd48e5c37e98dafa086bc0eb81b
commit: aab52f11001fb2495b3bc774b6ebbaa34fb80c4f [2312/2351] drm: Add Client Cap for advance degamma mode
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311261008.VqTfZ1vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261008.VqTfZ1vy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_file.h:218: warning: Incorrect use of kernel-doc format:          * This is to enable advance degamma modes using
>> ./include/drm/drm_file.h:393: warning: Function parameter or member 'advance_degamma_mode_active' not described in 'drm_file'
>> ./include/drm/drm_atomic.h:431: warning: Function parameter or member 'advance_degamma_mode_active' not described in 'drm_atomic_state'
>> ./include/drm/drm_crtc.h:166: warning: Incorrect use of kernel-doc format:          * This is to indicate advance degamma mode support
>> ./include/drm/drm_crtc.h:423: warning: Function parameter or member 'advance_degamma_mode_active' not described in 'drm_crtc_state'
>> ./include/drm/drm_crtc.h:1233: warning: Function parameter or member 'advance_degamma_mode_active' not described in 'drm_crtc'

vim +218 ./include/drm/drm_file.h

   158	
   159	/**
   160	 * struct drm_file - DRM file private data
   161	 *
   162	 * This structure tracks DRM state per open file descriptor.
   163	 */
   164	struct drm_file {
   165		/**
   166		 * @authenticated:
   167		 *
   168		 * Whether the client is allowed to submit rendering, which for legacy
   169		 * nodes means it must be authenticated.
   170		 *
   171		 * See also the :ref:`section on primary nodes and authentication
   172		 * <drm_primary_node>`.
   173		 */
   174		bool authenticated;
   175	
   176		/**
   177		 * @stereo_allowed:
   178		 *
   179		 * True when the client has asked us to expose stereo 3D mode flags.
   180		 */
   181		bool stereo_allowed;
   182	
   183		/**
   184		 * @universal_planes:
   185		 *
   186		 * True if client understands CRTC primary planes and cursor planes
   187		 * in the plane list. Automatically set when @atomic is set.
   188		 */
   189		bool universal_planes;
   190	
   191		/** @atomic: True if client understands atomic properties. */
   192		bool atomic;
   193	
   194		/**
   195		 * @aspect_ratio_allowed:
   196		 *
   197		 * True, if client can handle picture aspect ratios, and has requested
   198		 * to pass this information along with the mode.
   199		 */
   200		bool aspect_ratio_allowed;
   201	
   202		/**
   203		 * @writeback_connectors:
   204		 *
   205		 * True if client understands writeback connectors
   206		 */
   207		bool writeback_connectors;
   208	
   209		/**
   210		 * This is to enable advance gamma modes using
   211		 * gamma_mode property
   212		 *
   213		 * True if client understands advance gamma
   214		 */
   215		bool advance_gamma_mode_active : 1;
   216	
   217		/**
 > 218		 * This is to enable advance degamma modes using
   219		 * 64 bit LUT values
   220		 *
   221		 * True if client understands advance degamma
   222		 */
   223		bool advance_degamma_mode_active : 1;
   224	
   225		/**
   226		 * @was_master:
   227		 *
   228		 * This client has or had, master capability. Protected by struct
   229		 * &drm_device.master_mutex.
   230		 *
   231		 * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
   232		 * client is or was master in the past.
   233		 */
   234		bool was_master;
   235	
   236		/**
   237		 * @is_master:
   238		 *
   239		 * This client is the creator of @master. Protected by struct
   240		 * &drm_device.master_mutex.
   241		 *
   242		 * See also the :ref:`section on primary nodes and authentication
   243		 * <drm_primary_node>`.
   244		 */
   245		bool is_master;
   246	
   247		/**
   248		 * @master:
   249		 *
   250		 * Master this node is currently associated with. Protected by struct
   251		 * &drm_device.master_mutex, and serialized by @master_lookup_lock.
   252		 *
   253		 * Only relevant if drm_is_primary_client() returns true. Note that
   254		 * this only matches &drm_device.master if the master is the currently
   255		 * active one.
   256		 *
   257		 * To update @master, both &drm_device.master_mutex and
   258		 * @master_lookup_lock need to be held, therefore holding either of
   259		 * them is safe and enough for the read side.
   260		 *
   261		 * When dereferencing this pointer, either hold struct
   262		 * &drm_device.master_mutex for the duration of the pointer's use, or
   263		 * use drm_file_get_master() if struct &drm_device.master_mutex is not
   264		 * currently held and there is no other need to hold it. This prevents
   265		 * @master from being freed during use.
   266		 *
   267		 * See also @authentication and @is_master and the :ref:`section on
   268		 * primary nodes and authentication <drm_primary_node>`.
   269		 */
   270		struct drm_master *master;
   271	
   272		/** @master_lookup_lock: Serializes @master. */
   273		spinlock_t master_lookup_lock;
   274	
   275		/** @pid: Process that opened this file. */
   276		struct pid *pid;
   277	
   278		/** @client_id: A unique id for fdinfo */
   279		u64 client_id;
   280	
   281		/** @magic: Authentication magic, see @authenticated. */
   282		drm_magic_t magic;
   283	
   284		/**
   285		 * @lhead:
   286		 *
   287		 * List of all open files of a DRM device, linked into
   288		 * &drm_device.filelist. Protected by &drm_device.filelist_mutex.
   289		 */
   290		struct list_head lhead;
   291	
   292		/** @minor: &struct drm_minor for this file. */
   293		struct drm_minor *minor;
   294	
   295		/**
   296		 * @object_idr:
   297		 *
   298		 * Mapping of mm object handles to object pointers. Used by the GEM
   299		 * subsystem. Protected by @table_lock.
   300		 */
   301		struct idr object_idr;
   302	
   303		/** @table_lock: Protects @object_idr. */
   304		spinlock_t table_lock;
   305	
   306		/** @syncobj_idr: Mapping of sync object handles to object pointers. */
   307		struct idr syncobj_idr;
   308		/** @syncobj_table_lock: Protects @syncobj_idr. */
   309		spinlock_t syncobj_table_lock;
   310	
   311		/** @filp: Pointer to the core file structure. */
   312		struct file *filp;
   313	
   314		/**
   315		 * @driver_priv:
   316		 *
   317		 * Optional pointer for driver private data. Can be allocated in
   318		 * &drm_driver.open and should be freed in &drm_driver.postclose.
   319		 */
   320		void *driver_priv;
   321	
   322		/**
   323		 * @fbs:
   324		 *
   325		 * List of &struct drm_framebuffer associated with this file, using the
   326		 * &drm_framebuffer.filp_head entry.
   327		 *
   328		 * Protected by @fbs_lock. Note that the @fbs list holds a reference on
   329		 * the framebuffer object to prevent it from untimely disappearing.
   330		 */
   331		struct list_head fbs;
   332	
   333		/** @fbs_lock: Protects @fbs. */
   334		struct mutex fbs_lock;
   335	
   336		/**
   337		 * @blobs:
   338		 *
   339		 * User-created blob properties; this retains a reference on the
   340		 * property.
   341		 *
   342		 * Protected by @drm_mode_config.blob_lock;
   343		 */
   344		struct list_head blobs;
   345	
   346		/** @event_wait: Waitqueue for new events added to @event_list. */
   347		wait_queue_head_t event_wait;
   348	
   349		/**
   350		 * @pending_event_list:
   351		 *
   352		 * List of pending &struct drm_pending_event, used to clean up pending
   353		 * events in case this file gets closed before the event is signalled.
   354		 * Uses the &drm_pending_event.pending_link entry.
   355		 *
   356		 * Protect by &drm_device.event_lock.
   357		 */
   358		struct list_head pending_event_list;
   359	
   360		/**
   361		 * @event_list:
   362		 *
   363		 * List of &struct drm_pending_event, ready for delivery to userspace
   364		 * through drm_read(). Uses the &drm_pending_event.link entry.
   365		 *
   366		 * Protect by &drm_device.event_lock.
   367		 */
   368		struct list_head event_list;
   369	
   370		/**
   371		 * @event_space:
   372		 *
   373		 * Available event space to prevent userspace from
   374		 * exhausting kernel memory. Currently limited to the fairly arbitrary
   375		 * value of 4KB.
   376		 */
   377		int event_space;
   378	
   379		/** @event_read_lock: Serializes drm_read(). */
   380		struct mutex event_read_lock;
   381	
   382		/**
   383		 * @prime:
   384		 *
   385		 * Per-file buffer caches used by the PRIME buffer sharing code.
   386		 */
   387		struct drm_prime_file_private prime;
   388	
   389		/* private: */
   390	#if IS_ENABLED(CONFIG_DRM_LEGACY)
   391		unsigned long lock_count; /* DRI1 legacy lock count */
   392	#endif
 > 393	};
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
