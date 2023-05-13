Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC219EDB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 06:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683958269; x=1715494269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72itzeKxsk7S7f1i1V3zonGHpciPHvK7GsN+s81/H4w=;
  b=T0xjPuXK9XvC5ylM4Ta3d5K8iPEsA5OLNjjLcE7qVE/yDXxvwc8FLtCM
   889kDn68me9V9ExG+tXZ7ig+J8JbEH7Rgr6ag0VZmstjBS4Vudf4BqbmU
   Kt9j9ZrByYX51uGRz/0ghkVhY4NsX2DXxReFMBh2UQ1kCeVGeQjVz1rv8
   MoFYgJsd4wzJIcTxAW/B0D6EWoCFc1j1Yn7B8x2BcqUk0PA5/2zl8ZY48
   OpPRdH+D9DjZPa9edlZezH+5u45CzIMLT+g5w8XQiM0trbKc4xbc/G4L2
   0uC6+M4dPUE9WheLCGYtC3opShOAGhRV+bg8vDzB4U6FI3Az5GQoVpWiC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354069734"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="354069734"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 23:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="765377755"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="765377755"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2023 23:11:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxiTC-0005Mo-0e;
	Sat, 13 May 2023 06:11:06 +0000
Date: Sat, 13 May 2023 14:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nico Boehr <nrb@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH 1/5] s390/uvdevice: Add info IOCTL
Message-ID: <202305131333.DKwclZxs-lkp@intel.com>
References: <20230512093153.206378-2-seiden@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512093153.206378-2-seiden@linux.ibm.com>

Hi Steffen,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvms390/next]
[also build test ERROR on s390/features mst-vhost/linux-next linus/master v6.4-rc1 next-20230512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Eiden/s390-uvdevice-Add-info-IOCTL/20230512-174226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
patch link:    https://lore.kernel.org/r/20230512093153.206378-2-seiden%40linux.ibm.com
patch subject: [PATCH 1/5] s390/uvdevice: Add info IOCTL
config: s390-randconfig-s043-20230509 (https://download.01.org/0day-ci/archive/20230513/202305131333.DKwclZxs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/82f137c1686ef0317cd12c5737fa349f2582163c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steffen-Eiden/s390-uvdevice-Add-info-IOCTL/20230512-174226
        git checkout 82f137c1686ef0317cd12c5737fa349f2582163c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131333.DKwclZxs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "uv_info" [drivers/s390/char/uvdevice.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
