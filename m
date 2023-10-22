Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0735063CE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+f2aLiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697994690; x=1729530690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZ9y7tUpQXOBLsbN/h1+F9EbZWx1o+Hmy8dNHm2zSKc=;
  b=A+f2aLiBKZnas+YdtvOVOqCP2goZzYrLJUMLr0sXSejps/ovIO7KM7rd
   3mbVPe4cWhJuq0myT+o1IjC2P15xjGbETPB8uhYoIsUboSJXD3BgJp65Q
   NEh+Qib0sJlgwBlZBVl4snvdEqZ7Ay7cBSaathkT78mJOYnYMp7h+hwIj
   OpQM7LuFFiBui18fAvtv6J9FgVMalqhNJyQ4+VtWoOsqoo3nKU/gSHq9T
   1RJ14Vqrkr/4Yp78+cJvqW7BYCY69QyFMqQXj+e3WPe4U2cxRr6fQ0ES7
   EjDqFrCoOBTO95DBWl68jYLbxHAOiDRrjRws1E+Lqv8vVNjQEDRIgZS6W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="389569937"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="389569937"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 10:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="901590042"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="901590042"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2023 10:08:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qubye-00068A-1V;
	Sun, 22 Oct 2023 17:11:00 +0000
Date: Mon, 23 Oct 2023 01:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 23/25]
 fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function
 'xz_dec_microlzma_end'; did you mean 'xz_dec_end'?
Message-ID: <202310230150.9Ko6bV5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   3e57724f00323e26143a9f214b94a3009d0a83ab
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [23/25] FROMGIT: erofs: lzma compression support
config: i386-buildonly-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231023/202310230150.9Ko6bV5q-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310230150.9Ko6bV5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230150.9Ko6bV5q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_exit':
>> fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function 'xz_dec_microlzma_end'; did you mean 'xz_dec_end'? [-Werror=implicit-function-declaration]
        xz_dec_microlzma_end(strm->state);
        ^~~~~~~~~~~~~~~~~~~~
        xz_dec_end
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_load_lzma_config':
>> fs/erofs/decompressor_lzma.c:136:17: error: implicit declaration of function 'xz_dec_microlzma_alloc' [-Werror=implicit-function-declaration]
      strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
                    ^~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/decompressor_lzma.c:136:15: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
                  ^
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_decompress':
>> fs/erofs/decompressor_lzma.c:193:2: error: implicit declaration of function 'xz_dec_microlzma_reset'; did you mean 'xz_dec_reset'? [-Werror=implicit-function-declaration]
     xz_dec_microlzma_reset(strm->state, inlen, outlen,
     ^~~~~~~~~~~~~~~~~~~~~~
     xz_dec_reset
>> fs/erofs/decompressor_lzma.c:266:12: error: implicit declaration of function 'xz_dec_microlzma_run'; did you mean 'xz_dec_run'? [-Werror=implicit-function-declaration]
      xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);
               ^~~~~~~~~~~~~~~~~~~~
               xz_dec_run
   cc1: some warnings being treated as errors


vim +42 fs/erofs/decompressor_lzma.c

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
