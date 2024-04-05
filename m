Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611C36134
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712356989; cv=none; b=QlCGnXSmsz0CIZrRq4/2tEzj8l2Owb1pzhJLqSlo6py80uvrXLGNkl/a5gmbRB2lD35M1BysfFOIUWa1kduL3LWfYWFmbJh5gpCtiFhTnsI3n4NLZk7/rtsMwv0TDztCAwFkJezk3EnEx68Mtp0LHMZ5EzVHRb8fOR5Z3W5Mb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712356989; c=relaxed/simple;
	bh=G2bYyP0hn5mvr2eJv36RdY8tc9CsS/YoPyLxMNbM398=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxJCsX2jau4TcgmZ4yTgEFEN5MS+goBdC3hkBcwaRTxzyAQI6cjNHe7ECnES9135mLkWh1yG02p5SQorvVQjyH6cfWkYoF1r31mEEo7WhgiLdja7zlHnG4UZ4ErPNAzKa6RFMhLTDJF2fdyn0k9eANXO8zRr9aDqx4EKULQw4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJw6F+yb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJw6F+yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712356988; x=1743892988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2bYyP0hn5mvr2eJv36RdY8tc9CsS/YoPyLxMNbM398=;
  b=fJw6F+yblNbQCv47rlf/2dVYVntSMY/Dw5cCYuZWSwGcn+Xe+FVTJP6x
   7i8GfpKZkjxjOiqRgxt1ehGIH9sziteOhCZHkn0SSiHUoYI+U98Z69Gvy
   SM0OkLFKwdwzkLzXsXAKL4eqL7Q8/DxPAgCj3Mm3R8EolrXDdT/PN2uOg
   bkHUKZmG/UYAjE53a9Swg4EzB0CHu9jXpAHGHctTKLPf5xwHVNJKkBwKN
   +2RIS5f/z7FMwp5mGmXNTs5nnqlRMfS67tOl3d60s8e5biB+2PTXh4Pwv
   /oVXF4sftRgH60lzw0Dv8zitwD7r/dJMkgsuAXkyJLep/kAZV+E41GAn9
   g==;
X-CSE-ConnectionGUID: 7GohGi4AQ3SvV/fOkrPd+g==
X-CSE-MsgGUID: ccY0IAueQ8yK5/MjJxN6MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7937674"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7937674"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 15:43:07 -0700
X-CSE-ConnectionGUID: XOxrhohJSeeiF9nPU/XYJA==
X-CSE-MsgGUID: xj6wnOqkQ22xiUeF/aP0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19832221"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Apr 2024 15:43:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rssH1-0002nO-1d;
	Fri, 05 Apr 2024 22:43:03 +0000
Date: Sat, 6 Apr 2024 06:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 91/93] fs/ocfs2/dlmfs/dlmfs.c:237:24: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404060638.oHaZt5Qn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   025d6230e73400e8c46ec29a297b9bca08f36f6f
commit: b69acd824b0274e931a16593ff7f18de1ff9d577 [91/93] fs/ocfs2: convert to read/write iterators
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060638.oHaZt5Qn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060638.oHaZt5Qn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060638.oHaZt5Qn-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ocfs2/dlmfs/dlmfs.c: In function 'dlmfs_file_write':
>> fs/ocfs2/dlmfs/dlmfs.c:237:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     237 |         size_t count = iov_iter_count(from);
         |                        ^~~~~~~~~~~~~~
>> fs/ocfs2/dlmfs/dlmfs.c:252:18: error: implicit declaration of function 'copy_from_iter'; did you mean 'copy_from_user'? [-Werror=implicit-function-declaration]
     252 |         copied = copy_from_iter(lvb_buf, count, from);
         |                  ^~~~~~~~~~~~~~
         |                  copy_from_user
   cc1: some warnings being treated as errors


vim +/iov_iter_count +237 fs/ocfs2/dlmfs/dlmfs.c

   231	
   232	static ssize_t dlmfs_file_write(struct kiocb *iocb, struct iov_iter *from)
   233	{
   234		char lvb_buf[DLM_LVB_LEN];
   235		int copied;
   236		struct inode *inode = file_inode(iocb->ki_filp);
 > 237		size_t count = iov_iter_count(from);
   238	
   239		mlog(0, "inode %lu, count = %zu, *ppos = %llu\n",
   240			inode->i_ino, count, iocb->ki_pos);
   241	
   242		if (iocb->ki_pos >= DLM_LVB_LEN)
   243			return -ENOSPC;
   244	
   245		/* don't write past the lvb */
   246		if (count > DLM_LVB_LEN - iocb->ki_pos)
   247			count = DLM_LVB_LEN - iocb->ki_pos;
   248	
   249		if (!count)
   250			return 0;
   251	
 > 252		copied = copy_from_iter(lvb_buf, count, from);
   253		count -= copied;
   254		if (count)
   255			user_dlm_write_lvb(inode, lvb_buf, count);
   256	
   257		iocb->ki_pos += count;
   258		mlog(0, "wrote %zu bytes\n", count);
   259		return count;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
