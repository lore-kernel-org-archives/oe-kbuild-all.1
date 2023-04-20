Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC922914
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681977153; x=1713513153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zHa6Iwze4UUpXczpFnr0I3iLpl1omfIFHB+hxYo7yc=;
  b=eNo+gbeRQOqExjDysP8Qyim7SZL76N7JWCM0NMJXSnbr3K2qtnpa8NcI
   U01S5Exl0p/o7139/z0VdEC7Osre/wZ7ZBsWAlKZm2nIpxkBU/iNUxg17
   XNlF+HM5OhIGNeGM847bwKj9F9F3hyIBzLZyEr4akgP+LqFXzAGBjkl4s
   2DkROFMW/p+dbo6hTes0UTx1io4qtU0dp5JjRYP5YOLK3h499UJCzAKRz
   tO9T/dp/EFd6Au6FkUw22G7LFS8h1EH1QBGr/mWos3qdXT5ieH8KeAc0P
   xKEYms1A/c7Zl1uJbBKQ33Sq4vNh/ODCAmDuEcbgWqbBbP+pjTugOB2Rg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347527200"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="347527200"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 00:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021501295"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="1021501295"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 00:52:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppP5j-000fb6-0T;
	Thu, 20 Apr 2023 07:52:31 +0000
Date: Thu, 20 Apr 2023 15:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: peili.dev@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] Reduce vdpa initialization / startup overhead for
 ioctl()
Message-ID: <202304201529.bfoHvKF4-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304201529.bfoHvKF4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review peili-dev-gmail-com/Reduce-vdpa-initialization-startup-overhead-for-ioctl/20230420-132556
        git checkout ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201529.bfoHvKF4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:855,
                    from drivers/vhost/vdpa.c:18:
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_vring_ioctl_batch':
>> arch/m68k/include/asm/uaccess.h:162:24: error: invalid type argument of unary '*' (have 'unsigned int')
     162 |         switch (sizeof(*(ptr))) {                                       \
         |                        ^~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/m68k/include/asm/uaccess.h:122:24: error: invalid type argument of unary '*' (have 'unsigned int')
     122 |                 : "m" (*(ptr)), "i" (err));                             \
         |                        ^~~~~~
   arch/m68k/include/asm/uaccess.h:164:17: note: in expansion of macro '__get_user_asm'
     164 |                 __get_user_asm(MOVES, __gu_err, x, ptr, u8, b, d, -EFAULT); \
         |                 ^~~~~~~~~~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/m68k/include/asm/uaccess.h:123:31: error: invalid type argument of unary '*' (have 'unsigned int')
     123 |         (x) = (__force typeof(*(ptr)))(__force unsigned long)__gu_val;  \
         |                               ^~~~~~
   arch/m68k/include/asm/uaccess.h:164:17: note: in expansion of macro '__get_user_asm'
     164 |                 __get_user_asm(MOVES, __gu_err, x, ptr, u8, b, d, -EFAULT); \
         |                 ^~~~~~~~~~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/m68k/include/asm/uaccess.h:122:24: error: invalid type argument of unary '*' (have 'unsigned int')
     122 |                 : "m" (*(ptr)), "i" (err));                             \
         |                        ^~~~~~
   arch/m68k/include/asm/uaccess.h:167:17: note: in expansion of macro '__get_user_asm'
     167 |                 __get_user_asm(MOVES, __gu_err, x, ptr, u16, w, r, -EFAULT); \
         |                 ^~~~~~~~~~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/m68k/include/asm/uaccess.h:123:31: error: invalid type argument of unary '*' (have 'unsigned int')
     123 |         (x) = (__force typeof(*(ptr)))(__force unsigned long)__gu_val;  \
         |                               ^~~~~~
   arch/m68k/include/asm/uaccess.h:167:17: note: in expansion of macro '__get_user_asm'
     167 |                 __get_user_asm(MOVES, __gu_err, x, ptr, u16, w, r, -EFAULT); \
         |                 ^~~~~~~~~~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/m68k/include/asm/uaccess.h:122:24: error: invalid type argument of unary '*' (have 'unsigned int')
     122 |                 : "m" (*(ptr)), "i" (err));                             \
         |                        ^~~~~~
   arch/m68k/include/asm/uaccess.h:170:17: note: in expansion of macro '__get_user_asm'
     170 |                 __get_user_asm(MOVES, __gu_err, x, ptr, u32, l, r, -EFAULT); \
         |                 ^~~~~~~~~~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/m68k/include/asm/uaccess.h:123:31: error: invalid type argument of unary '*' (have 'unsigned int')
     123 |         (x) = (__force typeof(*(ptr)))(__force unsigned long)__gu_val;  \
         |                               ^~~~~~
   arch/m68k/include/asm/uaccess.h:170:17: note: in expansion of macro '__get_user_asm'
     170 |                 __get_user_asm(MOVES, __gu_err, x, ptr, u32, l, r, -EFAULT); \
         |                 ^~~~~~~~~~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/m68k/include/asm/uaccess.h:131:28: error: invalid type argument of unary '*' (have 'unsigned int')
     131 |                 __typeof__(*(ptr)) t;                                   \
         |                            ^~~~~~
   arch/m68k/include/asm/uaccess.h:173:17: note: in expansion of macro '__get_user_asm8'
     173 |                 __get_user_asm8(MOVES, __gu_err, x, ptr);               \
         |                 ^~~~~~~~~~~~~~~
   arch/m68k/include/asm/uaccess.h:180:26: note: in expansion of macro '__get_user'
     180 | #define get_user(x, ptr) __get_user(x, ptr)
         |                          ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
