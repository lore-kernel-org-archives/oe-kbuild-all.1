Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D68BA54
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679593362; x=1711129362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+xTf/86J1kbCBTb2NcGIukazyguIr78YmS1f061ptM=;
  b=fLAvo3a4/GTU5T3OYikwV9SBSnPj46OSoKEeecveAFQ3rI1yI/A+uSLb
   SLojVk6FT0UNcOAV2tOmUdS6MzNDNxHwFSN1icAcAYMd9Z0lwZ1pcY0Q/
   nULJQahizX3BSwj65DPJkJ4q1j2nlChOLXOSkaNtKsnG30nq3orSa4uMb
   h2bf8IVTg+9wUI3lIDysJKqUDCEomwYiLNrp4/JhijgxRbPyWsq7Cp5Tq
   vcA4AwPBq5Vqve3XTrMvMq/I1p/1yP6874A89Sy+QUY9VgHkVl+kDYUDa
   /sEu2GAZfkKHgIeD5zUd8oNVXNB+rGTnAFtbwvJJQSfw7ttrZjw4yxI8m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319230411"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="319230411"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="856579644"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="856579644"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Mar 2023 10:42:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfOxQ-000EaI-35;
	Thu, 23 Mar 2023 17:42:36 +0000
Date: Fri, 24 Mar 2023 01:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202303240127.hyNYFwhJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: b7aa7e9f2bc16fe18b1cced9581df8527baf2dea Merge origin/chromeos-5.10-esdfs
date:   2 years, 3 months ago
config: alpha-randconfig-s053-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240127.hyNYFwhJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=b7aa7e9f2bc16fe18b1cced9581df8527baf2dea
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout b7aa7e9f2bc16fe18b1cced9581df8527baf2dea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240127.hyNYFwhJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/esdfs/file.c:382:1: sparse: sparse: symbol 'esdfs_read_iter' was not declared. Should it be static?
   fs/esdfs/file.c:410:1: sparse: sparse: symbol 'esdfs_write_iter' was not declared. Should it be static?
   fs/esdfs/file.c: note: in included file:
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/esdfs/inode.c: note: in included file:
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/esdfs/lookup.c: note: in included file:
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/esdfs/mmap.c: note: in included file:
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred
--
   fs/esdfs/derive.c: note: in included file:
>> fs/esdfs/esdfs.h:616:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] __rcu *cred @@
   fs/esdfs/esdfs.h:616:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:616:51: sparse:     got struct cred const [noderef] __rcu *cred

vim +616 fs/esdfs/esdfs.h

f5548a15ab7ead Russ W. Knize 2013-04-07  613  
f5548a15ab7ead Russ W. Knize 2013-04-07  614  static inline void esdfs_revert_creds(const struct cred *creds, int *mask)
f5548a15ab7ead Russ W. Knize 2013-04-07  615  {
f5548a15ab7ead Russ W. Knize 2013-04-07 @616  	const struct cred *current_creds = current->cred;
f5548a15ab7ead Russ W. Knize 2013-04-07  617  
f5548a15ab7ead Russ W. Knize 2013-04-07  618  	/* restore the old umask */
f5548a15ab7ead Russ W. Knize 2013-04-07  619  	if (mask)
f5548a15ab7ead Russ W. Knize 2013-04-07  620  		*mask = xchg(&current->fs->umask, *mask & S_IRWXUGO);
f5548a15ab7ead Russ W. Knize 2013-04-07  621  
f5548a15ab7ead Russ W. Knize 2013-04-07  622  	/* restore the old creds into current */
f5548a15ab7ead Russ W. Knize 2013-04-07  623  	revert_creds(creds);
f5548a15ab7ead Russ W. Knize 2013-04-07  624  	put_cred(current_creds);	/* destroy the old temporary creds */
f5548a15ab7ead Russ W. Knize 2013-04-07  625  }
f5548a15ab7ead Russ W. Knize 2013-04-07  626  

:::::: The code at line 616 was first introduced by commit
:::::: f5548a15ab7ead52d472cb9ee29964b90e7caf1c CHROMIUM: fs: Import esdfs code

:::::: TO: Russ W. Knize <Russ.Knize@motorola.com>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
