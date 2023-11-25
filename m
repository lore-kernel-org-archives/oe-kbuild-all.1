Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D78C19
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irf9f2wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898228; x=1732434228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHBQQ9sAuAeDkffKPuCjV5Rjq/fSu1/PRBKJjxHnujY=;
  b=irf9f2wY9BcKbHmzajG3z0bbz6LMb0LVBfYULQJxhpLMl3PAP+K98HO2
   Yoegw8Nx8oZ8GIZbSGTIe1XOoK+CSSJpX/uxUkIDhy9aTmK/pVvUqa2vb
   3OnSE4VnamJoAHeGbS0nt9a84z8QQG1RzjeidYODIU6IoMitOlKFsq/1E
   J2gCtuxNmkGHoDuBnTT8WltOHflB3esyTdu+aeL13seNJx67GQBtW8KYj
   np767sMHR/t4ebAY7zI3s8xWiQ8r585KR03JjcJwY92oPqLz//Sg29Ird
   W/o21tyY8P7AT6XPmZ73m4QCasPy26/s4NTfRM+6h23N3HDuWVA9f9n5E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395321543"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="395321543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="9329668"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2023 23:43:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nKE-0003kT-3D;
	Sat, 25 Nov 2023 07:43:38 +0000
Date: Sat, 25 Nov 2023 15:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 2284/2351] htmldocs:
 ./include/drm/drm_file.h:210: warning: Incorrect use of kernel-doc format:
          * This is to enable advance gamma modes using
Message-ID: <202311251426.zh2atk9d-lkp@intel.com>
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
commit: 696ae17877b16d2ba3232aaee4e455556c15ee62 [2284/2351] drm: Add Client Cap for advance gamma mode
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251426.zh2atk9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251426.zh2atk9d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_file.h:210: warning: Incorrect use of kernel-doc format:          * This is to enable advance gamma modes using
>> ./include/drm/drm_file.h:385: warning: Function parameter or member 'advance_gamma_mode_active' not described in 'drm_file'
>> ./include/drm/drm_atomic.h:430: warning: Function parameter or member 'advance_gamma_mode_active' not described in 'drm_atomic_state'
>> ./include/drm/drm_crtc.h:161: warning: Incorrect use of kernel-doc format:          * This is to indicate advance gamma mode support
>> ./include/drm/drm_crtc.h:408: warning: Function parameter or member 'advance_gamma_mode_active' not described in 'drm_crtc_state'
>> ./include/drm/drm_crtc.h:1208: warning: Function parameter or member 'advance_gamma_mode_active' not described in 'drm_crtc'

