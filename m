Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF01386C0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690341; cv=none; b=MOwp9pdZVMryOxdxmcC32oMSvM70MySI01k+x0JMjl7MPJujG3sM6pIT2qWyHugjc4uB0U3GJ7+px24BXkd8Wiib0ThB6JJhu2uTX0gCjDWvJa52porXJf4ybgzfUpjb45vwXNstsH7p3b2AbTHlzxD6oKpQbHK4yJXI5PQ8ETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690341; c=relaxed/simple;
	bh=sVa1GMPH5X8pbSeQhQKZCMdgukRbRN0gslir4do+d58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYgsHp9RqEmiMzMlU0MTnqSmjCD1sN05JsP9Yuvg8uEKvlMaGH6NoLf/vMb3t9AUDYiM+Lyt62q3NCcaVh8pufi7bhtI98+U6qvlcacMEgIUPwt3o2JVuKXVCjlTGc/UoOp24S4tWsGxA4OdfeBlP/qtFAnt2M24I54+Ga9Pp7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKYHMUJk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKYHMUJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712690339; x=1744226339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVa1GMPH5X8pbSeQhQKZCMdgukRbRN0gslir4do+d58=;
  b=MKYHMUJkKq6or/JA14mXsfB8LNdUzcnxL9GdK5h2O5Q7AE16kY1PAn93
   0MppeX3lQoL1ihPs4bma1KlsldX9PUG+3EbJE4mEehYUMiYSwJ1KXDYl8
   oBPI3k0Zpek4/Mmup7Iy6bndUgBHaO8CzKl3swB4dEjVy3HMSo+W5ZYO7
   X+D3l3nG5ckDCQ4iBuPtAl34FX2ubQ9uJl8Lb0nY290OwJqyIvdJ0cLNB
   oRv7Hx08thDCaXYyf/L8DoGr7rU1968pFGfCAkvG8aTVRavMJVam+dmlU
   CGx9EL9Ah6LJdDA5MSxSzZLeQVQFl8U+/livJfgk9yPnaESM9oJ/yKaiX
   w==;
X-CSE-ConnectionGUID: 87JTo9pkR1OIbl+xH48OVg==
X-CSE-MsgGUID: GLCl3VnsQBGHHdb/bQztYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8127438"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8127438"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 12:18:59 -0700
X-CSE-ConnectionGUID: /QohI3j1TIadki41BBBsGg==
X-CSE-MsgGUID: KZB7rvs+RIy04tZG5eQ0fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20792460"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Apr 2024 12:18:58 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruGzf-0006R8-2V;
	Tue, 09 Apr 2024 19:18:55 +0000
Date: Wed, 10 Apr 2024 03:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.misc 14/14] include/drm/drm_accel.h:50:31: error:
 expected expression before ',' token
Message-ID: <202404100312.5KNzTfZH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   27a838e027e7fca274675ba21eeedb93b9425f3e
commit: 27a838e027e7fca274675ba21eeedb93b9425f3e [14/14] fs: move FMODE_UNSIGNED_OFFSET to fop_flags
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240410/202404100312.5KNzTfZH-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100312.5KNzTfZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100312.5KNzTfZH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/qaic/qaic_drv.c:21:
>> include/drm/drm_accel.h:50:31: error: expected expression before ',' token
      50 |                 DRM_ACCEL_FOPS,\
         |                               ^~
      51 |         }
         |                                
   drivers/accel/qaic/qaic_drv.c:189:1: note: in expansion of macro 'DEFINE_DRM_ACCEL_FOPS'
     189 | DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
         | ^~~~~~~~~~~~~~~~~~~~~
>> include/drm/drm_accel.h:50:31: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      50 |                 DRM_ACCEL_FOPS,\
         |                               ^~
      51 |         }
         |                                
   drivers/accel/qaic/qaic_drv.c:189:1: note: in expansion of macro 'DEFINE_DRM_ACCEL_FOPS'
     189 | DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
         | ^~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_accel.h:50:31: note: (near initialization for 'qaic_accel_fops')
      50 |                 DRM_ACCEL_FOPS,\
         |                               ^~
      51 |         }
         |                                
   drivers/accel/qaic/qaic_drv.c:189:1: note: in expansion of macro 'DEFINE_DRM_ACCEL_FOPS'
     189 | DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
         | ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +50 include/drm/drm_accel.h

