Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443A7E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 00:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685491911; x=1717027911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qCW6f5bONF4ov+XksrgUtUDTiIuxULxtzYku56KGsd0=;
  b=hhFSuX9HMew72Gw/pUWrxrZAVl4aEady1Cu0K4Ew55jCqeqIEbWJfLwy
   5EiNLzfQiJzqY7Sl0++4pHkjJvL3/+I0Yh50+eMhoww3gxGMOCyAsjAoe
   Xpg+hze1U0096JL3Oc34L7mPGR+6Beq0xHjbDws8b3rOwaILdiD9iT0Ac
   FaSALooVZc4HWzfu1k7JQe92w+JLH6qnG6XU93Pb3A+mbMIq96Pts4GMD
   COyAb9gH+IF4Oquzp1abZSxtojgklFVX7twgq4Du0La/8aqmOnddqofGe
   khbiiLMTBUEXigEIbtQOcXCK7Ij/uyIQr0C0F9uqMoyXXIHOEjvNLlc8Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383344846"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="383344846"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 17:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="771773546"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="771773546"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 May 2023 17:11:50 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q49RN-0000v5-20;
	Wed, 31 May 2023 00:11:49 +0000
Date: Wed, 31 May 2023 08:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-05112023-yi-no-bitmap 29/51]
 htmldocs: Documentation/userspace-api/iommufd:174:
 ./include/uapi/linux/iommufd.h:532: WARNING: Inline strong start-string
 without end-string.
Message-ID: <202305310824.bfZwB7aB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-05112023-yi-no-bitmap
head:   9d42da14a06f33e64fc593b2287ad9a9a4d12880
commit: b0ca1cf8cb621c86c979b0bba9f9f3b43ec65299 [29/51] iommu/vt-d: Add iotlb flush for nested domain
reproduce:
        # https://github.com/yiliu1765/iommufd/commit/b0ca1cf8cb621c86c979b0bba9f9f3b43ec65299
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-05112023-yi-no-bitmap
        git checkout b0ca1cf8cb621c86c979b0bba9f9f3b43ec65299
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310824.bfZwB7aB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:532: WARNING: Inline strong start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
