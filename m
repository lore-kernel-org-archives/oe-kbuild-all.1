Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA0D3E4C6A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298823; cv=none; b=BIngZeihMr+ZTja6Ji1dxrpY+4MGtWzdHzeolckwJzRXoQFilAoLVGZMi2pg52tg+3cBDL2XyAMMqjZ+8bfn312+A8O2f7dQgc0FM7f4m9qHbacHifUCBGwDAIaDc+HouF2GxmY+WCVNeetcLiT2y7LPoUZvQuvff0PJqbCLYUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298823; c=relaxed/simple;
	bh=Fpc13MVo7lYRnEN6LeyyLxp4Da0+KmYvCm0bGsC5JK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NRwy1ZP95z3dR3QOMC0uAWsLv5RBYABkUqngKILRzilzGeZbpi/8jqNXbd77qpZ3YxZjTB7XDM9RqbaA/6/ETcwGVs0lyI1xKbCyNmMd2AkF1BiIle7OTmf6d+AoUF0kExsaR0/l9xtRiwgmp5dhqoyhQSRzQ8Q6CX5AiWLidJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TI+xB1zy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TI+xB1zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774298820; x=1805834820;
  h=date:from:to:cc:subject:message-id;
  bh=Fpc13MVo7lYRnEN6LeyyLxp4Da0+KmYvCm0bGsC5JK0=;
  b=TI+xB1zy4+h0GJkz+/Z1LZe2raX15CvXrDAptmqteMxP+pn1lWuyi9VO
   PgFC2bTK8yIVUPUKDvuHLeslzE7gPy/Y7Iq785i0Mc/lsro0tCUelphEa
   KD2ADvr3lIIqVem/IhGW0RBGYnnMHgNhAwb2di3+yca4Sy0F2ioLgKEeN
   fEyj4VuLHqY77zKnoNLagC4HqDFG/N+7jPc00bX1Lb44PuBndCe7wMUoe
   4kqHgqu5awqcg/wfyEdCDyadPaPy4udrSwGmd/WpKqZqsuWwu6JZApGMm
   s6qfiVYuRIPbws9YUTaRYtQ8lC8l+9SaOSW4+dogL6dly4BHZiQHZwz+C
   w==;
X-CSE-ConnectionGUID: Tqg6vB/qT1mtBOozICF9BQ==
X-CSE-MsgGUID: JnKGwNH9QN6nY3hjuNKR+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74489698"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74489698"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 13:46:59 -0700
X-CSE-ConnectionGUID: N4/M4hoMQO6ssL9IIBCVyQ==
X-CSE-MsgGUID: c1nMLhbNTYeVuFAx4c12Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228874294"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 13:46:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4mAq-000000003DF-109U;
	Mon, 23 Mar 2026 20:46:56 +0000
Date: Tue, 24 Mar 2026 04:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 fs/fuse/backing.c:156:16: sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202603240442.cEamc4nT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c77dc98143521f8761dda88c7b8d04fc0e35c5fc
commit: 8be90ef631b70dedc3c43b247aeae296a633dcb2 [5/5] ANDROID: fuse-bpf: fuse-bpf v1.2
config: i386-randconfig-r121-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240442.cEamc4nT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240442.cEamc4nT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240442.cEamc4nT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:156:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:314:16: sparse: sparse: Using plain integer as NULL pointer
>> fs/fuse/backing.c:861:48: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:861:48: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:861:48: sparse:     got int
   fs/fuse/backing.c:949:59: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:949:59: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:949:59: sparse:     got int
>> fs/fuse/backing.c:2097:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2098:18: sparse:   also defined here

vim +156 fs/fuse/backing.c

   145	
   146	void *fuse_open_finalize(struct fuse_bpf_args *fa,
   147			       struct inode *inode, struct file *file, bool isdir)
   148	{
   149		struct fuse_file *ff = file->private_data;
   150		struct fuse_open_out *foo = fa->out_args[0].value;
   151	
   152		if (ff) {
   153			ff->fh = foo->fh;
   154			ff->nodeid = get_fuse_inode(inode)->nodeid;
   155		}
 > 156		return 0;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