2c204f3d53218d Oded Gabbay       2022-10-31  15  
2c204f3d53218d Oded Gabbay       2022-10-31  16  /**
2c204f3d53218d Oded Gabbay       2022-10-31  17   * DRM_ACCEL_FOPS - Default drm accelerators file operations
2c204f3d53218d Oded Gabbay       2022-10-31  18   *
2c204f3d53218d Oded Gabbay       2022-10-31  19   * This macro provides a shorthand for setting the accelerator file ops in the
2c204f3d53218d Oded Gabbay       2022-10-31  20   * &file_operations structure.  If all you need are the default ops, use
2c204f3d53218d Oded Gabbay       2022-10-31  21   * DEFINE_DRM_ACCEL_FOPS instead.
2c204f3d53218d Oded Gabbay       2022-10-31  22   */
2c204f3d53218d Oded Gabbay       2022-10-31  23  #define DRM_ACCEL_FOPS \
2c204f3d53218d Oded Gabbay       2022-10-31  24  	.open		= accel_open,\
2c204f3d53218d Oded Gabbay       2022-10-31  25  	.release	= drm_release,\
2c204f3d53218d Oded Gabbay       2022-10-31  26  	.unlocked_ioctl	= drm_ioctl,\
2c204f3d53218d Oded Gabbay       2022-10-31  27  	.compat_ioctl	= drm_compat_ioctl,\
2c204f3d53218d Oded Gabbay       2022-10-31  28  	.poll		= drm_poll,\
2c204f3d53218d Oded Gabbay       2022-10-31  29  	.read		= drm_read,\
e868cc591e89cf Jeffrey Hugo      2023-01-17  30  	.llseek		= noop_llseek, \
27a838e027e7fc Christian Brauner 2024-04-07  31  	.mmap		= drm_gem_mmap, \
27a838e027e7fc Christian Brauner 2024-04-07  32  	.fop_flags	= FOP_UNSIGNED_OFFSET,
2c204f3d53218d Oded Gabbay       2022-10-31  33  
2c204f3d53218d Oded Gabbay       2022-10-31  34  /**
2c204f3d53218d Oded Gabbay       2022-10-31  35   * DEFINE_DRM_ACCEL_FOPS() - macro to generate file operations for accelerators drivers
2c204f3d53218d Oded Gabbay       2022-10-31  36   * @name: name for the generated structure
2c204f3d53218d Oded Gabbay       2022-10-31  37   *
2c204f3d53218d Oded Gabbay       2022-10-31  38   * This macro autogenerates a suitable &struct file_operations for accelerators based
2c204f3d53218d Oded Gabbay       2022-10-31  39   * drivers, which can be assigned to &drm_driver.fops. Note that this structure
2c204f3d53218d Oded Gabbay       2022-10-31  40   * cannot be shared between drivers, because it contains a reference to the
2c204f3d53218d Oded Gabbay       2022-10-31  41   * current module using THIS_MODULE.
2c204f3d53218d Oded Gabbay       2022-10-31  42   *
2c204f3d53218d Oded Gabbay       2022-10-31  43   * Note that the declaration is already marked as static - if you need a
2c204f3d53218d Oded Gabbay       2022-10-31  44   * non-static version of this you're probably doing it wrong and will break the
2c204f3d53218d Oded Gabbay       2022-10-31  45   * THIS_MODULE reference by accident.
2c204f3d53218d Oded Gabbay       2022-10-31  46   */
2c204f3d53218d Oded Gabbay       2022-10-31  47  #define DEFINE_DRM_ACCEL_FOPS(name) \
2c204f3d53218d Oded Gabbay       2022-10-31  48  	static const struct file_operations name = {\
2c204f3d53218d Oded Gabbay       2022-10-31  49  		.owner		= THIS_MODULE,\
2c204f3d53218d Oded Gabbay       2022-10-31 @50  		DRM_ACCEL_FOPS,\
2c204f3d53218d Oded Gabbay       2022-10-31  51  	}
8bf4889762a8f5 Oded Gabbay       2022-10-31  52  

:::::: The code at line 50 was first introduced by commit
:::::: 2c204f3d53218dd2d14a51a4d0ad510c8d6e775a accel: add dedicated minor for accelerator devices

:::::: TO: Oded Gabbay <ogabbay@kernel.org>
:::::: CC: Oded Gabbay <ogabbay@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
