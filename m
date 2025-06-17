Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7AD215793
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 17:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180930; cv=none; b=I2lK9saaqtlNmGD5ws3NEV9MWtHHFHvAFcs18vIyJIKvISr3grL/cr3vGaCUIby6RoCREWQ2zRYyBuZMpo2C/mXMqw/mVIqFaSngV8bxmiQCn2IMmqBOXBkEkSedqZBgMwOhczNlnbawPetGHvP1oEaFlct+Pmwun1PwD42iaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180930; c=relaxed/simple;
	bh=kUIHWcwQ+2Uhns9/SdysMEnfrHMc7KuSlfdnAOjmDy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SlPdyG8GOZa3VCdQsdyuGZvRSvYvbTIpi0AEZsT8MD8/HvdCBkypEIy9D7NkznhJZSkxFKNMsPAZaJkUSc3axw17ERm14mrYilSTdFKoYT7tskprQ7XSmkWkuRzIQB2RVx/mYL9pkr8THWYwk2f6tFKHSaqDsmqUhXJKqsYGSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKK6/V2n; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKK6/V2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750180928; x=1781716928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUIHWcwQ+2Uhns9/SdysMEnfrHMc7KuSlfdnAOjmDy8=;
  b=dKK6/V2nTpP0q5ziYeAaHmghg6BW/+l9Xpjb3G0wHDgVE/X1z12c/Zrp
   CwC4v+4VqJL3jx+GdGx57jKQcZWO4A2SCa90hjzOeO+7mTNbt42KkM1kx
   A3s3WMM18P5Wg3i2wtmo4a1/C+bQtvkkd7bI2lGT1Jy9EE/duKjjI1Pka
   idwoOGI8KNH3IC1LcAsO9bTCYmczghh5xzX9rKl1hw7jdSky0bznuUSnH
   kbclVzjZz/LhkX4EuLdpuXqKgWpt52qTLMC9iiwiANK27epn1+PHwFBOh
   rIOks8ZIKdxoXSwanOZycpEB04GTH60jeNpqSWUs1lDmeyTnloQmsMuDY
   w==;
X-CSE-ConnectionGUID: PR5jdRkqQNyB+UbP6+wHCQ==
X-CSE-MsgGUID: GtuXoN6fSieyA6LLSD3olw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52243541"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52243541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 10:22:07 -0700
X-CSE-ConnectionGUID: GHwYgMV7TgKICL+IRz2jsA==
X-CSE-MsgGUID: 7MfE0jK5QeOeVRWtFgD3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148768428"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jun 2025 10:22:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRa0Z-000Hww-2a;
	Tue, 17 Jun 2025 17:22:03 +0000
Date: Wed, 18 Jun 2025 01:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] io_uring/io_uring.c:6135:31:
 warning: default initialization of an object of type 'typeof ((sqe->addr2))'
 (aka 'const unsigned long long') leaves the object uninitialized
Message-ID: <202506180108.sHHmbWdo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   06f12cdca15807c094c59de63e522974b3568f6c
commit: 3a1c153b965470d1225facb7f4a5cd30eb90241c [1/1] UPSTREAM: io_uring: move to separate directory
config: arm-randconfig-003-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180108.sHHmbWdo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180108.sHHmbWdo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180108.sHHmbWdo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/io_uring.c:1469:61: warning: parameter 'locked' set but not used [-Wunused-but-set-parameter]
    1469 | static void io_queue_async_work(struct io_kiocb *req, bool *locked)
         |                                                             ^
>> io_uring/io_uring.c:6135:31: warning: default initialization of an object of type 'typeof ((sqe->addr2))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    6135 |                 if (get_timespec64(&tr->ts, u64_to_user_ptr(sqe->addr2)))
         |                                             ^
   include/linux/kernel.h:50:2: note: expanded from macro 'u64_to_user_ptr'
      50 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> io_uring/io_uring.c:6216:32: warning: default initialization of an object of type 'typeof ((sqe->addr))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    6216 |         if (get_timespec64(&data->ts, u64_to_user_ptr(sqe->addr)))
         |                                       ^
   include/linux/kernel.h:50:2: note: expanded from macro 'u64_to_user_ptr'
      50 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   3 warnings generated.


