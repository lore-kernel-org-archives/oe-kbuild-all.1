Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817643D75
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686824037; x=1718360037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CsKusn1tmuyH1l6oJZAeUPOyOLRrRIhYK163+bSgxCU=;
  b=PR61oQwtQRznEtxhoipBSm2TBFNx2pvej+BOu0GQA92y32dwx4qi3zZ5
   Wuy4oBILAj2ErmsOd+7COnCgPrD7A28YrQUX/PiLLW41Rlrw2wf/ZmqTb
   DqPgcdEUXyLs5jjZY76k+NKauTm2VkdUuUFY7eoaCejfCqXwAquE7rCBQ
   636QPutHoeZ+OQkyoCgqDLwhfIue4yn0aC8dvnJN3veGRR98tpAw29fLA
   BvA4bWN4/RJaDNJwk8zrf6jDPpMGaG7H3a6VdfdIGm61BM3szb8dmoH+Z
   O3NvLiteu5/7yGVb7UtN6IxYHR5ZwP5Xs92XY46Wz3T/WHpu784QkGdq8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="348540802"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="348540802"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="689738045"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="689738045"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2023 03:13:55 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9jz4-0001jl-0q;
	Thu, 15 Jun 2023 10:13:51 +0000
Date: Thu, 15 Jun 2023 18:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 23/25]
 fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function
 'xz_dec_microlzma_end'
Message-ID: <202306151836.MGMzL2HW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [23/25] FROMGIT: erofs: lzma compression support
config: i386-randconfig-i012-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151836.MGMzL2HW-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout ede603374aab4bb8a612fd3c1c84ceef11435fa1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash M=fs/erofs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151836.MGMzL2HW-lkp@intel.com/

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
