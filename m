Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93677E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677942357; x=1709478357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6UAohudd3h+z+jyRBlmoHhA1HAjrSRqZq0MK+aB2VI=;
  b=AnDVUW8pSqbmn4BYDDYK3zHSrF34rt0qRtKwc7NVb5XrFVxdLiANPBJJ
   bNb1WxzUpycQ/OgfbKG7Rg1dcKUbfyLa5VpyPf3KIiPLENBlRyYllIkQ9
   U07ePjL7MgtGa6MFFL2KUmWLMavUbNziRG+9a3SBZZcn156vvwxFKDVPi
   eth1DEtQNGSbg80RG5LobWNbsCFe6IvBK5uVTbikE61BIJKhVxiLmewcR
   BWKrKZVjNz6ZuoNHcJI89wHBQ8kjFkHOyzfzjZbnCu/IuJKw+WLX/oYUs
   Kam4+C7VSsMI+aqtoyMiAqtNkWUm9uT9V7L/J/6J2/yq/Bdxsp4zMPrqq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315662507"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="315662507"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 07:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="675677382"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675677382"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 07:05:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYTSN-0002EK-1g;
	Sat, 04 Mar 2023 15:05:55 +0000
Date: Sat, 4 Mar 2023 23:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:testme 1/1] lib/usercopy.c:20:17: error: implicit
 declaration of function 'barrier_nospec'
Message-ID: <202303042250.SCVUHU8r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git testme
head:   e2a7db9bc835a0f271b16c2d78dca88e33b8ee29
commit: e2a7db9bc835a0f271b16c2d78dca88e33b8ee29 [1/1] uaccess: Add speculation barrier to copy_from_user()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230304/202303042250.SCVUHU8r-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=e2a7db9bc835a0f271b16c2d78dca88e33b8ee29
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel testme
        git checkout e2a7db9bc835a0f271b16c2d78dca88e33b8ee29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042250.SCVUHU8r-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/usercopy.c: In function '_copy_from_user':
>> lib/usercopy.c:20:17: error: implicit declaration of function 'barrier_nospec' [-Werror=implicit-function-declaration]
      20 |                 barrier_nospec();
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/barrier_nospec +20 lib/usercopy.c

     8	
     9	#ifndef INLINE_COPY_FROM_USER
    10	unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
    11	{
    12		unsigned long res = n;
    13		might_fault();
    14		if (!should_fail_usercopy() && likely(access_ok(from, n))) {
    15			/*
    16			 * Ensure that bad access_ok() speculation will not
    17			 * lead to nasty side effects *after* the copy is
    18			 * finished:
    19			 */
  > 20			barrier_nospec();
    21			instrument_copy_from_user_before(to, from, n);
    22			res = raw_copy_from_user(to, from, n);
    23			instrument_copy_from_user_after(to, from, n, res);
    24		}
    25		if (unlikely(res))
    26			memset(to + (n - res), 0, res);
    27		return res;
    28	}
    29	EXPORT_SYMBOL(_copy_from_user);
    30	#endif
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
