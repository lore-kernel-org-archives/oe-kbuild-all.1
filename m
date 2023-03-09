Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C79473
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678369107; x=1709905107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4RmdgUoJXdLX6iac0D3Xsj342eGCUFQO36LBQvJy4VY=;
  b=SkLRhQWmJIt+bizqS+7q63WJBNu6fI7GprOyolwEKUceygvYRzUfCp1z
   hrhlI1dG8Y3haezFLm3xV2m/NyOnHrZS2HfjkNbmez+EV/qwIEprojqeM
   P71HEIUm5/FfKNcu47zOss8z34kyatTuDQlWVTGc1C6saK9yn3BVPUodO
   2M+T4QaqdVpEoYTWy7lxrWETMY5WaY7xNCyrybtJUmf85tZ6wDVgp1kH6
   kTudVuFtI6pd4a58Tm9e6WcCzFoTUQDxM6QloLp+Dzcdm51jd55N9/8vm
   D4cAR09e8NVZgxLVrDLzwqJjKTzLWtNE0mFZTxY+2zLgYAHMO2Eu8RPAX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337971808"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="337971808"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 05:38:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677374573"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="677374573"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 05:38:25 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paGTR-0002yr-0e;
	Thu, 09 Mar 2023 13:38:25 +0000
Date: Thu, 9 Mar 2023 21:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] fscrypt: new helper function -
 __fscrypt_prepare_atomic_open()
Message-ID: <202303092108.lUCfozm1-lkp@intel.com>
References: <20230309121910.18939-2-lhenriques@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309121910.18939-2-lhenriques@suse.de>

Hi Luís,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on ceph-client/testing]
[also build test ERROR on ceph-client/for-linus linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-s-Henriques/fscrypt-new-helper-function-__fscrypt_prepare_atomic_open/20230309-202021
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20230309121910.18939-2-lhenriques%40suse.de
patch subject: [RFC PATCH 1/2] fscrypt: new helper function - __fscrypt_prepare_atomic_open()
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230309/202303092108.lUCfozm1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bc0e93e713bcb2b95af1bcb4ac369a7fe3a72863
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lu-s-Henriques/fscrypt-new-helper-function-__fscrypt_prepare_atomic_open/20230309-202021
        git checkout bc0e93e713bcb2b95af1bcb4ac369a7fe3a72863
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092108.lUCfozm1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/super.c:34:
>> include/linux/fscrypt.h:692:5: warning: no previous prototype for '__fscrypt_prepare_atomic_open' [-Wmissing-prototypes]
     692 | int __fscrypt_prepare_atomic_open(struct inode *dir, struct dentry *dentry)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: fs/ioctl.o: in function `__fscrypt_prepare_atomic_open':
>> ioctl.c:(.text+0x10a): multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:super.c:(.text+0x461): first defined here
   ld: fs/dcache.o: in function `__fscrypt_prepare_atomic_open':
   dcache.c:(.text+0x897): multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:super.c:(.text+0x461): first defined here
   ld: fs/libfs.o: in function `__fscrypt_prepare_atomic_open':
   libfs.c:(.text+0x782): multiple definition of `__fscrypt_prepare_atomic_open'; fs/super.o:super.c:(.text+0x461): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
