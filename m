Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF02F0C45
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504103; cv=none; b=mMuhp8U6w/aUEKzlHPTurQLkaOCiqgOMWgDEtzqWD70mh9PQqJEgHXvbYh+KBcYscsKY9ZfRbLYAxyvZVTkpvW161Tg42iSN8O1o/X83QrvAxAvXHt9PjKA0F3+NU6BqMGxZEBf/Q5pekoqy3KAnerwAPC62Z94adLoz0XPjTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504103; c=relaxed/simple;
	bh=gX/DUBjAhvt8Zc+9/1yZ66tH35Uy9+nqwc/oBWP7t5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bhBsLBX9cuvxrprrqI/5+kVI/JHSLGRsQSFgOyfjLw9FKXD0MTVChRvKQw3quxO9XeE+rInMeG61S23DmtrAr9nzAkVUdUkYXolCE4i1otAw/HqxY8piEw27VUw/JF9NGPeQDf5Ade5boRCHXw96vWMFUJBGLMndYPCiVOpa7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7IcLIJS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7IcLIJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778504102; x=1810040102;
  h=date:from:to:cc:subject:message-id;
  bh=gX/DUBjAhvt8Zc+9/1yZ66tH35Uy9+nqwc/oBWP7t5Y=;
  b=V7IcLIJS54i0ldyDJJ8bqrobqZgTWku+aCb8Te5YJJYE0pCOLfNqqz1C
   fd44D+LnrPT7duYhY4bLE5j1Q4dEHVISazjvILLAEYEF87Jyj+AXS24rt
   6CyE2kXtmb1FK5rvZt2XXKsSSmOtTHYQbRHk0892C2xtZfTcwhTp1nfiQ
   pH8rTnRhVmd1EDktjk2pji8Wy1dVvwGA6ViRCDOKRH0l9OZi5DgMLgpUx
   iZrMpYfyZ1cfIgk+WIgR/M5IFq8g49LYFDkpvlK1kh2LyAHXcRgZjkrzI
   XDpCRPbSKjtjnxLOk2vY7kq+KjgSc4gvhtMhViMZdP6kElbASLBg1B0la
   g==;
X-CSE-ConnectionGUID: iN9KgheYTXaLOa7PWt2rVw==
X-CSE-MsgGUID: tOpJ5esWQlKvKIk5bjRMPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89972867"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="89972867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:55:01 -0700
X-CSE-ConnectionGUID: h1ku9f4yRrKPbOyR+91Ijw==
X-CSE-MsgGUID: BnN6gfuhTD2D8nc8txPzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="241419792"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 May 2026 05:54:59 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMQ9x-000000000ad-2IQg;
	Mon, 11 May 2026 12:54:57 +0000
Date: Mon, 11 May 2026 20:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 fs/erofs/decompressor_lzma.c:136:29: warning: assignment to 'struct
 xz_dec_microlzma *' from 'int' makes pointer from integer without a cast
Message-ID: <202605112049.I9ef1cyD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   80e99694479e5e9fe7c6230aad1327bbb9c655be
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [0/1] FROMGIT: erofs: lzma compression support
config: i386-buildonly-randconfig-001-20260511 (https://download.01.org/0day-ci/archive/20260511/202605112049.I9ef1cyD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112049.I9ef1cyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112049.I9ef1cyD-lkp@intel.com/

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
