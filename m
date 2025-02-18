Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3EC1EA6F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 03:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739849444; cv=none; b=gelF0AYJtERX0SVPCmnZe252vynsq9cVK+l518lh7D51JmQ+Qq0deYook//lf6WM33nyDsQom1IBbTjIqmUFIIfR+t54iRYXP/VHjkekG58L8rZv5SOqfe1+iwY/K2cNfzPnIExcEJal/kbQTr0SM2FM2fnaCdIkpsIwSraSOA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739849444; c=relaxed/simple;
	bh=h92Lotw9ubSHQjSgn/EEsc+OaoiV8Wc6aewdxzGy+4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=as+beO+Le/FmtYpxv+S4A3UOBTyVmxbcbF5xpaoHwj531d/BUjYMCNYHK3oSK/ThdrbbaMSnjqTk77kNe+F2mY2sNmYrjwyPQqux4Bg9XKyGgd+zFhl0GS1WTeaZUhJCSvvkLXJ8xqUD1Ix+DE7xmPSXs/biU8XL45Qaw5kgHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLZNnKTn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLZNnKTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739849443; x=1771385443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h92Lotw9ubSHQjSgn/EEsc+OaoiV8Wc6aewdxzGy+4w=;
  b=RLZNnKTn0UFgmOrImRprjTswuG74+qYLlRnkUR/Mv6iwerWDIHKwXTpo
   34EOdy+UJ7fqM5DqAPiH8SYKFbQ+I8J6J7wIKSyyEpCEELKYYcFBMEW98
   xD/1a7tv8/yzQ+CrJ4S3HSUZTSR7ECvktbMxPkZSC2QfTAFfMXO6F8caN
   yuEh9aOcMXrAS6ZKFKsuaoj2LG+ZU/gtYEko+w2CLPa7NTreTyowflAAM
   HoON61rx+7TYwBU2l9n0V9CrWPpKKmGEV7BviGQT45SRLQDsY277JSaji
   kpFl2nKr3ruTi7tC6mBc4XnP+2M+D+7+niTt0ChHWSsLEGf/mm4pQUGcR
   g==;
X-CSE-ConnectionGUID: NMlICXIrQxC8B2GMv2cGhQ==
X-CSE-MsgGUID: bbg/L5DLSsCbYPqRh5cTCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39767242"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="39767242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 19:30:42 -0800
X-CSE-ConnectionGUID: 7Kf48oUETV6URzWHqRaeFA==
X-CSE-MsgGUID: WS6hk7G1TRSjweI1DhNbAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114924252"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Feb 2025 19:30:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkEJe-00007j-0S;
	Tue, 18 Feb 2025 03:30:35 +0000
Date: Tue, 18 Feb 2025 11:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 28/28]
 fs/fuse/backing.c:861:48: sparse: sparse: incorrect type in argument 4
 (different base types)
Message-ID: <202502181122.R7dRwEnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   beb8e60d0487cc606d41b948106c68787f909dee
commit: 8be90ef631b70dedc3c43b247aeae296a633dcb2 [28/28] ANDROID: fuse-bpf: fuse-bpf v1.2
config: x86_64-randconfig-r121-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181122.R7dRwEnO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181122.R7dRwEnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181122.R7dRwEnO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fuse/backing.c:156:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:314:16: sparse: sparse: Using plain integer as NULL pointer
>> fs/fuse/backing.c:861:48: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:861:48: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:861:48: sparse:     got int
   fs/fuse/backing.c:949:59: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:949:59: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:949:59: sparse:     got int
   fs/fuse/backing.c:2097:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2098:18: sparse:   also defined here

vim +861 fs/fuse/backing.c

   841	
   842	int fuse_file_read_iter_backing(struct fuse_bpf_args *fa,
   843			struct kiocb *iocb, struct iov_iter *to)
   844	{
   845		struct fuse_read_iter_out *frio = fa->out_args[0].value;
   846		struct file *file = iocb->ki_filp;
   847		struct fuse_file *ff = file->private_data;
   848		ssize_t ret;
   849	
   850		if (!iov_iter_count(to))
   851			return 0;
   852	
   853		if ((iocb->ki_flags & IOCB_DIRECT) &&
   854		    (!ff->backing_file->f_mapping->a_ops ||
   855		     !ff->backing_file->f_mapping->a_ops->direct_IO))
   856			return -EINVAL;
   857	
   858		/* TODO This just plain ignores any change to fuse_read_in */
   859		if (is_sync_kiocb(iocb)) {
   860			ret = vfs_iter_read(ff->backing_file, to, &iocb->ki_pos,
 > 861					iocb->ki_flags & FUSE_BPF_IOCB_MASK);
   862		} else {
   863			struct fuse_bpf_aio_req *aio_req;
   864	
   865			ret = -ENOMEM;
   866			aio_req = kmem_cache_zalloc(fuse_bpf_aio_request_cachep, GFP_KERNEL);
   867			if (!aio_req)
   868				goto out;
   869	
   870			aio_req->iocb_orig = iocb;
   871			kiocb_clone(&aio_req->iocb, iocb, ff->backing_file);
   872			aio_req->iocb.ki_complete = fuse_bpf_aio_rw_complete;
   873			refcount_set(&aio_req->ref, 2);
   874			ret = vfs_iocb_iter_read(ff->backing_file, &aio_req->iocb, to);
   875			fuse_bpf_aio_put(aio_req);
   876			if (ret != -EIOCBQUEUED)
   877				fuse_bpf_aio_cleanup_handler(aio_req);
   878		}
   879	
   880		frio->ret = ret;
   881	
   882		/* TODO Need to point value at the buffer for post-modification */
   883	
   884	out:
   885		fuse_file_accessed(file, ff->backing_file);
   886	
   887		return ret;
   888	}
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
