Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0452261D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683996735; x=1715532735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BEpfEkzLAJQYo7u9859/iOZWDRTANVaWrsK16OjPNfw=;
  b=GqzOnNYxZp/qNr1dymk5ex34Wne/sFla+CNI0sDlmYUB2BTVejWM+hWl
   s7Pe8uS59jmmOdOwdvJI+rp0mNKgbIat6pkT/PgiuKInK1BPIl0fwLMZP
   sRAmyhWBGeIO2QmSaISghfKgxUGtr1ePA9hYO7GDIfznB0BepdqduCk5t
   SSt/i1qfqU377c4JjElcmAjK9p/sDjAMlgpBDDsMziTtZ8+3S5I+To1/l
   PXYQV+RpNSAwiVgq3gduSQHE6EoSRcHF6YZWjkuxnUO7wJNucE01WUhfS
   Phzq1Hc3FusPGTwp6yhs/3uxmrdhFvZJPxdFjfqNynDSqrUJqJeqBF+8o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="340306222"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="340306222"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 09:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="770126298"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="770126298"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 May 2023 09:52:14 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxsTd-0005aO-17;
	Sat, 13 May 2023 16:52:13 +0000
Date: Sun, 14 May 2023 00:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 09/10] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Message-ID: <202305140001.0dGs26GJ-lkp@intel.com>
References: <20230513132136.15021-10-yi.l.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230513132136.15021-10-yi.l.liu@intel.com>

Hi Yi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc1 next-20230512]
[cannot apply to awilliam-vfio/next awilliam-vfio/for-linus joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-Liu/vfio-iommufd-Create-iommufd_access-for-noiommu-devices/20230513-212336
base:   linus/master
patch link:    https://lore.kernel.org/r/20230513132136.15021-10-yi.l.liu%40intel.com
patch subject: [PATCH v5 09/10] vfio/pci: Extend VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
config: arc-randconfig-r024-20230511 (https://download.01.org/0day-ci/archive/20230514/202305140001.0dGs26GJ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1f9114d23b61451e60915851ae95b7cc3c615c3d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-Liu/vfio-iommufd-Create-iommufd_access-for-noiommu-devices/20230513-212336
        git checkout 1f9114d23b61451e60915851ae95b7cc3c615c3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140001.0dGs26GJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module vfio-pci-core uses symbol iommufd_ctx_has_group from namespace IOMMUFD, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
