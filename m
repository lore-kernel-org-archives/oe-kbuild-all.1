Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2733C00
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 12:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678190587; x=1709726587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l1clGx5jIFXWTjr0l7YZHDdAwr7fHjYS3AtzNmceqmM=;
  b=laZoUihCo43+EhBbpoO2F9Jn53G5NpVBUK8gH77mJPM9vIjI/9YikG3A
   GW5DiGPAzxQaLG8gglEYeKuOL9tvHvmnXl1xvopLzc/aRcBjUIHhIGRm2
   txn7kIEUJggM9+LLZzcVmXY9lP7QWTV7yMZLO/6dIvnrLKYjYtFWBlcQx
   rJGIVPYI7Mgr1jLBNyyAK7Il4/WG4fn8mpWh38Ykvm+LPuzTu9/4wzeKy
   f8VvYmMEQiTLzLYhzz7zyczZYCVtBOj5a3fnpzDx2Q7XBRwCdlpSfm3g/
   iSQI77vzXnq9k8TorSXkGcq+uZXtqncub8rKb1eYiQyu6Wy7F5yM5YU6S
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315487117"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="315487117"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 04:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745438490"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="745438490"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 04:03:03 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZW22-0001H9-2h;
	Tue, 07 Mar 2023 12:03:02 +0000
Date: Tue, 7 Mar 2023 20:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: mingzhe <mingzhe.zou@easystack.cn>, colyli@suse.de,
	bcache@lists.ewheeler.net, andrea.tomassetti-opensource@devo.com
Cc: oe-kbuild-all@lists.linux.dev, linux-bcache@vger.kernel.org,
	zoumingzhe@qq.com
Subject: Re: [PATCH v6 1/3] bcache: add dirty_data in struct bcache_device
Message-ID: <202303071948.FdodHBjj-lkp@intel.com>
References: <20230307101842.2450-1-mingzhe.zou@easystack.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307101842.2450-1-mingzhe.zou@easystack.cn>

Hi mingzhe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc1 next-20230307]
[cannot apply to song-md/md-next device-mapper-dm/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mingzhe/bcache-allocate-stripe-memory-when-partial_stripes_expensive-is-true/20230307-181923
patch link:    https://lore.kernel.org/r/20230307101842.2450-1-mingzhe.zou%40easystack.cn
patch subject: [PATCH v6 1/3] bcache: add dirty_data in struct bcache_device
config: m68k-allyesconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9c7354d0ffcbc41178540901315f22fb0a16b11a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review mingzhe/bcache-allocate-stripe-memory-when-partial_stripes_expensive-is-true/20230307-181923
        git checkout 9c7354d0ffcbc41178540901315f22fb0a16b11a
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=m68k 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071948.FdodHBjj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/Kconfig:42: can't open file "drivers/md/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: allyesconfig] Error 1
   make[1]: *** [Makefile:693: allyesconfig] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'allyesconfig' not remade because of errors.
--
>> drivers/Kconfig:42: can't open file "drivers/md/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[1]: *** [Makefile:693: oldconfig] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/Kconfig:42: can't open file "drivers/md/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[1]: *** [Makefile:693: olddefconfig] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +42 drivers/Kconfig

c6fd280766a050 Jeff Garzik    2006-08-10  41  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @42  source "drivers/md/Kconfig"
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
