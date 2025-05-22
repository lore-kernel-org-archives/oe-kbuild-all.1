Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08BC221719
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896255; cv=none; b=Bqov1dcgzrgF05giGstG4mxZuQh5taCgKNPUMHAjfRvJDskkT3pUrnY2JQOPNzcR+lRcsmjMzBXSFoYEI6RJ9idhhzg2dU1aD1YIcy+KD7n4uD/J6twG2lNZH+MmR97xUOYZDyRwx/Vh/2C34UCXlq+DRa1clL0d2Njyc1IMdq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896255; c=relaxed/simple;
	bh=8AHK+xw8A93fv5Doh1XL11OyvREW1u3RYK+h9iFDv1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Me10k6nC2jkHvcV2ZikxGB1jkypPsygM524zR6jKK1q6aGfGC0Co5CJAe+yqzcKCkvHBPY9/ZqSdnCc/lS7eoHo4LDIEufGOtWKkN84IH7+/c6ePdUVPr/u0zmmPJqJ/jiB9YMopehs1fakSrS16eI1NMw+n2ikrDa2QSKCcB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzRRHKA4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzRRHKA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747896253; x=1779432253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8AHK+xw8A93fv5Doh1XL11OyvREW1u3RYK+h9iFDv1c=;
  b=HzRRHKA4oBQoILzyVtLa1+LvcxitEW/Yq0cow43myVYeorbjqvJ34Hlp
   kkW8o6yF6+vz8892Ga0bRKDoEbUPpeO6J3XD7VG4Xm/8ZQM6ZMk6FsmXf
   n9wZ6zbwAlrZX927z9ANY9s58Sqlkwb6cEmzDFozo/uFX2F2JEv8idheS
   BYDhiMTtY72vUu2uvZ5inc1whXMqSxj45ELsWSFFHneW4BtTl82fg7Ndy
   UawxTzqC5k1qZgvcNx9VfjzmaEK9S24iPzg0AYg6Ndr54GcbFgaRJfGnS
   WEnH9YHDBAEK5T0ufav6ZNmOczH6JWV9S95Jd7jQHGevy/WRCKa79axHP
   g==;
X-CSE-ConnectionGUID: Y2o9ClkrRZeGaqY6mbNDJQ==
X-CSE-MsgGUID: jwLoEPP8QMafh33nU9nU9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49780494"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49780494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 23:44:12 -0700
X-CSE-ConnectionGUID: 09bk4wfFTy6r1hvOr8orJg==
X-CSE-MsgGUID: RWQoGHPjRreRRwvudMRAmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="177605966"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2025 23:44:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHzey-000P0I-2U;
	Thu, 22 May 2025 06:44:08 +0000
Date: Thu, 22 May 2025 14:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH UNTESTED v4] erofs: support DEFLATE decompression by
 using Intel QAT
Message-ID: <202505221437.63K8zg0Z-lkp@intel.com>
References: <20250521100326.2867828-1-hsiangkao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521100326.2867828-1-hsiangkao@linux.alibaba.com>

Hi Gao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gao-Xiang/erofs-support-DEFLATE-decompression-by-using-Intel-QAT/20250521-180531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250521100326.2867828-1-hsiangkao%40linux.alibaba.com
patch subject: [PATCH UNTESTED v4] erofs: support DEFLATE decompression by using Intel QAT
config: arc-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221437.63K8zg0Z-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221437.63K8zg0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221437.63K8zg0Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/erofs/decompressor_zstd.c:3:
   fs/erofs/compress.h: In function 'z_erofs_crypto_show_engines':
>> fs/erofs/compress.h:87:1: warning: no return statement in function returning non-void [-Wreturn-type]
      87 | static inline int z_erofs_crypto_show_engines(char *buf, int size, char sep) {}
         | ^~~~~~


vim +87 fs/erofs/compress.h

    72	
    73	int z_erofs_stream_switch_bufs(struct z_erofs_stream_dctx *dctx, void **dst,
    74				       void **src, struct page **pgpl);
    75	int z_erofs_fixup_insize(struct z_erofs_decompress_req *rq, const char *padbuf,
    76				 unsigned int padbufsize);
    77	int __init z_erofs_init_decompressor(void);
    78	void z_erofs_exit_decompressor(void);
    79	int z_erofs_crypto_decompress(struct z_erofs_decompress_req *rq,
    80				      struct page **pgpl);
    81	int z_erofs_crypto_enable_engine(const char *name, int len);
    82	#ifdef CONFIG_EROFS_FS_ZIP_ACCEL
    83	void z_erofs_crypto_disable_all_engines(void);
    84	int z_erofs_crypto_show_engines(char *buf, int size, char sep);
    85	#else
    86	static inline void z_erofs_crypto_disable_all_engines(void) {}
  > 87	static inline int z_erofs_crypto_show_engines(char *buf, int size, char sep) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
