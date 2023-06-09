Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C49200BB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686327937; x=1717863937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TUV3WXkxGDnSUKT0odrqr21Ya/6sLzntQ3G+ecOvDKo=;
  b=TNDttMyf7YK31GdkiuYZsKxoAYCH+17AIEDQk9QhAkJZQhohxDVXn1Zg
   kHaR0Bsohoa7XNrOUMyVF2JWyMvMYA9wuM4y8UPhLFlbuknO57vV4Vz5H
   vri0ZM1zoDEk6oDs3x0hwTavzJYMxOdXb3+K/8/sbguXa0Eu/Y0L5nDmB
   AucL26oz+9sfM77c8hqlpKirzYH5lV3NNxlB+x9klFl1ddvKdeF8oOCal
   1MHId+VeI6bP1eC71pmVJ8Nsv7JdQsaKunHiCOe7eRJ8CrrYLWoL5hby1
   O1UVFhHNWVajOc5NTAMEwlFTLg7t7hdCqmWeVhUKHXrQvMrFOToSrYFO8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="356526149"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="356526149"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 09:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="743541642"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="743541642"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2023 09:25:35 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7evd-0009Ds-2d;
	Fri, 09 Jun 2023 16:25:33 +0000
Date: Sat, 10 Jun 2023 00:24:50 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
Subject: [linux-next:master 7164/8413] uvdevice.c:undefined reference to
 `uv_info'
Message-ID: <202306100056.Z3G9GUfT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   53ab6975c12d1ad86c599a8927e8c698b144d669
commit: f0e8f36f8b99c475ee75455fd68e0b955c5cd1e4 [7164/8413] s390/uvdevice: Add info IOCTL
config: s390-randconfig-r044-20230609 (https://download.01.org/0day-ci/archive/20230610/202306100056.Z3G9GUfT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f0e8f36f8b99c475ee75455fd68e0b955c5cd1e4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f0e8f36f8b99c475ee75455fd68e0b955c5cd1e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100056.Z3G9GUfT-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/s390/char/uvdevice.o: in function `cpu_feature_match_S390_CPU_FEATURE_UV_init':
>> uvdevice.c:(.init.text+0x2e): undefined reference to `uv_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
