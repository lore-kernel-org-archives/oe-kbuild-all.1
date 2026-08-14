Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EBD3CEB90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722164; cv=none; b=p0hFLBTACyGtBTMOrvb2GTslc3c16l+RkjUdMHqBUXo11GKKgTjxjZgseg9rZLpDcF1CoMAJVON7pv1WyW5k3rUhvkhYqOa1+SLYsbWV7RkNeY75U/AqixI6s0M0IDjtFinkYyhCMIEDypQJ1yDnTTU6loFbOWd+G1un1hwgPzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722164; c=relaxed/simple;
	bh=VNdUN13TDTj/JVPe0W+GPYefl0yaD8zxqBimH0eodlg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uXYIcZRu6lhCkB5bjC0jc3JrZom9xU5Ak7pDHuqLxz8ym8EDGz4UzWqFuc0diEncfpptSjgB7MzKriaFYq9p5f5mFzXC692CM2kvncTc4QouMOy1R2nrOM7bnKD0EnUVDIJcl2wvHzcugnX7MVQq5ZAtlCahNx9j76r4MWP57qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2dS/pNz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2dS/pNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786722163; x=1818258163;
  h=date:from:to:cc:subject:message-id;
  bh=VNdUN13TDTj/JVPe0W+GPYefl0yaD8zxqBimH0eodlg=;
  b=U2dS/pNzSv0HggFf/shiMXBVtm3ndt4YG04HDv9Wd0Kx8tPnjw/G0/9z
   eCEY3RpOmAWEsPM1EGq03voT2ENkx93qNVHSumtBUBt7Kw5t3/MLAH3nb
   BTd+Vohs2GONX8U6aXC1c/sSObpHDqrNfiP7B5HCZi2p1buuEoErvTenA
   ZfsLCg5OeFiQbZfD/XFzw0CTMU6x41mljmeLGSEZ2eKwYyyYUqIJYzG+4
   R7+6FrK5ag7TIA6VEjNTroGZFxgPbM07s2PZYvUXbVdwX4BsnoCZGwTZz
   jZTRC1VcoTFu8JSlRChXSNnav5JnvBXzKaa2+sObhhvsRAHYbfNsRBdWF
   w==;
X-CSE-ConnectionGUID: cFyU6x4FTzqoyoQXRA25Dg==
X-CSE-MsgGUID: OBvPwDSASvyRJblp/Rlbow==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89820536"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="89820536"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 08:42:41 -0700
X-CSE-ConnectionGUID: qT6goyytQmmGjuoTplbYAA==
X-CSE-MsgGUID: o+0cy2jTSPGhNDv80Je3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260468825"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2026 08:42:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuu3J-00000000ZQa-3CpL;
	Fri, 14 Aug 2026 15:42:37 +0000
Date: Fri, 14 Aug 2026 23:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 17/18] fs/nfsd/nfs4proc.c:2015:34:
 error: implicit declaration of function 'filemap_check_wb_err'
