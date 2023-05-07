Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678107E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683457774; x=1714993774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfdTKIT5I3k66RGwtM5ULkGPwUZspa9lDvoqTpcwZbw=;
  b=DGDDM8V830lhwFSKVrJnaXqXn61EDSJ5LLIk+p98idI+nBuV0HAYW487
   KJsTK8TpblG0sdiHS0Ec+G0d/H0DiV9lXY3yMRNLL5zWXCYj5lYkBQeIO
   xu4mjNjHiXHvD+5sj1FZBbNsJeSKGR3y/AH/Lv2xqYzJ5Ut4dlCQbDpoP
   cIsJswvSJiVF2CGOY3FSWrRI0HTribUGhHfTNQ9ArwZ79s/blEen9YIWd
   RS33fs+TLouz2uBhSexQG2prXLyF6ebyLHupwkUlMRT40wNDvtj0QKAC2
   Ayb6RSbngkEF1xjbhy+xL90yxbcvLYxVvPVJRa7+Ys1DPQ6bCyXoSyKuZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="338691868"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="338691868"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 04:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="675730716"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="675730716"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 May 2023 04:09:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvcGh-0000jP-1O;
	Sun, 07 May 2023 11:09:31 +0000
Date: Sun, 7 May 2023 19:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 481/9999] drivers/tty/vt/vt_ioctl.c:652: Error:
 unrecognized opcode `csrs sstatus,a2'
Message-ID: <202305071820.e3o9g5xY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: 2ff2b207f3556e4c68fbbe3c3c8d65c0e0e949cf [481/9999] vt: vt_ioctl: fix use-after-free in vt_in_use()
config: riscv-randconfig-r042-20230504 (https://download.01.org/0day-ci/archive/20230507/202305071820.e3o9g5xY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=2ff2b207f3556e4c68fbbe3c3c8d65c0e0e949cf
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 2ff2b207f3556e4c68fbbe3c3c8d65c0e0e949cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/tty/vt/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071820.e3o9g5xY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/uaccess.h:81:9: note: in expansion of macro 'likely'
      81 |         likely(__access_ok((unsigned long __force)(addr), (size)));     \
         |         ^~~~~~
   arch/riscv/include/asm/uaccess.h:261:9: note: in expansion of macro 'access_ok'
     261 |         access_ok(VERIFY_READ, __p, sizeof(*__p)) ?             \
         |         ^~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:839:21: note: in expansion of macro 'get_user'
     839 |                 if (get_user(ll, &vtsizes->v_rows) ||
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:839:17: note: in expansion of macro 'if'
     839 |                 if (get_user(ll, &vtsizes->v_rows) ||
         |                 ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   drivers/tty/vt/vt_ioctl.c:839:17: note: in expansion of macro 'if'
     839 |                 if (get_user(ll, &vtsizes->v_rows) ||
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:81:9: note: in expansion of macro 'likely'
      81 |         likely(__access_ok((unsigned long __force)(addr), (size)));     \
         |         ^~~~~~
   arch/riscv/include/asm/uaccess.h:261:9: note: in expansion of macro 'access_ok'
     261 |         access_ok(VERIFY_READ, __p, sizeof(*__p)) ?             \
         |         ^~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:840:21: note: in expansion of macro 'get_user'
     840 |                     get_user(cc, &vtsizes->v_cols))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:839:17: note: in expansion of macro 'if'
     839 |                 if (get_user(ll, &vtsizes->v_rows) ||
         |                 ^~
   drivers/tty/vt/vt_ioctl.c: In function 'vt_move_to_console':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/dynamic_debug.h:126:9: note: in expansion of macro 'if'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:118:9: note: in expansion of macro 'unlikely'
     118 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
         |         ^~~~~~~~
   include/linux/dynamic_debug.h:126:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:340:9: note: in expansion of macro 'dynamic_pr_debug'
     340 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:1446:17: note: in expansion of macro 'pr_debug'
    1446 |                 pr_debug("Suspend: Can't switch VCs.");
         |                 ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:126:9: note: in expansion of macro 'if'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/printk.h:340:9: note: in expansion of macro 'dynamic_pr_debug'
     340 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:1446:17: note: in expansion of macro 'pr_debug'
    1446 |                 pr_debug("Suspend: Can't switch VCs.");
         |                 ^~~~~~~~
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc t5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,t5'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,t5'
   drivers/tty/vt/vt_ioctl.c:540: Error: unrecognized opcode `csrs sstatus,a5'
   drivers/tty/vt/vt_ioctl.c:540: Error: unrecognized opcode `csrc sstatus,a5'
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2'
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2'
>> drivers/tty/vt/vt_ioctl.c:652: Error: unrecognized opcode `csrs sstatus,a2'
>> drivers/tty/vt/vt_ioctl.c:652: Error: unrecognized opcode `csrc sstatus,a2'
   drivers/tty/vt/vt_ioctl.c:411: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/tty/vt/vt_ioctl.c:411: Error: unrecognized opcode `csrc sstatus,a4'
   drivers/tty/vt/vt_ioctl.c:1032: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/tty/vt/vt_ioctl.c:1032: Error: unrecognized opcode `csrc sstatus,a4'
   drivers/tty/vt/vt_ioctl.c:839: Error: unrecognized opcode `csrs sstatus,s5'
   drivers/tty/vt/vt_ioctl.c:839: Error: unrecognized opcode `csrc sstatus,s5'
   drivers/tty/vt/vt_ioctl.c:662: Error: unrecognized opcode `csrs sstatus,a5'
   drivers/tty/vt/vt_ioctl.c:662: Error: unrecognized opcode `csrc sstatus,a5'
   drivers/tty/vt/vt_ioctl.c:839: Error: unrecognized opcode `csrs sstatus,s5'
   drivers/tty/vt/vt_ioctl.c:839: Error: unrecognized opcode `csrc sstatus,s5'


vim +652 drivers/tty/vt/vt_ioctl.c

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  442  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  443  	/* Linux m68k/i386 interface for setting the keyboard delay/repeat rate */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  444  		
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  445  	case KDKBDREP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  446  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  447  		struct kbd_repeat kbrep;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  448  		
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  449  		if (!capable(CAP_SYS_TTY_CONFIG))
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  450  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  451  
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  452  		if (copy_from_user(&kbrep, up, sizeof(struct kbd_repeat))) {
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  453  			ret =  -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  454  			break;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  455  		}
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  456  		ret = kbd_rate(&kbrep);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  457  		if (ret)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  458  			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  459  		if (copy_to_user(up, &kbrep, sizeof(struct kbd_repeat)))
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  460  			ret = -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  461  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  462  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  463  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  464  	case KDSETMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  465  		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  466  		 * currently, setting the mode from KD_TEXT to KD_GRAPHICS
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  467  		 * doesn't do a whole lot. i'm not sure if it should do any
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  468  		 * restoration of modes or what...
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  469  		 *
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  470  		 * XXX It should at least call into the driver, fbdev's definitely
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  471  		 * need to restore their engine state. --BenH
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  472  		 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  473  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  474  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  475  		switch (arg) {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  476  		case KD_GRAPHICS:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  477  			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  478  		case KD_TEXT0:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  479  		case KD_TEXT1:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  480  			arg = KD_TEXT;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  481  		case KD_TEXT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  482  			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  483  		default:
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  484  			ret = -EINVAL;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  485  			goto out;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  486  		}
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  487  		/* FIXME: this needs the console lock extending */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  488  		if (vc->vc_mode == (unsigned char) arg)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  489  			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  490  		vc->vc_mode = (unsigned char) arg;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  491  		if (console != fg_console)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  492  			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  493  		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  494  		 * explicitly blank/unblank the screen if switching modes
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  495  		 */
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  496  		console_lock();
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  497  		if (arg == KD_TEXT)
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  498  			do_unblank_screen(1);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  499  		else
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  500  			do_blank_screen(1);
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  501  		console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  502  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  503  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  504  	case KDGETMODE:
1e0ad2881d50be drivers/char/vt_ioctl.c   Graham Gower        2010-10-27  505  		uival = vc->vc_mode;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  506  		goto setint;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  507  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  508  	case KDMAPDISP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  509  	case KDUNMAPDISP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  510  		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  511  		 * these work like a combination of mmap and KDENABIO.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  512  		 * this could be easily finished.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  513  		 */
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  514  		ret = -EINVAL;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  515  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  516  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  517  	case KDSKBMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  518  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  519  			return -EPERM;
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  520  		ret = vt_do_kdskbmode(console, arg);
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  521  		if (ret == 0)
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  522  			tty_ldisc_flush(tty);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  523  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  524  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  525  	case KDGKBMODE:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  526  		uival = vt_do_kdgkbmode(console);
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  527  		ret = put_user(uival, (int __user *)arg);
6da9e95f7381fa drivers/tty/vt/vt_ioctl.c Andrew Morton       2011-04-07  528  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  529  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  530  	/* this could be folded into KDSKBMODE, but for compatibility
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  531  	   reasons it is not so easy to fold KDGKBMETA into KDGKBMODE */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  532  	case KDSKBMETA:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  533  		ret = vt_do_kdskbmeta(console, arg);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  534  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  535  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  536  	case KDGKBMETA:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  537  		/* FIXME: should review whether this is worth locking */
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  538  		uival = vt_do_kdgkbmeta(console);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  539  	setint:
1e0ad2881d50be drivers/char/vt_ioctl.c   Graham Gower        2010-10-27 @540  		ret = put_user(uival, (int __user *)arg);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  541  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  542  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  543  	case KDGETKEYCODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  544  	case KDSETKEYCODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  545  		if(!capable(CAP_SYS_TTY_CONFIG))
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  546  			perm = 0;
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  547  		ret = vt_do_kbkeycode_ioctl(cmd, up, perm);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  548  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  549  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  550  	case KDGKBENT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  551  	case KDSKBENT:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  552  		ret = vt_do_kdsk_ioctl(cmd, up, perm, console);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  553  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  554  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  555  	case KDGKBSENT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  556  	case KDSKBSENT:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  557  		ret = vt_do_kdgkb_ioctl(cmd, up, perm);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  558  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  559  
247ff8e610cb63 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-24  560  	/* Diacritical processing. Handled in keyboard.c as it has
247ff8e610cb63 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-24  561  	   to operate on the keyboard locks and structures */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  562  	case KDGKBDIACR:
04c71976500352 drivers/char/vt_ioctl.c   Samuel Thibault     2007-10-16  563  	case KDGKBDIACRUC:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  564  	case KDSKBDIACR:
04c71976500352 drivers/char/vt_ioctl.c   Samuel Thibault     2007-10-16  565  	case KDSKBDIACRUC:
247ff8e610cb63 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-24  566  		ret = vt_do_diacrit(cmd, up, perm);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  567  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  568  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  569  	/* the ioctls below read/set the flags usually shown in the leds */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  570  	/* don't use them - they will go away without warning */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  571  	case KDGKBLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  572  	case KDSKBLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  573  	case KDGETLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  574  	case KDSETLED:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-02-28  575  		ret = vt_do_kdskled(console, cmd, arg, perm);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  576  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  577  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  578  	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  579  	 * A process can indicate its willingness to accept signals
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  580  	 * generated by pressing an appropriate key combination.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  581  	 * Thus, one can have a daemon that e.g. spawns a new console
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  582  	 * upon a keypress and then changes to it.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  583  	 * See also the kbrequest field of inittab(5).
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  584  	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  585  	case KDSIGACCEPT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  586  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  587  		if (!perm || !capable(CAP_KILL))
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  588  			return -EPERM;
7ed20e1ad521b5 drivers/char/vt_ioctl.c   Jesper Juhl         2005-05-01  589  		if (!valid_signal(arg) || arg < 1 || arg == SIGKILL)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  590  			ret = -EINVAL;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  591  		else {
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman   2006-10-02  592  			spin_lock_irq(&vt_spawn_con.lock);
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman   2006-10-02  593  			put_pid(vt_spawn_con.pid);
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman   2006-10-02  594  			vt_spawn_con.pid = get_pid(task_pid(current));
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman   2006-10-02  595  			vt_spawn_con.sig = arg;
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman   2006-10-02  596  			spin_unlock_irq(&vt_spawn_con.lock);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  597  		}
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  598  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  599  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  600  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  601  	case VT_SETMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  602  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  603  		struct vt_mode tmp;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  604  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  605  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  606  			return -EPERM;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  607  		if (copy_from_user(&tmp, up, sizeof(struct vt_mode))) {
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  608  			ret = -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  609  			goto out;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  610  		}
87a6aca504d65f drivers/char/vt_ioctl.c   Greg Kroah-Hartman  2010-03-15  611  		if (tmp.mode != VT_AUTO && tmp.mode != VT_PROCESS) {
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  612  			ret = -EINVAL;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  613  			goto out;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  614  		}
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  615  		console_lock();
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  616  		vc->vt_mode = tmp;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  617  		/* the frsig is ignored, so we set it to 0 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  618  		vc->vt_mode.frsig = 0;
8b6312f4dcc1ef drivers/char/vt_ioctl.c   Eric W. Biederman   2007-02-10  619  		put_pid(vc->vt_pid);
8b6312f4dcc1ef drivers/char/vt_ioctl.c   Eric W. Biederman   2007-02-10  620  		vc->vt_pid = get_pid(task_pid(current));
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  621  		/* no switch is required -- saw@shade.msu.ru */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  622  		vc->vt_newvt = -1;
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  623  		console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  624  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  625  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  626  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  627  	case VT_GETMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  628  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  629  		struct vt_mode tmp;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  630  		int rc;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  631  
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  632  		console_lock();
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  633  		memcpy(&tmp, &vc->vt_mode, sizeof(struct vt_mode));
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  634  		console_unlock();
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  635  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  636  		rc = copy_to_user(up, &tmp, sizeof(struct vt_mode));
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  637  		if (rc)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  638  			ret = -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  639  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  640  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  641  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  642  	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  643  	 * Returns global vt state. Note that VT 0 is always open, since
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  644  	 * it's an alias for the current VT, and people can't use it here.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  645  	 * We cannot return state for more than 16 VTs, since v_state is short.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  646  	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  647  	case VT_GETSTATE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  648  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  649  		struct vt_stat __user *vtstat = up;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  650  		unsigned short state, mask;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  651  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16 @652  		if (put_user(fg_console + 1, &vtstat->v_active))
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  653  			ret = -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  654  		else {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  655  			state = 1;	/* /dev/tty0 is always open */
2ff2b207f3556e drivers/tty/vt/vt_ioctl.c Eric Biggers        2020-03-21  656  			console_lock(); /* required by vt_in_use() */
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  657  			for (i = 0, mask = 2; i < MAX_NR_CONSOLES && mask;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  658  							++i, mask <<= 1)
7de934f4099b03 drivers/tty/vt/vt_ioctl.c Jiri Slaby          2020-02-19  659  				if (vt_in_use(i))
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  660  					state |= mask;
2ff2b207f3556e drivers/tty/vt/vt_ioctl.c Eric Biggers        2020-03-21  661  			console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  662  			ret = put_user(state, &vtstat->v_state);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  663  		}
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  664  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  665  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  666  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  667  	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  668  	 * Returns the first available (non-opened) console.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  669  	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  670  	case VT_OPENQRY:
2ff2b207f3556e drivers/tty/vt/vt_ioctl.c Eric Biggers        2020-03-21  671  		console_lock(); /* required by vt_in_use() */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  672  		for (i = 0; i < MAX_NR_CONSOLES; ++i)
7de934f4099b03 drivers/tty/vt/vt_ioctl.c Jiri Slaby          2020-02-19  673  			if (!vt_in_use(i))
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  674  				break;
2ff2b207f3556e drivers/tty/vt/vt_ioctl.c Eric Biggers        2020-03-21  675  		console_unlock();
1e0ad2881d50be drivers/char/vt_ioctl.c   Graham Gower        2010-10-27  676  		uival = i < MAX_NR_CONSOLES ? (i+1) : -1;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  677  		goto setint;		 
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  678  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  679  	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  680  	 * ioctl(fd, VT_ACTIVATE, num) will cause us to switch to vt # num,
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  681  	 * with num >= 1 (switches to vt 0, our console, are not allowed, just
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  682  	 * to preserve sanity).
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  683  	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  684  	case VT_ACTIVATE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  685  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  686  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  687  		if (arg == 0 || arg > MAX_NR_CONSOLES)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  688  			ret =  -ENXIO;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  689  		else {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  690  			arg--;
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  691  			console_lock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  692  			ret = vc_allocate(arg);
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  693  			console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  694  			if (ret)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  695  				break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  696  			set_console(arg);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  697  		}
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  698  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  699  
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  700  	case VT_SETACTIVATE:
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  701  	{
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  702  		struct vt_setactivate vsa;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  703  
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  704  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  705  			return -EPERM;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  706  
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  707  		if (copy_from_user(&vsa, (struct vt_setactivate __user *)arg,
a09efb07b5025f drivers/char/vt_ioctl.c   Jiri Slaby          2009-10-01  708  					sizeof(struct vt_setactivate))) {
a09efb07b5025f drivers/char/vt_ioctl.c   Jiri Slaby          2009-10-01  709  			ret = -EFAULT;
a09efb07b5025f drivers/char/vt_ioctl.c   Jiri Slaby          2009-10-01  710  			goto out;
a09efb07b5025f drivers/char/vt_ioctl.c   Jiri Slaby          2009-10-01  711  		}
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  712  		if (vsa.console == 0 || vsa.console > MAX_NR_CONSOLES)
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  713  			ret = -ENXIO;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  714  		else {
e97267cb4d1ee0 drivers/tty/vt/vt_ioctl.c Gustavo A. R. Silva 2018-08-16  715  			vsa.console = array_index_nospec(vsa.console,
e97267cb4d1ee0 drivers/tty/vt/vt_ioctl.c Gustavo A. R. Silva 2018-08-16  716  							 MAX_NR_CONSOLES + 1);
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  717  			vsa.console--;
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  718  			console_lock();
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  719  			ret = vc_allocate(vsa.console);
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  720  			if (ret == 0) {
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  721  				struct vc_data *nvc;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  722  				/* This is safe providing we don't drop the
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  723  				   console sem between vc_allocate and
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  724  				   finishing referencing nvc */
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  725  				nvc = vc_cons[vsa.console].d;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  726  				nvc->vt_mode = vsa.mode;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  727  				nvc->vt_mode.frsig = 0;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  728  				put_pid(nvc->vt_pid);
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  729  				nvc->vt_pid = get_pid(task_pid(current));
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  730  			}
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  731  			console_unlock();
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  732  			if (ret)
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  733  				break;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  734  			/* Commence switch and lock */
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  735  			/* Review set_console locks */
d637837583163a drivers/tty/vt/vt_ioctl.c Jiri Olsa           2011-02-11  736  			set_console(vsa.console);
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  737  		}
d637837583163a drivers/tty/vt/vt_ioctl.c Jiri Olsa           2011-02-11  738  		break;
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  739  	}
d3b5cffcf84a8b drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  740  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  741  	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  742  	 * wait until the specified VT has been activated
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  743  	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  744  	case VT_WAITACTIVE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  745  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  746  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  747  		if (arg == 0 || arg > MAX_NR_CONSOLES)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  748  			ret = -ENXIO;
99cceb4e50cb67 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  749  		else
8b92e87d39bfd0 drivers/char/vt_ioctl.c   Alan Cox            2009-09-19  750  			ret = vt_waitactive(arg);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  751  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  752  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  753  	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  754  	 * If a vt is under process control, the kernel will not switch to it
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  755  	 * immediately, but postpone the operation until the process calls this
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  756  	 * ioctl, allowing the switch to complete.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  757  	 *
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  758  	 * According to the X sources this is the behavior:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  759  	 *	0:	pending switch-from not OK
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  760  	 *	1:	pending switch-from OK
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  761  	 *	2:	completed switch-to OK
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  762  	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  763  	case VT_RELDISP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  764  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  765  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  766  
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  767  		console_lock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  768  		if (vc->vt_mode.mode != VT_PROCESS) {
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  769  			console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  770  			ret = -EINVAL;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  771  			break;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  772  		}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  773  		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  774  		 * Switching-from response
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  775  		 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  776  		if (vc->vt_newvt >= 0) {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  777  			if (arg == 0)
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  778  				/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  779  				 * Switch disallowed, so forget we were trying
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  780  				 * to do it.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  781  				 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  782  				vc->vt_newvt = -1;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  783  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  784  			else {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  785  				/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  786  				 * The current vt has been released, so
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  787  				 * complete the switch.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  788  				 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  789  				int newvt;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  790  				newvt = vc->vt_newvt;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  791  				vc->vt_newvt = -1;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  792  				ret = vc_allocate(newvt);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  793  				if (ret) {
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  794  					console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  795  					break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  796  				}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  797  				/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  798  				 * When we actually do the console switch,
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  799  				 * make sure we are atomic with respect to
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  800  				 * other console switches..
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  801  				 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  802  				complete_change_console(vc_cons[newvt].d);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  803  			}
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  804  		} else {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  805  			/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  806  			 * Switched-to response
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  807  			 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  808  			/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  809  			 * If it's just an ACK, ignore it
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  810  			 */
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  811  			if (arg != VT_ACKACQ)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  812  				ret = -EINVAL;
8792f961ba8057 drivers/char/vt_ioctl.c   Samuel Ortiz        2007-10-01  813  		}
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  814  		console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  815  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  816  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  817  	 /*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  818  	  * Disallocate memory associated to VT (but leave VT1)
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  819  	  */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  820  	 case VT_DISALLOCATE:
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  821  		if (arg > MAX_NR_CONSOLES) {
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  822  			ret = -ENXIO;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  823  			break;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  824  		}
421b40a6286ee3 drivers/tty/vt/vt_ioctl.c Peter Hurley        2013-05-17  825  		if (arg == 0)
421b40a6286ee3 drivers/tty/vt/vt_ioctl.c Peter Hurley        2013-05-17  826  			vt_disallocate_all();
421b40a6286ee3 drivers/tty/vt/vt_ioctl.c Peter Hurley        2013-05-17  827  		else
421b40a6286ee3 drivers/tty/vt/vt_ioctl.c Peter Hurley        2013-05-17  828  			ret = vt_disallocate(--arg);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  829  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  830  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  831  	case VT_RESIZE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  832  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  833  		struct vt_sizes __user *vtsizes = up;
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  834  		struct vc_data *vc;
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  835  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  836  		ushort ll,cc;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  837  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  838  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  839  		if (get_user(ll, &vtsizes->v_rows) ||
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  840  		    get_user(cc, &vtsizes->v_cols))
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  841  			ret = -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  842  		else {
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  843  			console_lock();
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  844  			for (i = 0; i < MAX_NR_CONSOLES; i++) {
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  845  				vc = vc_cons[i].d;
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  846  
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  847  				if (vc) {
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  848  					vc->vc_resize_user = 1;
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  849  					/* FIXME: review v tty lock */
8c9a9dd0fa3a26 drivers/char/vt_ioctl.c   Alan Cox            2008-08-15  850  					vc_resize(vc_cons[i].d, cc, ll);
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  851  				}
e400b6ec4ede4d drivers/char/vt_ioctl.c   Antonino A. Daplas  2007-10-16  852  			}
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  853  			console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  854  		}
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  855  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  856  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  857  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  858  	case VT_RESIZEX:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  859  	{
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  860  		struct vt_consize v;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  861  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  862  			return -EPERM;
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  863  		if (copy_from_user(&v, up, sizeof(struct vt_consize)))
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  864  			return -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  865  		/* FIXME: Should check the copies properly */
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  866  		if (!v.v_vlin)
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  867  			v.v_vlin = vc->vc_scan_lines;
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  868  		if (v.v_clin) {
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  869  			int rows = v.v_vlin/v.v_clin;
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  870  			if (v.v_rows != rows) {
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  871  				if (v.v_rows) /* Parameters don't add up */
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  872  					return -EINVAL;
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  873  				v.v_rows = rows;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  874  			}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  875  		}
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  876  		if (v.v_vcol && v.v_ccol) {
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  877  			int cols = v.v_vcol/v.v_ccol;
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  878  			if (v.v_cols != cols) {
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  879  				if (v.v_cols)
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  880  					return -EINVAL;
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  881  				v.v_cols = cols;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  882  			}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  883  		}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  884  
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  885  		if (v.v_clin > 32)
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  886  			return -EINVAL;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  887  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  888  		for (i = 0; i < MAX_NR_CONSOLES; i++) {
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  889  			struct vc_data *vcp;
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  890  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  891  			if (!vc_cons[i].d)
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  892  				continue;
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  893  			console_lock();
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  894  			vcp = vc_cons[i].d;
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  895  			if (vcp) {
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  896  				if (v.v_vlin)
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  897  					vcp->vc_scan_lines = v.v_vlin;
1b3bce4d6bf839 drivers/tty/vt/vt_ioctl.c Al Viro             2017-09-29  898  				if (v.v_clin)
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  899  					vcp->vc_font.height = v.v_clin;
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  900  				vcp->vc_resize_user = 1;
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  901  				vc_resize(vcp, v.v_cols, v.v_rows);
ec9645f1a77eab drivers/tty/vt/vt_ioctl.c Eric Dumazet        2020-02-10  902  			}
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn         2011-01-25  903  			console_unlock();
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  904  		}
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  905  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  906  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  907  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  908  	case PIO_FONT: {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  909  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  910  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  911  		op.op = KD_FONT_OP_SET;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  912  		op.flags = KD_FONT_FLAG_OLD | KD_FONT_FLAG_DONT_RECALC;	/* Compatibility */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  913  		op.width = 8;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  914  		op.height = 0;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  915  		op.charcount = 256;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  916  		op.data = up;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  917  		ret = con_font_op(vc_cons[fg_console].d, &op);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  918  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  919  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  920  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  921  	case GIO_FONT: {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  922  		op.op = KD_FONT_OP_GET;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  923  		op.flags = KD_FONT_FLAG_OLD;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  924  		op.width = 8;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  925  		op.height = 32;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  926  		op.charcount = 256;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  927  		op.data = up;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  928  		ret = con_font_op(vc_cons[fg_console].d, &op);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  929  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  930  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  931  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  932  	case PIO_CMAP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  933                  if (!perm)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  934  			ret = -EPERM;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  935  		else
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  936  	                ret = con_set_cmap(up);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  937  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  938  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  939  	case GIO_CMAP:
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  940                  ret = con_get_cmap(up);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  941  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  942  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  943  	case PIO_FONTX:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  944  	case GIO_FONTX:
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  945  		ret = do_fontx_ioctl(cmd, up, perm, &op);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox            2008-04-30  946  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  947  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  948  	case PIO_FONTRESET:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  949  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  950  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox            2012-03-02  951  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds      2005-04-16  952  

:::::: The code at line 652 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
