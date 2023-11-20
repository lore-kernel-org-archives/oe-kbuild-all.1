Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28723766
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6K8wBlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700503051; x=1732039051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Dn/uUBJDMhcqfG9yyCELfd327wiu4890Y2tU3Ajmo4=;
  b=T6K8wBlY/hWjMAA4yg+imGHkYYr/QbPqNIhU8X0H1DYdC4+Ixwa1flex
   QP9UtdSyMWafHOsAbrMNy3Ix1uu2ggBGavDC32qMdXPg2+D/m+CAxP0JU
   nU4cjFfwQPrlOA+P09IJdNz3h0UW2gQ3QS0ZWnVD2y2v2xLc9lPzgPTQF
   xoBHu+YPuWGP3LdSk1nzjAyASVDHwA7nFuOZI3wv/XN1I0vpo46e5KThf
   cW0P86N0kkDD3nyxpxu/x6XijMv7lbqpuVj4E/+9JPYBP/elVhNyVagJH
   oHtQO/XemNDwaGTwfc7VRf79XJE5YN+/04PQE//F0FzlrjFXXzD8ctbod
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4865234"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4865234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 09:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939855668"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="939855668"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 09:57:28 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r58WU-0006l2-1S;
	Mon, 20 Nov 2023 17:57:26 +0000
Date: Tue, 21 Nov 2023 01:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 23/25]
 fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function
 'xz_dec_microlzma_end'
Message-ID: <202311210102.PfvJp9U8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   405b0c3781aa200f4b3bc1dc61d352f61544568d
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [23/25] FROMGIT: erofs: lzma compression support
config: i386-buildonly-randconfig-003-20231120 (https://download.01.org/0day-ci/archive/20231121/202311210102.PfvJp9U8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210102.PfvJp9U8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210102.PfvJp9U8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror,-Wimplicit-function-declaration]
                                   xz_dec_microlzma_end(strm->state);
                                   ^
   fs/erofs/decompressor_lzma.c:135:4: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror,-Wimplicit-function-declaration]
                           xz_dec_microlzma_end(strm->state);
                           ^
>> fs/erofs/decompressor_lzma.c:136:17: error: implicit declaration of function 'xz_dec_microlzma_alloc' [-Werror,-Wimplicit-function-declaration]
                   strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
                                 ^
>> fs/erofs/decompressor_lzma.c:136:15: error: incompatible integer to pointer conversion assigning to 'struct xz_dec_microlzma *' from 'int' [-Wint-conversion]
                   strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/decompressor_lzma.c:193:2: error: implicit declaration of function 'xz_dec_microlzma_reset' [-Werror,-Wimplicit-function-declaration]
           xz_dec_microlzma_reset(strm->state, inlen, outlen,
           ^
>> fs/erofs/decompressor_lzma.c:266:12: error: implicit declaration of function 'xz_dec_microlzma_run' [-Werror,-Wimplicit-function-declaration]
                   xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);
                            ^
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
