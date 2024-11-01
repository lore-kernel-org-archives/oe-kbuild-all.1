Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135A11A08A8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476549; cv=none; b=IiTJryf7/R1WVVtmRnt79qXjzaGYYmx2bcsBjMGpiqRgbg3PiIQ24cC6sktrIl4Cq6bWgUuFRotkBV/haiNYdN64qvaPCCsQgsqTFc/chsQqYSSMCI/J2+GuDUculbK52BJGCVC731PKt0sGsimTc84iDGINvwDGzfD24jbZ5dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476549; c=relaxed/simple;
	bh=RfX/Pq9Kv4ZZFqWq9W00vQCYJZlADBv+/bY1R9a2Uz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6R578XH9WsV93yYyhglqS/qy+zMOFPoD1wcxcYTuuf4aD9YtYj7Bfgip9T9Nc+/1mZD7lqzcfrrMcQDs3OGYOS3T4RdMs5FmgcgudaPhoETzX7gFtEIxBP+uefqIuN+iRJ4HZ2opU0ZuZRwfqOPCagr5Q/mWRyhTSPiuhMfkPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO3aGwmz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO3aGwmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730476547; x=1762012547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RfX/Pq9Kv4ZZFqWq9W00vQCYJZlADBv+/bY1R9a2Uz4=;
  b=hO3aGwmzc4rC5rfqFQNOM/dspv0ohN/PwIkwIW45VgpK+5JgFJOOJY54
   c7DVnHiSm5bDlnIWaRHTmZUugt1i667X3O4KbH5weGHB7RJvCzyfejWVo
   +y8lO24ZzKSGreomPhP1mz2bYPTltJ1gONjIaauZXoHqhzG+9HSuK59bu
   xf2AWtKaFOjzn+oTUooBlnk+l5CwFgJ/j67V+OoQoVXulu4REUMtu/jBh
   EK3e3ulR6XT31ksFtb29Mm8MwRGfW04i5sArtN60pwMoM+/WiPdSWPj/W
   DqPbHNt3CKFIEZ/oFxv4ZUdlsYReJsW4BVSGwjZL0mCemQLmDjYV/sP/u
   Q==;
X-CSE-ConnectionGUID: BXKH1BeUTUWj5j8FTTvgzw==
X-CSE-MsgGUID: xjTrm/gtQhS6MFkVrgEHZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30355454"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="30355454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 08:55:47 -0700
X-CSE-ConnectionGUID: pp7q0RoVRPuvIAt2+sUamA==
X-CSE-MsgGUID: vNi3foNbQeSZyZWDenSrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="106335116"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2024 08:55:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6tzz-000hj7-0t;
	Fri, 01 Nov 2024 15:55:43 +0000
Date: Fri, 1 Nov 2024 23:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-group 59/60] io_uring/io_uring.c:2036:25:
 sparse: sparse: restricted io_req_flags_t degrades to integer
Message-ID: <202411012311.7tUtERay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-group
head:   208960febed8e8a2deaadfc0135e934373b16532
commit: 3f048388f63bf3e751c0eca2a55db050c558da61 [59/60] io_uring: extend io_uring_sqe flags bits
config: x86_64-randconfig-123-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012311.7tUtERay-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012311.7tUtERay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012311.7tUtERay-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:182:37: sparse: sparse: array of flexible structures
>> io_uring/io_uring.c:2036:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:598:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:600:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block

