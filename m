Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865F8F54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 22:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680300489; x=1711836489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfhXH7Tsc8QCJ9vkfHUOGo0fDtEC/tsq73O4OsNA7ss=;
  b=SLOM+s7zWXghp0sGLFyYmSp7rAzDKV9BB6yPXo/K2+rZObkVvy1nE68r
   14/AouJIyLf1rilchR/BGMdIS3x66p0VV91Zuv6IwtG9fUmGh+Q+vKzCw
   cVibWZqwG4H2ZX6CRrYjVw9e5BOt4VmLV+qMHle8c1MDl2cLzw3odayne
   SGr69EWnTNXwJSdhBzTA++7TwUUg81nksCOmdoiN3G37uJrnyLzkSbtx/
   hVqNbGnBZ4PxqdmrzxDFcJckkiWwRVqQ2upqVquX5BoVQYWi1xAL4hmIy
   1amQ4hLZlzvBnJBXM4DxWZWs7OWk8RuI6l0qbsMvVRX+OOkHjLsx7FUJr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321220718"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321220718"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 15:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="687834889"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="687834889"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Mar 2023 15:07:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piMuc-000MDN-2k;
	Fri, 31 Mar 2023 22:07:58 +0000
Date: Sat, 1 Apr 2023 06:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm-efi-zboot 4/13] hexdump: arch/loongarch/boot/vmlinux.efi:
 No such file or directory
Message-ID: <202304010529.AV8FYPl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-efi-zboot
head:   0cf33b405a4aa0915fbe092694b18cc0315c69b9
commit: d65de98bda9e16c7e1d03fe9715252bf550c873e [4/13] efi/zboot: Add BSS padding before compression
config: loongarch-buildonly-randconfig-r004-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010529.AV8FYPl5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=d65de98bda9e16c7e1d03fe9715252bf550c873e
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb arm-efi-zboot
        git checkout d65de98bda9e16c7e1d03fe9715252bf550c873e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch distclean

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010529.AV8FYPl5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hexdump: arch/loongarch/boot/vmlinux.efi: No such file or directory
   hexdump: stdin: Bad file descriptor

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
