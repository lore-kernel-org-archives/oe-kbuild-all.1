Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5114F25A626
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737854361; cv=none; b=EWCc+hNJm6Y4GuAaizR3a3i3WR5+2I9Uqye7+xBeFSFonv2pdRnruu5IBn+CD4Lq1yK8ZCHEeQKQ2n+GQP3t1XIQjnvMrTU8lFC7KlNUq8u8StfFnn/hoJr5xo3MbXEavD+6BUBepBuujCqm0n6PGkO22CWgCGx+G1yXVwTIn2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737854361; c=relaxed/simple;
	bh=u/BLiTgauypCIXWmbfFLPk2ukgbWqWY3bLGxvTRK++I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l0OJNO1yfPJ+huWyaYrZFTy0PPZtOMWclMMQQPYAoCP7baIxjJsF/oG/fLAkECKi8PeBoYpwzLy8pLl+2r9Z1ecJr+FGzPuZRtDVklb3pVd2JU/CoHHJFuDt1PhX3Q7Len5LsdMaPiTxa8kVdP9Tq9E/GjpL0H7Ajjz5ZPe47CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UM9eh0LV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UM9eh0LV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737854360; x=1769390360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u/BLiTgauypCIXWmbfFLPk2ukgbWqWY3bLGxvTRK++I=;
  b=UM9eh0LVIdBNsKr0l7Gcsc+xk4SKtYyyHgzHWe6eZ2hSuA/7C29bEg0G
   bGmi3aweLyOrh4IdB0iZ+AnPKG/I5/oPWUrnUTYjabRN/W3G6jt+57grQ
   mx2egxxZIXHD56W3TdSOEYMYWq0S2x5rDSBv8EXx7PLpr6Cu7RgrrmJvE
   Kgl9OBXNx/PhqpXNTtalbh0rMeCwmDhHhWx2gpMPvFjtrCg44PdKvJBbw
   O7E7EcArSmj0eglWft9wwOQNcqdPgek63tK1S0TMG51J3ZiLaJ1cwjGSq
   j4WRl+YQYyprdbaICS7AoDK6CJIahNDVyM8WYlzU5PSNSx8Hxn933Ir1r
   Q==;
X-CSE-ConnectionGUID: n6ngc19oQNWj4vPIZ+jodA==
X-CSE-MsgGUID: BjZhbgZvSLaWkNgcBugiig==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38519861"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="38519861"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 17:19:19 -0800
X-CSE-ConnectionGUID: WIInHA23TO2g37Z9l2al2g==
X-CSE-MsgGUID: 9Ndc1xnsQn66x+Si0b/xWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="108630518"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2025 17:19:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbrIx-000ei7-29;
	Sun, 26 Jan 2025 01:19:15 +0000
Date: Sun, 26 Jan 2025 09:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/zen-sauce 7/31] fs/xfs/xfs_xattr.c:246:9: warning:
 'strncpy' output truncated before terminating nul copying 16 bytes from a
 string of the same length