vim +6135 io_uring/io_uring.c

47f467686ec02f fs/io_uring.c Jens Axboe     2019-11-09  6112  
3529d8c2b353e6 fs/io_uring.c Jens Axboe     2019-12-19  6113  static int io_timeout_remove_prep(struct io_kiocb *req,
3529d8c2b353e6 fs/io_uring.c Jens Axboe     2019-12-19  6114  				  const struct io_uring_sqe *sqe)
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6115  {
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6116  	struct io_timeout_rem *tr = &req->timeout_rem;
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6117  
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6118  	if (unlikely(req->ctx->flags & IORING_SETUP_IOPOLL))
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6119  		return -EINVAL;
61710e437f2807 fs/io_uring.c Daniele Albano 2020-07-18  6120  	if (unlikely(req->flags & (REQ_F_FIXED_FILE | REQ_F_BUFFER_SELECT)))
61710e437f2807 fs/io_uring.c Daniele Albano 2020-07-18  6121  		return -EINVAL;
26578cda3db983 fs/io_uring.c Pavel Begunkov 2021-08-20  6122  	if (sqe->ioprio || sqe->buf_index || sqe->len || sqe->splice_fd_in)
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6123  		return -EINVAL;
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6124  
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6125  	tr->ltimeout = false;
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6126  	tr->addr = READ_ONCE(sqe->addr);
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6127  	tr->flags = READ_ONCE(sqe->timeout_flags);
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6128  	if (tr->flags & IORING_TIMEOUT_UPDATE_MASK) {
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6129  		if (hweight32(tr->flags & IORING_TIMEOUT_CLOCK_MASK) > 1)
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6130  			return -EINVAL;
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6131  		if (tr->flags & IORING_LINK_TIMEOUT_UPDATE)
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6132  			tr->ltimeout = true;
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6133  		if (tr->flags & ~(IORING_TIMEOUT_UPDATE_MASK|IORING_TIMEOUT_ABS))
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6134  			return -EINVAL;
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30 @6135  		if (get_timespec64(&tr->ts, u64_to_user_ptr(sqe->addr2)))
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6136  			return -EFAULT;
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6137  	} else if (tr->flags) {
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6138  		/* timeout removal doesn't support flags */
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6139  		return -EINVAL;
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6140  	}
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6141  
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6142  	return 0;
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6143  }
b29472ee7b5378 fs/io_uring.c Jens Axboe     2019-12-17  6144  
8662daec09edcd fs/io_uring.c Pavel Begunkov 2021-01-19  6145  static inline enum hrtimer_mode io_translate_timeout_mode(unsigned int flags)
8662daec09edcd fs/io_uring.c Pavel Begunkov 2021-01-19  6146  {
8662daec09edcd fs/io_uring.c Pavel Begunkov 2021-01-19  6147  	return (flags & IORING_TIMEOUT_ABS) ? HRTIMER_MODE_ABS
8662daec09edcd fs/io_uring.c Pavel Begunkov 2021-01-19  6148  					    : HRTIMER_MODE_REL;
8662daec09edcd fs/io_uring.c Pavel Begunkov 2021-01-19  6149  }
8662daec09edcd fs/io_uring.c Pavel Begunkov 2021-01-19  6150  
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6151  /*
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6152   * Remove or update an existing timeout command
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6153   */
61e98203047983 fs/io_uring.c Pavel Begunkov 2021-02-10  6154  static int io_timeout_remove(struct io_kiocb *req, unsigned int issue_flags)
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6155  {
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6156  	struct io_timeout_rem *tr = &req->timeout_rem;
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6157  	struct io_ring_ctx *ctx = req->ctx;
47f467686ec02f fs/io_uring.c Jens Axboe     2019-11-09  6158  	int ret;
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6159  
ec3c3d0f3a271b fs/io_uring.c Pavel Begunkov 2021-08-18  6160  	if (!(req->timeout_rem.flags & IORING_TIMEOUT_UPDATE)) {
ec3c3d0f3a271b fs/io_uring.c Pavel Begunkov 2021-08-18  6161  		spin_lock(&ctx->completion_lock);
89850fce16a1a7 fs/io_uring.c Jens Axboe     2021-08-10  6162  		spin_lock_irq(&ctx->timeout_lock);
9c8e11b36c9b64 fs/io_uring.c Pavel Begunkov 2020-11-30  6163  		ret = io_timeout_cancel(ctx, tr->addr);
ec3c3d0f3a271b fs/io_uring.c Pavel Begunkov 2021-08-18  6164  		spin_unlock_irq(&ctx->timeout_lock);
ec3c3d0f3a271b fs/io_uring.c Pavel Begunkov 2021-08-18  6165  		spin_unlock(&ctx->completion_lock);
ec3c3d0f3a271b fs/io_uring.c Pavel Begunkov 2021-08-18  6166  	} else {
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6167  		enum hrtimer_mode mode = io_translate_timeout_mode(tr->flags);
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6168  
ec3c3d0f3a271b fs/io_uring.c Pavel Begunkov 2021-08-18  6169  		spin_lock_irq(&ctx->timeout_lock);
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6170  		if (tr->ltimeout)
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6171  			ret = io_linked_timeout_update(ctx, tr->addr, &tr->ts, mode);
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6172  		else
f1042b6ccb887f fs/io_uring.c Pavel Begunkov 2021-08-28  6173  			ret = io_timeout_update(ctx, tr->addr, &tr->ts, mode);
89850fce16a1a7 fs/io_uring.c Jens Axboe     2021-08-10  6174  		spin_unlock_irq(&ctx->timeout_lock);
ec3c3d0f3a271b fs/io_uring.c Pavel Begunkov 2021-08-18  6175  	}
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6176  
4e88d6e7793f2f fs/io_uring.c Jens Axboe     2019-12-07  6177  	if (ret < 0)
93d2bcd2cbfed2 fs/io_uring.c Pavel Begunkov 2021-05-16  6178  		req_set_fail(req);
505657bc6c52b0 fs/io_uring.c Pavel Begunkov 2021-08-17  6179  	io_req_complete_post(req, ret, 0);
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6180  	return 0;
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6181  }
11365043e5271f fs/io_uring.c Jens Axboe     2019-10-16  6182  
3529d8c2b353e6 fs/io_uring.c Jens Axboe     2019-12-19  6183  static int io_timeout_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe,
2d28390aff8792 fs/io_uring.c Jens Axboe     2019-12-04  6184  			   bool is_timeout_link)
5262f567987d3c fs/io_uring.c Jens Axboe     2019-09-17  6185  {
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15  6186  	struct io_timeout_data *data;
a41525ab2e7598 fs/io_uring.c Jens Axboe     2019-10-15  6187  	unsigned flags;
56080b02ed6e71 fs/io_uring.c Pavel Begunkov 2020-05-26  6188  	u32 off = READ_ONCE(sqe->off);
5262f567987d3c fs/io_uring.c Jens Axboe     2019-09-17  6189  
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15  6190  	if (unlikely(req->ctx->flags & IORING_SETUP_IOPOLL))
5262f567987d3c fs/io_uring.c Jens Axboe     2019-09-17  6191  		return -EINVAL;
26578cda3db983 fs/io_uring.c Pavel Begunkov 2021-08-20  6192  	if (sqe->ioprio || sqe->buf_index || sqe->len != 1 ||
26578cda3db983 fs/io_uring.c Pavel Begunkov 2021-08-20  6193  	    sqe->splice_fd_in)
a41525ab2e7598 fs/io_uring.c Jens Axboe     2019-10-15  6194  		return -EINVAL;
56080b02ed6e71 fs/io_uring.c Pavel Begunkov 2020-05-26  6195  	if (off && is_timeout_link)
2d28390aff8792 fs/io_uring.c Jens Axboe     2019-12-04  6196  		return -EINVAL;
a41525ab2e7598 fs/io_uring.c Jens Axboe     2019-10-15  6197  	flags = READ_ONCE(sqe->timeout_flags);
50c1df2b56e0f5 fs/io_uring.c Jens Axboe     2021-08-27  6198  	if (flags & ~(IORING_TIMEOUT_ABS | IORING_TIMEOUT_CLOCK_MASK))
50c1df2b56e0f5 fs/io_uring.c Jens Axboe     2021-08-27  6199  		return -EINVAL;
50c1df2b56e0f5 fs/io_uring.c Jens Axboe     2021-08-27  6200  	/* more than one clock specified is invalid, obviously */
50c1df2b56e0f5 fs/io_uring.c Jens Axboe     2021-08-27  6201  	if (hweight32(flags & IORING_TIMEOUT_CLOCK_MASK) > 1)
5262f567987d3c fs/io_uring.c Jens Axboe     2019-09-17  6202  		return -EINVAL;
bdf200731145f0 fs/io_uring.c Arnd Bergmann  2019-10-01  6203  
ef9dd637084d43 fs/io_uring.c Pavel Begunkov 2021-08-28  6204  	INIT_LIST_HEAD(&req->timeout.list);
bfe68a221905de fs/io_uring.c Pavel Begunkov 2020-05-30  6205  	req->timeout.off = off;
f18ee4cf0a277a fs/io_uring.c Pavel Begunkov 2021-06-14  6206  	if (unlikely(off && !req->ctx->off_timeout_used))
f18ee4cf0a277a fs/io_uring.c Pavel Begunkov 2021-06-14  6207  		req->ctx->off_timeout_used = true;
26a61679f10c6f fs/io_uring.c Jens Axboe     2019-12-20  6208  
e8c2bc1fb6c949 fs/io_uring.c Jens Axboe     2020-08-15  6209  	if (!req->async_data && io_alloc_async_data(req))
26a61679f10c6f fs/io_uring.c Jens Axboe     2019-12-20  6210  		return -ENOMEM;
26a61679f10c6f fs/io_uring.c Jens Axboe     2019-12-20  6211  
e8c2bc1fb6c949 fs/io_uring.c Jens Axboe     2020-08-15  6212  	data = req->async_data;
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15  6213  	data->req = req;
50c1df2b56e0f5 fs/io_uring.c Jens Axboe     2021-08-27  6214  	data->flags = flags;
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15  6215  
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15 @6216  	if (get_timespec64(&data->ts, u64_to_user_ptr(sqe->addr)))
5262f567987d3c fs/io_uring.c Jens Axboe     2019-09-17  6217  		return -EFAULT;
5262f567987d3c fs/io_uring.c Jens Axboe     2019-09-17  6218  
ba7261af2b030a fs/io_uring.c Jens Axboe     2022-04-08  6219  	INIT_LIST_HEAD(&req->timeout.list);
8662daec09edcd fs/io_uring.c Pavel Begunkov 2021-01-19  6220  	data->mode = io_translate_timeout_mode(flags);
50c1df2b56e0f5 fs/io_uring.c Jens Axboe     2021-08-27  6221  	hrtimer_init(&data->timer, io_timeout_get_clock(data), data->mode);
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6222  
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6223  	if (is_timeout_link) {
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6224  		struct io_submit_link *link = &req->ctx->submit_state.link;
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6225  
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6226  		if (!link->head)
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6227  			return -EINVAL;
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6228  		if (link->last->opcode == IORING_OP_LINK_TIMEOUT)
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6229  			return -EINVAL;
4d13d1a4d1e180 fs/io_uring.c Pavel Begunkov 2021-08-15  6230  		req->timeout.head = link->last;
4d13d1a4d1e180 fs/io_uring.c Pavel Begunkov 2021-08-15  6231  		link->last->flags |= REQ_F_ARM_LTIMEOUT;
b97e736a4b553f fs/io_uring.c Pavel Begunkov 2021-08-15  6232  	}
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15  6233  	return 0;
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15  6234  }
ad8a48acc23cb1 fs/io_uring.c Jens Axboe     2019-11-15  6235  

:::::: The code at line 6135 was first introduced by commit
:::::: 9c8e11b36c9b640a85a4a33a9e9dff418993cc34 io_uring: add timeout update

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
