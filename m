Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207482D46A2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 22:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767740212; cv=none; b=Yb3Rw8uDVEj98xKb6DLSbUgYQJbAmOLvhhCUYsMW41a6U1zFgwyPrpSFsAgQYda8fkSrGZMqnsXzWl/m7bHtxYAbaMhSgXPaBZUmnx3YoGnwqsC7LztlYo4qR3MvVguIwgkgAfhD8643l/QKubd0GRosxIBf12pAvJ7QYKivFPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767740212; c=relaxed/simple;
	bh=ewoC7hhhDgxBCTw47kNNrD2XWZzDwoDJAwYx4Xm1pDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Myky61AJ4riCnjwiNaxQKI0TSmA+ig+y3cisPMbByryaeJ5FBHYuFaNvps+Jo7tGkQfSvBHFVzkPYvlRvEPWgyHvtoV/6IoNyH4Ara8UcKALRM/ZKmQ6GVy5/G0NeluYLyC25dOe9unkd7LIesgFCtLIyS5LNwDh5vkqWLGOQy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoZAQ1h1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoZAQ1h1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767740211; x=1799276211;
  h=date:from:to:cc:subject:message-id;
  bh=ewoC7hhhDgxBCTw47kNNrD2XWZzDwoDJAwYx4Xm1pDw=;
  b=DoZAQ1h1GBY/9J1X1jCKMAmXTJrwK9BV3VR983ZwkaFR46YhEo2Dwc/w
   QgLZp7lgzkdd2i7vMR6PnCKq8fTBHTzgB4yYnvYYWU7DpG44iHF/fiYxu
   6SwilcRF3P0a5YJRD+Zi3bMtJ54ErnJzFCJT5iOBV+7tyGkMv3mM1RIfD
   lRC26LtTdc+lPiQTGnyggHiIpPzXkvnMnz+ub4Ha1zRYBa7pi+Ox+LV2l
   00mUo1474TTzKAcUHqE0ddfbhysykHrTUFceFOhjAwqpZw8agMbBxur6b
   OCzFtt1sCNJB5vltg7Dcolj/DfZrynwimSZXkK+QW2WzvFId4Jki2Nji7
   g==;
X-CSE-ConnectionGUID: VrqhCz/+Sl2AYh22GlQcDg==
X-CSE-MsgGUID: OkN7wYtDTQa+/S1hwEZ+YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69091226"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69091226"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 14:56:51 -0800
X-CSE-ConnectionGUID: qG0KzrW1SK+0DrmGpOMLeg==
X-CSE-MsgGUID: Kh0mY1yAThCVo3/Pw2EZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="207644432"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jan 2026 14:56:49 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdFyo-000000001NN-3Hym;
	Tue, 06 Jan 2026 22:56:46 +0000
Date: Tue, 06 Jan 2026 23:55:47 +0100
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, jpsollie <janpieter.sollie@edpnet.be>
Subject: [koverstreet-bcachefs:pr/992 2/2]
 fs/bcachefs/data/read.c:977:1: error: version control conflict marker in file
Message-ID: <202601062314.7ER75yvq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/992
head:   a2ed7a4e3724ad977f40d2918d5366e22065d940
commit: a2ed7a4e3724ad977f40d2918d5366e22065d940 [2/2] Merge branch 'master' of https://github.com/koverstreet/bcachefs into HEAD
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260106/202601062314.7ER75yvq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062314.7ER75yvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062314.7ER75yvq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/bcachefs/data/read.c: In function '__bch2_read_endio':
>> fs/bcachefs/data/read.c:977:1: error: version control conflict marker in file
     977 | <<<<<<< HEAD:fs/bcachefs/io_read.c
         | ^~~~~~~
>> fs/bcachefs/data/read.c:982:9: error: too many arguments to function 'bch2_rbio_error'
     982 |         bch2_rbio_error(rbio, -BCH_ERR_data_read_retry_csum_err, BLK_STS_IOERR);
         |         ^~~~~~~~~~~~~~~
   fs/bcachefs/data/read.c:753:13: note: declared here
     753 | static void bch2_rbio_error(struct bch_read_bio *rbio, int ret)
         |             ^~~~~~~~~~~~~~~
