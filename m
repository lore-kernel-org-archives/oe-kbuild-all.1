Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD80143C72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826861; cv=none; b=qQxNkzaPc6BlPet8+/CgihaDDWmlrzoWGY7IqKOsQ3GXwJA6jNDP8yb9CZYBCZs/6yuv865okr8GZhOQZU1pMkIJrwD902gBCKGPjRohvCGQdv1srw3QQVjyLIPVu6eZ5ZHMDQVLH26cuSXx39JXPONYSyUlOFHA4oy113S0WFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826861; c=relaxed/simple;
	bh=rWubZYmzEzCWhwoXddlmczgg4WtXCHn94Zc/AaP6Anc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1/gtF1krHBJqsvXImWAKe45Yy4rpdASZtLZzZVIk1j9BWyuIfM77SeCAEFSp9awV4jqbovtKUIARS5v7301u1YPDR8q9ylD3D6WEqFDJpR4I9nk0HtrrPjF9ScchIBn4rDG//0xQ1SKSK3bE0TO1gZNmPc3B4kPzN9bdHlaMIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHHUV8lD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHHUV8lD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826859; x=1744362859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rWubZYmzEzCWhwoXddlmczgg4WtXCHn94Zc/AaP6Anc=;
  b=lHHUV8lDPLng5iV39+UzSDX93/792JdjYNYveXDabLdrYCdi+Q0oZpRe
   VhXhzSUhwxrPlyBI0a773V3FGd1a+HWq5uhJ0rsMoOi3EjVFPBUEb2By4
   tbFowg5TEtw5fCJWFb6JaGkWtN7ihU0c2gQNK+/7nRXFXepXdW0FLxnHf
   uDocUlSnIxqHkb95AkP10DyJPICu/DLkfi58nJbfjcFsloCX9v9ZgYxEQ
   cZSZRW1YEbUXhg0U3h98N2Hq80yM9E3AbyOTVFtPqxFPyQSUgKLmE4xsU
   W1NF6+o9LKv4Ag4KSgO7CtUlEWDzkmDM/kc96j+jsUvLk6hqVnlWbK9Ip
   g==;
X-CSE-ConnectionGUID: xzED9rOBRyagWLLOZ7Iieg==
X-CSE-MsgGUID: QZRxoVwURFenZh46B4Dvbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18935609"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18935609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:14:19 -0700
X-CSE-ConnectionGUID: UizFUREqS1SZZtnslUuVxQ==
X-CSE-MsgGUID: G2F72BPjSIeO87oPqiGEtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20895161"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Apr 2024 02:14:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruqVb-0008SQ-0T;
	Thu, 11 Apr 2024 09:14:15 +0000
Date: Thu, 11 Apr 2024 17:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 3/5] io_uring/rsrc.c:1008:94: warning: format
 specifies type 'int' but the argument has type '__kernel_size_t' (aka
 'unsigned long')
Message-ID: <202404111707.lIIxponM-lkp@intel.com>
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
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111707.lIIxponM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111707.lIIxponM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111707.lIIxponM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/rsrc.c:6:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/rsrc.c:1008:94: warning: format specifies type 'int' but the argument has type '__kernel_size_t' (aka 'unsigned long') [-Wformat]
    1008 |                 printk("----- io_sqe_buffers_register: i=%d, iov_base=%px, iov_len=%d\n", i, iov.iov_base, iov.iov_len);
         |                                                                                    ~~                      ^~~~~~~~~~~
         |                                                                                    %lu
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


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
