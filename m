Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED771D309
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 02:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677293118; x=1708829118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nzueu2sQyogCh8gsAOnv/vPgotHpS6OD6b0kcXEDdcA=;
  b=fZ4svptmz6A1luQ9S3uMNSOAoY6vs8ILcB1O8IUMkNxijaULztpC1txo
   PuWBXIuiJLrn3xrKBQrpngWv694kwH+ENjQEjCA+QQ5UwkLSi27o3fToG
   cCkcFrur5vNSDKXR4FKUqtVrZZJj0pb40n6vLs6vBJWMKY4sUfo7+Z9Gk
   d3H+ra+jdOonReJ0Txd6OnQkj/uwKf8KmZbKoFaAxPFovKnynS3OHqRla
   +iUAC+UX63dps9+mPKEsBIxqwCALxJfZ78EmMIfwWjddY6vIM3N4shJm/
   f1teAVpFO2svVejCjXHIdDwRLvETCpbEPlU1Gz1inSKAVxTQvXVEh7lOk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="419856752"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="419856752"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 18:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673097103"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="673097103"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Feb 2023 18:45:15 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVkYk-0002rf-2q;
	Sat, 25 Feb 2023 02:45:14 +0000
Date: Sat, 25 Feb 2023 10:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 10/15] drm/vblank: Add helper to get next vblank time
Message-ID: <202302251010.iEgHwScn-lkp@intel.com>
References: <20230224200155.2510320-11-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224200155.2510320-11-robdclark@gmail.com>

Hi Rob,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm/drm-next linus/master v6.2 next-20230224]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/dma-buf-dma-fence-Add-deadline-awareness/20230225-040451
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230224200155.2510320-11-robdclark%40gmail.com
patch subject: [PATCH v6 10/15] drm/vblank: Add helper to get next vblank time
config: parisc-buildonly-randconfig-r001-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251010.iEgHwScn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/afd134c1224b4bf8b1e52f3c1e9baed6ee4fb49d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/dma-buf-dma-fence-Add-deadline-awareness/20230225-040451
        git checkout afd134c1224b4bf8b1e52f3c1e9baed6ee4fb49d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251010.iEgHwScn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
