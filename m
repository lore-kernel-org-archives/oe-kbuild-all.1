Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7434D75
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686161841; x=1717697841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OgnQ9RSYvmAx4/jKzuSNk2y8Gm2y5HtAYSDoGb/SrdE=;
  b=jKqvzT7l2J/qKtOsy74a1ve1gBG62rnwNGMDc1jRn7XM9ZgDE4JliuZM
   BkryE86lGIa7K6Ey8LNRXsZWDTffBnU7hxM68VDLCxUIKRHK5siRibr0u
   oDIv/MW5BG3E1VT+s7o3ZXyZpS128WYnqTr8R6WjARTPIUPFySKZIqQ34
   lqdF88NYPbYBhP+6I0EhfJncLTKUvsDP8P2ttTfFWTxKI9j9k2lIcO5Xc
   ohRx/jCu0TfPKzNI30cGdXHRAb9noCGmogTclC3uKX1ZmkSYCLIj3xTrk
   hlNPpVwvk/kx4Gmth1sOsCnDCqYm2X16+d/dnj6PmImNTm3SuyxX7IVUv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360400256"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="360400256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 11:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854019500"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="854019500"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 11:17:19 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6xig-0006nn-2n;
	Wed, 07 Jun 2023 18:17:18 +0000
Date: Thu, 8 Jun 2023 02:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:mnt_idmap_prot 29/29] fs/mnt_idmapping.c:20:19: warning:
 no previous prototype for 'fsnotify_conn_mnt_idmap'
Message-ID: <202306080219.UmA7l5Te-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux mnt_idmap_prot
head:   8e70eb8a651b98677105e34ded526227e7afb4a8
commit: c2694695d45048f17fbb48fafc41a919e3cd2d60 [29/29] fs: add support for "protected" attribute on a mount
config: microblaze-buildonly-randconfig-r003-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080219.UmA7l5Te-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/c2694695d45048f17fbb48fafc41a919e3cd2d60
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il mnt_idmap_prot
        git checkout c2694695d45048f17fbb48fafc41a919e3cd2d60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080219.UmA7l5Te-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mnt_idmapping.c:20:19: warning: no previous prototype for 'fsnotify_conn_mnt_idmap' [-Wmissing-prototypes]
      20 | struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~


vim +/fsnotify_conn_mnt_idmap +20 fs/mnt_idmapping.c

    19	
  > 20	struct mnt_idmap *fsnotify_conn_mnt_idmap(struct fsnotify_mark_connector *conn)
    21	{
    22		return container_of(conn->obj, struct mnt_idmap, fsnotify_marks);
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
