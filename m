Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1642F872
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 00:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762647974; cv=none; b=lQwZpfb3aWaDQDDDDbRdI9fq5LZlOF6h2cjzu8TX/pTpLF5Rcnhr0W5UmISEXx1XIZynxPEK5Ot3HJZZJFaBfBLjfgSxoPeIiTJIFsNEuSGqPWOz+G5euWb0s74MlzVyyKalbuXBsLGmG6QiqvCqzFigXomLKozzg/c1mt7eaJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762647974; c=relaxed/simple;
	bh=MVJnPVgSQkWwppwBds6FLZADEB2rVIKq+FpTeepExwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBvID15MDkWPpEYy8bXCq1+Ggfvi2w9QHh6de9R8Zn5dzEstsP/h3S9FvvgMRKgcJ687oYaP9gWDizVHyRBZJhSGov4a/4+6ipIyWKeSXbQiB8+v1+3/K5wpmZJBjcr4TLxZzE5NJj3+Ur/8xZvqA2ZlK2pnEaQUIs1dM0Jakus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWxF1qE2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWxF1qE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762647972; x=1794183972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MVJnPVgSQkWwppwBds6FLZADEB2rVIKq+FpTeepExwM=;
  b=BWxF1qE2C4wwjXn2XH8koGNjQSYxkXzgV7mhslpSHPmLJwGGdEU5NFT6
   QSvjS0qQcZFG+iaz+o6Hl1K3j0obQZjOTGV3JXXMbP9tDRuNQDHjy94AL
   5IxmudA97y2D6ztQZkaUtsKGVg/sJk06vQjSFh4RtfaI5dJi0gonGpiPS
   3/n66ng04xUUPynMu9uDmAB2dnICObF43aQYj5ugArgEvP/fk9wjLDLIZ
   m1TGGktBGxNLCZytQsdsGXR48l36VxVXAakHuii8kJC2Rnw3GDNi/u2m/
   AEQaNpR0uK6a9Tcyk7qvyGL9WZLAjw5GP58IYhFfxZJ9uwNwvUwpaA7lV
   A==;
X-CSE-ConnectionGUID: vRdkqXcgQ/Sds9NrcMTXNw==
X-CSE-MsgGUID: y0BfSqumTu6E1DVSJ/FYgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64842202"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="64842202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 16:26:12 -0800
X-CSE-ConnectionGUID: 1ZeNe8laQRyIwZAK6KOwnQ==
X-CSE-MsgGUID: /dHmp8DbTZ2Ee0NKhUm2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="188312996"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Nov 2025 16:26:09 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHtFs-0001cL-2t;
	Sun, 09 Nov 2025 00:26:04 +0000
Date: Sun, 9 Nov 2025 08:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 736/788]
 fs/bcachefs/data/compress.c:194:7: error: cannot jump from this goto
 statement to its label
