Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CB628
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Sep 2023 00:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694912073; x=1726448073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8MfTh4OGkVfWPQiqBQ3JFUqFFgaeLQb+PKnsalLhTM=;
  b=gsKZ7bgaSKxH8MqC7wXtIoRk+TcrACPulhtLd5q7xZmjOw03rB6jf+PF
   XSlF5qrsvNEVh0Z7kfSVftx/cnP8BiBkk5XL16K10YjKsv/cuY5Dvsr8D
   c7eNL/IIgtH5x7Ffj/uEG4P8ysIAasbXqe/2evuLoP3TiiIBiBVNYfgpA
   evhcAtGHBxWkRbBE1bsT3RYRXOLa3AWe0jwbl+4WMVVrDfpnLAJjaFZka
   Ywz14QhuIPMSfBq+0Wg0vfrIWDzABQhSSwvGj+1irpBs3rw0oqTsonT2H
   X+sdVhWo7gWJbYQJv0MlJl3mOvOuyF39/+Fnh/YEVyJTezuaZr5y8OXYm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="376785690"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="376785690"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 17:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="815606082"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="815606082"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2023 17:54:31 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhg3Q-0004ok-3C;
	Sun, 17 Sep 2023 00:54:29 +0000
Date: Sun, 17 Sep 2023 08:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 12/14] fs/fuse/passthrough.c:67:22:
 warning: format specifies type 'unsigned long' but the argument has type
 'size_t' (aka 'unsigned int')
Message-ID: <202309170847.Ek5jeP8p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   a162ad55e2618ff22555d226f9076c83304a12ce
commit: cf8388aefa4988849bf36191d3f3ad87c1ab42c8 [12/14] fuse: implement read/write passthrough
config: mips-pic32mzda_defconfig (https://download.01.org/0day-ci/archive/20230917/202309170847.Ek5jeP8p-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170847.Ek5jeP8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170847.Ek5jeP8p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/passthrough.c:67:22: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      67 |         pr_debug("%s: fb=0x%p, pos=%lld, len=%lu\n", __func__,
         |                                              ~~~
         |                                              %zu
      68 |                  fb, iocb->ki_pos, count);
         |                                    ^~~~~
   include/linux/printk.h:585:38: note: expanded from macro 'pr_debug'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/fuse/passthrough.c:92:22: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      92 |         pr_debug("%s: fb=0x%p, pos=%lld, len=%lu\n", __func__,
         |                                              ~~~
         |                                              %zu
      93 |                  fb, iocb->ki_pos, count);
         |                                    ^~~~~
   include/linux/printk.h:585:38: note: expanded from macro 'pr_debug'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +67 fs/fuse/passthrough.c

    56	
    57	ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
    58	{
    59		struct file *file = iocb->ki_filp;
    60		struct fuse_file *ff = file->private_data;
    61		struct fuse_backing *fb = fuse_file_passthrough(ff);
    62		size_t count = iov_iter_count(iter);
    63		const struct cred *old_cred;
    64		ssize_t ret;
    65	
    66		pr_debug("%s: fb=0x%p, pos=%lld, len=%lu\n", __func__,
  > 67			 fb, iocb->ki_pos, count);
    68	
    69		if (!count)
    70			return 0;
    71	
    72		old_cred = override_creds(fb->cred);
    73		ret = backing_file_read_iter(fb->file, iter, iocb, iocb->ki_flags,
    74					     fuse_rw_complete);
    75		revert_creds(old_cred);
    76	
    77		return ret;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
