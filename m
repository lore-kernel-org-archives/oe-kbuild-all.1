Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1C637
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 00:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686185948; x=1717721948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iKT9SeYaa9aMV1hxaKdQBc+gTC22IMQ7/Sqhx6s+exc=;
  b=EMAcM4ZfEbr9fHLLrhMLU8DU+XFLvAQZomRjY2y8meFdPd7cotoh4EfN
   QD0t1+QLExnjmkzTnAlpKK/xeuHi5lmjSdrrJrTzFDn7KGio1Ki++3Iuw
   RnHW5CgBeagZ/cYADxioj/xuGQrP3Nwi61Tz49n0oOQvzXm5Jh077DU+4
   LqSJYCS1shSRwU1XqX60D+UwUDOGZlyzwBkn19933i+otCADWqBbN8HQ4
   rrtAfSs/ss4BaqkZIJwk8JHdLeKWyAtomBcMTijgrLh2Eb7JQNpRu2FCd
   0Ooe+pCcY29P6okIGAHxsNG93kVyDnkBO6jXgX7zzXT1st1w7Vv0VruWq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336782145"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="336782145"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 17:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799605076"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="799605076"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2023 17:59:05 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q73zV-00073z-0W;
	Thu, 08 Jun 2023 00:59:05 +0000
Date: Thu, 8 Jun 2023 08:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next v12 2/4] ice: configure FW
 logging
Message-ID: <202306080833.aw31Lseu-lkp@intel.com>
References: <20230607222443.119-3-paul.m.stillwell.jr@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607222443.119-3-paul.m.stillwell.jr@intel.com>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-M-Stillwell-Jr/ice-remove-FW-logging-code/20230608-062658
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230607222443.119-3-paul.m.stillwell.jr%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v12 2/4] ice: configure FW logging
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306080833.aw31Lseu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/20230607222443.119-3-paul.m.stillwell.jr@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080833.aw31Lseu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_debugfs.c:504:37: warning: 'ice_debugfs_enable_fops' defined but not used [-Wunused-const-variable=]
     504 | static const struct file_operations ice_debugfs_enable_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/ice_debugfs_enable_fops +504 drivers/net/ethernet/intel/ice/ice_debugfs.c

   503	
 > 504	static const struct file_operations ice_debugfs_enable_fops = {
   505		.owner = THIS_MODULE,
   506		.open  = simple_open,
   507		.read = ice_debugfs_enable_read,
   508		.write = ice_debugfs_enable_write,
   509	};
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
