Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4D18F5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676303486; x=1707839486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Edcb/K4ctlx+5FTHPgtIhp+dEt+0MV25QZFil5VHK3Y=;
  b=FbsSs+RJ9IsBF97NXBCN6NKjEZk2n60hyOmE9tRLIl6EvSyM8ZLGyufU
   tFlQqnxV3UqAQCLf9iRhL81aeaYnBxMFuf7lEZI+Ecs51pDUC/cKhs5sk
   K9sMqX1tpJwAp876fBw3vXiiE+iIJmU3ZrBm/vX7y3ZvZs+ZlLrYnOhVy
   8K61UUdQIp5w4ydnfAayKa0GB5/Cb1foknu7QXgcrENc9R+HTSohawNtP
   qL0oh/z6UQtnFpchM/BmHm9Qy0flXwgTtdZ238jokYIcSYj3efKgFbyNg
   OHjpbMtnCcvNWb0JxyM/zI2bBUt6RjXfULSY00wOmkP/ZMWz3accUijXO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310550876"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="310550876"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 07:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701304172"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="701304172"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 07:51:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRb6x-0007pl-2h;
	Mon, 13 Feb 2023 15:51:23 +0000
Date: Mon, 13 Feb 2023 23:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yuta Hayama <hayama@lineo.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] usb: gadget: f_fs: Fix incorrect version checking of
 OS descs
Message-ID: <202302132325.Eq9x4pOW-lkp@intel.com>
References: <1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6@lineo.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6@lineo.co.jp>

Hi Yuta,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.2-rc8 next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuta-Hayama/usb-gadget-f_fs-Fix-incorrect-version-checking-of-OS-descs/20230213-170908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6%40lineo.co.jp
patch subject: [RFC PATCH] usb: gadget: f_fs: Fix incorrect version checking of OS descs
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302132325.Eq9x4pOW-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/533ddb5489674dddad0609860508a2f048a0485f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yuta-Hayama/usb-gadget-f_fs-Fix-incorrect-version-checking-of-OS-descs/20230213-170908
        git checkout 533ddb5489674dddad0609860508a2f048a0485f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132325.Eq9x4pOW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/ia64/include/asm/bug.h:17,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/ia64/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/usb/gadget/function/f_fs.c:17:
   drivers/usb/gadget/function/f_fs.c: In function '__ffs_do_os_desc_header':
>> drivers/usb/gadget/function/f_fs.c:2296:27: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'char *' [-Wformat=]
    2296 |                 pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:581:9: note: in expansion of macro 'dynamic_pr_debug'
     581 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_fs.h:24:21: note: in expansion of macro 'pr_debug'
      24 | #  define pr_vdebug pr_debug
         |                     ^~~~~~~~
   drivers/usb/gadget/function/f_fs.c:2296:17: note: in expansion of macro 'pr_vdebug'
    2296 |                 pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
         |                 ^~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:2296:78: note: format string is defined here
    2296 |                 pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
         |                                                                             ~^
         |                                                                              |
         |                                                                              unsigned int
         |                                                                             %s
>> drivers/usb/gadget/function/f_fs.c:2296:27: warning: too many arguments for format [-Wformat-extra-args]
    2296 |                 pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:581:9: note: in expansion of macro 'dynamic_pr_debug'
     581 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_fs.h:24:21: note: in expansion of macro 'pr_debug'
      24 | #  define pr_vdebug pr_debug
         |                     ^~~~~~~~
   drivers/usb/gadget/function/f_fs.c:2296:17: note: in expansion of macro 'pr_vdebug'
    2296 |                 pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
         |                 ^~~~~~~~~


vim +2296 drivers/usb/gadget/function/f_fs.c

  2288	
  2289	static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
  2290					   struct usb_os_desc_header *desc)
  2291	{
  2292		u16 bcd_version = le16_to_cpu(desc->bcdVersion);
  2293		u16 w_index = le16_to_cpu(desc->wIndex);
  2294	
  2295		if (bcd_version == 0x1) {
> 2296			pr_vdebug("bcdVersion is expected to be 0x100, but it was 0x%x. ",
  2297				  "Pass for compatibility, but fix your user space driver.\n",
  2298				  bcd_version);
  2299		} else if (bcd_version != 0x100) {
  2300			pr_vdebug("unsupported os descriptors version: 0x%x\n",
  2301				  bcd_version);
  2302			return -EINVAL;
  2303		}
  2304		switch (w_index) {
  2305		case 0x4:
  2306			*next_type = FFS_OS_DESC_EXT_COMPAT;
  2307			break;
  2308		case 0x5:
  2309			*next_type = FFS_OS_DESC_EXT_PROP;
  2310			break;
  2311		default:
  2312			pr_vdebug("unsupported os descriptor type: %d", w_index);
  2313			return -EINVAL;
  2314		}
  2315	
  2316		return sizeof(*desc);
  2317	}
  2318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
