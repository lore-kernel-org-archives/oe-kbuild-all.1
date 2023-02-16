Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5636FD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676568875; x=1708104875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21F6ZeATCCAcYELhYng2IrjTvFvXrXpP7BPL/Zv6wRM=;
  b=KvRsG1jpNzUPYPH4q+Q1t4AyQIEAoxqci2I1C9KNffrqNyroQOsfQZ8x
   kL01xQzFyzilvU2Mivp9BFJBkoN3v68gITsA4O3PcfNLUKYaYQ/YmRjzQ
   UPq/T1L/yA1DfbcwjgVI9rJCvR5NidJq/r2cHQoOlOfQ6c1WrNqZynFI0
   Zn2lNsYHTBjVHQIwF4zcCfAvLX1RdrD8cdLTb7lgMYRrSWHSbebeVSeZz
   9kZcL7Qxt9DTZEvYeUmkMAfnESSzjSJDbjpTf69Bxb1gBrSGVqprluRR2
   XiWjIw0EUcrnpgD+qDJXK72yvvqcGfY+fFuHGi0lwrOdbPEpgM5ouvC1l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396452382"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="396452382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 09:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759016811"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="759016811"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2023 09:34:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSi9Q-000AO1-0C;
	Thu, 16 Feb 2023 17:34:32 +0000
Date: Fri, 17 Feb 2023 01:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@nvidia.com>
Subject: [tnguy-next-queue:master 27/39]
 drivers/net/ethernet/sfc/efx_devlink.c:522:2: error: unterminated argument
 list invoking macro "memset"
Message-ID: <202302170135.8MjefLR1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git master
head:   40967f77dfa9fa728b7f36a5d2eb432f39de185c
commit: 14743ddd2495c96caa18e382625c034e49a812e2 [27/39] sfc: add devlink info support for ef100
config: s390-randconfig-r035-20230216 (https://download.01.org/0day-ci/archive/20230217/202302170135.8MjefLR1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=14743ddd2495c96caa18e382625c034e49a812e2
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue master
        git checkout 14743ddd2495c96caa18e382625c034e49a812e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/ethernet/sfc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170135.8MjefLR1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/sfc/efx_devlink.c: In function 'efx_devlink_info_running_v2':
>> drivers/net/ethernet/sfc/efx_devlink.c:522:2: error: unterminated argument list invoking macro "memset"
     522 | }
         |  ^
   drivers/net/ethernet/sfc/efx_devlink.c:185:17: warning: statement with no effect [-Wunused-value]
     185 |                 memset(&build_date, 0, sizeof(build_date)
         |                 ^~~~~~
>> drivers/net/ethernet/sfc/efx_devlink.c:185:23: error: expected ';' at end of input
     185 |                 memset(&build_date, 0, sizeof(build_date)
         |                       ^
         |                       ;
   ......
>> drivers/net/ethernet/sfc/efx_devlink.c:185:17: error: expected declaration or statement at end of input
     185 |                 memset(&build_date, 0, sizeof(build_date)
         |                 ^~~~~~
>> drivers/net/ethernet/sfc/efx_devlink.c:185:17: error: expected declaration or statement at end of input
   drivers/net/ethernet/sfc/efx_devlink.c:94:25: warning: unused variable 'build_date' [-Wunused-variable]
      94 |         struct rtc_time build_date;
         |                         ^~~~~~~~~~
   drivers/net/ethernet/sfc/efx_devlink.c: At top level:
   drivers/net/ethernet/sfc/efx_devlink.c:84:13: warning: 'efx_devlink_info_running_v2' defined but not used [-Wunused-function]
      84 | static void efx_devlink_info_running_v2(struct efx_nic *efx,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/efx_devlink.c:46:12: warning: 'efx_devlink_info_stored_versions' defined but not used [-Wunused-function]
      46 | static int efx_devlink_info_stored_versions(struct efx_nic *efx,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memset +522 drivers/net/ethernet/sfc/efx_devlink.c

fa34a5140a8e8f Alejandro Lucero 2023-02-15  515  
fa34a5140a8e8f Alejandro Lucero 2023-02-15  516  void efx_probe_devlink_unlock(struct efx_nic *efx)
fa34a5140a8e8f Alejandro Lucero 2023-02-15  517  {
fa34a5140a8e8f Alejandro Lucero 2023-02-15  518  	if (!efx->devlink)
fa34a5140a8e8f Alejandro Lucero 2023-02-15  519  		return;
fa34a5140a8e8f Alejandro Lucero 2023-02-15  520  
fa34a5140a8e8f Alejandro Lucero 2023-02-15  521  	devl_unlock(efx->devlink);
fa34a5140a8e8f Alejandro Lucero 2023-02-15 @522  }

:::::: The code at line 522 was first introduced by commit
:::::: fa34a5140a8e8f4120e86a1ae622b5df58414c3a sfc: add devlink support for ef100

:::::: TO: Alejandro Lucero <alejandro.lucero-palau@amd.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
