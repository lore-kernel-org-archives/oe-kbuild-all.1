Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B410E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 22:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680215234; x=1711751234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5J/0pRyGjn9VO36Nme4pSF2xJSP+xrFxr6oieucejus=;
  b=jqVz3/yXEfy4FN9cJ7ismo7BYqNquMmfwHrZHl00znKjDZjos58B686D
   s6I0bOesqU2DcosBm+fPDoGTRLqA1HC5py+jAxlVyIKJu7Rai7n3Au6u5
   HzNK1vwqUmD9V3e3OH3li0aawlmKvXB70v+s09R1NNK6bJ1PfWWMrbOVK
   pNjZ7xcWxihoA9A2GdErulgexvQmoAEMB9oyn4tK1PAkVsDQ3yIhY0KPa
   4XY9+aI8nDQsEJEcj51+IygJQTERXfBa5G+wNhYob4y+MzSy+tYByzSf/
   Eg2Jbt4G5/D4YcgrkI0AoN4uZnlchckS2WGYy6dsr34a847QvPJ5bctvi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="404000145"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="404000145"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 15:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="754189043"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="754189043"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 15:27:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi0jg-000LGo-1Z;
	Thu, 30 Mar 2023 22:27:12 +0000
Date: Fri, 31 Mar 2023 06:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] f2fs: expand f2fs_compr_option to allow ioctl
 setting compression level
Message-ID: <202303310601.ffuatWCu-lkp@intel.com>
References: <20230330153719.3085164-1-shengyong@oppo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330153719.3085164-1-shengyong@oppo.com>

Hi Sheng,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev next-20230330]
[cannot apply to linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sheng-Yong/f2fs-expand-f2fs_compr_option-to-allow-ioctl-setting-compression-level/20230330-233928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230330153719.3085164-1-shengyong%40oppo.com
patch subject: [RFC PATCH] f2fs: expand f2fs_compr_option to allow ioctl setting compression level
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230331/202303310601.ffuatWCu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d454d77b29654af47145c3ff3b9a59714f84ca6a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sheng-Yong/f2fs-expand-f2fs_compr_option-to-allow-ioctl-setting-compression-level/20230330-233928
        git checkout d454d77b29654af47145c3ff3b9a59714f84ca6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310601.ffuatWCu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/f2fs.h:109:37: error: C++ style comments are not allowed in ISO C90
     109 |                         __u8 value; // MSB 4 bit is version, LSB 4 bit is algorithm
         |                                     ^
   ./usr/include/linux/f2fs.h:109:37: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
