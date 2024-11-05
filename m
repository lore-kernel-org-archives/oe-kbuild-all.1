Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21047163
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 00:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765156; cv=none; b=WeubGuVUPeItLGHrE9JW2+YsEwCp235zYYbwMeBHTzsLt0ivdHsVfRfsXyD6k9yEMbHvaeRUxHAmzugpA5k/si8ux4VfKh8acYRj7avOnzB9xxN9GFmxmZX1OK37UJpGSAsDcTOMZz2cqjKdOvt22eIjTTZ92LdnB0LsLkUb42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765156; c=relaxed/simple;
	bh=t9TodP49Tzra9PMjPWz3RQtoqbjXb1siFuSbyYVxBps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/+J45sIH7M5iVMofABA1mqbhNXb50JMbwWK29J87jc5Vr5kJhWhRD3+cXzwm9eGRF28MzYa3GoWZWduaHITOVwKx72pPAELiVlxPC6K79Y3ozw6qcs0HzcnnGtpFPaZPhRAd1Eyr0OVuU7U8ITYF0PqL7/NlwhwCzMnYo8uje4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coBJwWB7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coBJwWB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730765154; x=1762301154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t9TodP49Tzra9PMjPWz3RQtoqbjXb1siFuSbyYVxBps=;
  b=coBJwWB7Q/y1fMknhzwv201yoLCZNS4dcl+fGC/e0GMbR782fn+u8zMN
   605dlGsMSuV2gaZhzUwMYe+epLVf0+JZS/2qMju8LpZxcYrAmqkfhrutl
   fgP0OL87qzmhn6WvL46pR30B2DAG0MANlAXv6fiagIetRZRNGwweGgjJB
   0bu2fB4jBNNOw/cyeYYJkmFj53LwP4vGeX+KVdWLV0JNeXJIX2A07ppym
   lz/JZSmR6viA0OJRAKf16Rl8JUNrDBxGmNC4ZFgP9PmceMTyU6cufqIA0
   EzYLGe5fZJEm8rZYL/k73GAtlvKD0Zy5gvcJPJjgHTt7AZwqSamrAsMF3
   A==;
X-CSE-ConnectionGUID: cJ3K8NVvTv+gussfiTRPnw==
X-CSE-MsgGUID: CVuKKku0Tqi4kIJxeDHA6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41072850"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41072850"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 16:05:53 -0800
X-CSE-ConnectionGUID: QjVA6bDZTCGwHTYC3IvX9A==
X-CSE-MsgGUID: YyMKDFT8TAKde6pzcFitIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88567201"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2024 16:05:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t874v-000lQ1-37;
	Tue, 05 Nov 2024 00:05:49 +0000
Date: Tue, 5 Nov 2024 08:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <maharmstone@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [linux-next:master 8334/9360] fs/btrfs/ioctl.c:4975:9-16: WARNING
 opportunity for kmemdup
Message-ID: <202411050846.GI8oh5IK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1ffec08567f426a1c593e038cadc61bdc38cb467
commit: 48b8a3df6d216bf9641bebf1efa1a3e1bdc9520d [8334/9360] btrfs: add io_uring command for encoded reads (ENCODED_READ ioctl)
config: x86_64-randconfig-103-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050846.GI8oh5IK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050846.GI8oh5IK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/ioctl.c:4975:9-16: WARNING opportunity for kmemdup

