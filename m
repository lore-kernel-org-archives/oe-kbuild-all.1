Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE948839
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 21:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695765397; x=1727301397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndiE3oKeydjSuyEZuucnIL8YBCU2yjsDLF52b3vBhQU=;
  b=cojCXotIepYSiyruckk9WqUbINzGWHEwR35apSfL5uKurebYWd29qGnG
   Z+jGLroT6Gml1PlRg3uDsRgBLFQGt2jdrd6SVbYypX5niVbTLk/4VKzHq
   USPfHUX+13nKnOo+Lc4nyce3mKdEjmORdmtEDTp61xPGzZc+zZd/ZOeRE
   jopOFaH9XhAKJ8bWJXXxMsqkNTO0+k7DWVks1NvSu7Cras9Po4VfPsV6a
   Pa+RcGHMC1+wHm455RXwNBKZ7M874EvSlwl5QMpHMD/3CB4miDmztB8IA
   c6Vl+Zb6Y6OoGJapIz4sWmfWS4KVT88cpA0S3UgMbHSv7GbliuZJLEaic
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="467963890"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="467963890"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995936797"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="995936797"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2023 14:56:35 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlG2j-0003P6-1k;
	Tue, 26 Sep 2023 21:56:33 +0000
Date: Wed, 27 Sep 2023 05:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 4/5]
 ./usr/include/asm/amd_hsmp.h:333:9: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202309270535.g9nOUvFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   bd2b5ff0df3da9b75e684d99cd5b1ed4e74e24db
commit: 0f21042c11c7fa9053d5af1797f5a9380579f4dd [4/5] platform/x86/amd/hsmp: add support for metrics tbl
config: x86_64-buildonly-randconfig-005-20230927 (https://download.01.org/0day-ci/archive/20230927/202309270535.g9nOUvFb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270535.g9nOUvFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270535.g9nOUvFb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/asm/amd_hsmp.h:333:9: error: C++ style comments are not allowed in ISO C90
     333 |         //TEMPERATURE
         |         ^
   ./usr/include/asm/amd_hsmp.h:333:9: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
