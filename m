Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2EB1ACEBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739854430; cv=none; b=qBooc6Tg2U9qxcx5t1yiqu7FPvEDzLIOHfFLnTIFtl7Qf/VWxP3kJTeQqmcPdKeNluyOrzm0bfBrVjzR5BdcL30EZpc2N45Qh9WUXQPmJv/pH61woH6czt7iFIr1flW4JY7artyo4TLzp2vbVgCdYKwT5scEuCA28Pwjk5bD1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739854430; c=relaxed/simple;
	bh=SFd0vf+SSyJmv1pfmQJ/JnKhPHmXJWFI2fbuEvKCGQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJqrjaYmPWCBoGuuH1PV09ohTqsmckSqv5+tuOeOjMDc1xBgyt1mZbMsr+86dhHdSLY91kG7f4+NZj1IkmS05EzDFLT6cLuxEo2wABethFCJg8t4uz3g3u7IjvtFZ8IvQi/qOoq4IJ2FREv2K/aHFJa841OW5eIr7s5+QAS0CPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqJ5fMmV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqJ5fMmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739854428; x=1771390428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFd0vf+SSyJmv1pfmQJ/JnKhPHmXJWFI2fbuEvKCGQI=;
  b=YqJ5fMmVw0dYavXFZhKiuvXz5T6vDaQMG3skbUcbZegrUWaFp7wnI7oX
   q0shbf3SLsU/DCmKhzxaENslnqYNl1Y2ig40d+A1zCCIr7p/y7diFGhaX
   hRkJ0ROtZ9dME9+ShhGYeB7TIRODPAkZCX7pdgqg6NWF0+m5Mjrcv0w8U
   dJcaqtYH7efkEG1C9cfIRmw/XS4bjS9Krkgo76SZVGs+gfExwIsLOvJiI
   oCjwUNtoYwdrjYEgrEUd9aiL//HUb2vnv6bDpp9whBtG4qXaGS9gxA+18
   CO2UNzUlBPdmZO9wlvf4UclNtHhOcJlGiCw/L2SEsbtQ55PHy+9gjZqP6
   Q==;
X-CSE-ConnectionGUID: ZsRF9qwFThq1TMlnM8hj2A==
X-CSE-MsgGUID: tXpkuSROR5ymyGH03ErOIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65893212"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="65893212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 20:53:47 -0800
X-CSE-ConnectionGUID: GQwDedp+T12/GFkd/cUa3g==
X-CSE-MsgGUID: nq0WqdYGQ5SIoyunToPdnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="119284206"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2025 20:53:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkFc0-0000BQ-18;
	Tue, 18 Feb 2025 04:53:37 +0000
Date: Tue, 18 Feb 2025 12:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 101/106]
 fs/bcachefs/fsck.c:1989:33: warning: format '%u' expects argument of type
 'unsigned int', but argument 8 has type 'u64' {aka 'long long unsigned int'}
Message-ID: <202502181211.CwbdSRHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   c0a15f588bcc855c5e30e6c8cfe2ec207e13acf2
commit: 30f640edcaf4398d30d758f6dc888258d7916042 [101/106] fixup! bcachefs: Fix fsck directory i_size checking
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250218/202502181211.CwbdSRHW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181211.CwbdSRHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181211.CwbdSRHW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/str_hash.h:8,
                    from fs/bcachefs/dirent.h:5,
                    from fs/bcachefs/fsck.c:10:
   fs/bcachefs/fsck.c: In function 'check_dir_i_size_notnested':
>> fs/bcachefs/fsck.c:1989:33: warning: format '%u' expects argument of type 'unsigned int', but argument 8 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
    1989 |                                 "directory %llu:%u with wrong i_size: got %u, should be %llu",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1990 |                                 w->last_pos.inode, i->snapshot, i->inode.bi_size, i->i_size)) {
         |                                                                 ~~~~~~~~~~~~~~~~
         |                                                                         |
         |                                                                         u64 {aka long long unsigned int}
   fs/bcachefs/error.h:107:20: note: in definition of macro 'fsck_err_wrap'
     107 |         int _ret = _do;                                                 \
         |                    ^~~
   fs/bcachefs/error.h:117:47: note: in expansion of macro 'bch2_fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                               ^~~~~~~~~~~~~
   fs/bcachefs/error.h:130:27: note: in expansion of macro '__fsck_err'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^~~~~~~~~~
   fs/bcachefs/error.h:143:9: note: in expansion of macro '__fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^~~~~~~~~~~~~
   fs/bcachefs/fsck.c:1987:21: note: in expansion of macro 'fsck_err_on'
    1987 |                 if (fsck_err_on(i->inode.bi_size != i->i_size,
         |                     ^~~~~~~~~~~
   fs/bcachefs/fsck.c:1989:76: note: format string is defined here
    1989 |                                 "directory %llu:%u with wrong i_size: got %u, should be %llu",
         |                                                                           ~^
         |                                                                            |
         |                                                                            unsigned int
         |                                                                           %llu


vim +1989 fs/bcachefs/fsck.c

  1980	
  1981	static int check_dir_i_size_notnested(struct btree_trans *trans, struct inode_walker *w)
  1982	{
  1983		struct bch_fs *c = trans->c;
  1984		int ret = 0;
  1985	
  1986		darray_for_each(w->inodes, i)
  1987			if (fsck_err_on(i->inode.bi_size != i->i_size,
  1988					trans, inode_dir_wrong_nlink,
> 1989					"directory %llu:%u with wrong i_size: got %u, should be %llu",
  1990					w->last_pos.inode, i->snapshot, i->inode.bi_size, i->i_size)) {
  1991				i->inode.bi_size = i->i_size;
  1992				ret = bch2_fsck_write_inode(trans, &i->inode);
  1993				if (ret)
  1994					break;
  1995			}
  1996	fsck_err:
  1997		bch_err_fn(c, ret);
  1998		return ret;
  1999	}
  2000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
