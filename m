Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAF28E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 06:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730185145; cv=none; b=EXgTioacRi3sqn8y6wvly4oMVaYx/GzwVga6kJ48QyD4wgUNcNID8y7sAK8AsFUw7l5qnwqJa1Sr3LGySv4M1DJGSEJQlR/x8rh2OTWQNN05HTqUeQ3+b0ggIhBdvjcQ77YI1opTsuCihWw7y96L7pZreOsC4z/AJhcxodnujl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730185145; c=relaxed/simple;
	bh=ZZkISwJnANKbaEmTR4pjH1Smwl0scEzVB94YKDvjM7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lk7uBDfViQSu+9r9L+kusL0c0imskDpOP8RXvr8wgDVMsgLwxMox8yV11bNSWnGJdelYEiVfEOgFZPa2RfgRtMZ4eqe6m+7zOg0ZBXzqs5nYFglcRTq9ZqEDgqjJ54dP+DIaeJ2Aoh5KRxT7MhiWF9OAnp19hsjaM2g+8hQRs4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSMPlCAi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSMPlCAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730185143; x=1761721143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZkISwJnANKbaEmTR4pjH1Smwl0scEzVB94YKDvjM7g=;
  b=bSMPlCAiWYyeMIGPAqvEDOlJF/7jDN23Skv3Z+kd8WfnQYyFL0Frknu4
   Dvc95f7PYKCDp5dysWf5ZmfOj2gEEH5FCGktRVrCjiZRujUW1VPMI3yiU
   Zt4QGrcxDUyfnWYeongFWvQeE6v1jCLp4T2aYIDEOoqwdnX/yml0C0A65
   PB0Rt96rLhI+ZKb76EUaPOgtL7YkL7ZGiaDN4lxk4/G9F4HH4mNwzAGxZ
   ZnlxiaUbNNn5kYgDZEKpUx9ktBfU23sAvDki4LtJ/X4yhHGdgMvtREgHj
   BYWjCHGCveluHNbJyftCYtFDOHcxH1ZO2zYQIkpF0GxieLcZuw5KQAvxR
   w==;
X-CSE-ConnectionGUID: 3sW8vLfrTrmUav89Cdbz3w==
X-CSE-MsgGUID: DRNDVTXRR2+4qx7v2Xgizg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40426366"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40426366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:59:02 -0700
X-CSE-ConnectionGUID: RGESs22aT0GrR0Yt4uJWjQ==
X-CSE-MsgGUID: xlVfoV9ESHyBnxYiA/wHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82283295"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2024 23:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5gBf-000dLy-1D;
	Tue, 29 Oct 2024 06:58:43 +0000
Date: Tue, 29 Oct 2024 14:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22906/23897] fs/ext4/inode.c:2995:23:
 warning: unused variable 'sbi'
Message-ID: <202410291459.qfL3pzNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e7116f4c77ecbf4fe5ee0c5f388efd733f80556
commit: 7b208222f6845875c568d238aeb9db17a1c63d96 [22906/23897] ext4: avoid deadlock in fs reclaim with page writeback
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241029/202410291459.qfL3pzNM-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291459.qfL3pzNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291459.qfL3pzNM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ext4/inode.c:25:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ext4/inode.c:2995:23: warning: unused variable 'sbi' [-Wunused-variable]
    2995 |         struct ext4_sb_info *sbi = EXT4_SB(mapping->host->i_sb);
         |                              ^~~
   2 warnings generated.


vim +/sbi +2995 fs/ext4/inode.c

64769240bd07f4 Alex Tomas   2008-07-11  2988  
5f0663bb4a64f5 Dan Williams 2017-12-21  2989  static int ext4_dax_writepages(struct address_space *mapping,
5f0663bb4a64f5 Dan Williams 2017-12-21  2990  			       struct writeback_control *wbc)
5f0663bb4a64f5 Dan Williams 2017-12-21  2991  {
5f0663bb4a64f5 Dan Williams 2017-12-21  2992  	int ret;
5f0663bb4a64f5 Dan Williams 2017-12-21  2993  	long nr_to_write = wbc->nr_to_write;
5f0663bb4a64f5 Dan Williams 2017-12-21  2994  	struct inode *inode = mapping->host;
5f0663bb4a64f5 Dan Williams 2017-12-21 @2995  	struct ext4_sb_info *sbi = EXT4_SB(mapping->host->i_sb);
7b208222f68458 Jan Kara     2024-06-11  2996  	int alloc_ctx;
5f0663bb4a64f5 Dan Williams 2017-12-21  2997  
5f0663bb4a64f5 Dan Williams 2017-12-21  2998  	if (unlikely(ext4_forced_shutdown(EXT4_SB(inode->i_sb))))
5f0663bb4a64f5 Dan Williams 2017-12-21  2999  		return -EIO;
5f0663bb4a64f5 Dan Williams 2017-12-21  3000  
7b208222f68458 Jan Kara     2024-06-11  3001  	alloc_ctx = ext4_writepages_down_read(inode->i_sb);
5f0663bb4a64f5 Dan Williams 2017-12-21  3002  	trace_ext4_writepages(inode, wbc);
5f0663bb4a64f5 Dan Williams 2017-12-21  3003  
5f0663bb4a64f5 Dan Williams 2017-12-21  3004  	ret = dax_writeback_mapping_range(mapping, inode->i_sb->s_bdev, wbc);
5f0663bb4a64f5 Dan Williams 2017-12-21  3005  	trace_ext4_writepages_result(inode, wbc, ret,
5f0663bb4a64f5 Dan Williams 2017-12-21  3006  				     nr_to_write - wbc->nr_to_write);
7b208222f68458 Jan Kara     2024-06-11  3007  	ext4_writepages_up_read(inode->i_sb, alloc_ctx);
5f0663bb4a64f5 Dan Williams 2017-12-21  3008  	return ret;
5f0663bb4a64f5 Dan Williams 2017-12-21  3009  }
5f0663bb4a64f5 Dan Williams 2017-12-21  3010  

:::::: The code at line 2995 was first introduced by commit
:::::: 5f0663bb4a64f588f0a2dd6d1be68d40f9af0086 ext4, dax: introduce ext4_dax_aops

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
