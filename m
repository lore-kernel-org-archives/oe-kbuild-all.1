Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B23DBD65
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 08:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274402; cv=none; b=Sn4Ge/bJ+Ust4NemyomJa2AOg/avSMxhWZgykz9f7jURgX0fKcNg8P6/dGTblEa+U+H1RV8pbPa68m3MWHLoxgJLChKMvaFXVRUCjMkaBDuVRGSgZKrgiG6z/PWP2U2yf0PltzRzN3QuRdRNa/3M1mIR/ICLjOwqODq7bz05560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274402; c=relaxed/simple;
	bh=nNzWXsU8STSDluj6R/IEq8ZlLmfdd5K9YXYzB+Fsrvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Eg4ujcms2QRiH/5hOG1Qhy4qO+gb1Rd7kuEmwFn9OvwfnBosh+mJ9Ic6wtrpnEa9P6v97quCPH5KFAQ8njoJDzWbLUbWdm53Fh3HGGiSYQXM/wAeT/zLJudt2ToD3+LNQelkVlqx6Yz3zYQzMy0HR4fOi10wpXgGcCnvsLweezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rj/sNgJS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rj/sNgJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791274398; x=1822810398;
  h=date:from:to:cc:subject:message-id;
  bh=nNzWXsU8STSDluj6R/IEq8ZlLmfdd5K9YXYzB+Fsrvw=;
  b=Rj/sNgJS04dN8qo0kJmt/aQLxKKMZo7HVGkb4HL42puNhBvc0TLFLMBp
   9IYFW/M6ScZDDjLr/7rL0SDt6JxmYKI/fCIeTtKlNRsW8FA5J0WRwJqlu
   dsYfmgghZhruCXlFQDNtzHbJRWKXcTAA4CE2htTfiU7KT88mKB7pRP/cj
   ZTHrSlrTRHtTSNm7EpWd15WV6hbvDt1WlrSp3KCYIRjBsU+psOfnAmweG
   6vc/QtIVzPx6IjsGuGZcbYhRSSyoEar0ZnMdLFLNnk1p/MrXxE0pWbSvk
   wg4SK9S1oLHvXMTGorVpIXDz/umT7OS+PeGTeLUDmTocive+8sFksVMja
   A==;
X-CSE-ConnectionGUID: 9Ccv5ySvQuKf0fwyWOnDIg==
X-CSE-MsgGUID: WvYPDJZnR06rpb+hiah+9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="5762"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="5762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:11:08 -0700
X-CSE-ConnectionGUID: Q2hjeTKeTJ+ddza/XFz+2w==
X-CSE-MsgGUID: oO2naGr6T3yls1P+sPpDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="306575566"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Oct 2026 01:11:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE0GO-000000001LA-1kZk;
	Tue, 06 Oct 2026 08:11:04 +0000
Date: Tue, 06 Oct 2026 16:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function
 'xz_dec_microlzma_end'
Message-ID: <202610061603.uC9AOIJ6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   6f82755ed602e815541b2c6617a3f30f53500cdc
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [0/4] FROMGIT: erofs: lzma compression support
config: i386-randconfig-1012-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061603.uC9AOIJ6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061603.uC9AOIJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061603.uC9AOIJ6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror,-Wimplicit-function-declaration]
      42 |                                 xz_dec_microlzma_end(strm->state);
         |                                 ^
   fs/erofs/decompressor_lzma.c:135:4: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror,-Wimplicit-function-declaration]
     135 |                         xz_dec_microlzma_end(strm->state);
         |                         ^
>> fs/erofs/decompressor_lzma.c:136:17: error: implicit declaration of function 'xz_dec_microlzma_alloc' [-Werror,-Wimplicit-function-declaration]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                               ^
>> fs/erofs/decompressor_lzma.c:136:15: error: incompatible integer to pointer conversion assigning to 'struct xz_dec_microlzma *' from 'int' [-Wint-conversion]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/decompressor_lzma.c:193:2: error: implicit declaration of function 'xz_dec_microlzma_reset' [-Werror,-Wimplicit-function-declaration]
     193 |         xz_dec_microlzma_reset(strm->state, inlen, outlen,
         |         ^
   fs/erofs/decompressor_lzma.c:266:12: error: implicit declaration of function 'xz_dec_microlzma_run' [-Werror,-Wimplicit-function-declaration]
     266 |                 xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);
         |                          ^
   6 errors generated.


