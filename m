Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C53AEF2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 21:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786744399; cv=none; b=PN1FkPRxjDke2TbfdFl+oplTVS5fCloRwKvkJL4yAWZeluxeT9Nq7GDeKLlJ0+rKSW77oO4tnwh6uBue6Ky8y3Qu9lL7ymu0nLtB6uLGnhVgUUvDhZaIfPaJ6lSCRTFCbXVMgozMC5XYIdozoSrbDczBtRHpbb+L0dw2m9W6T9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786744399; c=relaxed/simple;
	bh=dbBVL3Mu+KSxQmWO+DSHwY+It6hpBf3jrnnwz/vMfp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A+P27nDqvWACKUa9cytZmqXQRBAR+o/l0f//JiMDyfhKsvJERtA7BvpravrXGM2zny0lMeQuhOa79J1zH8e58H8714w8MeCkLFsx0YRBKhRKhC91JyBshXDO7kQrAii2mZctZHvsWHwXNkg0vDTAttmSFu29aKxo8s4JJrdvWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQ06tROo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQ06tROo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786744398; x=1818280398;
  h=date:from:to:cc:subject:message-id;
  bh=dbBVL3Mu+KSxQmWO+DSHwY+It6hpBf3jrnnwz/vMfp4=;
  b=MQ06tROo24167+KKXOF3MPmLUNCjVf8U9RtMB2vIWYXwWjT2ed4eoXgC
   6kcMV/wW4GA2navIJUwvQ/f0qfTJscRYThXN0T2pgaj19dzm6+wIgfKU4
   k9VYe7M6qmqyExwY4xRZMbTSm/2XsqYr/Dr0JPW78z5hBmEcvynG2kDpZ
   a6tuy7XbMSMAuoZlWj+nYo2ZqSlvSJFP6+Qjbrm7sMOtjcC19NCdBvu5X
   fc+7qxkuxRtb4xpcY89m6xI9X47qRxG7L5VzLzv+sqmDpzxzHWSsg2U9G
   IOoH3xQ51a51hILL+ZxcUVcYvgIRkjqT5teoDAajDGnKjke0NYsjn9IaD
   g==;
X-CSE-ConnectionGUID: wlgkXIJVSgeIffhEDyMO5w==
X-CSE-MsgGUID: wsA+JMSYQF2FoGd0qTYWzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91000151"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="91000151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 14:53:18 -0700
X-CSE-ConnectionGUID: vHTtFYodRcKreCOMeKr88w==
X-CSE-MsgGUID: clyLvb1KR/G4wKbPBvaM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="294255149"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2026 14:53:16 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuzpy-00000000aKg-0pfR;
	Fri, 14 Aug 2026 21:53:14 +0000
Date: Sat, 15 Aug 2026 05:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 fs/erofs/decompressor_lzma.c:266:12: error: implicit declaration of function
 'xz_dec_microlzma_run'
Message-ID: <202608150554.r02a2TR3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8b4ccabf3e6b7ef8ad04f513e8e5b1a5a1021267
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [1/1] FROMGIT: erofs: lzma compression support
config: x86_64-randconfig-r071-20260815 (https://download.01.org/0day-ci/archive/20260815/202608150554.r02a2TR3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150554.r02a2TR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150554.r02a2TR3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
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
