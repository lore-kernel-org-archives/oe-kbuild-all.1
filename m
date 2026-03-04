Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300303FFD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 05:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600958; cv=none; b=Ocbn6upKMub1tanmyf6bfCR3XNGPinftizshxCRYhWIaq125Svi11rf9/P7dTLhS1ZfVdCdVbKUN7aiHj5dBBuuztf6iilukop6HfxZl7RaxlxdX0RcgrW97XZgvs11XnT9eQQuY5HuDHUqvd4YSUKo6qn/562t14+4CUYYScL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600958; c=relaxed/simple;
	bh=qfqtgyWichTfqBE5fqG/uFtudUjnmUWVTaQe2WNYc+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OC6rhFvAeYm4E6gXLohdagQGQly3IcANgxKi1YJoC8PZOcohfyFs3ED+jPkGVDKsq8JnSVotL2p61Cu2CvzSmsb7FZcF4rgTk8ydkjIM1+Zjpw+kPLfGp0/QWZi8AT+N0MCr2sUXLjvhZiZ/1MvHQtM2Dx0qdYgChr8hPu78R1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfOEoSyo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfOEoSyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772600957; x=1804136957;
  h=date:from:to:cc:subject:message-id;
  bh=qfqtgyWichTfqBE5fqG/uFtudUjnmUWVTaQe2WNYc+M=;
  b=GfOEoSyo5Aa5DtE/XxaMz3QC2pTRlGKldvLImkt3iqZKXkV9LfQbo91i
   60hWQExrdvdvN7+6W5jeScIs6GS+oTz564Igm4h8PoqI5VAk0sYkXb77B
   KiCrjA1q2bFAO1D0nK4U3/RW/aXukYCijWcbqwKozrVtyBhJDty+hrbjN
   Fa6TZmoFO+YXgLJnEXAqSLTAOomhJ7Ju9mLRuu+y8I49LCurwYN8R2Tf6
   LZcGILfOMlfdVVm9rUD8yazvhH3BqpuZCnlASKsdPySl2oV60b3H8utpv
   hGjQnsGEIXkkRkz9UX4si947wzXBTux1Q54gIRBVPVOVLhRW0XX139zni
   A==;
X-CSE-ConnectionGUID: J6bUCivNTJWtnJ+ahbiSdA==
X-CSE-MsgGUID: nw6MfODERwOBt5oufYejxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73528505"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73528505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 21:09:17 -0800
X-CSE-ConnectionGUID: 6FvTc0prTrOy/mltXZrDgg==
X-CSE-MsgGUID: lc6fzh18SCOWCswgESxm5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="222895257"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2026 21:09:15 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxeTw-000000003HB-3tr8;
	Wed, 04 Mar 2026 05:09:12 +0000
Date: Wed, 04 Mar 2026 13:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 6/6]
 fs/erofs/decompressor_lzma.c:266:12: error: implicit declaration of function
 'xz_dec_microlzma_run'
Message-ID: <202603041345.ew47dBSR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8426c769398ef6f4ac3f61df3f3ec10bd11b0e50
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [6/6] FROMGIT: erofs: lzma compression support
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260304/202603041345.ew47dBSR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041345.ew47dBSR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041345.ew47dBSR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror,-Wimplicit-function-declaration]
      42 |                                 xz_dec_microlzma_end(strm->state);
         |                                 ^
   fs/erofs/decompressor_lzma.c:135:4: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror,-Wimplicit-function-declaration]
     135 |                         xz_dec_microlzma_end(strm->state);
         |                         ^
   fs/erofs/decompressor_lzma.c:136:17: error: implicit declaration of function 'xz_dec_microlzma_alloc' [-Werror,-Wimplicit-function-declaration]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                               ^
   fs/erofs/decompressor_lzma.c:136:15: error: incompatible integer to pointer conversion assigning to 'struct xz_dec_microlzma *' from 'int' [-Wint-conversion]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/decompressor_lzma.c:193:2: error: implicit declaration of function 'xz_dec_microlzma_reset' [-Werror,-Wimplicit-function-declaration]
     193 |         xz_dec_microlzma_reset(strm->state, inlen, outlen,
         |         ^
>> fs/erofs/decompressor_lzma.c:266:12: error: implicit declaration of function 'xz_dec_microlzma_run' [-Werror,-Wimplicit-function-declaration]
     266 |                 xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);
         |                          ^
   1 warning and 6 errors generated.


