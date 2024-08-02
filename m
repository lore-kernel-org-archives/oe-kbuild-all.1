Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04BF17571
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 01:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722563583; cv=none; b=T5r4UdYTGARgBseOki+UHG/VG3TIqI8NfB8vI3t4us97SKYPHY0y5uGgMD9RLmfZsl2KrpOqLbZ5GwCnplpyt5f3mhdIOJwbb93+IVsFFtpuCzqVXWi/QMhfq6HOM1oBcEBGPz9h8XjEyR9UY1sTXwEPWWNJxHfNpEMipCJhL8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722563583; c=relaxed/simple;
	bh=js/noxqvwYCGZfwM0D1xppL/Dccb5XOjvpIwuYbt7z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8pV3jZAIVkqJb6OntOwLfc/EU5WU9QSjiJ91Z25UWC+kil4QqsoMiDwKkBf6QpXxYj2xNrvpgoh0iqjmZWWsJ7InlC+yzdk2b6VzBqhtxzPmaydoycYXJ4jJBlDsfZKUCapglrkODL5ajFd1su0hdwj/RTTe+DBsQN1SL/7w3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHb6ZH7Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHb6ZH7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722563582; x=1754099582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=js/noxqvwYCGZfwM0D1xppL/Dccb5XOjvpIwuYbt7z0=;
  b=dHb6ZH7YWXD49qdXZ8bQqOEKzbI97RALA5+uBYu1vLbPaEFTVl1L++g/
   bgLg6UfjnveI/Wc1WV5EmBhkBxINO858bv3m6kiMPOm3UHFCsha9Rqpi/
   Sjq1CWMcMKdbkUHsKNVflqulPsSaXW5PEH3S3sACwWaR9DpjeJf7ILadT
   Bp3MwtsQmbtGpofo0IAHgh2tmrq7aSuDb5ZBIdfy06f6nUIJpEXr7MSCF
   UYj+hqjGDLiFOETtf9exwnVVy1cYZboZ2hrLyneLYxLJVBjY0d3dbCgqm
   8y/jn1ys18hZ27P2GkFr53aRr23ZQhuL0K3VPO3lsfd3UVJS64CvWda4E
   Q==;
X-CSE-ConnectionGUID: 3GnxLHZASqePCp7W/nD7qg==
X-CSE-MsgGUID: Z2cNRw2nRryMAcK7QyNMlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20448353"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20448353"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 18:52:59 -0700
X-CSE-ConnectionGUID: iSIQLj7nSjOwkJCnhKfGrg==
X-CSE-MsgGUID: 7xsnDaNBQOmr88jw5lM9ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="55843967"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2024 18:52:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZhTS-000wDi-2T;
	Fri, 02 Aug 2024 01:52:54 +0000
Date: Fri, 2 Aug 2024 09:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.fd 7/39] drivers/block/ataflop.c:428:13: error:
 conflicting types for 'fd_error'; have 'void(void)'
Message-ID: <202408020919.BhS4vbmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   a2303c1df65cfa7933b43246c298d558ad70dbce
commit: baf640c41da47e7cd98b422391e0d219f749a92d [7/39] introduce struct fderr, convert overlayfs uses to that
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240802/202408020919.BhS4vbmr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020919.BhS4vbmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020919.BhS4vbmr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/ataflop.c:428:13: error: conflicting types for 'fd_error'; have 'void(void)'
     428 | static void fd_error( void );
         |             ^~~~~~~~
   In file included from include/linux/blkdev.h:27,
                    from include/linux/blk-mq.h:5,
                    from drivers/block/ataflop.c:70:
   include/linux/file.h:58:20: note: previous definition of 'fd_error' with type 'long int(struct fderr)'
      58 | static inline long fd_error(struct fderr f)
         |                    ^~~~~~~~


vim +428 drivers/block/ataflop.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  421  
^1da177e4c3f41 Linus Torvalds    2005-04-16  422  static void fd_select_side( int side );
^1da177e4c3f41 Linus Torvalds    2005-04-16  423  static void fd_select_drive( int drive );
^1da177e4c3f41 Linus Torvalds    2005-04-16  424  static void fd_deselect( void );
24ed960abf1d50 Kees Cook         2017-08-28  425  static void fd_motor_off_timer(struct timer_list *unused);
24ed960abf1d50 Kees Cook         2017-08-28  426  static void check_change(struct timer_list *unused);
7d12e780e003f9 David Howells     2006-10-05  427  static irqreturn_t floppy_irq (int irq, void *dummy);
^1da177e4c3f41 Linus Torvalds    2005-04-16 @428  static void fd_error( void );
^1da177e4c3f41 Linus Torvalds    2005-04-16  429  static int do_format(int drive, int type, struct atari_format_descr *desc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  430  static void do_fd_action( int drive );
^1da177e4c3f41 Linus Torvalds    2005-04-16  431  static void fd_calibrate( void );
^1da177e4c3f41 Linus Torvalds    2005-04-16  432  static void fd_calibrate_done( int status );
^1da177e4c3f41 Linus Torvalds    2005-04-16  433  static void fd_seek( void );
^1da177e4c3f41 Linus Torvalds    2005-04-16  434  static void fd_seek_done( int status );
^1da177e4c3f41 Linus Torvalds    2005-04-16  435  static void fd_rwsec( void );
24ed960abf1d50 Kees Cook         2017-08-28  436  static void fd_readtrack_check(struct timer_list *unused);
^1da177e4c3f41 Linus Torvalds    2005-04-16  437  static void fd_rwsec_done( int status );
^1da177e4c3f41 Linus Torvalds    2005-04-16  438  static void fd_rwsec_done1(int status);
^1da177e4c3f41 Linus Torvalds    2005-04-16  439  static void fd_writetrack( void );
^1da177e4c3f41 Linus Torvalds    2005-04-16  440  static void fd_writetrack_done( int status );
24ed960abf1d50 Kees Cook         2017-08-28  441  static void fd_times_out(struct timer_list *unused);
^1da177e4c3f41 Linus Torvalds    2005-04-16  442  static void finish_fdc( void );
^1da177e4c3f41 Linus Torvalds    2005-04-16  443  static void finish_fdc_done( int dummy );
^1da177e4c3f41 Linus Torvalds    2005-04-16  444  static void setup_req_params( int drive );
05bdb9965305bb Christoph Hellwig 2023-06-08  445  static int fd_locked_ioctl(struct block_device *bdev, blk_mode_t mode,
05bdb9965305bb Christoph Hellwig 2023-06-08  446  		unsigned int cmd, unsigned long param);
^1da177e4c3f41 Linus Torvalds    2005-04-16  447  static void fd_probe( int drive );
^1da177e4c3f41 Linus Torvalds    2005-04-16  448  static int fd_test_drive_present( int drive );
^1da177e4c3f41 Linus Torvalds    2005-04-16  449  static void config_types( void );
05bdb9965305bb Christoph Hellwig 2023-06-08  450  static int floppy_open(struct gendisk *disk, blk_mode_t mode);
ae220766d87cd6 Christoph Hellwig 2023-06-08  451  static void floppy_release(struct gendisk *disk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  452  

:::::: The code at line 428 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
