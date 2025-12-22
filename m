Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A934320CA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 01:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766368095; cv=none; b=SBSZLOGHf6n4Aa3/L9wA6xs1CjHALxk7gumhlpXMy+oLs2yBLjM2bfVZJ+0MIJkJ9UT/5VEUwouik6QHhqXks/Sv1CbwMF0Mh8Yaqp1D86+Oh1Z+UDigwnmyjjI8+ZDBSOupr+xJH9tI/WX1hGL+nfobCNH/Y4b6KCefRHsB61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766368095; c=relaxed/simple;
	bh=M/qy0vF1izOP/zBE0Pt62a2DM0ZHgf2jilaU7Jn7i68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYaIbAZSCEIIcYm2TL0oSvqu6fJSFRMnG3iFVyFUmu7EIcualeMzP0h3TjfR6j5rVj5d/4jQLV9MonhlkqkX4za8IoC/SX/DK1U6H9g1kdnr2iiTYtd7a6WHboHljSvMUUo8R+JF/p6m2UvVGp1v2aRupF+irKosFNhI8luPCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgmwq5R0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgmwq5R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766368093; x=1797904093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M/qy0vF1izOP/zBE0Pt62a2DM0ZHgf2jilaU7Jn7i68=;
  b=mgmwq5R0s3tvE8ZeB+YS+jfPHGNVp1zrarzm95tAtR+9ZMmkpWvIoIK6
   SmVFMZGqbi2pYuZQPU6YjUkETlQmqnFjMuzuK5qsjef5YrKrQMLZL4YX0
   EICQ/I7ofF2m8Usacb9f2DZTZn3RqcLk6wXY9/SuzV7SIR6oOBoyht1Kz
   mlKVNZ7oIpp4rXJsmu2KYgOtYZ5DbXpVqEqnNbun7chV7LkiiPBOj6g+c
   iL9KFmMXKxMdsTXI66Ja4xcyJMxLuecZE/WhotAofN1yjT69XAf3+rlJh
   pKCz9Yvd+4AsTAxI2l6qRcuG5VKPF2/eNuXKQK4a7oylI3kcD7AeV9MAQ
   Q==;
X-CSE-ConnectionGUID: TacI3u88SQytZ/2AxLZrFg==
X-CSE-MsgGUID: dFVYo2RlT7aHuKy6veRTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72085856"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72085856"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:48:13 -0800
X-CSE-ConnectionGUID: zMWPp8vEQyaqjgGCG/CC0A==
X-CSE-MsgGUID: fH1DDKpNQHCciMolUtsSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="236819874"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 17:48:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXV1t-000000005Jk-1x1p;
	Mon, 22 Dec 2025 01:48:09 +0000
Date: Mon, 22 Dec 2025 02:47:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] drivers/dma-buf/dma-heap.c:47:
 warning: Function parameter or struct member 'heap_dev' not described in
 'dma_heap'
Message-ID: <202512220230.9q2uGmGm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: cefb5c96f328e7ece57ff0a5c39d554e1d6cd171 [3/3] Merge 0c6bc3725592 ("Merge tag 'ubifs-for-linus-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs") into android-mainline
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512220230.9q2uGmGm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220230.9q2uGmGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220230.9q2uGmGm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'heap_cdev' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'refcount' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'heap_dev' not described in 'dma_heap'


vim +47 drivers/dma-buf/dma-heap.c

c02a81fba74fe3 Andrew F. Davis 2019-12-03  26  
c02a81fba74fe3 Andrew F. Davis 2019-12-03  27  /**
c02a81fba74fe3 Andrew F. Davis 2019-12-03  28   * struct dma_heap - represents a dmabuf heap in the system
c02a81fba74fe3 Andrew F. Davis 2019-12-03  29   * @name:		used for debugging/device-node name
c02a81fba74fe3 Andrew F. Davis 2019-12-03  30   * @ops:		ops struct for this heap
c02a81fba74fe3 Andrew F. Davis 2019-12-03  31   * @heap_devt		heap device node
c02a81fba74fe3 Andrew F. Davis 2019-12-03  32   * @list		list head connecting to list of heaps
c02a81fba74fe3 Andrew F. Davis 2019-12-03  33   * @heap_cdev		heap char device
9d47057e55785b John Stultz     2020-05-07  34   * @heap_dev		heap device struct
c02a81fba74fe3 Andrew F. Davis 2019-12-03  35   *
c02a81fba74fe3 Andrew F. Davis 2019-12-03  36   * Represents a heap of memory from which buffers can be made.
c02a81fba74fe3 Andrew F. Davis 2019-12-03  37   */
c02a81fba74fe3 Andrew F. Davis 2019-12-03  38  struct dma_heap {
c02a81fba74fe3 Andrew F. Davis 2019-12-03  39  	const char *name;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  40  	const struct dma_heap_ops *ops;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  41  	void *priv;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  42  	dev_t heap_devt;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  43  	struct list_head list;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  44  	struct cdev heap_cdev;
c700bdd2233e00 John Stultz     2020-07-25  45  	struct kref refcount;
9d47057e55785b John Stultz     2020-05-07  46  	struct device *heap_dev;
c02a81fba74fe3 Andrew F. Davis 2019-12-03 @47  };
c02a81fba74fe3 Andrew F. Davis 2019-12-03  48  

:::::: The code at line 47 was first introduced by commit
:::::: c02a81fba74fe3488ad6b08bfb5a1329005418f8 dma-buf: Add dma-buf heaps framework

:::::: TO: Andrew F. Davis <afd@ti.com>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
