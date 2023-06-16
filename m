Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA5624
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 07:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686899295; x=1718435295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XhCn4rs2mEsmqYxJ+krfEbjlPIy3M8yZIF/kDQlohBY=;
  b=kfAtfhF5KhiNlJOhWUE8PNRW68vOlJjz6I6q/CGzJadZ4mqGRk43NEYo
   4zrHNDCp33lIKsfNsZFe3AJ3t7SHtuz1oUTA2E1JhYmsnIuLcXy3njEW6
   hPZUSsj/Bsh7uLe5i5P0JqJvXlCVOD0CAqt8q7NppVYdgXlH1JGVmICB3
   5bw4G0bBEF6jZlVVm9ST4mIAdSnkPUMVx3t9081sZ0w5bZU+4g/ZOlPXm
   akiXU6J15PlOUbgF06tiePhBxo1AOjymjngU515jZv/oDUjHaZSBn2eZc
   1oIBrw5JKqnu8VVE0l3BDxrxfRJnctdXh8RFXHLLEezlQ2IVqWPZmpQ/g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361669288"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="361669288"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 00:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782784740"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="782784740"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 00:08:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA3Z6-0000uC-1l;
	Fri, 16 Jun 2023 07:08:12 +0000
Date: Fri, 16 Jun 2023 15:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [pdx86-platform-drivers-x86:review-hans 84/88]
 drivers/platform/x86/intel/int3472/clk_and_regulator.c:257:28: sparse:
 sparse: symbol 'skl_int3472_regulator_second_sensor' was not declared.
 Should it be static?
Message-ID: <202306161530.hbpb8FvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
head:   357fe44f7d962ba049f66fbe829d61789c64d7bf
commit: b8f3ae7eaae350477eb976f6b5a5801559d78430 [84/88] platform/x86: int3472: discrete: Add support for 1 GPIO regulator shared between 2 sensors
config: i386-randconfig-s043-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161530.hbpb8FvB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=b8f3ae7eaae350477eb976f6b5a5801559d78430
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout b8f3ae7eaae350477eb976f6b5a5801559d78430
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/intel/int3472/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161530.hbpb8FvB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/intel/int3472/clk_and_regulator.c:257:28: sparse: sparse: symbol 'skl_int3472_regulator_second_sensor' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
