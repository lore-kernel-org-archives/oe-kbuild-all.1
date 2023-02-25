Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F0A7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677320547; x=1708856547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FHtTGdeKVHLY58qqJ5s9mPaKSyDxmOxdSuIOqxCru8=;
  b=c6JdVcBK0AwruWG9rD2VDogswuiXwv64vpL2npjWLuyWIykHKI8WIWSY
   M2/UYx6MpKCCu6hmo+ZJ6+O58aa1Rq91B91VngqrrhcXSpa/+2sgXauuo
   q+ZF3cx6buHiCw4H7yVk2fP79u48sK75hiEv5Gg3mxqK1xcRoq6DkM1Ht
   SeifKfnINpSHHW8DV8VsbjALYnqE3uRQlWanasiA0bYzAmUugVhscJ9TB
   6y7oGiGLCk8GyUhD2ei5x3c6nCBuxYikrZtg9HwcgBoinLe7qZVDbell2
   2FLoz0oPbPxnthCgFYpi3rInpsWGbPjImkKGUtcVI5svQqAq7zn1koULR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="398384859"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="398384859"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 02:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="1002108744"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="1002108744"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2023 02:22:26 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVrhB-00036t-2Z;
	Sat, 25 Feb 2023 10:22:25 +0000
Date: Sat, 25 Feb 2023 18:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/76] ssdfs: key file system declarations
Message-ID: <202302251807.f6nqwNhK-lkp@intel.com>
References: <20230225010927.813929-3-slava@dubeyko.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225010927.813929-3-slava@dubeyko.com>

Hi Viacheslav,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.2 next-20230225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Dubeyko/ssdfs-introduce-SSDFS-on-disk-layout/20230225-092342
patch link:    https://lore.kernel.org/r/20230225010927.813929-3-slava%40dubeyko.com
patch subject: [RFC PATCH 02/76] ssdfs: key file system declarations
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230225/202302251807.f6nqwNhK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3171e72c56ede87c9c819222e2345dc34e8776ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Viacheslav-Dubeyko/ssdfs-introduce-SSDFS-on-disk-layout/20230225-092342
        git checkout 3171e72c56ede87c9c819222e2345dc34e8776ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251807.f6nqwNhK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/ssdfs_fs.h:1:1: error: C++ style comments are not allowed in ISO C90
       1 | // SPDX-License-Identifier: BSD-3-Clause-Clear
         | ^
   ./usr/include/linux/ssdfs_fs.h:1:1: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
