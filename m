Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B457C20F83
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689962841; x=1721498841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ftzKxyeE1YgehaHuy61AcU/z7PNQcwtQedEeNHLH3Ds=;
  b=QCGo52uH9jLOrCG4YMTDGZzoRH5gEzfpIOwNnUFu+SRsrMQ0HpJYq5K5
   hDbOkUJmlQrfYL12NbYMr9STjQAwi526O8Y8leHbTaW24HfiKXN9mvZny
   HBPAammIlCtu5jkIqu/QEYRQlau5IN1VFmA1t9A2uOiptsfXjrdKcVuKi
   mKzoglxJ4ingP5Cl9ATqxbElr5b2vVbpOoRz4UC97j1NXDx3QpH4yg0Or
   uKKVX59FAeagaSOXo4rILUk45IILA7TXn3EMQxW6a8db91oyqk7Lfw9Kz
   D0n4pN5iRJXnVn1roBR+h0Uuho5aGilZ8UWGP2pQfkDqglbUYROyer5Ct
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="357078810"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="357078810"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 11:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848902542"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="848902542"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 11:07:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMuX5-0007W1-2o;
	Fri, 21 Jul 2023 18:07:15 +0000
Date: Sat, 22 Jul 2023 02:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Erik Kurzinger <ekurzinger@nvidia.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, James Jones <jajones@nvidia.com>,
	Austin Shafer <ashafer@nvidia.com>
Subject: Re: [PATCH v2] drm/syncobj: add
 DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Message-ID: <202307220102.hq8N9hIr-lkp@intel.com>
References: <a09e38a6-5ac3-75c1-eadd-38a265e0ae33@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09e38a6-5ac3-75c1-eadd-38a265e0ae33@nvidia.com>

Hi Erik,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip next-20230721]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.5-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Erik-Kurzinger/drm-syncobj-add-DRM_IOCTL_SYNCOBJ_IMPORT-EXPORT_SYNC_FILE/20230722-003446
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/a09e38a6-5ac3-75c1-eadd-38a265e0ae33%40nvidia.com
patch subject: [PATCH v2] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230722/202307220102.hq8N9hIr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220102.hq8N9hIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220102.hq8N9hIr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_syncobj.c: In function 'drm_syncobj_fd_to_handle_ioctl':
>> drivers/gpu/drm/drm_syncobj.c:922:71: error: expected ')' before numeric constant
     922 |                                                           args->handle
         |                                                                       ^
         |                                                                       )
     923 |                                                           0 /* binary */);
         |                                                           ~            
   drivers/gpu/drm/drm_syncobj.c:920:58: note: to match this '('
     920 |                 return drm_syncobj_import_sync_file_fence(file_private,
         |                                                          ^
>> drivers/gpu/drm/drm_syncobj.c:920:24: error: too few arguments to function 'drm_syncobj_import_sync_file_fence'
     920 |                 return drm_syncobj_import_sync_file_fence(file_private,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:745:12: note: declared here
     745 | static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +922 drivers/gpu/drm/drm_syncobj.c

   902	
   903	int
   904	drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
   905					   struct drm_file *file_private)
   906	{
   907		struct drm_syncobj_handle *args = data;
   908	
   909		if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
   910			return -EOPNOTSUPP;
   911	
   912		if (args->pad)
   913			return -EINVAL;
   914	
   915		if (args->flags != 0 &&
   916		    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
   917			return -EINVAL;
   918	
   919		if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
 > 920			return drm_syncobj_import_sync_file_fence(file_private,
   921								  args->fd,
 > 922								  args->handle
   923								  0 /* binary */);
   924	
   925		return drm_syncobj_fd_to_handle(file_private, args->fd,
   926						&args->handle);
   927	}
   928	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
