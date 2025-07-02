Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DD42F4321
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481151; cv=none; b=bHG0A5e1A7Ml0/Zl6U0yn94zgZNFWMHs0ybcwjz99t0WiEfCuvT+QWKr79oNrbRGKCrft52dC4K/8gMuKdetLVYI1BsmaEK+cLiGiVgmvEVvmRjkl8A/Kn9HvfWA6NQ9TwWvCgTgNnCau485Vl6dZbytI/9CROzVCsf2PxYQRrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481151; c=relaxed/simple;
	bh=41NTmRPxFxJJAPiB3UvWfD7QrJ1i1G48OQUURo6I6/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o74lZdwGzmlUmuIM8zb4W84Fl9+a7fNDKaLtc3lCYaCpvaq1qB++BHNwMSp9LQdJO+h0NAtKVgnJY7oRj66gSOC8ALpwanQbzZbkWpQ6RCz4ldBX9Q7ARE1OgsChZsR7Jpszk4u2tsUuKYAHAtJweHzCwKoc65OOXMIxJIFMJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo7vGKXG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo7vGKXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751481150; x=1783017150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=41NTmRPxFxJJAPiB3UvWfD7QrJ1i1G48OQUURo6I6/0=;
  b=Qo7vGKXG//T/JYDd9b8cC2AO31sU9Njka9Rfey5TVtAi+E/vFWBjEwpg
   0ydMG3cFYXyBcDTeOtDJa9jfwavNJNlR3xLLF4/GH+qPjc6MR7Z8+g1CP
   7rSDaae4IlB7OBKAfKIJwrIJAR3g/6FGuCNV0ysuMH3ca+6mk67SL4J0n
   5H5lf5hsLxfc+UkBfv46WA0mvFsMI4Ptf1gj1X3YmTlFUX6Sttl5p1S6p
   wAVNakIcbN+R+TTwGt1ab3tWQoBRkRQNdpONJish1275MYzmKQCTYB90u
   eRWbDrPQDVctChMmGJ15wEdHwTJDqmRljfozQLmfH/DUOgPQ+4Kpvw5l4
   g==;
X-CSE-ConnectionGUID: nxqrk+wKSIiNr4qNV2cBqA==
X-CSE-MsgGUID: bdZpfgApTdid9ZC+wkBoVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53656500"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="53656500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 11:32:29 -0700
X-CSE-ConnectionGUID: lAZS3r3NQdyeWiWHhw3mNA==
X-CSE-MsgGUID: D9vXpO8qTcuP+khkKCaXkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="153926827"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 02 Jul 2025 11:32:28 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX2Fs-0000KP-1g;
	Wed, 02 Jul 2025 18:32:24 +0000
Date: Wed, 2 Jul 2025 20:31:41 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] fs/hugetlbfs/inode.c:635:3:
 warning: cast from 'int (*)(unsigned long, unsigned long, struct hf_args *)'
 to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to
 incompatible function type
Message-ID: <202507022022.QDVHgFyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 4733c59fabc3d9c145aca2f1c86b4872a7fb671d [1605/1605] hugetlbfs: parallelize hugetlbfs_fallocate with ktask
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250702/202507022022.QDVHgFyQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022022.QDVHgFyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022022.QDVHgFyQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/hugetlbfs/inode.c:635:3: warning: cast from 'int (*)(unsigned long, unsigned long, struct hf_args *)' to 'ktask_thread_func' (aka 'int (*)(void *, void *, void *)') converts to incompatible function type [-Wcast-function-type-mismatch]
     635 |                 DEFINE_KTASK_CTL(ctl, hugetlbfs_fallocate_chunk,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     636 |                                  &hf_args, KTASK_PMD_MINCHUNK);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:139:3: note: expanded from macro 'DEFINE_KTASK_CTL'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ktask.h:123:21: note: expanded from macro 'KTASK_CTL_INITIALIZER'
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +635 fs/hugetlbfs/inode.c

   577	
   578	static int hugetlbfs_fallocate_chunk(pgoff_t start, pgoff_t end,
   579					     struct hf_args *args);
   580	
   581	static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
   582					loff_t len)
   583	{
   584		struct inode *inode = file_inode(file);
   585		struct hugetlbfs_inode_info *info = HUGETLBFS_I(inode);
   586		struct hstate *h = hstate_inode(inode);
   587		loff_t hpage_size = huge_page_size(h);
   588		unsigned long hpage_shift = huge_page_shift(h);
   589		pgoff_t start, end;
   590		struct hf_args hf_args;
   591		int error;
   592	
   593		if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
   594			return -EOPNOTSUPP;
   595	
   596		if (mode & FALLOC_FL_PUNCH_HOLE)
   597			return hugetlbfs_punch_hole(inode, offset, len);
   598	
   599		/*
   600		 * Default preallocate case.
   601		 * For this range, start is rounded down and end is rounded up
   602		 * as well as being converted to page offsets.
   603		 */
   604		start = (unsigned long long)offset >> hpage_shift;
   605		end = ((unsigned long long)(offset + len + hpage_size) - 1)
   606				>> hpage_shift;
   607	
   608		inode_lock(inode);
   609	
   610		/* We need to check rlimit even when FALLOC_FL_KEEP_SIZE */
   611		error = inode_newsize_ok(inode, offset + len);
   612		if (error)
   613			goto out;
   614	
   615		if ((info->seals & F_SEAL_GROW) && offset + len > inode->i_size) {
   616			error = -EPERM;
   617			goto out;
   618		}
   619	
   620		hf_args.file = file;
   621		hf_args.parent_task = current;
   622		hf_args.mm = current->mm;
   623		hf_args.shared_policy = hugetlb_get_shared_policy(inode);
   624		hf_args.hstate = h;
   625		hf_args.mapping = inode->i_mapping;
   626		hf_args.error = 0;
   627	
   628		if (unlikely(hstate_is_gigantic(h))) {
   629			/*
   630			 * Use multiple threads in clear_gigantic_page instead of here,
   631			 * so just do a 1-threaded hugetlbfs_fallocate_chunk.
   632			 */
   633			error = hugetlbfs_fallocate_chunk(start, end, &hf_args);
   634		} else {
 > 635			DEFINE_KTASK_CTL(ctl, hugetlbfs_fallocate_chunk,
   636					 &hf_args, KTASK_PMD_MINCHUNK);
   637	
   638			error = ktask_run((void *)start, end - start, &ctl);
   639		}
   640	
   641		if (error != KTASK_RETURN_SUCCESS && hf_args.error != -EINTR)
   642			goto out;
   643	
   644		if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + len > inode->i_size)
   645			i_size_write(inode, offset + len);
   646		inode->i_ctime = current_time(inode);
   647	out:
   648		inode_unlock(inode);
   649		return error;
   650	}
   651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
