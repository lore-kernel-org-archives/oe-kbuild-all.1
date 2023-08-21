Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB016FC0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692636657; x=1724172657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dLG8E1KJA3Sayxhvg1+zhwJtdWgyXYXpIyZvIRcOch4=;
  b=UqDqBpgN9o+hy9d9u6LHMzxzVx9tEKwYOnLNSynOJKeKr/KqAm3bAKEe
   /093kkiBLZ4/XjFglVaY5G1hN8fmn7EzTb1xe46D81oWx+pjlNJcYs3wu
   XPI59fZnKQzxvIcfJ7NDh8eAkVIIWNLzI61euVKEoZ+eRC79eRMI92HYG
   EZL2ZjIKhOyWqOs9IFPOrZduZ/SHUvKQstA6/wCLzK0DBTJQFOk2JM8Wb
   98OEeqpg9AT+EOwrPSrxM0Ce76/GJhXQ//yXfPeRqV1f9R5B3BkEhlXM2
   5PDirjn9voZiimu/jTSKyNNUrv7Z9g9gMxt29JZO5HlpMVcSM1iaY8q9i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358633081"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="358633081"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 09:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="801330443"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="801330443"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 Aug 2023 09:50:55 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY87C-0000hq-2b;
	Mon, 21 Aug 2023 16:50:54 +0000
Date: Tue, 22 Aug 2023 00:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1023/29766] htmldocs:
 ./include/drm/drm_drv.h:492: warning: Incorrect use of kernel-doc format:
          * @gem_prime_get_uuid
Message-ID: <202308220049.K2TvCamX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   c69294897c585e659328b3c6b747643af883015a
commit: 5674a23c0c7199882393fcd3eb327c6d668349c0 [1023/29766] FROMLIST: drm/prime: add support for virtio exported objects
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220049.K2TvCamX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220049.K2TvCamX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_drv.h:492: warning: Incorrect use of kernel-doc format:          * @gem_prime_get_uuid
>> ./include/drm/drm_drv.h:626: warning: Function parameter or member 'gem_prime_get_uuid' not described in 'drm_driver'

