Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893DF5661
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681990190; x=1713526190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mn7BNeDlVLPFtytCLS85MBGoWXCeGotO1ADdeQF8tjg=;
  b=YFCMgLtVo/akkczJdxzliFC13t/lxkBoHxs2G/6gk0tx+JeuYAYKdNmV
   4I/cFceUmrZQsE6KhAXLR59HLVokm8447eLo1vMRS7YgYvAKRArpNny29
   2sU/idInLkiYmz3IyOOS09qMOAXYQAT+wcy9lXem9ZYXFLJOCM4Ip+qrI
   /nxR5fV46CN4Sm48w74qZygPLNtYojuj1Qme4+H75dDIBZcFa33SQ1uWA
   KSE/UqL4YbM7tebGZHZR5cxZ2cE5hqg4PnGjFg2nuMYY4QosUFGkZopDN
   HDCDJOQNPmYbOChj3TWKM7xMWjAp9VfQGL7ZCEbBnU+Vina9/Skq/+x6q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344459818"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="344459818"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 04:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="866220998"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="866220998"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Apr 2023 04:29:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppSTr-000fnK-1B;
	Thu, 20 Apr 2023 11:29:39 +0000
Date: Thu, 20 Apr 2023 19:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: peili.dev@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] Reduce vdpa initialization / startup overhead for
 ioctl()
Message-ID: <202304201916.BgWsotQz-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304201916.BgWsotQz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review peili-dev-gmail-com/Reduce-vdpa-initialization-startup-overhead-for-ioctl/20230420-132556
        git checkout ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201916.BgWsotQz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/s390/include/asm/elf.h:160,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from drivers/vhost/vdpa.c:15:
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_vring_ioctl_batch':
>> arch/s390/include/asm/uaccess.h:228:24: error: invalid type argument of unary '*' (have 'unsigned int')
     228 |         switch (sizeof(*(ptr))) {                                       \
         |                        ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:232:60: error: invalid type argument of unary '*' (have 'unsigned int')
     232 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
>> drivers/vhost/vdpa.c:558:68: warning: passing argument 2 of '__get_user_fn' makes pointer from integer without a cast [-Wint-conversion]
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    unsigned int
   arch/s390/include/asm/uaccess.h:232:48: note: in definition of macro '__get_user'
     232 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                ^~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:161:70: note: expected 'const void *' but argument is of type 'unsigned int'
     161 | static __always_inline int __get_user_fn(void *x, const void __user *ptr, unsigned long size)
         |                                                   ~~~~~~~~~~~~~~~~~~~^~~
   arch/s390/include/asm/uaccess.h:233:44: error: invalid type argument of unary '*' (have 'unsigned int')
     233 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:239:60: error: invalid type argument of unary '*' (have 'unsigned int')
     239 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
>> drivers/vhost/vdpa.c:558:68: warning: passing argument 2 of '__get_user_fn' makes pointer from integer without a cast [-Wint-conversion]
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    unsigned int
   arch/s390/include/asm/uaccess.h:239:48: note: in definition of macro '__get_user'
     239 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                ^~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:161:70: note: expected 'const void *' but argument is of type 'unsigned int'
     161 | static __always_inline int __get_user_fn(void *x, const void __user *ptr, unsigned long size)
         |                                                   ~~~~~~~~~~~~~~~~~~~^~~
   arch/s390/include/asm/uaccess.h:240:44: error: invalid type argument of unary '*' (have 'unsigned int')
     240 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:246:60: error: invalid type argument of unary '*' (have 'unsigned int')
     246 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
>> drivers/vhost/vdpa.c:558:68: warning: passing argument 2 of '__get_user_fn' makes pointer from integer without a cast [-Wint-conversion]
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    unsigned int
   arch/s390/include/asm/uaccess.h:246:48: note: in definition of macro '__get_user'
     246 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                ^~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:161:70: note: expected 'const void *' but argument is of type 'unsigned int'
     161 | static __always_inline int __get_user_fn(void *x, const void __user *ptr, unsigned long size)
         |                                                   ~~~~~~~~~~~~~~~~~~~^~~
   arch/s390/include/asm/uaccess.h:247:44: error: invalid type argument of unary '*' (have 'unsigned int')
     247 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:253:60: error: invalid type argument of unary '*' (have 'unsigned int')
     253 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
>> drivers/vhost/vdpa.c:558:68: warning: passing argument 2 of '__get_user_fn' makes pointer from integer without a cast [-Wint-conversion]
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    unsigned int
   arch/s390/include/asm/uaccess.h:253:48: note: in definition of macro '__get_user'
     253 |                 __gu_err = __get_user_fn(&__x, ptr, sizeof(*(ptr)));    \
         |                                                ^~~
   drivers/vhost/vdpa.c:558:13: note: in expansion of macro 'get_user'
     558 |         r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
         |             ^~~~~~~~
   arch/s390/include/asm/uaccess.h:161:70: note: expected 'const void *' but argument is of type 'unsigned int'
     161 | static __always_inline int __get_user_fn(void *x, const void __user *ptr, unsigned long size)
         |                                                   ~~~~~~~~~~~~~~~~~~~^~~
   arch/s390/include/asm/uaccess.h:254:44: error: invalid type argument of unary '*' (have 'unsigned int')
     254 |                 (x) = *(__force __typeof__(*(ptr)) *)&__x;              \
         |                                            ^~~~~~
   arch/s390/include/asm/uaccess.h:267:9: note: in expansion of macro '__get_user'
     267 |         __get_user(x, ptr);                                             \
         |         ^~~~~~~~~~
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


vim +/__get_user_fn +558 drivers/vhost/vdpa.c

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
 > 558		r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
   559		if (r < 0) {
   560			return r;
   561		}
   562	
   563		num = array_index_nospec(num, v->nvqs);
   564	
   565		struct vhost_vring_state states[num + 1];
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
