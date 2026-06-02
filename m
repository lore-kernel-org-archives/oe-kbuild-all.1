Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E5306764
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368146; cv=none; b=Vhk9BTksFJdPkAlkLO/68evFvx05Ii9HNTiwAmgryjz0xXnZyZW9aaS2+AT1eLNGI6iQ6mED50HUVQ76eynmQUiUQgWvTvCbbublwFFNrNzlsTgsdIT9at9euAjVOX3KXc31zhcnsISh8kqICyUCbneI7VPF19hF3Yy69TH9SaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368146; c=relaxed/simple;
	bh=QjUVVRJrIrmPJD4XgVAjEiIEa6/GT7aoOsX7uzPEgtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CzSqQ4/+KMcsNdRObRpgh0O/wSmhw6+9aANsViVhlM08Npj8PZzc3oUEXk0HDwL9fLxktrmR6ygH8vTm1RvHW5Kvh076dfjFA5Hf1kaRgi7EUmwg4xruQKpwuBcERFYr7qt3ClNrcl4VJQSy7m5CVMhXlhzTRUTPjIn9Z/00kmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gooe43a2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gooe43a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780368145; x=1811904145;
  h=date:from:to:cc:subject:message-id;
  bh=QjUVVRJrIrmPJD4XgVAjEiIEa6/GT7aoOsX7uzPEgtk=;
  b=Gooe43a2qBu5Z18QeJJsIZ6sz0s0AC4F+DQ2EofHZTm//ymghRXsS+LW
   wolBUZJbf85gyIEQwyl45hSk7hFxtbmUEkJ4ukUziiGY7fnK/HCKtoKen
   0C+HRzCUs/Wni1eCkOr6G7BM2F3APU21bNvrQr/2cmi8EQWjoCdrlNcDU
   D9qJhB3cYP+GBR0SqwjO9GtvGwyAAP8cV1fy7kj+p96Ak4sN2/iXmEEJT
   J7/G1v663kCeM8OtvL6gRTlzVzrYA+MbfY52skzPgfK0y8dR/7tMelnwb
   rYfckww5cyEDlrIZ75Vc1Z1NHlMkMHRjEuAB2HQLM96GCP37Y2X/DBxMt
   Q==;
X-CSE-ConnectionGUID: y1ovQmCLSwOU4qeC9Ofvag==
X-CSE-MsgGUID: /woUxMi0QV6H1lb4MPLcnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91824436"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91824436"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:42:25 -0700
X-CSE-ConnectionGUID: BLQu5VUwQ9mtuetdnxByFA==
X-CSE-MsgGUID: bWVRabzGRL+C3jIqa5FLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="237402249"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jun 2026 19:42:23 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUF5A-000000001iz-3UW6;
	Tue, 02 Jun 2026 02:42:20 +0000
Date: Tue, 02 Jun 2026 04:41:26 +0200
From: kernel test robot <lkp@intel.com>
To: Danila Chernetsov <listdansp@mail.ru>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [jack-fs:for_next 29999/30000] fs/ext2/file.c:171:35: error:
 expected ';' before '}' token
Message-ID: <202606020400.nrz5VXur-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   97740c736bff8331fa4e6e33604a2c8b4229d70d
commit: d40e3cdfc2d0911712def016967103b37475c01e [29999/30000] ext2: fix ignored return value of generic_write_sync()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260602/202606020400.nrz5VXur-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020400.nrz5VXur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020400.nrz5VXur-lkp@intel.com/

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
