Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F02B1105
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 02:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680142413; x=1711678413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWTgTDdynPvopPGL+vYJbIn655YzBtnJ2eoaiQSqbjY=;
  b=h2DnzR84+6uRyyCZ+WUUdY5U50ZekZEyPr1uGSu0cVndV0AqDaZmBl5H
   fZTRjJsGnohlDmajIeHQGaum9RUOo5lwrDpSSnzyL1D898kA+ag448ktI
   6lFaw3mj7g0bRjrerVSJ0Elv9MMKhZy50+fzbolAOMFml2L81DfWkrWdN
   uJX296DKaOnmOlT3Imz4IS2wG1nrnvFOmvSPTn2+IrdR67P9gpwpk6G6f
   6jPlOFtEa/FM8Kukt1YCQf5Go/085P0zJVKtIwvz9E6zlv5WndHGhBAom
   /W2h6MwdcD84HKkWLo2FVW8+4u7EUlfhpMmQPOHhqt++DCPQDl+VhMdWl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="403694741"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="403694741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 19:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717120754"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="717120754"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 19:13:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phhmy-000KAi-2s;
	Thu, 30 Mar 2023 02:13:20 +0000
Date: Thu, 30 Mar 2023 10:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1980/7896]
 drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not
 declared. Should it be static?
Message-ID: <202303301023.TcJ8IpHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   993014e4433829d09f2664c6d8576041bf9914ea
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/7896] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: arm-randconfig-s033-20230326 (https://download.01.org/0day-ci/archive/20230330/202303301023.TcJ8IpHT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 83bf345abc0bc06b98e906bfbb120a52446e1c43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/arm_scmi/ drivers/hwtracing/coresight/ drivers/md/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301023.TcJ8IpHT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not declared. Should it be static?
   drivers/md/dm-user.c:539:5: sparse: sparse: symbol 'target_poll' was not declared. Should it be static?
   drivers/md/dm-user.c:544:6: sparse: sparse: symbol 'target_release' was not declared. Should it be static?
   drivers/md/dm-user.c:565:6: sparse: sparse: symbol 'target_put' was not declared. Should it be static?

vim +/message_kill +525 drivers/md/dm-user.c

   524	
 > 525	void message_kill(struct message *m, mempool_t *pool)
   526	{
   527		m->bio->bi_status = BLK_STS_IOERR;
   528		bio_endio(m->bio);
   529		bio_put(m->bio);
   530		mempool_free(m, pool);
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
