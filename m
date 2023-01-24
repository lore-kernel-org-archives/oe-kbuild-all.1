Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2527C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 01:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674523293; x=1706059293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ooYs9SEemHt7dBMAoSfbeu2Z56tJKsy9RG+wYDNngcw=;
  b=XokvhCBN5cjbrE3o6acHoIRtEP9x/6zhAQuS+LBDPzUA63qD9Uy+wKsK
   SM2IlIKVcqGsjBXPnPB3PEYWypyktH0RhBE2FGwwt27Q+gQY5JxI0YmQE
   EMfVeR0ea2hZkDI1GCSTkcA0iVUC1WB00bfP9KnivG7nKm3t9K4UF+Zz+
   M6Wq2GZPJvhqWmE11OuMzFLBW8a8lwISn0h0PcNV2BeWM/leflfCQTYxd
   7t0WrgFVEq8MESqHJyfG94BsJsiDkGPiS70ZF8auGwn+DAZFkHZNrbEl/
   l9U4C/mNgfacnujyK2v0uj6jBB6vElnkyfYtawP8IVMSPTZipv1UNHHhd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328293294"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="328293294"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 17:21:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785890719"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="785890719"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 17:21:30 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK809-00060W-2w;
	Tue, 24 Jan 2023 01:21:29 +0000
Date: Tue, 24 Jan 2023 09:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [ammarfaizi2-block:axboe/linux-block/for-6.3/io_uring 37/41]
 io_uring/io_uring.c:2373:8: warning: type qualifiers ignored on function
 return type
Message-ID: <202301240900.RL3QiHFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-6.3/io_uring
head:   73b62ca46fe7e10334f601643c2ccd4fca4a4874
commit: d5a6846a1c5fc7b864b63e90d136a3af6034e37c [37/41] io_uring: improve io_get_sqe
config: openrisc-randconfig-r023-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240900.RL3QiHFz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d5a6846a1c5fc7b864b63e90d136a3af6034e37c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/for-6.3/io_uring
        git checkout d5a6846a1c5fc7b864b63e90d136a3af6034e37c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   io_uring/io_uring.c: In function '__io_submit_flush_completions':
   io_uring/io_uring.c:1481:40: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    1481 |         struct io_wq_work_node *node, *prev;
         |                                        ^~~~
   io_uring/io_uring.c: At top level:
>> io_uring/io_uring.c:2373:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    2373 | static const bool io_get_sqe(struct io_ring_ctx *ctx, const struct io_uring_sqe **sqe)
         |        ^~~~~


vim +2373 io_uring/io_uring.c

  2364	
  2365	/*
  2366	 * Fetch an sqe, if one is available. Note this returns a pointer to memory
  2367	 * that is mapped by userspace. This means that care needs to be taken to
  2368	 * ensure that reads are stable, as we cannot rely on userspace always
  2369	 * being a good citizen. If members of the sqe are validated and then later
  2370	 * used, it's important that those reads are done through READ_ONCE() to
  2371	 * prevent a re-load down the line.
  2372	 */
> 2373	static const bool io_get_sqe(struct io_ring_ctx *ctx, const struct io_uring_sqe **sqe)
  2374	{
  2375		unsigned head, mask = ctx->sq_entries - 1;
  2376		unsigned sq_idx = ctx->cached_sq_head++ & mask;
  2377	
  2378		/*
  2379		 * The cached sq head (or cq tail) serves two purposes:
  2380		 *
  2381		 * 1) allows us to batch the cost of updating the user visible
  2382		 *    head updates.
  2383		 * 2) allows the kernel side to track the head on its own, even
  2384		 *    though the application is the one updating it.
  2385		 */
  2386		head = READ_ONCE(ctx->sq_array[sq_idx]);
  2387		if (likely(head < ctx->sq_entries)) {
  2388			/* double index for 128-byte SQEs, twice as long */
  2389			if (ctx->flags & IORING_SETUP_SQE128)
  2390				head <<= 1;
  2391			*sqe = &ctx->sq_sqes[head];
  2392			return true;
  2393		}
  2394	
  2395		/* drop invalid entries */
  2396		ctx->cq_extra--;
  2397		WRITE_ONCE(ctx->rings->sq_dropped,
  2398			   READ_ONCE(ctx->rings->sq_dropped) + 1);
  2399		return false;
  2400	}
  2401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