Message-ID: <202501260907.eV30HLlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/zen-sauce
head:   ae96db84281e1b10aee61ef832aabd0941743e99
commit: 1ab0facb6ae236af57bbcd06956a74fcf0599311 [7/31] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: csky-randconfig-r063-20250126 (https://download.01.org/0day-ci/archive/20250126/202501260907.eV30HLlA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260907.eV30HLlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260907.eV30HLlA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function '__xfs_xattr_put_listent',
       inlined from 'xfs_xattr_put_listent' at fs/xfs/xfs_xattr.c:278:4,
       inlined from 'xfs_xattr_put_listent' at fs/xfs/xfs_xattr.c:256:1:
>> fs/xfs/xfs_xattr.c:246:9: warning: 'strncpy' output truncated before terminating nul copying 16 bytes from a string of the same length [-Wstringop-truncation]
     246 |         strncpy(offset, (char *)name, namelen);                 /* real name */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function '__xfs_xattr_put_listent',
       inlined from 'xfs_xattr_put_listent' at fs/xfs/xfs_xattr.c:286:4,
       inlined from 'xfs_xattr_put_listent' at fs/xfs/xfs_xattr.c:256:1:
   fs/xfs/xfs_xattr.c:246:9: warning: 'strncpy' output truncated before terminating nul copying 17 bytes from a string of the same length [-Wstringop-truncation]
     246 |         strncpy(offset, (char *)name, namelen);                 /* real name */
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/scsi/scsi_transport_spi.c: In function 'spi_display_xfer_agreement':
>> drivers/scsi/scsi_transport_spi.c:90:39: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
      90 |         int result = sprintf(dest, "%d", value / denom);
         |                                       ^
   In function 'sprint_frac',
       inlined from 'spi_display_xfer_agreement' at drivers/scsi/scsi_transport_spi.c:1163:3:
   drivers/scsi/scsi_transport_spi.c:90:22: note: 'sprintf' output between 2 and 9 bytes into a destination of size 8
      90 |         int result = sprintf(dest, "%d", value / denom);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +246 fs/xfs/xfs_xattr.c

f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  219  
f7a136aee3c1c3 fs/xfs/xfs_xattr.c           Eric Sandeen        2016-12-05  220  static void
5d92b75c753ae2 fs/xfs/xfs_xattr.c           Andreas Gruenbacher 2015-12-02  221  __xfs_xattr_put_listent(
a9273ca5c6814f fs/xfs/linux-2.6/xfs_xattr.c Dave Chinner        2010-01-20  222  	struct xfs_attr_list_context *context,
5d92b75c753ae2 fs/xfs/xfs_xattr.c           Andreas Gruenbacher 2015-12-02  223  	char *prefix,
5d92b75c753ae2 fs/xfs/xfs_xattr.c           Andreas Gruenbacher 2015-12-02  224  	int prefix_len,
a9273ca5c6814f fs/xfs/linux-2.6/xfs_xattr.c Dave Chinner        2010-01-20  225  	unsigned char *name,
5d92b75c753ae2 fs/xfs/xfs_xattr.c           Andreas Gruenbacher 2015-12-02  226  	int namelen)
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  227  {
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  228  	char *offset;
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  229  	int arraytop;
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  230  
3b50086f0c0d78 fs/xfs/xfs_xattr.c           Darrick J. Wong     2019-02-13  231  	if (context->count < 0 || context->seen_enough)
3b50086f0c0d78 fs/xfs/xfs_xattr.c           Darrick J. Wong     2019-02-13  232  		return;
3b50086f0c0d78 fs/xfs/xfs_xattr.c           Darrick J. Wong     2019-02-13  233  
a9c8c69b496117 fs/xfs/xfs_xattr.c           Christoph Hellwig   2020-02-26  234  	if (!context->buffer)
5d92b75c753ae2 fs/xfs/xfs_xattr.c           Andreas Gruenbacher 2015-12-02  235  		goto compute_size;
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  236  
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  237  	arraytop = context->count + prefix_len + namelen + 1;
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  238  	if (arraytop > context->firstu) {
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  239  		context->count = -1;	/* insufficient space */
791cc43b36eb1f fs/xfs/xfs_xattr.c           Artem Savkov        2016-09-14  240  		context->seen_enough = 1;
f7a136aee3c1c3 fs/xfs/xfs_xattr.c           Eric Sandeen        2016-12-05  241  		return;
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  242  	}
a9c8c69b496117 fs/xfs/xfs_xattr.c           Christoph Hellwig   2020-02-26  243  	offset = context->buffer + context->count;
fd5beaff250d7e fs/xfs/xfs_xattr.c           Darrick J. Wong     2022-11-28  244  	memcpy(offset, prefix, prefix_len);
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  245  	offset += prefix_len;
a9273ca5c6814f fs/xfs/linux-2.6/xfs_xattr.c Dave Chinner        2010-01-20 @246  	strncpy(offset, (char *)name, namelen);			/* real name */
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  247  	offset += namelen;
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  248  	*offset = '\0';
5d92b75c753ae2 fs/xfs/xfs_xattr.c           Andreas Gruenbacher 2015-12-02  249  
5d92b75c753ae2 fs/xfs/xfs_xattr.c           Andreas Gruenbacher 2015-12-02  250  compute_size:
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  251  	context->count += prefix_len + namelen + 1;
f7a136aee3c1c3 fs/xfs/xfs_xattr.c           Eric Sandeen        2016-12-05  252  	return;
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  253  }
f9e09f095f3239 fs/xfs/linux-2.6/xfs_xattr.c Lachlan McIlroy     2008-06-23  254  

:::::: The code at line 246 was first introduced by commit
:::::: a9273ca5c6814f393e18ed66645f817b2b71e9ad xfs: convert attr to use unsigned names

:::::: TO: Dave Chinner <david@fromorbit.com>
:::::: CC: Dave Chinner <david@fromorbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
