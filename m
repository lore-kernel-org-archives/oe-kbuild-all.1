Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173EC2EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 23:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739747529; cv=none; b=cpU3rPXDyFJStWu7MA6TWGkIVLgXPwbfo+L24OG1M5v4GnE86N+EWfJqdzTS6H6gFWPlW83YBMd7exoJDAut/KUCqh/gRMLA81T1NGOpeokhzL9s8zJQDwbbTLPy1M9zJQUmCQauRvs5FWsGb6IIFUk9Yu4OObpkUp/DRqdecz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739747529; c=relaxed/simple;
	bh=ZSCIPxtSrjKVqruSe0104gnvkV/cNclVdK9zZmqMMk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNmxLdqEOOcjQM1kDiY0fhOnhiPRRSctV9VtW9sbAZaXGl1AQFGnADLpbjPjQzYJhtTdCoMDgtgkGzkcGsRDwV0EL6ssZrQ87SZF9nqRcFMTlYCFWhFxplhSDLE0FNYw0xlFyXsQ+4x5zQAJTDm3wJzd6ZfEd5roJC4hlHsMWqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEKErfEK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEKErfEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739747527; x=1771283527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZSCIPxtSrjKVqruSe0104gnvkV/cNclVdK9zZmqMMk4=;
  b=VEKErfEKLy4DpAnoRIdFgsweG6NzYJsYMH28jZYKLzXazvJGhUYBTJjm
   6ntDPmHZqb8OcvzsHlG4vZ5Qe1ENeHtXPdo4r0d1GylR7Q+dk+fReJho4
   cL/H1vTTqw+/n/QAYUA7BrPNs+YneZGmDXJ8i4Sb04nLeNPUEfBBqEUHv
   jIMOfyomgI6TG6Fol7LCUsOmRuVr/Dr/cjU4FOi7z8gisU2gjOQvTVsJR
   bYoDZvqagEi315jyL5Px/A84KtRoefavBvofKyPAflUESmdcn0734QAYK
   6rhx1UJvBU/U7Tsaj56WXKU31hdnG/WxqiRntXVnPwiI3Wz8SQSGaJjaH
   g==;
X-CSE-ConnectionGUID: evxsPvJMQHi3oLcak9Jigw==
X-CSE-MsgGUID: kult5MNlQcimhQu/2WWL1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="62893537"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="62893537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 15:12:07 -0800
X-CSE-ConnectionGUID: Si5tKxA+Qq64HQNul5I2SA==
X-CSE-MsgGUID: qWfVPNmmQranVH22PsFMQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119180485"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Feb 2025 15:12:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjnnv-001CMR-0c;
	Sun, 16 Feb 2025 23:12:03 +0000
Date: Mon, 17 Feb 2025 07:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [v2 PATCH 11/11] fsverity: improve performance by using
 multibuffer hashing
Message-ID: <202502170602.fE0D9Q0c-lkp@intel.com>
References: <dd11ea3e7231fb46f68d902ba38a5b688e378bfe.1739674648.1.git.herbert@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd11ea3e7231fb46f68d902ba38a5b688e378bfe.1739674648.1.git.herbert@gondor.apana.org.au>

Hi Herbert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20250214]
[cannot apply to herbert-crypto-2.6/master brauner-vfs/vfs.all linus/master v6.14-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-ahash-Only-save-callback-and-data-in-ahash_save_req/20250216-150941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/dd11ea3e7231fb46f68d902ba38a5b688e378bfe.1739674648.1.git.herbert%40gondor.apana.org.au
patch subject: [v2 PATCH 11/11] fsverity: improve performance by using multibuffer hashing
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250217/202502170602.fE0D9Q0c-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170602.fE0D9Q0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170602.fE0D9Q0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/verity/verify.c: In function 'fsverity_verify_pending_blocks':
>> fs/verity/verify.c:346:1: warning: the frame size of 1148 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     346 | }
         | ^


vim +346 fs/verity/verify.c

   293	
   294	static bool
   295	fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
   296	{
   297		struct inode *inode = ctx->inode;
   298		struct fsverity_info *vi = ctx->vi;
   299		const struct merkle_tree_params *params = &vi->tree_params;
   300		SYNC_HASH_REQUESTS_ON_STACK(reqs, FS_VERITY_MAX_PENDING_DATA_BLOCKS, params->hash_alg->tfm);
   301		struct ahash_request *req;
   302		int i;
   303		int err;
   304	
   305		if (ctx->num_pending == 0)
   306			return true;
   307	
   308		req = sync_hash_requests(reqs, 0);
   309		for (i = 0; i < ctx->num_pending; i++) {
   310			struct ahash_request *reqi = sync_hash_requests(reqs, i);
   311	
   312			ahash_request_set_callback(reqi, CRYPTO_TFM_REQ_MAY_SLEEP,
   313						   NULL, NULL);
   314			ahash_request_set_virt(reqi, ctx->pending_blocks[i].data,
   315					       ctx->pending_blocks[i].real_hash,
   316					       params->block_size);
   317			if (i)
   318				ahash_request_chain(reqi, req);
   319			if (!params->hashstate)
   320				continue;
   321	
   322			err = crypto_ahash_import(reqi, params->hashstate);
   323			if (err) {
   324				fsverity_err(inode, "Error %d importing hash state", err);
   325				return false;
   326			}
   327		}
   328	
   329		if (params->hashstate)
   330			err = crypto_ahash_finup(req);
   331		else
   332			err = crypto_ahash_digest(req);
   333		if (err) {
   334			fsverity_err(inode, "Error %d computing block hashes", err);
   335			return false;
   336		}
   337	
   338		for (i = 0; i < ctx->num_pending; i++) {
   339			if (!verify_data_block(inode, vi, &ctx->pending_blocks[i],
   340					       ctx->max_ra_pages))
   341				return false;
   342		}
   343	
   344		fsverity_clear_pending_blocks(ctx);
   345		return true;
 > 346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