>> fs/bcachefs/data/read.c:985:30: error: 'bch2_read_decompress_err' undeclared (first use in this function)
     985 |         bch2_rbio_punt(rbio, bch2_read_decompress_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/data/read.c:985:30: note: each undeclared identifier is reported only once for each function it appears in
>> fs/bcachefs/data/read.c:988:30: error: 'bch2_read_decrypt_err' undeclared (first use in this function)
     988 |         bch2_rbio_punt(rbio, bch2_read_decrypt_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
         |                              ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/data/read.c:990:1: error: version control conflict marker in file
     990 | =======
         | ^~~~~~~
>> fs/bcachefs/data/read.c:987:1: warning: label 'decrypt_err' defined but not used [-Wunused-label]
     987 | decrypt_err:
         | ^~~~~~~~~~~
>> fs/bcachefs/data/read.c:984:1: warning: label 'decompression_err' defined but not used [-Wunused-label]
     984 | decompression_err:
         | ^~~~~~~~~~~~~~~~~
>> fs/bcachefs/data/read.c:989:9: error: label 'out' used but not defined
     989 |         goto out;
         |         ^~~~
>> fs/bcachefs/data/read.c:981:1: warning: label 'csum_err' defined but not used [-Wunused-label]
     981 | csum_err:
         | ^~~~~~~~


vim +977 fs/bcachefs/data/read.c

   836	
   837	/* Inner part that may run in process context */
   838	static void __bch2_read_endio(struct work_struct *work)
   839	{
   840		struct bch_read_bio *rbio =
   841			container_of(work, struct bch_read_bio, work);
   842		struct bch_fs *c	= rbio->c;
   843		struct bch_dev *ca = rbio->have_ioref ? bch2_dev_have_ref(c, rbio->pick.ptr.dev) : NULL;
   844		struct bch_read_bio *parent	= bch2_rbio_parent(rbio);
   845		struct bio *src			= &rbio->bio;
   846		struct bio *dst			= &parent->bio;
   847		struct bvec_iter dst_iter	= rbio->bvec_iter;
   848		struct bch_extent_crc_unpacked crc = rbio->pick.crc;
   849		struct nonce nonce = extent_nonce(rbio->version, crc);
   850		struct bch_csum csum;
   851		int ret;
   852	
   853		guard(memalloc_flags)(PF_MEMALLOC_NOFS);
   854	
   855		/* Reset iterator for checksumming and copying bounced data: */
   856		if (rbio->bounce) {
   857			src->bi_iter.bi_size		= crc.compressed_size << 9;
   858			src->bi_iter.bi_idx		= 0;
   859			src->bi_iter.bi_bvec_done	= 0;
   860		} else {
   861			src->bi_iter			= rbio->bvec_iter;
   862		}
   863	
   864		if (bch2_read_corrupt_device == rbio->pick.ptr.dev ||
   865		    bch2_read_corrupt_device < 0)
   866			bch2_maybe_corrupt_bio(src, bch2_read_corrupt_ratio);
   867	
   868		csum = bch2_checksum_bio(c, crc.csum_type, nonce, src);
   869		bool csum_good = !bch2_crc_cmp(csum, rbio->pick.crc.csum) || c->opts.no_data_io;
   870	
   871		/*
   872		 * Checksum error: if the bio wasn't bounced, we may have been
   873		 * reading into buffers owned by userspace (that userspace can
   874		 * scribble over) - retry the read, bouncing it this time:
   875		 */
   876		if (!csum_good && !rbio->bounce && (rbio->flags & BCH_READ_user_mapped)) {
   877			rbio->flags |= BCH_READ_must_bounce;
   878			bch2_rbio_error(rbio, bch_err_throw(c, data_read_retry_csum_err_maybe_userspace));
   879			return;
   880		}
   881	
   882		bch2_account_io_completion(ca, BCH_MEMBER_ERROR_checksum, 0, csum_good);
   883	
   884		if (!csum_good) {
   885			bch2_rbio_error(rbio, bch_err_throw(c, data_read_retry_csum_err));
   886			return;
   887		}
   888	
   889		/*
   890		 * XXX
   891		 * We need to rework the narrow_crcs path to deliver the read completion
   892		 * first, and then punt to a different workqueue, otherwise we're
   893		 * holding up reads while doing btree updates which is bad for memory
   894		 * reclaim.
   895		 */
   896		if (unlikely(rbio->narrow_crcs))
   897			bch2_rbio_narrow_crcs(rbio);
   898	
   899		if (likely(!parent->data_update) ||
   900		    parent->data_update_verify_decompress) {
   901			/* Adjust crc to point to subset of data we want: */
   902			crc.offset     += rbio->offset_into_extent;
   903			crc.live_size	= bvec_iter_sectors(rbio->bvec_iter);
   904	
   905			if (crc_is_compressed(crc)) {
   906				BUG_ON(!rbio->bounce);
   907	
   908				ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
   909				if (ret) {
   910					bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
   911					return;
   912				}
   913	
   914				if (bch2_bio_uncompress(c, src, dst, dst_iter, crc) &&
   915				    !c->opts.no_data_io) {
   916					bch2_rbio_error(rbio, bch_err_throw(c, data_read_decompress_err));
   917					return;
   918				}
   919	
   920				if (unlikely(parent->data_update)) {
   921					/* We decrypted to decompress; re-encrypt: */
   922					ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
   923					if (ret) {
   924						bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
   925						return;
   926					}
   927				}
   928			} else if (likely(!parent->data_update)) {
   929				/* don't need to decrypt the entire bio: */
   930				nonce = nonce_add(nonce, crc.offset << 9);
   931				bio_advance(src, crc.offset << 9);
   932	
   933				BUG_ON(src->bi_iter.bi_size < dst_iter.bi_size);
   934				src->bi_iter.bi_size = dst_iter.bi_size;
   935	
   936				ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
   937				if (ret) {
   938					bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
   939					return;
   940				}
   941	
   942				if (rbio->bounce) {
   943					struct bvec_iter src_iter = src->bi_iter;
   944	
   945					bio_copy_data_iter(dst, &dst_iter, src, &src_iter);
   946				}
   947			}
   948		}
   949	
   950		if (unlikely(parent->data_update)) {
   951			if (rbio->split)
   952				rbio->parent->pick = rbio->pick;
   953	
   954			if (rbio->bounce) {
   955				struct bvec_iter src_iter = src->bi_iter;
   956	
   957				bio_copy_data_iter(dst, &dst_iter, src, &src_iter);
   958			}
   959		}
   960	
   961		if (rbio->promote) {
   962			/*
   963			 * Re encrypt data we decrypted, so it's consistent with
   964			 * rbio->crc:
   965			 */
   966			ret = bch2_encrypt_bio(c, crc.csum_type, nonce, src);
   967			if (ret) {
   968				bch2_rbio_error(rbio, bch_err_throw(c, data_read_decrypt_err));
   969				return;
   970			}
   971		}
   972	
   973		if (likely(!(rbio->flags & BCH_READ_in_retry))) {
   974			rbio = bch2_rbio_free(rbio);
   975			bch2_rbio_done(rbio);
   976		}
 > 977	<<<<<<< HEAD:fs/bcachefs/io_read.c
   978	out:
   979		memalloc_nofs_restore(nofs_flags);
   980		return;
 > 981	csum_err:
 > 982		bch2_rbio_error(rbio, -BCH_ERR_data_read_retry_csum_err, BLK_STS_IOERR);
   983		goto out;
 > 984	decompression_err:
 > 985		bch2_rbio_punt(rbio, bch2_read_decompress_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
   986		goto out;
 > 987	decrypt_err:
 > 988		bch2_rbio_punt(rbio, bch2_read_decrypt_err, RBIO_CONTEXT_UNBOUND, system_dfl_wq);
 > 989		goto out;
 > 990	=======
   991	>>>>>>> ba7b8f9521228d51c4ab46bf7723fb25cefc9a46:fs/bcachefs/data/read.c
   992	}
   993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
