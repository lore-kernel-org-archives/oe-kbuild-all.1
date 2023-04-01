Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A515A3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 02:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680316450; x=1711852450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBgonofK0dQgeDZsmSForg1G8ge6gLhM7jGEB72EbiE=;
  b=RDWQzGzAN5pvVbTLuBSsu1rYT8jRFusw1sbYo59liaXL0Bci2ximYJnc
   KTCk2pIhz/y4W6KdNUG3S8UkbbBOI6jH7bvOTL3K6R0XkyUwfNXvSVpmP
   yvO+Q4ZwfCpGrfKLZB1DvimollRMym1smYVegpnMnIjRJsHSvQeidcMY+
   FZFAgOUkdia0s48FT1bNvOEu1s3+dmGj2AlnVja9G36epm2eVWZidk067
   TJmmJerGdACnOLvnv8xzV9FZZm55PQnE5ulLoCfgMyPeQopd/ccsGRemt
   nnryYlpwiFqD3Vf9x3SFMRYbpwjpnaKAdQsMkKo8hIA3I6CDak/1H1qxE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="427882854"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="427882854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 19:34:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="715656969"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="715656969"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Mar 2023 19:34:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piR4B-000MNp-1j;
	Sat, 01 Apr 2023 02:34:07 +0000
Date: Sat, 1 Apr 2023 10:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:tmp 16/25]
 drivers/media/platform/ti/omap3isp/isp.c:1968:9: error: implicit declaration
 of function 'v4l2_async_notifier_cleanup'; did you mean
 'v4l2_async_nf_cleanup'?
Message-ID: <202304011023.E3XrM9LC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   42249987f00786a33526b973c650743bc49681c2
commit: d53fa8dcae176a268e39d8d14f778268d8d22d0a [16/25] omap3isp: Release the isp device struct by media device callback
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230401/202304011023.E3XrM9LC-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree tmp
        git checkout d53fa8dcae176a268e39d8d14f778268d8d22d0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011023.E3XrM9LC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/ti/omap3isp/isp.c: In function 'isp_release':
>> drivers/media/platform/ti/omap3isp/isp.c:1968:9: error: implicit declaration of function 'v4l2_async_notifier_cleanup'; did you mean 'v4l2_async_nf_cleanup'? [-Werror=implicit-function-declaration]
    1968 |         v4l2_async_notifier_cleanup(&isp->notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_async_nf_cleanup
   cc1: some warnings being treated as errors


vim +1968 drivers/media/platform/ti/omap3isp/isp.c

  1959	
  1960	static void isp_release(struct media_device *mdev)
  1961	{
  1962		struct isp_device *isp =
  1963			container_of(mdev, struct isp_device, media_dev);
  1964	
  1965		isp_cleanup_modules(isp);
  1966	
  1967		media_entity_enum_cleanup(&isp->crashed);
> 1968		v4l2_async_notifier_cleanup(&isp->notifier);
  1969	
  1970		kfree(isp);
  1971	}
  1972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
