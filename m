Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A4881A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 19:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676922869; x=1708458869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5HEdPJGdOD9b8A6OUVpRN9g82l0IeYKn4hI9zq+6sc=;
  b=k+QDhVpYLvbs5fSOGCjKQyn5F6h7cr6G6/lHWHM6oOKa+MRbs+7xgkbN
   DMVGO2kuJ1qMC5BdqY0gGDBiQZW9epzNddyf4mRU5uZ7PSlyc+561gM5H
   0jq0mXpszI1aHdAISP8UDQ0+TgiZ0NvTL9FNDDOoIF1hl2GhxhRZSPnDP
   bEdKBU+17Wu+o0wjphjMGYkOECWMREHQipmWA4xTw5MkB6N+nW2YZ0avh
   Q6y1MYwKFdBpxkmIShaUhP5b5hE8hb2FKGoyj7Fx4yhX16Ebb52LfkHOq
   MDrpDkOsMNhcTy8drENn0VuH0wWh13KTAgbOjKX85AqUYA+8kO7za0QZJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397162347"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="397162347"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 11:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671400639"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="671400639"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Feb 2023 11:54:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUCF1-000E8t-1W;
	Mon, 20 Feb 2023 19:54:27 +0000
Date: Tue, 21 Feb 2023 03:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:testme 1/1] lib/usercopy.c:16:17: error: implicit
 declaration of function 'barrier_nospec'
Message-ID: <202302210320.WnUHiQhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git testme
head:   b53352fd4d69b45255020235e79212674b1b89a5
commit: b53352fd4d69b45255020235e79212674b1b89a5 [1/1] uaccess: Add speculation barrier to copy_from_user()
config: arc-buildonly-randconfig-r003-20230220 (https://download.01.org/0day-ci/archive/20230221/202302210320.WnUHiQhy-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=b53352fd4d69b45255020235e79212674b1b89a5
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel testme
        git checkout b53352fd4d69b45255020235e79212674b1b89a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210320.WnUHiQhy-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/usercopy.c: In function '_copy_from_user':
>> lib/usercopy.c:16:17: error: implicit declaration of function 'barrier_nospec' [-Werror=implicit-function-declaration]
      16 |                 barrier_nospec();
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/barrier_nospec +16 lib/usercopy.c

     8	
     9	#ifndef INLINE_COPY_FROM_USER
    10	unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
    11	{
    12		unsigned long res = n;
    13		might_fault();
    14		if (!should_fail_usercopy() && likely(access_ok(from, n))) {
    15			/* Stop incorrect access_ok() speculation: */
  > 16			barrier_nospec();
    17			instrument_copy_from_user_before(to, from, n);
    18			res = raw_copy_from_user(to, from, n);
    19			instrument_copy_from_user_after(to, from, n, res);
    20		}
    21		if (unlikely(res))
    22			memset(to + (n - res), 0, res);
    23		return res;
    24	}
    25	EXPORT_SYMBOL(_copy_from_user);
    26	#endif
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