vim +/xz_dec_microlzma_run +266 fs/erofs/decompressor_lzma.c

   151	
   152	int z_erofs_lzma_decompress(struct z_erofs_decompress_req *rq,
   153				    struct list_head *pagepool)
   154	{
   155		const unsigned int nrpages_out =
   156			PAGE_ALIGN(rq->pageofs_out + rq->outputsize) >> PAGE_SHIFT;
   157		const unsigned int nrpages_in =
   158			PAGE_ALIGN(rq->inputsize) >> PAGE_SHIFT;
   159		unsigned int inputmargin, inlen, outlen, pageofs;
   160		struct z_erofs_lzma *strm;
   161		u8 *kin;
   162		bool bounced = false;
   163		int no, ni, j, err = 0;
   164	
   165		/* 1. get the exact LZMA compressed size */
   166		kin = kmap(*rq->in);
   167		inputmargin = 0;
   168		while (!kin[inputmargin & ~PAGE_MASK])
   169			if (!(++inputmargin & ~PAGE_MASK))
   170				break;
   171	
   172		if (inputmargin >= PAGE_SIZE) {
   173			kunmap(*rq->in);
   174			return -EFSCORRUPTED;
   175		}
   176		rq->inputsize -= inputmargin;
   177	
   178		/* 2. get an available lzma context */
   179	again:
   180		spin_lock(&z_erofs_lzma_lock);
   181		strm = z_erofs_lzma_head;
   182		if (!strm) {
   183			spin_unlock(&z_erofs_lzma_lock);
   184			wait_event(z_erofs_lzma_wq, READ_ONCE(z_erofs_lzma_head));
   185			goto again;
   186		}
   187		z_erofs_lzma_head = strm->next;
   188		spin_unlock(&z_erofs_lzma_lock);
   189	
   190		/* 3. multi-call decompress */
   191		inlen = rq->inputsize;
   192		outlen = rq->outputsize;
   193		xz_dec_microlzma_reset(strm->state, inlen, outlen,
   194				       !rq->partial_decoding);
   195		pageofs = rq->pageofs_out;
   196		strm->buf.in = kin + inputmargin;
   197		strm->buf.in_pos = 0;
   198		strm->buf.in_size = min_t(u32, inlen, PAGE_SIZE - inputmargin);
   199		inlen -= strm->buf.in_size;
   200		strm->buf.out = NULL;
   201		strm->buf.out_pos = 0;
   202		strm->buf.out_size = 0;
   203	
   204		for (ni = 0, no = -1;;) {
   205			enum xz_ret xz_err;
   206	
   207			if (strm->buf.out_pos == strm->buf.out_size) {
   208				if (strm->buf.out) {
   209					kunmap(rq->out[no]);
   210					strm->buf.out = NULL;
   211				}
   212	
   213				if (++no >= nrpages_out || !outlen) {
   214					erofs_err(rq->sb, "decompressed buf out of bound");
   215					err = -EFSCORRUPTED;
   216					break;
   217				}
   218				strm->buf.out_pos = 0;
   219				strm->buf.out_size = min_t(u32, outlen,
   220							   PAGE_SIZE - pageofs);
   221				outlen -= strm->buf.out_size;
   222				if (rq->out[no])
   223					strm->buf.out = kmap(rq->out[no]) + pageofs;
   224				pageofs = 0;
   225			} else if (strm->buf.in_pos == strm->buf.in_size) {
   226				kunmap(rq->in[ni]);
   227	
   228				if (++ni >= nrpages_in || !inlen) {
   229					erofs_err(rq->sb, "compressed buf out of bound");
   230					err = -EFSCORRUPTED;
   231					break;
   232				}
   233				strm->buf.in_pos = 0;
   234				strm->buf.in_size = min_t(u32, inlen, PAGE_SIZE);
   235				inlen -= strm->buf.in_size;
   236				kin = kmap(rq->in[ni]);
   237				strm->buf.in = kin;
   238				bounced = false;
   239			}
   240	
   241			/*
   242			 * Handle overlapping: Use bounced buffer if the compressed
   243			 * data is under processing; Otherwise, Use short-lived pages
   244			 * from the on-stack pagepool where pages share with the same
   245			 * request.
   246			 */
   247			if (!bounced && rq->out[no] == rq->in[ni]) {
   248				memcpy(strm->bounce, strm->buf.in, strm->buf.in_size);
   249				strm->buf.in = strm->bounce;
   250				bounced = true;
   251			}
   252			for (j = ni + 1; j < nrpages_in; ++j) {
   253				struct page *tmppage;
   254	
   255				if (rq->out[no] != rq->in[j])
   256					continue;
   257	
   258				DBG_BUGON(erofs_page_is_managed(EROFS_SB(rq->sb),
   259								rq->in[j]));
   260				tmppage = erofs_allocpage(pagepool,
   261							  GFP_KERNEL | __GFP_NOFAIL);
   262				set_page_private(tmppage, Z_EROFS_SHORTLIVED_PAGE);
   263				copy_highpage(tmppage, rq->in[j]);
   264				rq->in[j] = tmppage;
   265			}
 > 266			xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
