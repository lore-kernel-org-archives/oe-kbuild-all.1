Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A871531CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003368; cv=none; b=RitnWelkqQUqHadOdSAyV+IWTBrEhEGG3v5xwlp56DyOPzuTdMSaHlo+Gg+XwuNYBCYmCXRdbGPzswm2rxdr0R+12COAMVoQiEeFzdL9hF/e2FUHWf5D9qAoQAqvpzVHV4zIp7K2O0lLcVtPoNtfBHXhgBHH9yQA1zQhjLBDozE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003368; c=relaxed/simple;
	bh=n/35HqCn73lYRlpxKo5rBfjvgN3VEWO+0F64++ekZ/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PandBi5I9h2yuXqIYURiosfpRXkEVoDJzq8SjgPSYTlHpkOsSUPICEYDN0z5Vo3ijnOAord5HynRUBn80lJmC+IN0tUbjD+9EXxj1ObuKRonkz0enBUgw3n1ziqFYj8AXd1zpmb+Io2GWMdddri2gNbRp+cK4Vhmm6WdHV/6sQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKFzNbYp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKFzNbYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725003367; x=1756539367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/35HqCn73lYRlpxKo5rBfjvgN3VEWO+0F64++ekZ/k=;
  b=ZKFzNbYp5TPWFK9+hfmK6sNpAjmIWAnMF8icttC9yvPthxmomcOg/D6x
   Xgl+ad9huB7uEcQ58y8X9UCP6MNiX+kSscA5DmAeioMVEVfdVnwys6/5f
   9SRL6x7WLffy3aGfcAq6NpdIQuW9D32j5c85ECDgDUs7tPpSuTLZ1GZyN
   s8jcdTvNHXWIP+f3Oj5G3tqcZEHkheVHGDfNBxf9BqbHEyQFMuqkeL9zB
   tpjEqcp9WGOC//gBIhvfc6g/AFaR6ou42pMp9Koz3WzlTmwtAc0RVv9L5
   13tWEbo2J6HcAuo24fWT92EUaDutNIh0XBbUjQqIkfoPAKkHjMMXaC1NJ
   w==;
X-CSE-ConnectionGUID: GaG0MQmZRVeHTuXx7i2GpA==
X-CSE-MsgGUID: Hf4Bh82QRhmFceQVInWhJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="41113790"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="41113790"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 00:35:00 -0700
X-CSE-ConnectionGUID: vLGpPygGRtWKxp6NGAyfig==
X-CSE-MsgGUID: 1aBvc4rDTYC00GfocNs/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94647610"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Aug 2024 00:34:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjw9n-0001D8-2p;
	Fri, 30 Aug 2024 07:34:55 +0000
Date: Fri, 30 Aug 2024 15:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [axboe-block:io_uring-6.11 22/22] io_uring/rsrc.c:981:30: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202408301526.kGGDgLFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-6.11
head:   41ce1313454c91878970b46ed7efe849921482c6
commit: 41ce1313454c91878970b46ed7efe849921482c6 [22/22] io_uring/rsrc: ensure compat iovecs are copied correctly
config: i386-randconfig-061-20240830 (https://download.01.org/0day-ci/archive/20240830/202408301526.kGGDgLFJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301526.kGGDgLFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301526.kGGDgLFJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/rsrc.c:981:33: sparse: sparse: cast removes address space '__user' of expression
>> io_uring/rsrc.c:981:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iovec const [noderef] __user *uvec @@     got struct iovec *[noderef] __user @@
   io_uring/rsrc.c:981:30: sparse:     expected struct iovec const [noderef] __user *uvec
   io_uring/rsrc.c:981:30: sparse:     got struct iovec *[noderef] __user
   io_uring/rsrc.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/rsrc.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags_t degrades to integer

vim +981 io_uring/rsrc.c

   951	
   952	int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
   953				    unsigned int nr_args, u64 __user *tags)
   954	{
   955		struct page *last_hpage = NULL;
   956		struct io_rsrc_data *data;
   957		struct iovec fast_iov, *iov = &fast_iov;
   958		const struct iovec __user *uvec;
   959		int i, ret;
   960	
   961		BUILD_BUG_ON(IORING_MAX_REG_BUFFERS >= (1u << 16));
   962	
   963		if (ctx->user_bufs)
   964			return -EBUSY;
   965		if (!nr_args || nr_args > IORING_MAX_REG_BUFFERS)
   966			return -EINVAL;
   967		ret = io_rsrc_data_alloc(ctx, IORING_RSRC_BUFFER, tags, nr_args, &data);
   968		if (ret)
   969			return ret;
   970		ret = io_buffers_map_alloc(ctx, nr_args);
   971		if (ret) {
   972			io_rsrc_data_free(data);
   973			return ret;
   974		}
   975	
   976		if (!arg)
   977			memset(iov, 0, sizeof(*iov));
   978	
   979		for (i = 0; i < nr_args; i++, ctx->nr_user_bufs++) {
   980			if (arg) {
 > 981				uvec = (struct iovec * __user) arg;
   982				iov = iovec_from_user(uvec, 1, 1, &fast_iov, ctx->compat);
   983				if (IS_ERR(iov)) {
   984					ret = PTR_ERR(iov);
   985					break;
   986				}
   987				ret = io_buffer_validate(iov);
   988				if (ret)
   989					break;
   990				if (ctx->compat)
   991					arg += sizeof(struct compat_iovec);
   992				else
   993					arg += sizeof(struct iovec);
   994			}
   995	
   996			if (!iov->iov_base && *io_get_tag_slot(data, i)) {
   997				ret = -EINVAL;
   998				break;
   999			}
  1000	
  1001			ret = io_sqe_buffer_register(ctx, iov, &ctx->user_bufs[i],
  1002						     &last_hpage);
  1003			if (ret)
  1004				break;
  1005		}
  1006	
  1007		WARN_ON_ONCE(ctx->buf_data);
  1008	
  1009		ctx->buf_data = data;
  1010		if (ret)
  1011			__io_sqe_buffers_unregister(ctx);
  1012		return ret;
  1013	}
  1014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
