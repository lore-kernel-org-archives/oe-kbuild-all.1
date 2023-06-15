Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C653BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 09:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686822175; x=1718358175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JQNzal78cLd/6uuqHINP9nlfOL23Ka/qM8+rZ1hq/8=;
  b=LtWOpFUeQlLxQ8Fv6IKdfWmw6WR14Xt+RA7F2NX8xU35uhShn4YCxZJI
   0Sb5Up3tMKgJoraBcp4DOQtAg/IUjoNdTpMkg6ydODBkT36fZyZo+NVdR
   /D/ZFJYSvFv1Zfcm6ap6ngMHcud5Z8r12dc7wCBITXiF5qdZtWFLqtyCR
   kIxb83MFcLVPhUdc64I+eZM84zLAY594Lej7i6vf/VIjuxnSt6wVFjRG4
   F884gFfPcP7+H7F26IcW4iFJ+WSmbhD91FZEUljlbPNdqL0/hFifJNwj0
   bF808ks/hx+h7z87MpBxBO/I0joJQ4hC4Kjzm1iLFlKeQIN1nTJj0jH0v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="424757861"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="424757861"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 02:42:54 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="745437412"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="745437412"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2023 02:42:53 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9jVE-0001i5-19;
	Thu, 15 Jun 2023 09:42:52 +0000
Date: Thu, 15 Jun 2023 17:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 23/25]
 fs/erofs/decompressor_lzma.c:136:29: warning: assignment to 'struct
 xz_dec_microlzma *' from 'int' makes pointer from integer without a cast
Message-ID: <202306151728.mduoZC66-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306151728.mduoZC66-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout ede603374aab4bb8a612fd3c1c84ceef11435fa1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/erofs/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151728.mduoZC66-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_exit':
   fs/erofs/decompressor_lzma.c:42:33: error: implicit declaration of function 'xz_dec_microlzma_end' [-Werror=implicit-function-declaration]
      42 |                                 xz_dec_microlzma_end(strm->state);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_load_lzma_config':
   fs/erofs/decompressor_lzma.c:136:31: error: implicit declaration of function 'xz_dec_microlzma_alloc' [-Werror=implicit-function-declaration]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/decompressor_lzma.c:136:29: warning: assignment to 'struct xz_dec_microlzma *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     136 |                 strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
         |                             ^
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_decompress':
   fs/erofs/decompressor_lzma.c:193:9: error: implicit declaration of function 'xz_dec_microlzma_reset' [-Werror=implicit-function-declaration]
     193 |         xz_dec_microlzma_reset(strm->state, inlen, outlen,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/decompressor_lzma.c:266:26: error: implicit declaration of function 'xz_dec_microlzma_run' [-Werror=implicit-function-declaration]
     266 |                 xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);
         |                          ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +136 fs/erofs/decompressor_lzma.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
