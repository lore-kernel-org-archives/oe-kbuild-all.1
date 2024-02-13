Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC741626C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707863963; cv=none; b=jXTC6I7ed3Snatsy0/CVwmlU6m0aSWeKGyB7bYBLM8TcloXeLfBf3cF3qDn46w3PTRm1hx8ngKcdqFaFNslQWGesi8PT3EGg9d57N5qysZT/mdILgjaHe4YZEFSLeUQpgvW1ypdbgMxpeInlaM3gLbc/sEi183Y15Xo4/PvQXSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707863963; c=relaxed/simple;
	bh=02YRlFl6h8fd3rRO6W4eOJNM0NTBQWfU2Q80MgWMDc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ogIPTqlmTlBQ00zltS1m0eLv6neC6tDOBXZhy8QSX4kMMtcU3td1isuvAEq6TYozAzD5kZWAjdiIxVSIdab5AYTL1DlskXl8KEhYfwtdbIaQY+ORdUPeltd0xb/KPJEaLz6M8HGVg5+mknQOBNuuXsz6id7s7MgYVR0zLKm5t4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZvqw657; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZvqw657"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707863961; x=1739399961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02YRlFl6h8fd3rRO6W4eOJNM0NTBQWfU2Q80MgWMDc4=;
  b=iZvqw657zBefwE9cpSKLlgUMxEr5Ftyfl++ofgcxLdZOtTzCxDB5PXVP
   edgnLxoBOMB5GTZPQyHzSOikor9duZxjz73EoeurvLs4E/FbC933FU6ki
   His/OOJ2zy5iaIAoPe2ic3nGv11Fsh7HHtN3+1PWnZBrB+8530t+af6AJ
   7z58NCCnhp/6Ooq34ppmEyH/Ya1bnkT+yXfICHWdNin305P7g3oFXHqQD
   0HKsWM5hBpo83UB0l1rAj1U0O75HCCLhiXfC6WhpcW/n6xQdPf6/6XPu/
   2dzYjVjlMEONVHYjclf6vqbyBKQV3NZ6ZCY3w4WxVCkTy2711yOnmSmQc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12984952"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="12984952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 14:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7594148"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2024 14:39:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra1Qq-00087g-2L;
	Tue, 13 Feb 2024 22:39:16 +0000
Date: Wed, 14 Feb 2024 06:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4835/6424] io_uring/io_uring.c:2175:23: sparse:
 sparse: cast to restricted io_req_flags_t
Message-ID: <202402140601.uNW0oVSb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46d4e2eb58e14c8935fa0e27d16d4c62ef82849a
commit: 4bcb982cce74e18155fba0d97394ca9634e0d8f0 [4835/6424] io_uring: expand main struct io_kiocb flags to 64-bits
config: x86_64-randconfig-123-20240213 (https://download.01.org/0day-ci/archive/20240214/202402140601.uNW0oVSb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140601.uNW0oVSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140601.uNW0oVSb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:341:48: sparse: sparse: array of flexible structures
   include/linux/io_uring_types.h:182:37: sparse: sparse: array of flexible structures
>> io_uring/io_uring.c:2175:23: sparse: sparse: cast to restricted io_req_flags_t
   io_uring/io_uring.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/io_uring.c:656:36: sparse: sparse: context imbalance in 'io_fill_cqe_req_aux' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/io_uring.c:658:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +2175 io_uring/io_uring.c

  2161	
  2162	static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
  2163			       const struct io_uring_sqe *sqe)
  2164		__must_hold(&ctx->uring_lock)
  2165	{
  2166		const struct io_issue_def *def;
  2167		unsigned int sqe_flags;
  2168		int personality;
  2169		u8 opcode;
  2170	
  2171		/* req is partially pre-initialised, see io_preinit_req() */
  2172		req->opcode = opcode = READ_ONCE(sqe->opcode);
  2173		/* same numerical values with corresponding REQ_F_*, safe to copy */
  2174		sqe_flags = READ_ONCE(sqe->flags);
> 2175		req->flags = (io_req_flags_t) sqe_flags;
  2176		req->cqe.user_data = READ_ONCE(sqe->user_data);
  2177		req->file = NULL;
  2178		req->rsrc_node = NULL;
  2179		req->task = current;
  2180	
  2181		if (unlikely(opcode >= IORING_OP_LAST)) {
  2182			req->opcode = 0;
  2183			return -EINVAL;
  2184		}
  2185		def = &io_issue_defs[opcode];
  2186		if (unlikely(sqe_flags & ~SQE_COMMON_FLAGS)) {
  2187			/* enforce forwards compatibility on users */
  2188			if (sqe_flags & ~SQE_VALID_FLAGS)
  2189				return -EINVAL;
  2190			if (sqe_flags & IOSQE_BUFFER_SELECT) {
  2191				if (!def->buffer_select)
  2192					return -EOPNOTSUPP;
  2193				req->buf_index = READ_ONCE(sqe->buf_group);
  2194			}
  2195			if (sqe_flags & IOSQE_CQE_SKIP_SUCCESS)
  2196				ctx->drain_disabled = true;
  2197			if (sqe_flags & IOSQE_IO_DRAIN) {
  2198				if (ctx->drain_disabled)
  2199					return -EOPNOTSUPP;
  2200				io_init_req_drain(req);
  2201			}
  2202		}
  2203		if (unlikely(ctx->restricted || ctx->drain_active || ctx->drain_next)) {
  2204			if (ctx->restricted && !io_check_restriction(ctx, req, sqe_flags))
  2205				return -EACCES;
  2206			/* knock it to the slow queue path, will be drained there */
  2207			if (ctx->drain_active)
  2208				req->flags |= REQ_F_FORCE_ASYNC;
  2209			/* if there is no link, we're at "next" request and need to drain */
  2210			if (unlikely(ctx->drain_next) && !ctx->submit_state.link.head) {
  2211				ctx->drain_next = false;
  2212				ctx->drain_active = true;
  2213				req->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
  2214			}
  2215		}
  2216	
  2217		if (!def->ioprio && sqe->ioprio)
  2218			return -EINVAL;
  2219		if (!def->iopoll && (ctx->flags & IORING_SETUP_IOPOLL))
  2220			return -EINVAL;
  2221	
  2222		if (def->needs_file) {
  2223			struct io_submit_state *state = &ctx->submit_state;
  2224	
  2225			req->cqe.fd = READ_ONCE(sqe->fd);
  2226	
  2227			/*
  2228			 * Plug now if we have more than 2 IO left after this, and the
  2229			 * target is potentially a read/write to block based storage.
  2230			 */
  2231			if (state->need_plug && def->plug) {
  2232				state->plug_started = true;
  2233				state->need_plug = false;
  2234				blk_start_plug_nr_ios(&state->plug, state->submit_nr);
  2235			}
  2236		}
  2237	
  2238		personality = READ_ONCE(sqe->personality);
  2239		if (personality) {
  2240			int ret;
  2241	
  2242			req->creds = xa_load(&ctx->personalities, personality);
  2243			if (!req->creds)
  2244				return -EINVAL;
  2245			get_cred(req->creds);
  2246			ret = security_uring_override_creds(req->creds);
  2247			if (ret) {
  2248				put_cred(req->creds);
  2249				return ret;
  2250			}
  2251			req->flags |= REQ_F_CREDS;
  2252		}
  2253	
  2254		return def->prep(req, sqe);
  2255	}
  2256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
