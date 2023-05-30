Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11667EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 00:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685405868; x=1716941868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BQGnwKQIh2LTnln9TrN+BbBt7iNLC11YpkjTLybuanI=;
  b=E02nuBefhEFI+Hk8yYzc8PnRrq0Tm2/sLvTh8SgQMnoXvXauPtdDvYAr
   XpvOHgtaLiEffYpqxV5GoyAWVEmCfpA4L/ngyMDtrFdzCJ7xvWhK7YfKr
   bShEf5puy1ReFvCWUu6dPl5LqhAtxAb5qerwS3jdWnarurJxmBBCPXtcg
   R0Sz8S/+AtIrGF93o2Sr0o/qh5dZ7xjdCe+DAq+cPq9x+j3ibDjgMdeAZ
   VTEqfzq60ywn/Bx8preVhp96Eiea6O3V8x4lmogxHVPcPH588GWUrFxxO
   7fpW/oAzJgYb4/z2peuqwU0fm+yGoR0BZ3052xIqiCXXQGjXCdqqNm8a1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334407857"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="334407857"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 17:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="776075170"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="776075170"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 May 2023 17:17:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3n3Z-000LBa-29;
	Tue, 30 May 2023 00:17:45 +0000
Date: Tue, 30 May 2023 08:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 1/12] drivers/infiniband/hw/mlx4/sysfs.c:384:24: warning:
 assignment discards 'const' qualifier from pointer target type
Message-ID: <202305300835.AMAbLTxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   67efa89e18815a99a50013cbce4bebdddc63d53b
commit: 57d2ad8b4acb70aac5d967ff23fa3729bf5ad6f6 [1/12] sysfs: Constify attrs pointers in struct attribute_group
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230530/202305300835.AMAbLTxH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/57d2ad8b4acb70aac5d967ff23fa3729bf5ad6f6
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 57d2ad8b4acb70aac5d967ff23fa3729bf5ad6f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kernel/ arch/s390/pci/ drivers/block/zram/ drivers/infiniband/hw/mlx4/ drivers/infiniband/hw/mlx5/ drivers/misc/genwqe/ drivers/s390/block/ drivers/s390/char/ drivers/s390/cio/ drivers/s390/crypto/ drivers/s390/net/ drivers/s390/scsi/ drivers/tty/hvc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300835.AMAbLTxH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/mlx4/sysfs.c: In function 'mlx4_port_release':
>> drivers/infiniband/hw/mlx4/sysfs.c:384:24: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     384 |         for (i = 0; (a = p->pkey_group.attrs[i]); ++i)
         |                        ^
   drivers/infiniband/hw/mlx4/sysfs.c:387:24: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     387 |         for (i = 0; (a = p->gid_group.attrs[i]); ++i)
         |                        ^
   drivers/infiniband/hw/mlx4/sysfs.c: In function 'add_port':
   drivers/infiniband/hw/mlx4/sysfs.c:648:29: error: assignment to 'const struct attribute **' from incompatible pointer type 'struct attribute **' [-Werror=incompatible-pointer-types]
     648 |         p->pkey_group.attrs =
         |                             ^
   drivers/infiniband/hw/mlx4/sysfs.c:662:28: error: assignment to 'const struct attribute **' from incompatible pointer type 'struct attribute **' [-Werror=incompatible-pointer-types]
     662 |         p->gid_group.attrs = alloc_group_attrs(show_port_gid_idx, NULL, 1);
         |                            ^
   cc1: some warnings being treated as errors


vim +/const +384 drivers/infiniband/hw/mlx4/sysfs.c

c1e7e466120b80c Jack Morgenstein 2012-08-03  376  
c1e7e466120b80c Jack Morgenstein 2012-08-03  377  
c1e7e466120b80c Jack Morgenstein 2012-08-03  378  static void mlx4_port_release(struct kobject *kobj)
c1e7e466120b80c Jack Morgenstein 2012-08-03  379  {
c1e7e466120b80c Jack Morgenstein 2012-08-03  380  	struct mlx4_port *p = container_of(kobj, struct mlx4_port, kobj);
c1e7e466120b80c Jack Morgenstein 2012-08-03  381  	struct attribute *a;
c1e7e466120b80c Jack Morgenstein 2012-08-03  382  	int i;
c1e7e466120b80c Jack Morgenstein 2012-08-03  383  
c1e7e466120b80c Jack Morgenstein 2012-08-03 @384  	for (i = 0; (a = p->pkey_group.attrs[i]); ++i)
c1e7e466120b80c Jack Morgenstein 2012-08-03  385  		kfree(a);
c1e7e466120b80c Jack Morgenstein 2012-08-03  386  	kfree(p->pkey_group.attrs);
c1e7e466120b80c Jack Morgenstein 2012-08-03  387  	for (i = 0; (a = p->gid_group.attrs[i]); ++i)
c1e7e466120b80c Jack Morgenstein 2012-08-03  388  		kfree(a);
c1e7e466120b80c Jack Morgenstein 2012-08-03  389  	kfree(p->gid_group.attrs);
c1e7e466120b80c Jack Morgenstein 2012-08-03  390  	kfree(p);
c1e7e466120b80c Jack Morgenstein 2012-08-03  391  }
c1e7e466120b80c Jack Morgenstein 2012-08-03  392  

:::::: The code at line 384 was first introduced by commit
:::::: c1e7e466120b80ce49e91af0c9da1ce6dee4844a IB/mlx4: Add iov directory in sysfs under the ib device

:::::: TO: Jack Morgenstein <jackm@dev.mellanox.co.il>
:::::: CC: Roland Dreier <roland@purestorage.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
