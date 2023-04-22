Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143532F23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682172887; x=1713708887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uYEuiTR6fhr5f/c0XpwxQASoz/w9TyegwASpcO4RLjo=;
  b=agFkRdm/qpAlVNycPMKS+D54Eq7NNEVVuZL7gg0fD3H7ejy1YtdMoJrd
   bq+7CN3cRZGHIJ/TRmOsaptRkgxRuKhkc+F4U1IH1LOxUnunO/tqfQ6E2
   /5Bzn+tXFrACB5qMsQTDZvJ96FEzEDMUwLWb/7NXgeVOX5YL8+rYvZZC9
   gKKrkgdfsO9rrTxER18B7lxtRRXWiEacEVZn8X70RgKFuFy+kGemoL4J/
   3k+XUapw7BeeR8BdOFiRprJQucgyvP6KBH1ZS4btt4uMYJVfNJ0ScmI6P
   kc1J14tbDxJI1cPAcoecCNi8HYUCM6FUYn8OLNmnVHbq9zR0tSaD6DgFe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="432436900"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="432436900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 07:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="695230385"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="695230385"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 07:14:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqE0j-000hKS-05;
	Sat, 22 Apr 2023 14:14:45 +0000
Date: Sat, 22 Apr 2023 22:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:make-buffer_heads-optional 13/14] fops.c:undefined
 reference to `iomap_file_buffered_write'
Message-ID: <202304222208.PkmI2Xsu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git make-buffer_heads-optional
head:   174c941608ab09d2dc94900c64dd05128de04796
commit: 854fe8e72a7e983e250b80e95a99f45ea035f317 [13/14] block: use iomap for writes to block devices
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230422/202304222208.PkmI2Xsu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block make-buffer_heads-optional
        git checkout 854fe8e72a7e983e250b80e95a99f45ea035f317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222208.PkmI2Xsu-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: block/fops.o: in function `.L256':
>> fops.c:(.text+0x11ac): undefined reference to `iomap_file_buffered_write'
   loongarch64-linux-ld: block/fops.o: in function `.L250':
   fops.c:(.text+0x11e4): undefined reference to `iomap_file_buffered_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
