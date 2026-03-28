Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781D313273
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774704458; cv=none; b=BEme0IqOBZ3X9Y/c1nNh9TxTzb9/3tHxV2fglB8ETNSFIg22unQuvIlAdypf5KBNVu72+N2eubHPKcdUOYI4PJK7uF2lEeX2A7R+l3e0YCDOQEaO4k2XUKzEqGRnivP+eLfgQkviU9Ps+jCt37WCmoE+30IOr7JO9Jvz1JCFF5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774704458; c=relaxed/simple;
	bh=wFwht3UodmCWKng401t/NeqCup6dz1d4tdkllqRLztk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsRNk9xKSyf7Q8JmSfLdeXHR9efd5ENLbyyFDkNAKlf/ecm9ZgPxO4lIhWaYmIt3RJI9/wk51cVPjJB7a0x1li5Rnjx5fN6oy/IooY+GqHirl8Je1UAzfRZx+kDyOVP78BOMVja5RavIysjPFgm4wWuAAR9XvBOKBPRPkMaxVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtvOulhg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtvOulhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774704457; x=1806240457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wFwht3UodmCWKng401t/NeqCup6dz1d4tdkllqRLztk=;
  b=HtvOulhgZ2DuOHS2f0vlB/JcF0phrJzdd+fDBN1qVF7lYcDjXPv2xA2a
   H/6RfJ/DfTbm9wasf60BCnM6tGey2ZVThqlIMzf6u83GP00wo9d+SJSE4
   Vni/a6/lYcuuRne598dCZ90lzaV6nT4klG1QL0lknFYu/SprVgQflNeJm
   MrnmL5s0eYAkVADOpWnV5RQkiDCmMiGqvBi1zI30uUfaMlg5rs+VU4ql3
   8R4xf4Cj1aZDNao7ZfVrokz11P37ZTJ8lpk29Tq8GEFBDDQK0O+d9khyl
   547YQhjKaL5F7GnChYf/DFyZZazD+zi0cGpbIuFJn3ECulkSMyWa10+s3
   g==;
X-CSE-ConnectionGUID: zfmimHIyRI2e/6+BbfW2xQ==
X-CSE-MsgGUID: /KNPA2aRQ2ejijfpQ+yD4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79663947"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="79663947"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 06:27:33 -0700
X-CSE-ConnectionGUID: j30cmdpLTsSAtre2i4LViQ==
X-CSE-MsgGUID: 3uP3iU8WQ9qFV7bE2nkTnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="256080282"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2026 06:27:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ThI-00000000BRh-1wwF;
	Sat, 28 Mar 2026 13:27:28 +0000
Date: Sat, 28 Mar 2026 21:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>, axboe@kernel.dk
Cc: oe-kbuild-all@lists.linux.dev, miklos@szeredi.hu, bschubert@ddn.com,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v1 7/9] fuse: add io-uring kernel-managed buffer ring
Message-ID: <202603282121.RW1CxOjh-lkp@intel.com>
References: <20260324224532.3733468-8-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324224532.3733468-8-joannelkoong@gmail.com>

