Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4146FB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712821095; cv=none; b=VxTaD93Ws16R+uW6OMSjhx5fEH9auOnKXAWuDzigTZRpn5Y4VseC/fDZP80Xj3QzQboLeNufd/jSlgH7y1LQy6ulzRoES+I2SE3uFxTs0ewtNHK5NnrW46cLtfQeEWypjuUFoBFREcEB5KRIuRI/Kg2422X/+NuEIi3ZJ+Rl9tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712821095; c=relaxed/simple;
	bh=L3JoXk4FEl07a0j6E2upwLLCqgoju+2XhzIi3eYOF28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PWvduo+DKZ33HxgpP3bEg3hFvw4ITg0RQqyPtlwgzYdCYuV9MSLwjbsBotkqaORXsuzFyWhciyiSZ9eXyYVY6T5qx42LuQTISHON25+cJuTtop6EsKMIbjbkj+taktNYAQHVWsfPjyLEguuOjMzPWR/nQGE2zFbg0x69yN+Y3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB3Q3t9I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB3Q3t9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712821094; x=1744357094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L3JoXk4FEl07a0j6E2upwLLCqgoju+2XhzIi3eYOF28=;
  b=kB3Q3t9IdzTiPg9y/Od4SWbrtJGHvYqyjb47hkQPo/2MejW+bZ0G9m7C
   /Ih3woZLZtyGwULQGN3yBCh6VlGYkqyv1LKu6F4GxAzUIRfV+x56xUP5v
   +jlUpjP7PKdOz3+X8+u6swmImBsdHVDpKecV8Lk18eRbPkVFWNTlMKJ2R
   Q6dBHtjVpk5SFjX2ufjh5wAy83ZctmFKsinYHdTMoOwqDVov/a25ugWod
   tnIm9fkhshrIJLZcmVc/AHcFcfOq9IFmReX0+AnaPB5TtNKnaH5woybQe
   HOnzkFSapgtc9n7CozKZQC7lRBOGPfNGK3+J7ob+XvMq13nkcwe52V27u
   w==;
X-CSE-ConnectionGUID: 9ye5WBPaSzqR/BvULXBmDw==
X-CSE-MsgGUID: 8EKe1SqbSt2jTiShpUi7Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12068053"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="12068053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:38:13 -0700
X-CSE-ConnectionGUID: +lrVnIh2TC2MmtVIVpaCBg==
X-CSE-MsgGUID: WT06LAduRi62xsJwOfPwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25302771"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2024 00:38:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rup0b-0008Ml-2f;
	Thu, 11 Apr 2024 07:38:09 +0000
Date: Thu, 11 Apr 2024 15:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 3/5] io_uring/rsrc.c:1008:24: warning: format
 '%d' expects argument of type 'int', but argument 4 has type
 '__kernel_size_t' {aka 'long unsigned int'}
Message-ID: <202404111521.46gpY5cV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   145e80df1ac4e2380f8753660781bdc2c3350206
commit: 0fe9df64fe2bd74f7b4d92c0c9cfe55dc55e4ff8 [3/5] wip: bnxt
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404111521.46gpY5cV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111521.46gpY5cV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111521.46gpY5cV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from io_uring/rsrc.c:2:
   io_uring/rsrc.c: In function 'io_sqe_buffers_register':
>> io_uring/rsrc.c:1008:24: warning: format '%d' expects argument of type 'int', but argument 4 has type '__kernel_size_t' {aka 'long unsigned int'} [-Wformat=]
    1008 |                 printk("----- io_sqe_buffers_register: i=%d, iov_base=%px, iov_len=%d\n", i, iov.iov_base, iov.iov_len);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                   ~~~~~~~~~~~
         |                                                                                                               |
         |                                                                                                               __kernel_size_t {aka long unsigned int}
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   io_uring/rsrc.c:1008:17: note: in expansion of macro 'printk'
    1008 |                 printk("----- io_sqe_buffers_register: i=%d, iov_base=%px, iov_len=%d\n", i, iov.iov_base, iov.iov_len);
         |                 ^~~~~~
   io_uring/rsrc.c:1008:85: note: format string is defined here
    1008 |                 printk("----- io_sqe_buffers_register: i=%d, iov_base=%px, iov_len=%d\n", i, iov.iov_base, iov.iov_len);
         |                                                                                    ~^
         |                                                                                     |
         |                                                                                     int
         |                                                                                    %ld


vim +1008 io_uring/rsrc.c

   967	
   968	int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
   969				    unsigned int nr_args, u64 __user *tags)
   970	{
   971		struct page *last_hpage = NULL;
   972		struct io_rsrc_data *data;
   973		int i, ret;
   974		struct iovec iov;
   975	
   976		BUILD_BUG_ON(IORING_MAX_REG_BUFFERS >= (1u << 16));
   977	
   978		if (ctx->user_bufs)
   979			return -EBUSY;
   980		if (!nr_args || nr_args > IORING_MAX_REG_BUFFERS)
   981			return -EINVAL;
   982		ret = io_rsrc_data_alloc(ctx, IORING_RSRC_BUFFER, tags, nr_args, &data);
   983		if (ret)
   984			return ret;
   985		ret = io_buffers_map_alloc(ctx, nr_args);
   986		if (ret) {
   987			io_rsrc_data_free(data);
   988			return ret;
   989		}
   990	
   991		for (i = 0; i < nr_args; i++, ctx->nr_user_bufs++) {
   992			if (arg) {
   993				ret = io_copy_iov(ctx, &iov, arg, i);
   994				if (ret)
   995					break;
   996				ret = io_buffer_validate(&iov);
   997				if (ret)
   998					break;
   999			} else {
  1000				memset(&iov, 0, sizeof(iov));
  1001			}
  1002	
  1003			if (!iov.iov_base && *io_get_tag_slot(data, i)) {
  1004				ret = -EINVAL;
  1005				break;
  1006			}
  1007	
> 1008			printk("----- io_sqe_buffers_register: i=%d, iov_base=%px, iov_len=%d\n", i, iov.iov_base, iov.iov_len);
  1009			ret = io_sqe_buffer_register(ctx, &iov, &ctx->user_bufs[i],
  1010						     &last_hpage);
  1011			if (ret)
  1012				break;
  1013		}
  1014	
  1015		WARN_ON_ONCE(ctx->buf_data);
  1016	
  1017		ctx->buf_data = data;
  1018		if (ret)
  1019			__io_sqe_buffers_unregister(ctx);
  1020		return ret;
  1021	}
  1022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
