Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281ED20F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686842800; x=1718378800;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HbWr2S0/Bida9xOAl6bjrnREqBRKgzkgIi8tOFpBhLQ=;
  b=YWIS64c888yx4ZdxppYQKWjidks1y22l6X2dxfLxyai2fqXc0XTTZh0f
   xskp12g3pLmarTx7PDx8nb4SCRPihJFlUENT14/9LoHrqQ5sSwFdMfvT/
   aNSzSBIeZbMpHHXD6RVZ+4C9WQqaP/bS35q/YKs6wyWFsI1I2Tri26Pus
   fzgL94nxz3xTlvosGZTfC/Zozbj9FpB1O1FwQMFhp4cUBp3wvwBVUASpf
   KwVn/qMUffNBXjLKDLWD1ltmAAjYVcxwx1qbOAd1ZJPpr+Q6gzSoNNqvg
   j20LroU6dRx4Sk620BgIH3qrGOJlH6Py/lPn5knGgx5m+PBkR12lJKhi6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348637814"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="348637814"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 08:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="856994904"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="856994904"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2023 08:06:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9oYV-00004p-0I;
	Thu, 15 Jun 2023 15:06:35 +0000
Date: Thu, 15 Jun 2023 23:06:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 4060/30000] security/security.c:455:5:
 warning: no previous prototype for 'lsm_key_alloc'
Message-ID: <202306152333.cP9BSFAP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Casey,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84b0def7f5485c67cb173427c2009a55c6303842
commit: 1d4be734af45c0b49e13f8377be93c2f5cb01a6b [4060/30000] LSM: Infrastructure management of the key security blob
config: i386-randconfig-r021-20230615 (https://download.01.org/0day-ci/archive/20230615/202306152333.cP9BSFAP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/1d4be734af45c0b49e13f8377be93c2f5cb01a6b
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_s
        git checkout 1d4be734af45c0b49e13f8377be93c2f5cb01a6b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152333.cP9BSFAP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/security.c:332:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     332 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:353:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     353 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~
   security/security.c:433:5: warning: no previous prototype for 'lsm_ipc_alloc' [-Wmissing-prototypes]
     433 | int lsm_ipc_alloc(struct kern_ipc_perm *kip)
         |     ^~~~~~~~~~~~~
>> security/security.c:455:5: warning: no previous prototype for 'lsm_key_alloc' [-Wmissing-prototypes]
     455 | int lsm_key_alloc(struct key *key)
         |     ^~~~~~~~~~~~~
   security/security.c:477:5: warning: no previous prototype for 'lsm_msg_msg_alloc' [-Wmissing-prototypes]
     477 | int lsm_msg_msg_alloc(struct msg_msg *mp)
         |     ^~~~~~~~~~~~~~~~~
   security/security.c:499:5: warning: no previous prototype for 'lsm_sock_alloc' [-Wmissing-prototypes]
     499 | int lsm_sock_alloc(struct sock *sock, gfp_t priority)
         |     ^~~~~~~~~~~~~~
   security/security.c:520:5: warning: no previous prototype for 'lsm_superblock_alloc' [-Wmissing-prototypes]
     520 | int lsm_superblock_alloc(struct super_block *sb)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/lsm_key_alloc +455 security/security.c

   445	
   446	#ifdef CONFIG_KEYS
   447	/**
   448	 * lsm_key_alloc - allocate a composite key blob
   449	 * @key: the key that needs a blob
   450	 *
   451	 * Allocate the key blob for all the modules
   452	 *
   453	 * Returns 0, or -ENOMEM if memory can't be allocated.
   454	 */
 > 455	int lsm_key_alloc(struct key *key)
   456	{
   457		if (blob_sizes.lbs_key == 0) {
   458			key->security = NULL;
   459			return 0;
   460		}
   461	
   462		key->security = kzalloc(blob_sizes.lbs_key, GFP_KERNEL);
   463		if (key->security == NULL)
   464			return -ENOMEM;
   465		return 0;
   466	}
   467	#endif /* CONFIG_KEYS */
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