Message-ID: <202511090821.rMJqnzsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ce82419507a4135f95e9eef2d0c33abe90c08275
commit: 2fa23a10a54b61fa710c2028759ec6747ab87f9e [736/788] bcachefs: compress: kill gotos
config: powerpc64-randconfig-r073-20251109 (https://download.01.org/0day-ci/archive/20251109/202511090821.rMJqnzsf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b9ea93cd5c37fb6d606502fd01208dd48330549d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511090821.rMJqnzsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511090821.rMJqnzsf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/data/compress.c:194:7: error: cannot jump from this goto statement to its label
     194 |                 if (fsck_err(c, compression_type_not_marked_in_sb,
         |                     ^
   fs/bcachefs/init/error.h:140:2: note: expanded from macro 'fsck_err'
     140 |         __fsck_err(c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/init/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/init/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/data/compress.c:202:14: note: jump bypasses initialization of variable with __attribute__((cleanup))
     202 |         struct bbuf src_data __cleanup(bbuf_exit) = bio_map_or_bounce(c, src, READ);
         |                     ^
   fs/bcachefs/data/compress.c:431:7: error: cannot jump from this goto statement to its label
     431 |                 if (fsck_err(c, compression_opt_not_marked_in_sb,
         |                     ^
   fs/bcachefs/init/error.h:140:2: note: expanded from macro 'fsck_err'
     140 |         __fsck_err(c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/init/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/init/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/data/compress.c:447:14: note: jump bypasses initialization of variable with __attribute__((cleanup))
     447 |         struct bbuf src_data __cleanup(bbuf_exit) = bio_map_or_bounce(c, src, READ);
         |                     ^
   fs/bcachefs/data/compress.c:446:14: note: jump bypasses initialization of variable with __attribute__((cleanup))
     446 |         struct bbuf dst_data __cleanup(bbuf_exit) = bio_map_or_bounce(c, dst, WRITE);
         |                     ^
   2 errors generated.


vim +194 fs/bcachefs/data/compress.c

1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  182  
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  183  static int __bio_uncompress(struct bch_fs *c, struct bio *src,
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  184  			    void *dst_data, struct bch_extent_crc_unpacked crc)
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  185  {
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  186  	size_t src_len = src->bi_iter.bi_size;
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  187  	size_t dst_len = crc.uncompressed_size << 9;
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  188  	void *workspace;
8a9f3d058279ed fs/bcachefs/compress.c      Kent Overstreet 2025-03-20  189  	int ret = 0, ret2;
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  190  
e1702b98915164 fs/bcachefs/compress.c      Kent Overstreet 2024-11-15  191  	enum bch_compression_opts opt = bch2_compression_type_to_opt(crc.compression_type);
e1702b98915164 fs/bcachefs/compress.c      Kent Overstreet 2024-11-15  192  	mempool_t *workspace_pool = &c->compress_workspace[opt];
3d0b3b51c5abaf fs/bcachefs/compress.c      Kent Overstreet 2024-11-14  193  	if (unlikely(!mempool_initialized(workspace_pool))) {
3d0b3b51c5abaf fs/bcachefs/compress.c      Kent Overstreet 2024-11-14 @194  		if (fsck_err(c, compression_type_not_marked_in_sb,
3d0b3b51c5abaf fs/bcachefs/compress.c      Kent Overstreet 2024-11-14  195  			     "compression type %s set but not marked in superblock",
3d0b3b51c5abaf fs/bcachefs/compress.c      Kent Overstreet 2024-11-14  196  			     __bch2_compression_types[crc.compression_type]))
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  197  			try(bch2_check_set_has_compressed_data(c, opt));
3d0b3b51c5abaf fs/bcachefs/compress.c      Kent Overstreet 2024-11-14  198  		else
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  199  			return bch_err_throw(c, compression_workspace_not_initialized);
3d0b3b51c5abaf fs/bcachefs/compress.c      Kent Overstreet 2024-11-14  200  	}
e1702b98915164 fs/bcachefs/compress.c      Kent Overstreet 2024-11-15  201  
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  202  	struct bbuf src_data __cleanup(bbuf_exit) = bio_map_or_bounce(c, src, READ);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  203  
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  204  	switch (crc.compression_type) {
1c3ff72c0fa946 fs/bcachefs/compress.c      Kent Overstreet 2019-12-28  205  	case BCH_COMPRESSION_TYPE_lz4_old:
1c3ff72c0fa946 fs/bcachefs/compress.c      Kent Overstreet 2019-12-28  206  	case BCH_COMPRESSION_TYPE_lz4:
8a9f3d058279ed fs/bcachefs/compress.c      Kent Overstreet 2025-03-20  207  		ret2 = LZ4_decompress_safe_partial(src_data.b, dst_data,
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  208  						   src_len, dst_len, dst_len);
8a9f3d058279ed fs/bcachefs/compress.c      Kent Overstreet 2025-03-20  209  		if (ret2 != dst_len)
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  210  			return bch_err_throw(c, decompress_lz4);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  211  		break;
1c3ff72c0fa946 fs/bcachefs/compress.c      Kent Overstreet 2019-12-28  212  	case BCH_COMPRESSION_TYPE_gzip: {
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  213  		z_stream strm = {
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  214  			.next_in	= src_data.b,
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  215  			.avail_in	= src_len,
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  216  			.next_out	= dst_data,
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  217  			.avail_out	= dst_len,
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  218  		};
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  219  
e1702b98915164 fs/bcachefs/compress.c      Kent Overstreet 2024-11-15  220  		workspace = mempool_alloc(workspace_pool, GFP_NOFS);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  221  
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  222  		zlib_set_workspace(&strm, workspace);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  223  		zlib_inflateInit2(&strm, -MAX_WBITS);
8a9f3d058279ed fs/bcachefs/compress.c      Kent Overstreet 2025-03-20  224  		ret2 = zlib_inflate(&strm, Z_FINISH);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  225  
e1702b98915164 fs/bcachefs/compress.c      Kent Overstreet 2024-11-15  226  		mempool_free(workspace, workspace_pool);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  227  
8a9f3d058279ed fs/bcachefs/compress.c      Kent Overstreet 2025-03-20  228  		if (ret2 != Z_STREAM_END)
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  229  			return bch_err_throw(c, decompress_gzip);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  230  		break;
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  231  	}
1c3ff72c0fa946 fs/bcachefs/compress.c      Kent Overstreet 2019-12-28  232  	case BCH_COMPRESSION_TYPE_zstd: {
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  233  		ZSTD_DCtx *ctx;
d9b59a57cc81b1 fs/bcachefs/compress.c      Kent Overstreet 2020-05-08  234  		size_t real_src_len = le32_to_cpup(src_data.b);
d9b59a57cc81b1 fs/bcachefs/compress.c      Kent Overstreet 2020-05-08  235  
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  236  		if (real_src_len > src_len - 4)
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  237  			return bch_err_throw(c, decompress_zstd_src_len_bad);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  238  
e1702b98915164 fs/bcachefs/compress.c      Kent Overstreet 2024-11-15  239  		workspace = mempool_alloc(workspace_pool, GFP_NOFS);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  240  		ctx = zstd_init_dctx(workspace, zstd_dctx_workspace_bound());
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  241  
8a9f3d058279ed fs/bcachefs/compress.c      Kent Overstreet 2025-03-20  242  		ret2 = zstd_decompress_dctx(ctx,
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  243  				dst_data,	dst_len,
d9b59a57cc81b1 fs/bcachefs/compress.c      Kent Overstreet 2020-05-08  244  				src_data.b + 4, real_src_len);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  245  
e1702b98915164 fs/bcachefs/compress.c      Kent Overstreet 2024-11-15  246  		mempool_free(workspace, workspace_pool);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  247  
8a9f3d058279ed fs/bcachefs/compress.c      Kent Overstreet 2025-03-20  248  		if (ret2 != dst_len)
2fa23a10a54b61 fs/bcachefs/data/compress.c Kent Overstreet 2025-10-30  249  			return bch_err_throw(c, decompress_zstd);
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  250  		break;
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  251  	}
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  252  	default:
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  253  		BUG();
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  254  	}
3d0b3b51c5abaf fs/bcachefs/compress.c      Kent Overstreet 2024-11-14  255  fsck_err:
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  256  	return ret;
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  257  }
1c6fdbd8f2465d fs/bcachefs/compress.c      Kent Overstreet 2017-03-16  258  

:::::: The code at line 194 was first introduced by commit
:::::: 3d0b3b51c5abaf27e35d9eeca880eed44c8690b0 bcachefs: Don't BUG_ON() when superblock feature wasn't set for compressed data

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