Hi Joanne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/fuse-separate-next-request-fetching-from-sending-logic/20260328-142620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20260324224532.3733468-8-joannelkoong%40gmail.com
patch subject: [PATCH v1 7/9] fuse: add io-uring kernel-managed buffer ring
config: powerpc64-randconfig-002-20260328 (https://download.01.org/0day-ci/archive/20260328/202603282121.RW1CxOjh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603282121.RW1CxOjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603282121.RW1CxOjh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/dev_uring.c:8:
   fs/fuse/dev_uring_i.h:63:37: error: field 'payload_kvec' has incomplete type
      63 |                         struct kvec payload_kvec;
         |                                     ^~~~~~~~~~~~
   fs/fuse/dev_uring.c: In function 'fuse_uring_get_buf_ring_headers':
   fs/fuse/dev_uring.c:296:24: error: implicit declaration of function 'io_uring_registered_mem_region_get' [-Werror=implicit-function-declaration]
     296 |         mem_reg_addr = io_uring_registered_mem_region_get(cmd, &nr_pages,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/fuse/dev_uring.c:296:22: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     296 |         mem_reg_addr = io_uring_registered_mem_region_get(cmd, &nr_pages,
         |                      ^
   fs/fuse/dev_uring.c: In function 'fuse_uring_buf_ring_setup':
   fs/fuse/dev_uring.c:334:15: error: implicit declaration of function 'io_uring_buf_ring_pin'; did you mean 'fuse_uring_buf_ring_setup'? [-Werror=implicit-function-declaration]
     334 |         err = io_uring_buf_ring_pin(cmd, FUSE_URING_BUFRING_GROUP, issue_flags,
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               fuse_uring_buf_ring_setup
   fs/fuse/dev_uring.c:339:14: error: implicit declaration of function 'io_uring_is_kmbuf_ring' [-Werror=implicit-function-declaration]
     339 |         if (!io_uring_is_kmbuf_ring(cmd, FUSE_URING_BUFRING_GROUP, issue_flags))
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev_uring.c:349:9: error: implicit declaration of function 'io_uring_buf_ring_unpin'; did you mean 'fuse_uring_buf_ring_setup'? [-Werror=implicit-function-declaration]
     349 |         io_uring_buf_ring_unpin(cmd, FUSE_URING_BUFRING_GROUP, issue_flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         fuse_uring_buf_ring_setup
   fs/fuse/dev_uring.c: In function 'fuse_uring_select_buffer':
   fs/fuse/dev_uring.c:903:15: error: implicit declaration of function 'io_ring_buffer_select'; did you mean 'io_uring_cmd_buffer_select'? [-Werror=implicit-function-declaration]
     903 |         sel = io_ring_buffer_select(cmd_to_io_kiocb(ent->cmd), &len,
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               io_uring_cmd_buffer_select
   fs/fuse/dev_uring.c:903:15: error: incompatible types when assigning to type 'struct io_br_sel' from type 'int'
   fs/fuse/dev_uring.c:907:18: error: 'struct io_br_sel' has no member named 'kaddr'; did you mean 'addr'?
     907 |         if (!sel.kaddr)
         |                  ^~~~~
         |                  addr
   fs/fuse/dev_uring.c:910:42: error: 'struct io_br_sel' has no member named 'kaddr'; did you mean 'addr'?
     910 |         ent->payload_kvec.iov_base = sel.kaddr;
         |                                          ^~~~~
         |                                          addr
   fs/fuse/dev_uring.c:912:27: error: 'struct io_br_sel' has no member named 'buf_id'; did you mean 'buf_list'?
     912 |         ent->buf_id = sel.buf_id;
         |                           ^~~~~~
         |                           buf_list
   In file included from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/powerpc/include/asm/bitops.h:321,
                    from include/linux/bitops.h:67,
                    from include/linux/bitmap.h:8,
                    from include/linux/nodemask.h:91,
                    from include/linux/list_lru.h:12,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/fuse/fuse_i.h:17,
                    from fs/fuse/dev_uring.c:7:
   fs/fuse/dev_uring.c: In function 'fuse_uring_recycle_buffer':
   fs/fuse/dev_uring.c:928:22: error: implicit declaration of function 'io_uring_kmbuf_recycle' [-Werror=implicit-function-declaration]
     928 |         WARN_ON_ONCE(io_uring_kmbuf_recycle(ent->cmd, FUSE_URING_BUFRING_GROUP,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +296 fs/fuse/dev_uring.c

   285	
   286	static void *fuse_uring_get_buf_ring_headers(struct io_uring_cmd *cmd,
   287						     u64 headers_offset,
   288						     unsigned int queue_depth,
   289						     unsigned int issue_flags)
   290	{
   291		void *mem_reg_addr;
   292		u64 mem_reg_size, headers_size;
   293		unsigned nr_pages;
   294	
   295		/* find the headers in the registered memory region */
 > 296		mem_reg_addr = io_uring_registered_mem_region_get(cmd, &nr_pages,
   297								  issue_flags);
   298	
   299		/* server does not have a registered memory region set up */
   300		if (!mem_reg_addr)
   301			return NULL;
   302	
   303		mem_reg_size = (u64)nr_pages * PAGE_SIZE;
   304		if (headers_offset > mem_reg_size)
   305			return NULL;
   306	
   307		/* verify headers fit within memory region bounds */
   308		headers_size = (u64)queue_depth * sizeof(struct fuse_uring_req_header);
   309		if (mem_reg_size - headers_offset < headers_size)
   310			return NULL;
   311	
   312		return mem_reg_addr + headers_offset;
   313	}
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