vim +210 ./include/drm/drm_file.h

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
 > 210		 * This is to enable advance gamma modes using
   211		 * gamma_mode property
   212		 *
   213		 * True if client understands advance gamma
   214		 */
   215		bool advance_gamma_mode_active : 1;
   216	
   217		/**
   218		 * @was_master:
   219		 *
   220		 * This client has or had, master capability. Protected by struct
   221		 * &drm_device.master_mutex.
   222		 *
   223		 * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
   224		 * client is or was master in the past.
   225		 */
   226		bool was_master;
   227	
   228		/**
   229		 * @is_master:
   230		 *
   231		 * This client is the creator of @master. Protected by struct
   232		 * &drm_device.master_mutex.
   233		 *
   234		 * See also the :ref:`section on primary nodes and authentication
   235		 * <drm_primary_node>`.
   236		 */
   237		bool is_master;
   238	
   239		/**
   240		 * @master:
   241		 *
   242		 * Master this node is currently associated with. Protected by struct
   243		 * &drm_device.master_mutex, and serialized by @master_lookup_lock.
   244		 *
   245		 * Only relevant if drm_is_primary_client() returns true. Note that
   246		 * this only matches &drm_device.master if the master is the currently
   247		 * active one.
   248		 *
   249		 * To update @master, both &drm_device.master_mutex and
   250		 * @master_lookup_lock need to be held, therefore holding either of
   251		 * them is safe and enough for the read side.
   252		 *
   253		 * When dereferencing this pointer, either hold struct
   254		 * &drm_device.master_mutex for the duration of the pointer's use, or
   255		 * use drm_file_get_master() if struct &drm_device.master_mutex is not
   256		 * currently held and there is no other need to hold it. This prevents
   257		 * @master from being freed during use.
   258		 *
   259		 * See also @authentication and @is_master and the :ref:`section on
   260		 * primary nodes and authentication <drm_primary_node>`.
   261		 */
   262		struct drm_master *master;
   263	
   264		/** @master_lookup_lock: Serializes @master. */
   265		spinlock_t master_lookup_lock;
   266	
   267		/** @pid: Process that opened this file. */
   268		struct pid *pid;
   269	
   270		/** @client_id: A unique id for fdinfo */
   271		u64 client_id;
   272	
   273		/** @magic: Authentication magic, see @authenticated. */
   274		drm_magic_t magic;
   275	
   276		/**
   277		 * @lhead:
   278		 *
   279		 * List of all open files of a DRM device, linked into
   280		 * &drm_device.filelist. Protected by &drm_device.filelist_mutex.
   281		 */
   282		struct list_head lhead;
   283	
   284		/** @minor: &struct drm_minor for this file. */
   285		struct drm_minor *minor;
   286	
   287		/**
   288		 * @object_idr:
   289		 *
   290		 * Mapping of mm object handles to object pointers. Used by the GEM
   291		 * subsystem. Protected by @table_lock.
   292		 */
   293		struct idr object_idr;
   294	
   295		/** @table_lock: Protects @object_idr. */
   296		spinlock_t table_lock;
   297	
   298		/** @syncobj_idr: Mapping of sync object handles to object pointers. */
   299		struct idr syncobj_idr;
   300		/** @syncobj_table_lock: Protects @syncobj_idr. */
   301		spinlock_t syncobj_table_lock;
   302	
   303		/** @filp: Pointer to the core file structure. */
   304		struct file *filp;
   305	
   306		/**
   307		 * @driver_priv:
   308		 *
   309		 * Optional pointer for driver private data. Can be allocated in
   310		 * &drm_driver.open and should be freed in &drm_driver.postclose.
   311		 */
   312		void *driver_priv;
   313	
   314		/**
   315		 * @fbs:
   316		 *
   317		 * List of &struct drm_framebuffer associated with this file, using the
   318		 * &drm_framebuffer.filp_head entry.
   319		 *
   320		 * Protected by @fbs_lock. Note that the @fbs list holds a reference on
   321		 * the framebuffer object to prevent it from untimely disappearing.
   322		 */
   323		struct list_head fbs;
   324	
   325		/** @fbs_lock: Protects @fbs. */
   326		struct mutex fbs_lock;
   327	
   328		/**
   329		 * @blobs:
   330		 *
   331		 * User-created blob properties; this retains a reference on the
   332		 * property.
   333		 *
   334		 * Protected by @drm_mode_config.blob_lock;
   335		 */
   336		struct list_head blobs;
   337	
   338		/** @event_wait: Waitqueue for new events added to @event_list. */
   339		wait_queue_head_t event_wait;
   340	
   341		/**
   342		 * @pending_event_list:
   343		 *
   344		 * List of pending &struct drm_pending_event, used to clean up pending
   345		 * events in case this file gets closed before the event is signalled.
   346		 * Uses the &drm_pending_event.pending_link entry.
   347		 *
   348		 * Protect by &drm_device.event_lock.
   349		 */
   350		struct list_head pending_event_list;
   351	
   352		/**
   353		 * @event_list:
   354		 *
   355		 * List of &struct drm_pending_event, ready for delivery to userspace
   356		 * through drm_read(). Uses the &drm_pending_event.link entry.
   357		 *
   358		 * Protect by &drm_device.event_lock.
   359		 */
   360		struct list_head event_list;
   361	
   362		/**
   363		 * @event_space:
   364		 *
   365		 * Available event space to prevent userspace from
   366		 * exhausting kernel memory. Currently limited to the fairly arbitrary
   367		 * value of 4KB.
   368		 */
   369		int event_space;
   370	
   371		/** @event_read_lock: Serializes drm_read(). */
   372		struct mutex event_read_lock;
   373	
   374		/**
   375		 * @prime:
   376		 *
   377		 * Per-file buffer caches used by the PRIME buffer sharing code.
   378		 */
   379		struct drm_prime_file_private prime;
   380	
   381		/* private: */
   382	#if IS_ENABLED(CONFIG_DRM_LEGACY)
   383		unsigned long lock_count; /* DRI1 legacy lock count */
   384	#endif
 > 385	};
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
