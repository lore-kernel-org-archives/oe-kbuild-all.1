Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4415A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681979614; x=1713515614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LwrU5xenY1XqA9Jq5pnkQvUF3YnBynUNGJZuhY8xsEA=;
  b=QmzT6A2vE/h++X9YrY8nkHA6LP3VdNfUStGnka22MJD4MDvfCABelYVK
   bxS2JHKR5cDP+TO71NmGy2eL1iWJNNm0j7zJUcAmG4b76viLBuCqHpWi1
   o9Z7zIwKEz4TawqUcJJdygr8AM7ClUI0kvPKjUba4dDDFFPHkStL5wffv
   2ifKpDN2VbjoyrvQ8piCZssVlkrdZfb528cHduYRKeumhIVcD+1qUle62
   eXP+J030eOLH8JZer5y7L7LJLxgxqO2h9mStcgWtPfHKl29yyhGMY2u8v
   bG0oGYDLeaT8Bp2lqxP/LI/sqSShf7wyZdm6ZWlA2ZMWXfaEZytuCMXqq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347534956"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="347534956"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 01:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722288915"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="722288915"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Apr 2023 01:33:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppPjQ-000fd0-0w;
	Thu, 20 Apr 2023 08:33:32 +0000
Date: Thu, 20 Apr 2023 16:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: peili.dev@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] Reduce vdpa initialization / startup overhead for
 ioctl()
Message-ID: <202304201619.AlZrqoj4-lkp@intel.com>
References: <20230420052026.1883230-1-peili.dev@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420052026.1883230-1-peili.dev@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on linus/master v6.3-rc7 next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/peili-dev-gmail-com/Reduce-vdpa-initialization-startup-overhead-for-ioctl/20230420-132556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20230420052026.1883230-1-peili.dev%40gmail.com
patch subject: [RFC PATCH] Reduce vdpa initialization / startup overhead for ioctl()
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304201619.AlZrqoj4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review peili-dev-gmail-com/Reduce-vdpa-initialization-startup-overhead-for-ioctl/20230420-132556
        git checkout ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201619.AlZrqoj4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from arch/loongarch/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from drivers/vhost/vdpa.c:15:
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_vring_ioctl_batch':
>> arch/loongarch/include/asm/uaccess.h:47:26: error: invalid type argument of unary '*' (have 'unsigned int')
      47 |         const __typeof__(*(ptr)) __user *__p = (ptr);                   \
         |                          ^~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
>> arch/loongarch/include/asm/uaccess.h:47:48: warning: initialization of 'const int *' from 'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
      47 |         const __typeof__(*(ptr)) __user *__p = (ptr);                   \
         |                                                ^
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   drivers/vhost/vdpa.c:565:16: warning: ISO C90 forbids variable length array 'states' [-Wvla]
     565 |         struct vhost_vring_state states[num + 1];
         |                ^~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:565:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     565 |         struct vhost_vring_state states[num + 1];
         |         ^~~~~~
   drivers/vhost/vdpa.c:553:34: warning: unused variable 's' [-Wunused-variable]
     553 |         struct vhost_vring_state s;
         |                                  ^
   drivers/vhost/vdpa.c:552:33: warning: unused variable 'vq' [-Wunused-variable]
     552 |         struct vhost_virtqueue *vq;
         |                                 ^~


vim +47 arch/loongarch/include/asm/uaccess.h

be769645a2aef5 Huacai Chen 2022-05-31  26  
be769645a2aef5 Huacai Chen 2022-05-31  27  /*
be769645a2aef5 Huacai Chen 2022-05-31  28   * get_user: - Get a simple variable from user space.
be769645a2aef5 Huacai Chen 2022-05-31  29   * @x:	 Variable to store result.
be769645a2aef5 Huacai Chen 2022-05-31  30   * @ptr: Source address, in user space.
be769645a2aef5 Huacai Chen 2022-05-31  31   *
be769645a2aef5 Huacai Chen 2022-05-31  32   * Context: User context only. This function may sleep if pagefaults are
be769645a2aef5 Huacai Chen 2022-05-31  33   *          enabled.
be769645a2aef5 Huacai Chen 2022-05-31  34   *
be769645a2aef5 Huacai Chen 2022-05-31  35   * This macro copies a single simple variable from user space to kernel
be769645a2aef5 Huacai Chen 2022-05-31  36   * space.  It supports simple types like char and int, but not larger
be769645a2aef5 Huacai Chen 2022-05-31  37   * data types like structures or arrays.
be769645a2aef5 Huacai Chen 2022-05-31  38   *
be769645a2aef5 Huacai Chen 2022-05-31  39   * @ptr must have pointer-to-simple-variable type, and the result of
be769645a2aef5 Huacai Chen 2022-05-31  40   * dereferencing @ptr must be assignable to @x without a cast.
be769645a2aef5 Huacai Chen 2022-05-31  41   *
be769645a2aef5 Huacai Chen 2022-05-31  42   * Returns zero on success, or -EFAULT on error.
be769645a2aef5 Huacai Chen 2022-05-31  43   * On error, the variable @x is set to zero.
be769645a2aef5 Huacai Chen 2022-05-31  44   */
be769645a2aef5 Huacai Chen 2022-05-31  45  #define get_user(x, ptr) \
be769645a2aef5 Huacai Chen 2022-05-31  46  ({									\
be769645a2aef5 Huacai Chen 2022-05-31 @47  	const __typeof__(*(ptr)) __user *__p = (ptr);			\
be769645a2aef5 Huacai Chen 2022-05-31  48  									\
be769645a2aef5 Huacai Chen 2022-05-31  49  	might_fault();							\
be769645a2aef5 Huacai Chen 2022-05-31  50  	access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :		\
be769645a2aef5 Huacai Chen 2022-05-31  51  				       ((x) = 0, -EFAULT);		\
be769645a2aef5 Huacai Chen 2022-05-31  52  })
be769645a2aef5 Huacai Chen 2022-05-31  53  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
