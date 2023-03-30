Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55072C2FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680179221; x=1711715221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gJvnZgQkue/12hrpL+swh+HJ0hl42bCVklNCda2py/c=;
  b=UIIKKj/J649T10NwOrCI+CRkofAt3UGORHuwRCd3z3hIseU4lzU8fmQp
   KTazcSZSPGczmB3DfSh25FcX1i+lc0XCVbv0rAxQLccHp6rv+Aib3Hcf8
   ppXkdqRom/NNjv1GLc36i6Kzvel6Rkg4zIScxClgFIBWaX+nu5Ao1aF7P
   GBeQXYjAu7ccZlC0RfqBxVwpx4c7M5jPhu2wOyRqgTFSAAgNsmjoP9CV0
   7V739Dr0aryemzFC+L5zvdD1sG3wjTlzr6GljDFt3L8ZrDlgSXxFb3iUR
   XelEzHz9HByz07ttqiDpzs0n4aGTyi+/lzCnQ6gBzN8YUqlQrTqkgYmVp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427429503"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="427429503"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 05:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753982185"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="753982185"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 05:26:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phrMi-000KqC-28;
	Thu, 30 Mar 2023 12:26:52 +0000
Date: Thu, 30 Mar 2023 20:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tomba@kernel.org,
	javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel
 client
Message-ID: <202303302056.9US55Dt4-lkp@intel.com>
References: <20230330083205.12621-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330083205.12621-7-tzimmermann@suse.de>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-omapdrm-Include-linux-of-h/20230330-163453
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230330083205.12621-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel client
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303302056.9US55Dt4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b54095ec3eaa71a5cc6b433dfbbf58e26c44e38
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-omapdrm-Include-linux-of-h/20230330-163453
        git checkout 5b54095ec3eaa71a5cc6b433dfbbf58e26c44e38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/omapdrm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302056.9US55Dt4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/omap_fbdev.c:306:6: warning: no previous prototype for 'omap_fbdev_setup' [-Wmissing-prototypes]
     306 | void omap_fbdev_setup(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~


vim +/omap_fbdev_setup +306 drivers/gpu/drm/omapdrm/omap_fbdev.c

   305	
 > 306	void omap_fbdev_setup(struct drm_device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