>> drivers/vhost/vdpa.c:565:16: warning: ISO C90 forbids variable length array 'states' [-Wvla]
     565 |         struct vhost_vring_state states[num + 1];
         |                ^~~~~~~~~~~~~~~~~
>> drivers/vhost/vdpa.c:565:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     565 |         struct vhost_vring_state states[num + 1];
         |         ^~~~~~
   drivers/vhost/vdpa.c:553:34: warning: unused variable 's' [-Wunused-variable]
     553 |         struct vhost_vring_state s;
         |                                  ^
   drivers/vhost/vdpa.c:552:33: warning: unused variable 'vq' [-Wunused-variable]
     552 |         struct vhost_virtqueue *vq;
         |                                 ^~


vim +/states +565 drivers/vhost/vdpa.c

   546	
   547	static long vhost_vdpa_vring_ioctl_batch(struct vhost_vdpa *v, unsigned int cmd,
   548					   void __user *argp)
   549	{
   550		struct vdpa_device *vdpa = v->vdpa;
   551		const struct vdpa_config_ops *ops = vdpa->config;
   552		struct vhost_virtqueue *vq;
   553		struct vhost_vring_state s;
   554	
   555		u32 idx, num, i;
   556		long r;
   557	
   558		r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
   559		if (r < 0) {
   560			return r;
   561		}
   562	
   563		num = array_index_nospec(num, v->nvqs);
   564	
 > 565		struct vhost_vring_state states[num + 1];
   566	
   567		if (copy_from_user(&states, argp, sizeof(states)))
   568			return -EFAULT;
   569	
   570		switch (cmd) {
   571		case VHOST_VDPA_SET_VRING_ENABLE_BATCH:
   572			for (i = 1; i <= num; i++) {
   573				i = array_index_nospec(i, num + 1);
   574				idx = states[i].index;
   575				if (idx >= v->nvqs)
   576					return -ENOBUFS;
   577	
   578				idx = array_index_nospec(idx, v->nvqs);
   579	
   580				ops->set_vq_ready(vdpa, idx, 1);
   581			}
   582			return 0;
   583		case VHOST_VDPA_GET_VRING_GROUP_BATCH:
   584			if (!ops->get_vq_group)
   585				return -EOPNOTSUPP;
   586			
   587			for (i = 1; i <= num; i++) {
   588				i = array_index_nospec(i, num + 1);
   589				idx = states[i].index;
   590				if (idx >= v->nvqs)
   591					return -ENOBUFS;
   592				idx = array_index_nospec(idx, v->nvqs);
   593				states[i].num = ops->get_vq_group(vdpa, idx);
   594				if (states[i].num >= vdpa->ngroups)
   595					return -EIO;
   596			}
   597	
   598			if (copy_to_user(argp, &states, sizeof(states)))
   599				return -EFAULT;
   600	
   601			return 0;
   602		default:
   603			r = ENOIOCTLCMD;
   604		}
   605	
   606		return r;
   607	}
   608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
