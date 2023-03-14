Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4B2F29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678788932; x=1710324932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g60jSxQll0A7P8/+8Y/Ke216w5oCZw8ZaRepH1DIdjQ=;
  b=MLh8AaXfiKo+WFTuoWBeEvxZ8sS/vibmnwpF2nPrYmFyKc/i9F37EfKw
   qc4lfNG6A2JwDyToEs/uQ73N3srIpGynfMatf9Q3o6uiDwnFqEbwnHmsC
   0L9KsV97buGPu61HaohiEdrVSuZBZzoSz0oCynC18brMH/wTZZCVwsigI
   +Dz81UHAFjoBY4PNTXxPqWuU7Il54wZLsoqDqNgRSbglb96toKyPjnjwg
   fUlER9d03uaDF7xO0zzPHbrHXXHWFn1lVEobvNbQrsdvASHaUDw30i3cJ
   Lkul/7eHNEImK6EFj4K9aIPoc7HFIT0zLCplOSe45A1JpG84NCckQyf54
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317771660"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="317771660"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 03:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="853121752"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="853121752"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Mar 2023 03:15:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc1gn-0006oa-2B;
	Tue, 14 Mar 2023 10:15:29 +0000
Date: Tue, 14 Mar 2023 18:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>
Subject: [song-md:md-next 15/18] drivers/md/md-cluster.c:425:63: error:
 'mddev' undeclared
Message-ID: <202303141841.7hUZnSGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
head:   ec7246c9455e83f452055cec9c39bd54e72217a4
commit: 48b34bba06372e5f6645716b57394db28fa7260c [15/18] md: refactor md_wakeup_thread()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230314/202303141841.7hUZnSGb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/commit/?id=48b34bba06372e5f6645716b57394db28fa7260c
        git remote add song-md git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git
        git fetch --no-tags song-md md-next
        git checkout 48b34bba06372e5f6645716b57394db28fa7260c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141841.7hUZnSGb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/md-cluster.c: In function 'ack_bast':
>> drivers/md/md-cluster.c:425:63: error: 'mddev' undeclared (first use in this function)
     425 |                         md_wakeup_thread(&cinfo->recv_thread, mddev);
         |                                                               ^~~~~
   drivers/md/md-cluster.c:425:63: note: each undeclared identifier is reported only once for each function it appears in


vim +/mddev +425 drivers/md/md-cluster.c

   412	
   413	/*
   414	 * The BAST function for the ack lock resource
   415	 * This function wakes up the receive thread in
   416	 * order to receive and process the message.
   417	 */
   418	static void ack_bast(void *arg, int mode)
   419	{
   420		struct dlm_lock_resource *res = arg;
   421		struct md_cluster_info *cinfo = res->mddev->cluster_info;
   422	
   423		if (mode == DLM_LOCK_EX) {
   424			if (test_bit(MD_CLUSTER_ALREADY_IN_CLUSTER, &cinfo->state))
 > 425				md_wakeup_thread(&cinfo->recv_thread, mddev);
   426			else
   427				set_bit(MD_CLUSTER_PENDING_RECV_EVENT, &cinfo->state);
   428		}
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