vim +2036 io_uring/io_uring.c

  2022	
  2023	static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
  2024			       const struct io_uring_sqe *sqe)
  2025		__must_hold(&ctx->uring_lock)
  2026	{
  2027		const struct io_issue_def *def;
  2028		unsigned int sqe_flags;
  2029		int personality;
  2030		u8 opcode;
  2031	
  2032		/* req is partially pre-initialised, see io_preinit_req() */
  2033		req->opcode = opcode = READ_ONCE(sqe->opcode);
  2034		/* same numerical values with corresponding REQ_F_*, safe to copy */
  2035		sqe_flags = READ_ONCE(sqe->flags);
> 2036		if (sqe_flags & REQ_F_FLAGS2)
  2037			sqe_flags |= (__u32) READ_ONCE(sqe->flags2) << 8;
  2038		req->flags = (__force io_req_flags_t) sqe_flags;
  2039		req->cqe.user_data = READ_ONCE(sqe->user_data);
  2040		req->file = NULL;
  2041		req->task = current;
  2042		req->cancel_seq_set = false;
  2043	
  2044		if (unlikely(opcode >= IORING_OP_LAST)) {
  2045			req->opcode = 0;
  2046			return io_init_fail_req(req, -EINVAL);
  2047		}
  2048		def = &io_issue_defs[opcode];
  2049		if (unlikely(sqe_flags & ~SQE_COMMON_FLAGS)) {
  2050			/* enforce forwards compatibility on users */
  2051			if (sqe_flags & ~SQE_VALID_FLAGS)
  2052				return io_init_fail_req(req, -EINVAL);
  2053			if (sqe_flags & IOSQE_BUFFER_SELECT) {
  2054				if (!def->buffer_select)
  2055					return io_init_fail_req(req, -EOPNOTSUPP);
  2056				req->buf_index = READ_ONCE(sqe->buf_group);
  2057			}
  2058			if (sqe_flags & IOSQE_CQE_SKIP_SUCCESS)
  2059				ctx->drain_disabled = true;
  2060			if (sqe_flags & IOSQE_IO_DRAIN) {
  2061				if (ctx->drain_disabled)
  2062					return io_init_fail_req(req, -EOPNOTSUPP);
  2063				io_init_req_drain(req);
  2064			}
  2065		}
  2066		if (unlikely(ctx->restricted || ctx->drain_active || ctx->drain_next)) {
  2067			if (ctx->restricted && !io_check_restriction(ctx, req, sqe_flags))
  2068				return io_init_fail_req(req, -EACCES);
  2069			/* knock it to the slow queue path, will be drained there */
  2070			if (ctx->drain_active)
  2071				req->flags |= REQ_F_FORCE_ASYNC;
  2072			/* if there is no link, we're at "next" request and need to drain */
  2073			if (unlikely(ctx->drain_next) && !ctx->submit_state.link.head) {
  2074				ctx->drain_next = false;
  2075				ctx->drain_active = true;
  2076				req->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
  2077			}
  2078		}
  2079	
  2080		if (!def->ioprio && sqe->ioprio)
  2081			return io_init_fail_req(req, -EINVAL);
  2082		if (!def->iopoll && (ctx->flags & IORING_SETUP_IOPOLL))
  2083			return io_init_fail_req(req, -EINVAL);
  2084	
  2085		if (def->needs_file) {
  2086			struct io_submit_state *state = &ctx->submit_state;
  2087	
  2088			req->cqe.fd = READ_ONCE(sqe->fd);
  2089	
  2090			/*
  2091			 * Plug now if we have more than 2 IO left after this, and the
  2092			 * target is potentially a read/write to block based storage.
  2093			 */
  2094			if (state->need_plug && def->plug) {
  2095				state->plug_started = true;
  2096				state->need_plug = false;
  2097				blk_start_plug_nr_ios(&state->plug, state->submit_nr);
  2098			}
  2099		}
  2100	
  2101		personality = 0;
  2102		if (req->flags & REQ_F_PERSONALITY)
  2103			personality = READ_ONCE(sqe->personality2);
  2104		else if (!(req->flags & REQ_F_FLAGS2))
  2105			personality = READ_ONCE(sqe->personality);
  2106		if (unlikely(personality)) {
  2107			int ret;
  2108	
  2109			req->creds = xa_load(&ctx->personalities, personality);
  2110			if (!req->creds)
  2111				return io_init_fail_req(req, -EINVAL);
  2112			get_cred(req->creds);
  2113			ret = security_uring_override_creds(req->creds);
  2114			if (ret) {
  2115				put_cred(req->creds);
  2116				return io_init_fail_req(req, ret);
  2117			}
  2118			req->flags |= REQ_F_CREDS;
  2119		}
  2120	
  2121		return def->prep(req, sqe);
  2122	}
  2123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