vim +492 ./include/drm/drm_drv.h

   153	
   154	/**
   155	 * struct drm_driver - DRM driver structure
   156	 *
   157	 * This structure represent the common code for a family of cards. There will be
   158	 * one &struct drm_device for each card present in this family. It contains lots
   159	 * of vfunc entries, and a pile of those probably should be moved to more
   160	 * appropriate places like &drm_mode_config_funcs or into a new operations
   161	 * structure for GEM drivers.
   162	 */
   163	struct drm_driver {
   164		/**
   165		 * @load:
   166		 *
   167		 * Backward-compatible driver callback to complete
   168		 * initialization steps after the driver is registered.  For
   169		 * this reason, may suffer from race conditions and its use is
   170		 * deprecated for new drivers.  It is therefore only supported
   171		 * for existing drivers not yet converted to the new scheme.
   172		 * See drm_dev_init() and drm_dev_register() for proper and
   173		 * race-free way to set up a &struct drm_device.
   174		 *
   175		 * This is deprecated, do not use!
   176		 *
   177		 * Returns:
   178		 *
   179		 * Zero on success, non-zero value on failure.
   180		 */
   181		int (*load) (struct drm_device *, unsigned long flags);
   182	
   183		/**
   184		 * @open:
   185		 *
   186		 * Driver callback when a new &struct drm_file is opened. Useful for
   187		 * setting up driver-private data structures like buffer allocators,
   188		 * execution contexts or similar things. Such driver-private resources
   189		 * must be released again in @postclose.
   190		 *
   191		 * Since the display/modeset side of DRM can only be owned by exactly
   192		 * one &struct drm_file (see &drm_file.is_master and &drm_device.master)
   193		 * there should never be a need to set up any modeset related resources
   194		 * in this callback. Doing so would be a driver design bug.
   195		 *
   196		 * Returns:
   197		 *
   198		 * 0 on success, a negative error code on failure, which will be
   199		 * promoted to userspace as the result of the open() system call.
   200		 */
   201		int (*open) (struct drm_device *, struct drm_file *);
   202	
   203		/**
   204		 * @postclose:
   205		 *
   206		 * One of the driver callbacks when a new &struct drm_file is closed.
   207		 * Useful for tearing down driver-private data structures allocated in
   208		 * @open like buffer allocators, execution contexts or similar things.
   209		 *
   210		 * Since the display/modeset side of DRM can only be owned by exactly
   211		 * one &struct drm_file (see &drm_file.is_master and &drm_device.master)
   212		 * there should never be a need to tear down any modeset related
   213		 * resources in this callback. Doing so would be a driver design bug.
   214		 */
   215		void (*postclose) (struct drm_device *, struct drm_file *);
   216	
   217		/**
   218		 * @lastclose:
   219		 *
   220		 * Called when the last &struct drm_file has been closed and there's
   221		 * currently no userspace client for the &struct drm_device.
   222		 *
   223		 * Modern drivers should only use this to force-restore the fbdev
   224		 * framebuffer using drm_fb_helper_restore_fbdev_mode_unlocked().
   225		 * Anything else would indicate there's something seriously wrong.
   226		 * Modern drivers can also use this to execute delayed power switching
   227		 * state changes, e.g. in conjunction with the :ref:`vga_switcheroo`
   228		 * infrastructure.
   229		 *
   230		 * This is called after @postclose hook has been called.
   231		 *
   232		 * NOTE:
   233		 *
   234		 * All legacy drivers use this callback to de-initialize the hardware.
   235		 * This is purely because of the shadow-attach model, where the DRM
   236		 * kernel driver does not really own the hardware. Instead ownershipe is
   237		 * handled with the help of userspace through an inheritedly racy dance
   238		 * to set/unset the VT into raw mode.
   239		 *
   240		 * Legacy drivers initialize the hardware in the @firstopen callback,
   241		 * which isn't even called for modern drivers.
   242		 */
   243		void (*lastclose) (struct drm_device *);
   244	
   245		/**
   246		 * @unload:
   247		 *
   248		 * Reverse the effects of the driver load callback.  Ideally,
   249		 * the clean up performed by the driver should happen in the
   250		 * reverse order of the initialization.  Similarly to the load
   251		 * hook, this handler is deprecated and its usage should be
   252		 * dropped in favor of an open-coded teardown function at the
   253		 * driver layer.  See drm_dev_unregister() and drm_dev_put()
   254		 * for the proper way to remove a &struct drm_device.
   255		 *
   256		 * The unload() hook is called right after unregistering
   257		 * the device.
   258		 *
   259		 */
   260		void (*unload) (struct drm_device *);
   261	
   262		/**
   263		 * @release:
   264		 *
   265		 * Optional callback for destroying device data after the final
   266		 * reference is released, i.e. the device is being destroyed. Drivers
   267		 * using this callback are responsible for calling drm_dev_fini()
   268		 * to finalize the device and then freeing the struct themselves.
   269		 */
   270		void (*release) (struct drm_device *);
   271	
   272		/**
   273		 * @irq_handler:
   274		 *
   275		 * Interrupt handler called when using drm_irq_install(). Not used by
   276		 * drivers which implement their own interrupt handling.
   277		 */
   278		irqreturn_t(*irq_handler) (int irq, void *arg);
   279	
   280		/**
   281		 * @irq_preinstall:
   282		 *
   283		 * Optional callback used by drm_irq_install() which is called before
   284		 * the interrupt handler is registered. This should be used to clear out
   285		 * any pending interrupts (from e.g. firmware based drives) and reset
   286		 * the interrupt handling registers.
   287		 */
   288		void (*irq_preinstall) (struct drm_device *dev);
   289	
   290		/**
   291		 * @irq_postinstall:
   292		 *
   293		 * Optional callback used by drm_irq_install() which is called after
   294		 * the interrupt handler is registered. This should be used to enable
   295		 * interrupt generation in the hardware.
   296		 */
   297		int (*irq_postinstall) (struct drm_device *dev);
   298	
   299		/**
   300		 * @irq_uninstall:
   301		 *
   302		 * Optional callback used by drm_irq_uninstall() which is called before
   303		 * the interrupt handler is unregistered. This should be used to disable
   304		 * interrupt generation in the hardware.
   305		 */
   306		void (*irq_uninstall) (struct drm_device *dev);
   307	
   308		/**
   309		 * @master_set:
   310		 *
   311		 * Called whenever the minor master is set. Only used by vmwgfx.
   312		 */
   313		int (*master_set)(struct drm_device *dev, struct drm_file *file_priv,
   314				  bool from_open);
   315		/**
   316		 * @master_drop:
   317		 *
   318		 * Called whenever the minor master is dropped. Only used by vmwgfx.
   319		 */
   320		void (*master_drop)(struct drm_device *dev, struct drm_file *file_priv);
   321	
   322		/**
   323		 * @debugfs_init:
   324		 *
   325		 * Allows drivers to create driver-specific debugfs files.
   326		 */
   327		int (*debugfs_init)(struct drm_minor *minor);
   328	
   329		/**
   330		 * @gem_free_object: deconstructor for drm_gem_objects
   331		 *
   332		 * This is deprecated and should not be used by new drivers. Use
   333		 * &drm_gem_object_funcs.free instead.
   334		 */
   335		void (*gem_free_object) (struct drm_gem_object *obj);
   336	
   337		/**
   338		 * @gem_free_object_unlocked: deconstructor for drm_gem_objects
   339		 *
   340		 * This is deprecated and should not be used by new drivers. Use
   341		 * &drm_gem_object_funcs.free instead.
   342		 * Compared to @gem_free_object this is not encumbered with
   343		 * &drm_device.struct_mutex legacy locking schemes.
   344		 */
   345		void (*gem_free_object_unlocked) (struct drm_gem_object *obj);
   346	
   347		/**
   348		 * @gem_open_object:
   349		 *
   350		 * This callback is deprecated in favour of &drm_gem_object_funcs.open.
   351		 *
   352		 * Driver hook called upon gem handle creation
   353		 */
   354		int (*gem_open_object) (struct drm_gem_object *, struct drm_file *);
   355	
   356		/**
   357		 * @gem_close_object:
   358		 *
   359		 * This callback is deprecated in favour of &drm_gem_object_funcs.close.
   360		 *
   361		 * Driver hook called upon gem handle release
   362		 */
   363		void (*gem_close_object) (struct drm_gem_object *, struct drm_file *);
   364	
   365		/**
   366		 * @gem_print_info:
   367		 *
   368		 * This callback is deprecated in favour of
   369		 * &drm_gem_object_funcs.print_info.
   370		 *
   371		 * If driver subclasses struct &drm_gem_object, it can implement this
   372		 * optional hook for printing additional driver specific info.
   373		 *
   374		 * drm_printf_indent() should be used in the callback passing it the
   375		 * indent argument.
   376		 *
   377		 * This callback is called from drm_gem_print_info().
   378		 */
   379		void (*gem_print_info)(struct drm_printer *p, unsigned int indent,
   380				       const struct drm_gem_object *obj);
   381	
   382		/**
   383		 * @gem_create_object: constructor for gem objects
   384		 *
   385		 * Hook for allocating the GEM object struct, for use by the CMA and
   386		 * SHMEM GEM helpers.
   387		 */
   388		struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
   389							    size_t size);
   390		/**
   391		 * @prime_handle_to_fd:
   392		 *
   393		 * Main PRIME export function. Should be implemented with
   394		 * drm_gem_prime_handle_to_fd() for GEM based drivers.
   395		 *
   396		 * For an in-depth discussion see :ref:`PRIME buffer sharing
   397		 * documentation <prime_buffer_sharing>`.
   398		 */
   399		int (*prime_handle_to_fd)(struct drm_device *dev, struct drm_file *file_priv,
   400					uint32_t handle, uint32_t flags, int *prime_fd);
   401		/**
   402		 * @prime_fd_to_handle:
   403		 *
   404		 * Main PRIME import function. Should be implemented with
   405		 * drm_gem_prime_fd_to_handle() for GEM based drivers.
   406		 *
   407		 * For an in-depth discussion see :ref:`PRIME buffer sharing
   408		 * documentation <prime_buffer_sharing>`.
   409		 */
   410		int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *file_priv,
   411					int prime_fd, uint32_t *handle);
   412		/**
   413		 * @gem_prime_export:
   414		 *
   415		 * Export hook for GEM drivers. Deprecated in favour of
   416		 * &drm_gem_object_funcs.export.
   417		 */
   418		struct dma_buf * (*gem_prime_export)(struct drm_gem_object *obj,
   419						     int flags);
   420		/**
   421		 * @gem_prime_import:
   422		 *
   423		 * Import hook for GEM drivers.
   424		 *
   425		 * This defaults to drm_gem_prime_import() if not set.
   426		 */
   427		struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
   428					struct dma_buf *dma_buf);
   429	
   430		/**
   431		 * @gem_prime_pin:
   432		 *
   433		 * Deprecated hook in favour of &drm_gem_object_funcs.pin.
   434		 */
   435		int (*gem_prime_pin)(struct drm_gem_object *obj);
   436	
   437		/**
   438		 * @gem_prime_unpin:
   439		 *
   440		 * Deprecated hook in favour of &drm_gem_object_funcs.unpin.
   441		 */
   442		void (*gem_prime_unpin)(struct drm_gem_object *obj);
   443	
   444	
   445		/**
   446		 * @gem_prime_get_sg_table:
   447		 *
   448		 * Deprecated hook in favour of &drm_gem_object_funcs.get_sg_table.
   449		 */
   450		struct sg_table *(*gem_prime_get_sg_table)(struct drm_gem_object *obj);
   451	
   452		/**
   453		 * @gem_prime_import_sg_table:
   454		 *
   455		 * Optional hook used by the PRIME helper functions
   456		 * drm_gem_prime_import() respectively drm_gem_prime_import_dev().
   457		 */
   458		struct drm_gem_object *(*gem_prime_import_sg_table)(
   459					struct drm_device *dev,
   460					struct dma_buf_attachment *attach,
   461					struct sg_table *sgt);
   462		/**
   463		 * @gem_prime_vmap:
   464		 *
   465		 * Deprecated vmap hook for GEM drivers. Please use
   466		 * &drm_gem_object_funcs.vmap instead.
   467		 */
   468		void *(*gem_prime_vmap)(struct drm_gem_object *obj);
   469	
   470		/**
   471		 * @gem_prime_vunmap:
   472		 *
   473		 * Deprecated vunmap hook for GEM drivers. Please use
   474		 * &drm_gem_object_funcs.vunmap instead.
   475		 */
   476		void (*gem_prime_vunmap)(struct drm_gem_object *obj, void *vaddr);
   477	
   478		/**
   479		 * @gem_prime_mmap:
   480		 *
   481		 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
   482		 * PRIME helpers.
   483		 *
   484		 * FIXME: There's way too much duplication going on here, and also moved
   485		 * to &drm_gem_object_funcs.
   486		 */
   487		int (*gem_prime_mmap)(struct drm_gem_object *obj,
   488					struct vm_area_struct *vma);
   489	
   490		/**
   491		 * @gem_prime_get_uuid
 > 492		 *
   493		 * get_uuid hook for GEM drivers. Retrieves the virtio uuid of the
   494		 * given GEM buffer.
   495		 */
   496		int (*gem_prime_get_uuid)(struct drm_gem_object *obj,
   497					  uuid_t *uuid);
   498	
   499		/**
   500		 * @dumb_create:
   501		 *
   502		 * This creates a new dumb buffer in the driver's backing storage manager (GEM,
   503		 * TTM or something else entirely) and returns the resulting buffer handle. This
   504		 * handle can then be wrapped up into a framebuffer modeset object.
   505		 *
   506		 * Note that userspace is not allowed to use such objects for render
   507		 * acceleration - drivers must create their own private ioctls for such a use
   508		 * case.
   509		 *
   510		 * Width, height and depth are specified in the &drm_mode_create_dumb
   511		 * argument. The callback needs to fill the handle, pitch and size for
   512		 * the created buffer.
   513		 *
   514		 * Called by the user via ioctl.
   515		 *
   516		 * Returns:
   517		 *
   518		 * Zero on success, negative errno on failure.
   519		 */
   520		int (*dumb_create)(struct drm_file *file_priv,
   521				   struct drm_device *dev,
   522				   struct drm_mode_create_dumb *args);
   523		/**
   524		 * @dumb_map_offset:
   525		 *
   526		 * Allocate an offset in the drm device node's address space to be able to
   527		 * memory map a dumb buffer.
   528		 *
   529		 * The default implementation is drm_gem_create_mmap_offset(). GEM based
   530		 * drivers must not overwrite this.
   531		 *
   532		 * Called by the user via ioctl.
   533		 *
   534		 * Returns:
   535		 *
   536		 * Zero on success, negative errno on failure.
   537		 */
   538		int (*dumb_map_offset)(struct drm_file *file_priv,
   539				       struct drm_device *dev, uint32_t handle,
   540				       uint64_t *offset);
   541		/**
   542		 * @dumb_destroy:
   543		 *
   544		 * This destroys the userspace handle for the given dumb backing storage buffer.
   545		 * Since buffer objects must be reference counted in the kernel a buffer object
   546		 * won't be immediately freed if a framebuffer modeset object still uses it.
   547		 *
   548		 * Called by the user via ioctl.
   549		 *
   550		 * The default implementation is drm_gem_dumb_destroy(). GEM based drivers
   551		 * must not overwrite this.
   552		 *
   553		 * Returns:
   554		 *
   555		 * Zero on success, negative errno on failure.
   556		 */
   557		int (*dumb_destroy)(struct drm_file *file_priv,
   558				    struct drm_device *dev,
   559				    uint32_t handle);
   560	
   561		/**
   562		 * @gem_vm_ops: Driver private ops for this object
   563		 *
   564		 * For GEM drivers this is deprecated in favour of
   565		 * &drm_gem_object_funcs.vm_ops.
   566		 */
   567		const struct vm_operations_struct *gem_vm_ops;
   568	
   569		/** @major: driver major number */
   570		int major;
   571		/** @minor: driver minor number */
   572		int minor;
   573		/** @patchlevel: driver patch level */
   574		int patchlevel;
   575		/** @name: driver name */
   576		char *name;
   577		/** @desc: driver description */
   578		char *desc;
   579		/** @date: driver date */
   580		char *date;
   581	
   582		/**
   583		 * @driver_features:
   584		 * Driver features, see &enum drm_driver_feature. Drivers can disable
   585		 * some features on a per-instance basis using
   586		 * &drm_device.driver_features.
   587		 */
   588		u32 driver_features;
   589	
   590		/**
   591		 * @ioctls:
   592		 *
   593		 * Array of driver-private IOCTL description entries. See the chapter on
   594		 * :ref:`IOCTL support in the userland interfaces
   595		 * chapter<drm_driver_ioctl>` for the full details.
   596		 */
   597	
   598		const struct drm_ioctl_desc *ioctls;
   599		/** @num_ioctls: Number of entries in @ioctls. */
   600		int num_ioctls;
   601	
   602		/**
   603		 * @fops:
   604		 *
   605		 * File operations for the DRM device node. See the discussion in
   606		 * :ref:`file operations<drm_driver_fops>` for in-depth coverage and
   607		 * some examples.
   608		 */
   609		const struct file_operations *fops;
   610	
   611		/* Everything below here is for legacy driver, never use! */
   612		/* private: */
   613	
   614		/* List of devices hanging off this driver with stealth attach. */
   615		struct list_head legacy_dev_list;
   616		int (*firstopen) (struct drm_device *);
   617		void (*preclose) (struct drm_device *, struct drm_file *file_priv);
   618		int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
   619		int (*dma_quiescent) (struct drm_device *);
   620		int (*context_dtor) (struct drm_device *dev, int context);
   621		u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
   622		int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
   623		void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
   624		int dev_priv_size;
   625	};
 > 626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