Message-ID: <202608142324.EKix26tJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   33e73a1e8175a4735e962dec9465e64e85d0a63d
commit: 7191691f80efdfec4c2f8d87da800a18b7753e08 [17/18] nfs: Remove pagemap.h from includes
config: arm-randconfig-001-20260814 (https://download.01.org/0day-ci/archive/20260814/202608142324.EKix26tJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142324.EKix26tJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608142324.EKix26tJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4proc.c: In function '_nfsd_copy_file_range':
>> fs/nfsd/nfs4proc.c:2015:34: error: implicit declaration of function 'filemap_check_wb_err' [-Wimplicit-function-declaration]
    2015 |                         status = filemap_check_wb_err(dst->f_mapping, since);
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/filemap_check_wb_err +2015 fs/nfsd/nfs4proc.c

e0639dc5805a9d Olga Kornievskaia 2018-07-20  1980  
3b7bf5933cada7 Chuck Lever       2022-07-27  1981  static ssize_t _nfsd_copy_file_range(struct nfsd4_copy *copy,
3b7bf5933cada7 Chuck Lever       2022-07-27  1982  				     struct file *dst,
3b7bf5933cada7 Chuck Lever       2022-07-27  1983  				     struct file *src)
e0639dc5805a9d Olga Kornievskaia 2018-07-20  1984  {
555dbf1a9aac6d Trond Myklebust   2021-12-18  1985  	errseq_t since;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  1986  	ssize_t bytes_copied = 0;
e7a833e9cc6c3b J. Bruce Fields   2021-03-18  1987  	u64 bytes_total = copy->cp_count;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  1988  	u64 src_pos = copy->cp_src_pos;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  1989  	u64 dst_pos = copy->cp_dst_pos;
c2f1c4bd206211 Chuck Lever       2021-10-13  1990  	int status;
79a1d88a36f773 Brian Foster      2022-11-16  1991  	loff_t end;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  1992  
792a5112aa90e5 J. Bruce Fields   2021-03-18  1993  	/* See RFC 7862 p.67: */
792a5112aa90e5 J. Bruce Fields   2021-03-18  1994  	if (bytes_total == 0)
792a5112aa90e5 J. Bruce Fields   2021-03-18  1995  		bytes_total = ULLONG_MAX;
20a67a7d18221a Chuck Lever       2026-05-22  1996  	since = READ_ONCE(dst->f_wb_err);
e0639dc5805a9d Olga Kornievskaia 2018-07-20  1997  	do {
fa341560ca7458 NeilBrown         2023-09-11  1998  		/* Only async copies can be stopped here */
e0639dc5805a9d Olga Kornievskaia 2018-07-20  1999  		if (kthread_should_stop())
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2000  			break;
555dbf1a9aac6d Trond Myklebust   2021-12-18  2001  		bytes_copied = nfsd_copy_file_range(src, src_pos, dst, dst_pos,
5c4583b2b78eef Jeff Layton       2019-08-18  2002  						    bytes_total);
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2003  		if (bytes_copied <= 0)
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2004  			break;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2005  		bytes_total -= bytes_copied;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2006  		copy->cp_res.wr_bytes_written += bytes_copied;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2007  		src_pos += bytes_copied;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2008  		dst_pos += bytes_copied;
1913cdf56cb5bf Chuck Lever       2022-07-27  2009  	} while (bytes_total > 0 && nfsd4_copy_is_async(copy));
eac0b17a77fbd7 Olga Kornievskaia 2021-05-19  2010  	/* for a non-zero asynchronous copy do a commit of data */
1913cdf56cb5bf Chuck Lever       2022-07-27  2011  	if (nfsd4_copy_is_async(copy) && copy->cp_res.wr_bytes_written > 0) {
79a1d88a36f773 Brian Foster      2022-11-16  2012  		end = copy->cp_dst_pos + copy->cp_res.wr_bytes_written - 1;
79a1d88a36f773 Brian Foster      2022-11-16  2013  		status = vfs_fsync_range(dst, copy->cp_dst_pos, end, 0);
555dbf1a9aac6d Trond Myklebust   2021-12-18  2014  		if (!status)
555dbf1a9aac6d Trond Myklebust   2021-12-18 @2015  			status = filemap_check_wb_err(dst->f_mapping, since);
eac0b17a77fbd7 Olga Kornievskaia 2021-05-19  2016  		if (!status)
1913cdf56cb5bf Chuck Lever       2022-07-27  2017  			set_bit(NFSD4_COPY_F_COMMITTED, &copy->cp_flags);
f5cb2276954cb8 Chuck Lever       2026-05-22  2018  		else if (status != -EAGAIN && status != -ESTALE)
f5cb2276954cb8 Chuck Lever       2026-05-22  2019  			nfsd_reset_write_verifier(copy->cp_nn);
eac0b17a77fbd7 Olga Kornievskaia 2021-05-19  2020  	}
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2021  	return bytes_copied;
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2022  }
e0639dc5805a9d Olga Kornievskaia 2018-07-20  2023  

:::::: The code at line 2015 was first introduced by commit
:::::: 555dbf1a9aac6d3150c8b52fa35f768a692f4eeb nfsd: Replace use of rwsem with errseq_t

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
