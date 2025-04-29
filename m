Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA0242934
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953194; cv=none; b=heioHSNpbkuaKSF9mdNadAATGGnk73BnBfk2OnqRX1ChbA8ZLh4FFDL8bJjolPTwuNmoMBmRKM+Ztq3OnWS0ISwqE8n141NpwHy4h3nYdUmLADQzRUr+Di17sPZXK+MUwkjtxyt3oFBf0/g0baKgFoTB6z1fZm691cMCNnCrx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953194; c=relaxed/simple;
	bh=OgTUH1x0u22kMSG9WgHKZojXq5XRWM5IWk8VW5OfeTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNffzps5AOUY78NdjRfCj0Yn7RkPs253DulN/6NOUF7bBLWYIMm7jniMlPrrGwGiIDSw2FVGb1mB5OoUx85jOQ704ivjH6/CNSlp2g2KmT5rrNw20pY132R1lPHm4+pnxYJKRAoABs9jStAofe5xr+VqkA1lvktBQ7qA3O/zUOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGWe5MPY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGWe5MPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745953192; x=1777489192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OgTUH1x0u22kMSG9WgHKZojXq5XRWM5IWk8VW5OfeTQ=;
  b=jGWe5MPY9/kyy5r3kWqQmXXf5rOZXym4HWaAAXHDA6hq4O/RC+ohni4x
   eyAszxpNloLpp0Ye8a508nGOaKUKRhoKoQhv//349fFrH3ebmdeqXGWA7
   LLcEWCIPczTTgaP0K69B4A1QOoGLYIN4RjR4dLN5ZZC0YpJILuoY/xQ6R
   MShRQN1lIYiF8Fsopk2++Qb8Hv4OvjUUfjz0cpgiIf8RZy4CnspaYnumf
   /UQ4tJRAVQVR09tHidKwa5/mDcyXoDbaP4wXb4+leCb8+54sdshm028Zo
   xAaYqG1ddv/TgymD3+aTlF0rMYx5t619voI/Yd0QXSnkYejFpZJtOMSYb
   w==;
X-CSE-ConnectionGUID: HSOU4J9LRnqyH7PxPisqnw==
X-CSE-MsgGUID: hxvyooBVQYOUENh7QbxAaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47502743"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47502743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 11:59:51 -0700
X-CSE-ConnectionGUID: CSIHcE8jSd+fAJyg4PP8uQ==
X-CSE-MsgGUID: OELzkhcWRLWM/PzViOLpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134230372"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2025 11:59:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9qBH-0002rL-30;
	Tue, 29 Apr 2025 18:59:47 +0000
Date: Wed, 30 Apr 2025 02:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 7/7]
 fs/erofs/decompressor_lzma.c:136:15: warning: assignment makes pointer from
 integer without a cast
Message-ID: <202504300509.Szotj8yr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a5dd34cc79ba9654a63fc26c7187ce9dddbe583f
commit: ede603374aab4bb8a612fd3c1c84ceef11435fa1 [7/7] FROMGIT: erofs: lzma compression support
config: arm-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300509.Szotj8yr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300509.Szotj8yr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300509.Szotj8yr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_exit':
   fs/erofs/decompressor_lzma.c:42:5: error: implicit declaration of function 'xz_dec_microlzma_end'; did you mean 'xz_dec_end'? [-Werror=implicit-function-declaration]
        xz_dec_microlzma_end(strm->state);
        ^~~~~~~~~~~~~~~~~~~~
        xz_dec_end
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_load_lzma_config':
   fs/erofs/decompressor_lzma.c:136:17: error: implicit declaration of function 'xz_dec_microlzma_alloc' [-Werror=implicit-function-declaration]
      strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
                    ^~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/decompressor_lzma.c:136:15: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
                  ^
   fs/erofs/decompressor_lzma.c: In function 'z_erofs_lzma_decompress':
   fs/erofs/decompressor_lzma.c:193:2: error: implicit declaration of function 'xz_dec_microlzma_reset'; did you mean 'xz_dec_reset'? [-Werror=implicit-function-declaration]
     xz_dec_microlzma_reset(strm->state, inlen, outlen,
     ^~~~~~~~~~~~~~~~~~~~~~
     xz_dec_reset
   fs/erofs/decompressor_lzma.c:266:12: error: implicit declaration of function 'xz_dec_microlzma_run'; did you mean 'xz_dec_run'? [-Werror=implicit-function-declaration]
      xz_err = xz_dec_microlzma_run(strm->state, &strm->buf);
               ^~~~~~~~~~~~~~~~~~~~
               xz_dec_run
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