vim +/xz_dec_microlzma_end +42 fs/erofs/decompressor_lzma.c

    21	
    22	void z_erofs_lzma_exit(void)
    23	{
    24		/* there should be no running fs instance */
    25		while (z_erofs_lzma_avail_strms) {
    26			struct z_erofs_lzma *strm;
    27	
    28			spin_lock(&z_erofs_lzma_lock);
    29			strm = z_erofs_lzma_head;
    30			if (!strm) {
    31				spin_unlock(&z_erofs_lzma_lock);
    32				DBG_BUGON(1);
    33				return;
    34			}
    35			z_erofs_lzma_head = NULL;
    36			spin_unlock(&z_erofs_lzma_lock);
    37	
    38			while (strm) {
    39				struct z_erofs_lzma *n = strm->next;
    40	
    41				if (strm->state)
  > 42					xz_dec_microlzma_end(strm->state);
    43				kfree(strm);
    44				--z_erofs_lzma_avail_strms;
    45				strm = n;
    46			}
    47		}
    48	}
    49	
    50	int z_erofs_lzma_init(void)
    51	{
    52		unsigned int i;
    53	
    54		/* by default, use # of possible CPUs instead */
    55		if (!z_erofs_lzma_nstrms)
    56			z_erofs_lzma_nstrms = num_possible_cpus();
    57	
    58		for (i = 0; i < z_erofs_lzma_nstrms; ++i) {
    59			struct z_erofs_lzma *strm = kzalloc(sizeof(*strm), GFP_KERNEL);
    60	
    61			if (!strm) {
    62				z_erofs_lzma_exit();
    63				return -ENOMEM;
    64			}
    65			spin_lock(&z_erofs_lzma_lock);
    66			strm->next = z_erofs_lzma_head;
    67			z_erofs_lzma_head = strm;
    68			spin_unlock(&z_erofs_lzma_lock);
    69			++z_erofs_lzma_avail_strms;
    70		}
    71		return 0;
    72	}
    73	
    74	int z_erofs_load_lzma_config(struct super_block *sb,
    75				     struct erofs_super_block *dsb,
    76				     struct z_erofs_lzma_cfgs *lzma, int size)
    77	{
    78		static DEFINE_MUTEX(lzma_resize_mutex);
    79		unsigned int dict_size, i;
    80		struct z_erofs_lzma *strm, *head = NULL;
    81		int err;
    82	
    83		if (!lzma || size < sizeof(struct z_erofs_lzma_cfgs)) {
    84			erofs_err(sb, "invalid lzma cfgs, size=%u", size);
    85			return -EINVAL;
    86		}
    87		if (lzma->format) {
    88			erofs_err(sb, "unidentified lzma format %x, please check kernel version",
    89				  le16_to_cpu(lzma->format));
    90			return -EINVAL;
    91		}
    92		dict_size = le32_to_cpu(lzma->dict_size);
    93		if (dict_size > Z_EROFS_LZMA_MAX_DICT_SIZE || dict_size < 4096) {
    94			erofs_err(sb, "unsupported lzma dictionary size %u",
    95				  dict_size);
    96			return -EINVAL;
    97		}
    98	
    99		erofs_info(sb, "EXPERIMENTAL MicroLZMA in use. Use at your own risk!");
   100	
   101		/* in case 2 z_erofs_load_lzma_config() race to avoid deadlock */
   102		mutex_lock(&lzma_resize_mutex);
   103	
   104		if (z_erofs_lzma_max_dictsize >= dict_size) {
   105			mutex_unlock(&lzma_resize_mutex);
   106			return 0;
   107		}
   108	
   109		/* 1. collect/isolate all streams for the following check */
   110		for (i = 0; i < z_erofs_lzma_avail_strms; ++i) {
   111			struct z_erofs_lzma *last;
   112	
   113	again:
   114			spin_lock(&z_erofs_lzma_lock);
   115			strm = z_erofs_lzma_head;
   116			if (!strm) {
   117				spin_unlock(&z_erofs_lzma_lock);
   118				wait_event(z_erofs_lzma_wq,
   119					   READ_ONCE(z_erofs_lzma_head));
   120				goto again;
   121			}
   122			z_erofs_lzma_head = NULL;
   123			spin_unlock(&z_erofs_lzma_lock);
   124	
   125			for (last = strm; last->next; last = last->next)
   126				++i;
   127			last->next = head;
   128			head = strm;
   129		}
   130	
   131		err = 0;
   132		/* 2. walk each isolated stream and grow max dict_size if needed */
   133		for (strm = head; strm; strm = strm->next) {
   134			if (strm->state)
   135				xz_dec_microlzma_end(strm->state);
 > 136			strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
   137			if (!strm->state)
   138				err = -ENOMEM;
   139		}
   140	
   141		/* 3. push back all to the global list and update max dict_size */
   142		spin_lock(&z_erofs_lzma_lock);
   143		DBG_BUGON(z_erofs_lzma_head);
   144		z_erofs_lzma_head = head;
   145		spin_unlock(&z_erofs_lzma_lock);
   146	
   147		z_erofs_lzma_max_dictsize = dict_size;
   148		mutex_unlock(&lzma_resize_mutex);
   149		return err;
   150	}
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
 > 193		xz_dec_microlzma_reset(strm->state, inlen, outlen,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
