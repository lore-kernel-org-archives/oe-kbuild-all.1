Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284F8828
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 03:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712720735; cv=none; b=hXyctV5sq+8jTa9EyXK+8MVIgDLpUHZbwoBdXRv3HiIx+HPxI6853jovtSY24pGyb2fBmpUScdNS+TDq1xNzEFs5AbqmscoTNP3dHqGRB8wGJ8mUwrJhaiCJbsXx5KgUsqO+2ZSxO+x0mb9Unztn3pzxS5aZlZCVGwBCSuTb448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712720735; c=relaxed/simple;
	bh=caL/Xby2kDjetgjZSrex7KZKzQ5p5bYQ+hLkGGn+0xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/Mee7sDj1Grm8hx5Nlz/vo7DrVDJA7qQgfcZk2+ZomtpT6OrnN4Imk6xvt7e5rfgFFA6fhmj/P1ZOZDa6jVZqquVlKAylechLLMbaO0zKL2eCEjdVXe0fnGfjODVbpdcR294DLfOUWctKVSxbOBv1BFqWR+vapRRfPI17FBU6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJ1/zYxW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJ1/zYxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712720733; x=1744256733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=caL/Xby2kDjetgjZSrex7KZKzQ5p5bYQ+hLkGGn+0xk=;
  b=jJ1/zYxWcHG1ZEF4Eg3TU6rphyU7u7d8JgkSqJD/xPevhNRMjLQpIuaQ
   hs7xI1PSF8IE7z/gYitLbthYm0TvmRJMu9A9ll+n1WxizGrCbFQ/pgz/k
   iQt3HlEKr6O8F+1PVoGxxv3V3/sSr8qbYi1oLNPNTjIEMPFtD9D10g2wy
   CpdUXl7r9l4bpFd0sVJE4wrknr255NqZvcylFUyetlcsNXF+jT7Y9llS8
   kpAma88wwJzLdt8mRajZEpCZXwluVK0ZckMahWplycT3R7rekRjsV95kV
   OEYkU8a4Pu+U/gEKWI+vsIZe741oV/MbDGd/20rYhK2a7wYEz82nwLh95
   Q==;
X-CSE-ConnectionGUID: pDrK3gnaQJeJtcwUL7niVg==
X-CSE-MsgGUID: lumZlu7mSGuyl/CKg41uCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8240784"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8240784"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 20:45:33 -0700
X-CSE-ConnectionGUID: WlpWiKPESDS2iX2YGuIFFQ==
X-CSE-MsgGUID: ug9zodVBQdWyStTvfrRQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="57865773"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2024 20:45:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruOtt-0006lC-0g;
	Wed, 10 Apr 2024 03:45:29 +0000
Date: Wed, 10 Apr 2024 11:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 99/317]
 drivers/firmware/tegra/bpmp-debugfs.c:380:19: error: implicit declaration of
 function 'iterdup_user'; did you mean 'vmemdup_user'?
Message-ID: <202404101128.moxBnVwD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   055ce0185fada17bfc0c1b6d6f618704293314e7
commit: 0a91801558f6a97d215ad9f3987285e191699d0b [99/317] firmware: tegra: convert to read/write iterators
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101128.moxBnVwD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101128.moxBnVwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101128.moxBnVwD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/tegra/bpmp-debugfs.c: In function 'bpmp_debug_store':
>> drivers/firmware/tegra/bpmp-debugfs.c:380:19: error: implicit declaration of function 'iterdup_user'; did you mean 'vmemdup_user'? [-Werror=implicit-function-declaration]
     380 |         databuf = iterdup_user(from count);
         |                   ^~~~~~~~~~~~
         |                   vmemdup_user
>> drivers/firmware/tegra/bpmp-debugfs.c:380:36: error: expected ')' before 'count'
     380 |         databuf = iterdup_user(from count);
         |                               ~    ^~~~~~
         |                                    )
   drivers/firmware/tegra/bpmp-debugfs.c:380:17: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     380 |         databuf = iterdup_user(from count);
         |                 ^
   drivers/firmware/tegra/bpmp-debugfs.c: In function 'debugfs_store':
>> drivers/firmware/tegra/bpmp-debugfs.c:666:38: error: 'buf' undeclared (first use in this function)
     666 |         if (copy_from_user(datavirt, buf, count)) {
         |                                      ^~~
   drivers/firmware/tegra/bpmp-debugfs.c:666:38: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +380 drivers/firmware/tegra/bpmp-debugfs.c

   365	
   366	static ssize_t bpmp_debug_store(struct kiocb *iocb, struct iov_iter *from)
   367	{
   368		struct inode *inode = file_inode(iocb->ki_filp);
   369		struct tegra_bpmp *bpmp = inode->i_private;
   370		size_t count = iov_iter_count(from);
   371		char *databuf = NULL;
   372		char fnamebuf[256];
   373		const char *filename;
   374		ssize_t err;
   375	
   376		filename = get_filename(bpmp, iocb->ki_filp, fnamebuf, sizeof(fnamebuf));
   377		if (!filename)
   378			return -ENOENT;
   379	
 > 380		databuf = iterdup_user(from count);
   381		if (IS_ERR(databuf))
   382			return PTR_ERR(databuf);
   383	
   384		err = mrq_debug_write(bpmp, filename, databuf, count);
   385		kfree(databuf);
   386	
   387		return err ?: count;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
