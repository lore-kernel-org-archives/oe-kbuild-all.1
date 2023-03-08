Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252E36D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 23:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678316648; x=1709852648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UtG8UBslmqCV3TTbDg1m/qndc75b+H3Q9L1nD1c3NNU=;
  b=LNZZVJMsXV9heSfPTGzLyl7YksdL/CQZTHNOXXyLTkQ303Dejmhh7OUZ
   sPAp+ZeYSt/J7oeD0xTRH0/TDFLbDSMFMlXEH40AP1RFAYtAl4aRVjhN/
   FgC/I7i3bJUPQvZC6SoEAu2XiHIpupSE5qVg17T8Wbz92pErIsQBeMKTU
   65aVaQOc95DdgFv70Q8gVFt5gZ2B83h45+TMHWtNbZ3RcFdBxPaREUi1F
   IucJFdJArDkk68azfCs/JvXyDkd5TSSpPtvJ5vgsjzcelvGc7vvFW6O39
   BC6egHOK4iQgfP7NHzVbxDYlEPfSk7KJCbopsDXeuQJUXwo2M0Awm7znG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="363934358"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="363934358"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 15:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="800942835"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="800942835"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 15:04:02 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa2pF-0002TF-1z;
	Wed, 08 Mar 2023 23:04:01 +0000
Date: Thu, 9 Mar 2023 07:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] drm: property: use vzalloc() instead of kvzalloc() for
 large blobs
Message-ID: <202303090639.go7OZ9Q2-lkp@intel.com>
References: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>

Hi Abhinav,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-property-use-vzalloc-instead-of-kvzalloc-for-large-blobs/20230309-040340
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1678305762-32381-1-git-send-email-quic_abhinavk%40quicinc.com
patch subject: [RFC] drm: property: use vzalloc() instead of kvzalloc() for large blobs
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303090639.go7OZ9Q2-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/92cee5833068676c0ad28b238175260686a3c741
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abhinav-Kumar/drm-property-use-vzalloc-instead-of-kvzalloc-for-large-blobs/20230309-040340
        git checkout 92cee5833068676c0ad28b238175260686a3c741
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090639.go7OZ9Q2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_property.c: In function 'drm_property_create_blob':
   drivers/gpu/drm/drm_property.c:565:24: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
     565 |                 blob = vzalloc(sizeof(struct drm_property_blob)+length);
         |                        ^~~~~~~
         |                        kvzalloc
>> drivers/gpu/drm/drm_property.c:565:22: warning: assignment to 'struct drm_property_blob *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     565 |                 blob = vzalloc(sizeof(struct drm_property_blob)+length);
         |                      ^
   cc1: some warnings being treated as errors


vim +565 drivers/gpu/drm/drm_property.c

   539	
   540	/**
   541	 * drm_property_create_blob - Create new blob property
   542	 * @dev: DRM device to create property for
   543	 * @length: Length to allocate for blob data
   544	 * @data: If specified, copies data into blob
   545	 *
   546	 * Creates a new blob property for a specified DRM device, optionally
   547	 * copying data. Note that blob properties are meant to be invariant, hence the
   548	 * data must be filled out before the blob is used as the value of any property.
   549	 *
   550	 * Returns:
   551	 * New blob property with a single reference on success, or an ERR_PTR
   552	 * value on failure.
   553	 */
   554	struct drm_property_blob *
   555	drm_property_create_blob(struct drm_device *dev, size_t length,
   556				 const void *data)
   557	{
   558		struct drm_property_blob *blob;
   559		int ret;
   560	
   561		if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
   562			return ERR_PTR(-EINVAL);
   563	
   564		if (sizeof(struct drm_property_blob) + length > PAGE_SIZE)
 > 565			blob = vzalloc(sizeof(struct drm_property_blob)+length);
   566		else
   567			blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
   568	
   569		if (!blob)
   570			return ERR_PTR(-ENOMEM);
   571	
   572		/* This must be explicitly initialised, so we can safely call list_del
   573		 * on it in the removal handler, even if it isn't in a file list. */
   574		INIT_LIST_HEAD(&blob->head_file);
   575		blob->data = (void *)blob + sizeof(*blob);
   576		blob->length = length;
   577		blob->dev = dev;
   578	
   579		if (data)
   580			memcpy(blob->data, data, length);
   581	
   582		ret = __drm_mode_object_add(dev, &blob->base, DRM_MODE_OBJECT_BLOB,
   583					    true, drm_property_free_blob);
   584		if (ret) {
   585			kvfree(blob);
   586			return ERR_PTR(-EINVAL);
   587		}
   588	
   589		mutex_lock(&dev->mode_config.blob_lock);
   590		list_add_tail(&blob->head_global,
   591		              &dev->mode_config.property_blob_list);
   592		mutex_unlock(&dev->mode_config.blob_lock);
   593	
   594		return blob;
   595	}
   596	EXPORT_SYMBOL(drm_property_create_blob);
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