vim +4975 fs/btrfs/ioctl.c

  4868	
  4869	static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd, unsigned int issue_flags)
  4870	{
  4871		size_t copy_end_kernel = offsetofend(struct btrfs_ioctl_encoded_io_args, flags);
  4872		size_t copy_end;
  4873		struct btrfs_ioctl_encoded_io_args args = { 0 };
  4874		int ret;
  4875		u64 disk_bytenr, disk_io_size;
  4876		struct file *file;
  4877		struct btrfs_inode *inode;
  4878		struct btrfs_fs_info *fs_info;
  4879		struct extent_io_tree *io_tree;
  4880		struct iovec iovstack[UIO_FASTIOV];
  4881		struct iovec *iov = iovstack;
  4882		struct iov_iter iter;
  4883		loff_t pos;
  4884		struct kiocb kiocb;
  4885		struct extent_state *cached_state = NULL;
  4886		u64 start, lockend;
  4887		void __user *sqe_addr;
  4888	
  4889		if (!capable(CAP_SYS_ADMIN)) {
  4890			ret = -EPERM;
  4891			goto out_acct;
  4892		}
  4893		file = cmd->file;
  4894		inode = BTRFS_I(file->f_inode);
  4895		fs_info = inode->root->fs_info;
  4896		io_tree = &inode->io_tree;
  4897		sqe_addr = u64_to_user_ptr(READ_ONCE(cmd->sqe->addr));
  4898	
  4899		if (issue_flags & IO_URING_F_COMPAT) {
  4900	#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
  4901			struct btrfs_ioctl_encoded_io_args_32 args32;
  4902	
  4903			copy_end = offsetofend(struct btrfs_ioctl_encoded_io_args_32, flags);
  4904			if (copy_from_user(&args32, sqe_addr, copy_end)) {
  4905				ret = -EFAULT;
  4906				goto out_acct;
  4907			}
  4908			args.iov = compat_ptr(args32.iov);
  4909			args.iovcnt = args32.iovcnt;
  4910			args.offset = args32.offset;
  4911			args.flags = args32.flags;
  4912	#else
  4913			return -ENOTTY;
  4914	#endif
  4915		} else {
  4916			copy_end = copy_end_kernel;
  4917			if (copy_from_user(&args, sqe_addr, copy_end)) {
  4918				ret = -EFAULT;
  4919				goto out_acct;
  4920			}
  4921		}
  4922	
  4923		if (args.flags != 0)
  4924			return -EINVAL;
  4925	
  4926		ret = import_iovec(ITER_DEST, args.iov, args.iovcnt, ARRAY_SIZE(iovstack),
  4927				   &iov, &iter);
  4928		if (ret < 0)
  4929			goto out_acct;
  4930	
  4931		if (iov_iter_count(&iter) == 0) {
  4932			ret = 0;
  4933			goto out_free;
  4934		}
  4935	
  4936		pos = args.offset;
  4937		ret = rw_verify_area(READ, file, &pos, args.len);
  4938		if (ret < 0)
  4939			goto out_free;
  4940	
  4941		init_sync_kiocb(&kiocb, file);
  4942		kiocb.ki_pos = pos;
  4943	
  4944		if (issue_flags & IO_URING_F_NONBLOCK)
  4945			kiocb.ki_flags |= IOCB_NOWAIT;
  4946	
  4947		start = ALIGN_DOWN(pos, fs_info->sectorsize);
  4948		lockend = start + BTRFS_MAX_UNCOMPRESSED - 1;
  4949	
  4950		ret = btrfs_encoded_read(&kiocb, &iter, &args, &cached_state,
  4951					 &disk_bytenr, &disk_io_size);
  4952		if (ret < 0 && ret != -EIOCBQUEUED)
  4953			goto out_free;
  4954	
  4955		file_accessed(file);
  4956	
  4957		if (copy_to_user(sqe_addr + copy_end, (const char *)&args + copy_end_kernel,
  4958				 sizeof(args) - copy_end_kernel)) {
  4959			if (ret == -EIOCBQUEUED) {
  4960				unlock_extent(io_tree, start, lockend, &cached_state);
  4961				btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
  4962			}
  4963			ret = -EFAULT;
  4964			goto out_free;
  4965		}
  4966	
  4967		if (ret == -EIOCBQUEUED) {
  4968			u64 count;
  4969	
  4970			/*
  4971			 * If we've optimized things by storing the iovecs on the stack,
  4972			 * undo this.
  4973			 */
  4974			if (!iov) {
> 4975				iov = kmalloc(sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
  4976				if (!iov) {
  4977					unlock_extent(io_tree, start, lockend, &cached_state);
  4978					btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
  4979					ret = -ENOMEM;
  4980					goto out_acct;
  4981				}
  4982	
  4983				memcpy(iov, iovstack, sizeof(struct iovec) * args.iovcnt);
  4984			}
  4985	
  4986			count = min_t(u64, iov_iter_count(&iter), disk_io_size);
  4987	
  4988			/* Match ioctl by not returning past EOF if uncompressed. */
  4989			if (!args.compression)
  4990				count = min_t(u64, count, args.len);
  4991	
  4992			ret = btrfs_uring_read_extent(&kiocb, &iter, start, lockend,
  4993						      cached_state, disk_bytenr,
  4994						      disk_io_size, count,
  4995						      args.compression, iov, cmd);
  4996	
  4997			goto out_acct;
  4998		}
  4999	
  5000	out_free:
  5001		kfree(iov);
  5002	
  5003	out_acct:
  5004		if (ret > 0)
  5005			add_rchar(current, ret);
  5006		inc_syscr(current);
  5007	
  5008		return ret;
  5009	}
  5010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
