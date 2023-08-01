Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F46A32
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 02:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690855933; x=1722391933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w2KRhpOOnV41rVDe9MhZMtryqqi0gQAINXWdNE46deY=;
  b=njg+Ivuhg2fiLG3ru7AhdNbY9/xO0i2F8xHZgDZjkQ2ys6Uf75Y5ahMB
   sODkqnCBS0QmNLRsGwaseoXZJ+cgxgEQEVvjSAMxFySsarFxshhWyqYmQ
   8B9QAHir1JCVKaGHRnCxPKGBGLcvvigrxuuAR20p9F4zAK1IG53ocD+vn
   G50S+50K2lkP9xWh5CUnq807SVNOWzYPV9siCFj8td0Y91P1QCxVVsjqM
   zUXvGAHkj0i+fpAmQd6a2NVG1nQEyPsogFQWuwCDGPUcMiE+XkBeYivjT
   JRYh2jyLj2zTA/nDJcOT7kJKJDvvmwjv+pPWeCFTq+aDZxVAo0HfcucFN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349472396"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="349472396"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 19:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="1059196302"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="1059196302"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2023 19:12:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQerp-0005XB-1s;
	Tue, 01 Aug 2023 02:12:09 +0000
Date: Tue, 1 Aug 2023 10:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv3] io_uring: set plug tags for same file
Message-ID: <202308010928.aBAAqquT-lkp@intel.com>
References: <20230731203932.2083468-1-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731203932.2083468-1-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.5-rc4 next-20230731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/io_uring-set-plug-tags-for-same-file/20230801-044107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230731203932.2083468-1-kbusch%40meta.com
patch subject: [PATCHv3] io_uring: set plug tags for same file
config: openrisc-randconfig-r014-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010928.aBAAqquT-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010928.aBAAqquT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010928.aBAAqquT-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/io_uring.c: In function 'io_init_req':
>> io_uring/io_uring.c:2228:44: error: 'struct blk_plug' has no member named 'nr_ios'
    2228 |                                 state->plug.nr_ios++;
         |                                            ^


vim +2228 io_uring/io_uring.c

  2150	
  2151	static int io_init_req(struct io_ring_ctx *ctx, struct io_kiocb *req,
  2152			       const struct io_uring_sqe *sqe)
  2153		__must_hold(&ctx->uring_lock)
  2154	{
  2155		const struct io_issue_def *def;
  2156		unsigned int sqe_flags;
  2157		int personality;
  2158		u8 opcode;
  2159	
  2160		/* req is partially pre-initialised, see io_preinit_req() */
  2161		req->opcode = opcode = READ_ONCE(sqe->opcode);
  2162		/* same numerical values with corresponding REQ_F_*, safe to copy */
  2163		req->flags = sqe_flags = READ_ONCE(sqe->flags);
  2164		req->cqe.user_data = READ_ONCE(sqe->user_data);
  2165		req->file = NULL;
  2166		req->rsrc_node = NULL;
  2167		req->task = current;
  2168	
  2169		if (unlikely(opcode >= IORING_OP_LAST)) {
  2170			req->opcode = 0;
  2171			return -EINVAL;
  2172		}
  2173		def = &io_issue_defs[opcode];
  2174		if (unlikely(sqe_flags & ~SQE_COMMON_FLAGS)) {
  2175			/* enforce forwards compatibility on users */
  2176			if (sqe_flags & ~SQE_VALID_FLAGS)
  2177				return -EINVAL;
  2178			if (sqe_flags & IOSQE_BUFFER_SELECT) {
  2179				if (!def->buffer_select)
  2180					return -EOPNOTSUPP;
  2181				req->buf_index = READ_ONCE(sqe->buf_group);
  2182			}
  2183			if (sqe_flags & IOSQE_CQE_SKIP_SUCCESS)
  2184				ctx->drain_disabled = true;
  2185			if (sqe_flags & IOSQE_IO_DRAIN) {
  2186				if (ctx->drain_disabled)
  2187					return -EOPNOTSUPP;
  2188				io_init_req_drain(req);
  2189			}
  2190		}
  2191		if (unlikely(ctx->restricted || ctx->drain_active || ctx->drain_next)) {
  2192			if (ctx->restricted && !io_check_restriction(ctx, req, sqe_flags))
  2193				return -EACCES;
  2194			/* knock it to the slow queue path, will be drained there */
  2195			if (ctx->drain_active)
  2196				req->flags |= REQ_F_FORCE_ASYNC;
  2197			/* if there is no link, we're at "next" request and need to drain */
  2198			if (unlikely(ctx->drain_next) && !ctx->submit_state.link.head) {
  2199				ctx->drain_next = false;
  2200				ctx->drain_active = true;
  2201				req->flags |= REQ_F_IO_DRAIN | REQ_F_FORCE_ASYNC;
  2202			}
  2203		}
  2204	
  2205		if (!def->ioprio && sqe->ioprio)
  2206			return -EINVAL;
  2207		if (!def->iopoll && (ctx->flags & IORING_SETUP_IOPOLL))
  2208			return -EINVAL;
  2209	
  2210		if (def->needs_file) {
  2211			req->cqe.fd = READ_ONCE(sqe->fd);
  2212	
  2213			/*
  2214			 * Plug now if we have more than 2 IO left after this, and the
  2215			 * target is potentially a read/write to block based storage.
  2216			 */
  2217		        if (def->plug) {
  2218				struct io_submit_state *state = &ctx->submit_state;
  2219	
  2220				if (state->need_plug) {
  2221				        state->plug_started = true;
  2222				        state->need_plug = false;
  2223				        state->fd = req->cqe.fd;
  2224				        blk_start_plug(&state->plug);
  2225				} else if (state->plug_started &&
  2226				           state->fd == req->cqe.fd &&
  2227				           !state->link.head) {
> 2228				        state->plug.nr_ios++;
  2229				}
  2230			}
  2231		}
  2232	
  2233		personality = READ_ONCE(sqe->personality);
  2234		if (personality) {
  2235			int ret;
  2236	
  2237			req->creds = xa_load(&ctx->personalities, personality);
  2238			if (!req->creds)
  2239				return -EINVAL;
  2240			get_cred(req->creds);
  2241			ret = security_uring_override_creds(req->creds);
  2242			if (ret) {
  2243				put_cred(req->creds);
  2244				return ret;
  2245			}
  2246			req->flags |= REQ_F_CREDS;
  2247		}
  2248	
  2249		return def->prep(req, sqe);
  2250	}
  2251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
