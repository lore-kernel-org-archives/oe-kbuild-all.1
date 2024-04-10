Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B71C2D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 01:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712714116; cv=none; b=ZeGtPlXmMn8iS9exOywKGi/fp1xGGoOjwXoaFDrt1iceg7jXHw23SORSUfbr6KVTKKzeskjNaf0pvcfy99/ixPSlI1p1k6yP4G+DwmtRw77/b17npz795otVoZhkheWzv/OMOHRDJgSPbg94y0ehq2DOQpDiXrNNn/EV/ZevP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712714116; c=relaxed/simple;
	bh=J83908cxHc11DAp6ZVM63wcL3qksoUiKJcAqWEYV5gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=siRbguw124s9GzhHmG9qbi48WL6WI+RZXaOjF+4iFjVUDExgj1KtuOf9DF2v46lKx15ewjagH4/Gr1D05ggYOXdg40DWJY+OJbfLgLLWNo1Sjboei+/s5E+/qO5YQHtPzqOosuw4erxBrue97rfiuFrpakXSOWnDjFcw156d5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsz1sW+K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsz1sW+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712714114; x=1744250114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J83908cxHc11DAp6ZVM63wcL3qksoUiKJcAqWEYV5gQ=;
  b=bsz1sW+KvPHvn2QKY6G9gIaGmhDapW292/O4t2ORsmyu/j2dhMtLjiId
   PxdEwctt3ixhs0hZyijWB9JK2PTq1aBhOnh3d7UxGOoV+uZtau5pyawA9
   Ql/IsqwZq7tFuJh1vYdTkrkFsJUFYCfvhsn8ixI8ZOt3VpBNTqiKGfIU9
   1oa1tAJ2gptbvokGv1DRn4PJum94SYvBu84dSMBGswy8X5fUCI/nr4NUH
   ipAPcRaBIayZq7Mg6BaHOj/hEJNYBijRCoh1aiTuWhEJkbPEtTVrWW1fa
   FBKqSHHGCy4d+nnEMlmMg3p9wBrFYsNn5Lw/PPynEC8RzWePNPHp5ie5l
   Q==;
X-CSE-ConnectionGUID: H19xSJz8T46pTITNOMcDtg==
X-CSE-MsgGUID: QyKpBHpiRbCXj4m6HSInsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30541667"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="30541667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 18:55:14 -0700
X-CSE-ConnectionGUID: mUBmBzhmREaBKXmwDFN0kA==
X-CSE-MsgGUID: xkp3sx1vQTu+xFLaAfc/lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25085999"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2024 18:55:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruNB8-0006hK-1i;
	Wed, 10 Apr 2024 01:55:10 +0000
Date: Wed, 10 Apr 2024 09:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 99/317]
 drivers/firmware/tegra/bpmp-debugfs.c:380:17: warning: assignment to 'char
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202404100946.bXqLHRBF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ce74875ea91d3421b08ce15d34f1eccd90cebb2b
commit: 0a91801558f6a97d215ad9f3987285e191699d0b [99/317] firmware: tegra: convert to read/write iterators
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240410/202404100946.bXqLHRBF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100946.bXqLHRBF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100946.bXqLHRBF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/tegra/bpmp-debugfs.c: In function 'bpmp_debug_store':
   drivers/firmware/tegra/bpmp-debugfs.c:380:19: error: implicit declaration of function 'iterdup_user'; did you mean 'vmemdup_user'? [-Werror=implicit-function-declaration]
     380 |         databuf = iterdup_user(from count);
         |                   ^~~~~~~~~~~~
         |                   vmemdup_user
   drivers/firmware/tegra/bpmp-debugfs.c:380:36: error: expected ')' before 'count'
     380 |         databuf = iterdup_user(from count);
         |                               ~    ^~~~~~
         |                                    )
>> drivers/firmware/tegra/bpmp-debugfs.c:380:17: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     380 |         databuf = iterdup_user(from count);
         |                 ^
   drivers/firmware/tegra/bpmp-debugfs.c: In function 'debugfs_store':
   drivers/firmware/tegra/bpmp-debugfs.c:666:38: error: 'buf' undeclared (first use in this function)
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
