Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45E221721
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 04:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374965; cv=none; b=Rx1ikEdDn7c6k/5sZrv5ui/gcCGSf3K93D7Hdio88TJUFXF0kVRL2yKx435aC32NB0+wUT6Dc0hkc633oHnhmJcp4MaK37kqZnFCypxqvUhD0uF6IQeMTSZBQFD+mrffpWX4Wljz50gMfBKs1BgYadLSWbuVg2T/uR0tyNyC1W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374965; c=relaxed/simple;
	bh=N91ykbCZcd7ehcq9raQZYg3S8viLnMMyO2cRyZCf+ew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o6aae72lwyTH9QKaocfgyObelC0oeF34NVlS4Q/7os1q2rA9UBcW5TOwteDReu/fowPm9TXx3hcn8r+gtlD8Ou/oO2bLzL6WN7ZeUsrrAIxPgRPr9N0h3HqedSMOaxtNF91HyR7+CzLXOJFlGr3MSQmm5H+RbRq5WtsWJUYmptY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTgLSZd9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTgLSZd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780374963; x=1811910963;
  h=date:from:to:cc:subject:message-id;
  bh=N91ykbCZcd7ehcq9raQZYg3S8viLnMMyO2cRyZCf+ew=;
  b=FTgLSZd9JEottvQXW909CW0mO58hBO5ItxEOUSVo8UoemZB2zCnBU+bw
   1X4BTi7yjk/l7TRQCrzvT2AtJEHixvEuxYl098RTLcyYxQtFk0oB4vz0T
   LlrOwd66bNEluZb5szR/PeHdNv/y+nZZHzZTQhXXwrIFTx/zN30UTmJFo
   MKD+jSnxCE/uo599AiLKrGmK1Kl3K7NRqWVB5t0+UKouHendjlkJ+ay3C
   4zTj/BdlfNsp+rdO4qElAKrtagguiqY0zQvZmQaYGGwFBMU1e9Fx9hLg/
   N1ZOTclFQLoMSrSh/KQGM3XBpevwEiPGczrlihWzj2IAG5g0hMPHKL42h
   w==;
X-CSE-ConnectionGUID: Srlq3JQcQLa0muuifsSO+w==
X-CSE-MsgGUID: 1+QNqVVOQNGYOGOFjtwOzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80182371"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="80182371"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 21:36:02 -0700
X-CSE-ConnectionGUID: 2n8cgwz+Rxu+moz29cYV5A==
X-CSE-MsgGUID: Vd9ck8bJTzu1KSIzfe/D9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243897298"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jun 2026 21:36:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUGr8-00000000BVq-0k6p;
	Tue, 02 Jun 2026 04:35:58 +0000
Date: Tue, 02 Jun 2026 12:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Danila Chernetsov <listdansp@mail.ru>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [jack-fs:for_next 8/9] fs/ext2/file.c:171:35: error:
 expected ';' before '}' token
Message-ID: <202606021220.R1hg5E1A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   97740c736bff8331fa4e6e33604a2c8b4229d70d
commit: d40e3cdfc2d0911712def016967103b37475c01e [8/9] ext2: fix ignored return value of generic_write_sync()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260602/202606021220.R1hg5E1A-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021220.R1hg5E1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021220.R1hg5E1A-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ext2/file.c: In function 'ext2_dio_write_iter':
>> fs/ext2/file.c:171:35: error: expected ';' before '}' token
     171 |                         ret = ret2
         |                                   ^
         |                                   ;
     172 |                 }
         |                 ~                  


vim +171 fs/ext2/file.c

   110	
   111	static ssize_t ext2_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
   112	{
   113		struct file *file = iocb->ki_filp;
   114		struct inode *inode = file->f_mapping->host;
   115		ssize_t ret;
   116		unsigned int flags = 0;
   117		unsigned long blocksize = inode->i_sb->s_blocksize;
   118		loff_t offset = iocb->ki_pos;
   119		loff_t count = iov_iter_count(from);
   120		ssize_t status = 0;
   121	
   122		trace_ext2_dio_write_begin(iocb, from, 0);
   123		inode_lock(inode);
   124		ret = generic_write_checks(iocb, from);
   125		if (ret <= 0)
   126			goto out_unlock;
   127	
   128		ret = kiocb_modified(iocb);
   129		if (ret)
   130			goto out_unlock;
   131	
   132		/* use IOMAP_DIO_FORCE_WAIT for unaligned or extending writes */
   133		if (iocb->ki_pos + iov_iter_count(from) > i_size_read(inode) ||
   134		   (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(from), blocksize)))
   135			flags |= IOMAP_DIO_FORCE_WAIT;
   136	
   137		ret = iomap_dio_rw(iocb, from, &ext2_iomap_ops, &ext2_dio_write_ops,
   138				   flags, NULL, 0);
   139	
   140		/* ENOTBLK is magic return value for fallback to buffered-io */
   141		if (ret == -ENOTBLK)
   142			ret = 0;
   143	
   144		if (ret < 0 && ret != -EIOCBQUEUED)
   145			ext2_write_failed(inode->i_mapping, offset + count);
   146	
   147		/* handle case for partial write and for fallback to buffered write */
   148		if (ret >= 0 && iov_iter_count(from)) {
   149			loff_t pos, endbyte;
   150			int ret2;
   151	
   152			iocb->ki_flags &= ~IOCB_DIRECT;
   153			pos = iocb->ki_pos;
   154			status = generic_perform_write(iocb, from);
   155			if (unlikely(status < 0)) {
   156				ret = status;
   157				goto out_unlock;
   158			}
   159	
   160			ret += status;
   161			endbyte = pos + status - 1;
   162			ret2 = filemap_write_and_wait_range(inode->i_mapping, pos,
   163							    endbyte);
   164			if (!ret2) {
   165				invalidate_mapping_pages(inode->i_mapping,
   166							 pos >> PAGE_SHIFT,
   167							 endbyte >> PAGE_SHIFT);
   168				if (ret > 0)
   169					ret = generic_write_sync(iocb, ret);
   170			} else {
 > 171				ret = ret2
   172			}
   173		}
   174	
   175	out_unlock:
   176		inode_unlock(inode);
   177		if (status)
   178			trace_ext2_dio_write_buff_end(iocb, from, status);
   179		trace_ext2_dio_write_end(iocb, from, ret);
   180		return ret;
   181	}
   182	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
