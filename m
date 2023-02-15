Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70706FC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676478174; x=1708014174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xb5C11bLneJM/NUo8erZUmSJVAXgeXGUFBtTWuS190U=;
  b=E6pQwAlYrcMRsaGeZG0FeKuPqMUgHb77XU9VokYS9EhpmXtux3HGPMyo
   IYWKT0q5XE7WEdBr7jQfd4UpGJ6/6FZPS2QQB3U8sSRF2TD2o/WBbwUY1
   tFs/1qc4UuHqjPzIFyh5tgVgGRhxXjjqsyQ4siqRNBWyKzSUiMhchp4q4
   UKF/YR4/XsoaIJbK5TqdvcGExLi/t2kJ0DF5mNFi3GqdSRFrpbgD6ab7t
   eDnjkQfiAZk36GVRPJCwYHE3iUb8/9UEKW7E583swqgtPOuxPlO+q+yr1
   1dqa+rzBtOwy1rJa4FkobZfLrez0BkJnGzjrKojb6b3OOuHg5LAECEFTF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="315122532"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="315122532"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 08:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="843631600"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="843631600"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 08:22:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSKYW-0009Xj-1L;
	Wed, 15 Feb 2023 16:22:52 +0000
Date: Thu, 16 Feb 2023 00:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1980/7892]
 drivers/md/dm-user.c:525:6: sparse: sparse: symbol 'message_kill' was not
 declared. Should it be static?
Message-ID: <202302160043.RwOn44ew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   e88b0fcae6db893ef5f2a45ad70499e02ee01a4e
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/7892] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230216/202302160043.RwOn44ew-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout 83bf345abc0bc06b98e906bfbb120a52446e1c43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160043.RwOn44ew-lkp@intel.com/

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
