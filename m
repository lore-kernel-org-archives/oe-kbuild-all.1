Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159FF19CC0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734042714; cv=none; b=GeWZI+K+5iJPzgVmSlej9S70mZ688dLyDKPFRa/tV664wpxPYSofufi0bLQAwfMJxvmRJINV69/iruiaDQlpbLlUZtnxgRweGkw8/ax1CoM9+1rr+RA/K9k1gSaKBB54llvO3qQaGQx1ZzF4mOghQxsTBx9kx0ak/iccGGGgIe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734042714; c=relaxed/simple;
	bh=+Iyry7ybOHW7OB9mFHzNYHKQSCwJXgEzQCGV9ZSe/TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEHWPA/Po6z/nmtZgHdoeYHlnCFdRwqp+QYDUkkN0IZ9iDx1Nn5nSy3fQXZGEn/7ujtSMdlmOE02z0pOsR8D3j6CKNFTK+04W4YBCfekKArsmmVbOcEdUvDckpEIZbJrxw+1RGbaN7ZiOHtYIePDxyJp6BTJN03eBlLQ/qUfpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6xudZ9+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6xudZ9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734042713; x=1765578713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Iyry7ybOHW7OB9mFHzNYHKQSCwJXgEzQCGV9ZSe/TM=;
  b=K6xudZ9+oNfbyAOtuaQPtqVdj+mkkQsIFejRme5Xpd6fNCIAbvzdKsJm
   uKvpknrAgOryYJETHMKlcx60gJyVkZqu9fx9H2qRS5F7uHWrpJtRXWr1B
   GFbK9hQfClqZ3mhdpeElzbI7O0V9J+SMHLNoKckWjceCkJc+w5XIHiw/V
   y0THSVjxAjlXtPBstXZ9IUy7eEqF1PP5tjlulHgUH2VGL+cgKOYQ28O0S
   OcmyTvrrv+qOvkTeaQMMcH+rqAHhoIZJFBZ9IBe+gHmCPaApA26d5CLGP
   G59RvW5/slVxHcRI8d2ZegnVIjC0dkwLTi0nlQhrEtrdqdy+C+EHboZBH
   w==;
X-CSE-ConnectionGUID: G4MbmB3RSomBYVyZsifeEA==
X-CSE-MsgGUID: 1v7fnBLcRaqgy/gm9YrqWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38419124"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38419124"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 14:31:52 -0800
X-CSE-ConnectionGUID: 09SM+PfXSXKjBjVRmksCKw==
X-CSE-MsgGUID: wBJEsb5QTpe3C4i0kwe8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101452743"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2024 14:31:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLrim-000BRU-0o;
	Thu, 12 Dec 2024 22:31:48 +0000
Date: Fri, 13 Dec 2024 06:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [xiang-erofs:fixes 6/7] fs/erofs/fscache.c:201:30: error: 'struct
 erofs_map_dev' has no member named 'm_fscache'
Message-ID: <202412130644.hPflG7Qg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git fixes
head:   320077e635e75d3053b81adb7c0d53f0a89e300d
commit: 34cff83201d5d796f808bf72ab734c4aae425bff [6/7] erofs: reference `struct erofs_device_info` for erofs_map_dev
config: sparc64-randconfig-001-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130644.hPflG7Qg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130644.hPflG7Qg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130644.hPflG7Qg-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/fscache.c: In function 'erofs_fscache_bio_alloc':
>> fs/erofs/fscache.c:201:30: error: 'struct erofs_map_dev' has no member named 'm_fscache'
     201 |         io->io.private = mdev->m_fscache->cookie;
         |                              ^~
   fs/erofs/fscache.c: In function 'erofs_fscache_data_read_slice':
   fs/erofs/fscache.c:319:47: error: 'struct erofs_map_dev' has no member named 'm_fscache'
     319 |         ret = erofs_fscache_read_io_async(mdev.m_fscache->cookie,
         |                                               ^


vim +201 fs/erofs/fscache.c

a1bafc3109d713e Jingbo Xu 2024-03-08  194  
a1bafc3109d713e Jingbo Xu 2024-03-08  195  struct bio *erofs_fscache_bio_alloc(struct erofs_map_dev *mdev)
a1bafc3109d713e Jingbo Xu 2024-03-08  196  {
a1bafc3109d713e Jingbo Xu 2024-03-08  197  	struct erofs_fscache_bio *io;
a1bafc3109d713e Jingbo Xu 2024-03-08  198  
a1bafc3109d713e Jingbo Xu 2024-03-08  199  	io = kmalloc(sizeof(*io), GFP_KERNEL | __GFP_NOFAIL);
a1bafc3109d713e Jingbo Xu 2024-03-08  200  	bio_init(&io->bio, NULL, io->bvecs, BIO_MAX_VECS, REQ_OP_READ);
a1bafc3109d713e Jingbo Xu 2024-03-08 @201  	io->io.private = mdev->m_fscache->cookie;
a1bafc3109d713e Jingbo Xu 2024-03-08  202  	io->io.end_io = erofs_fscache_bio_endio;
a1bafc3109d713e Jingbo Xu 2024-03-08  203  	refcount_set(&io->io.ref, 1);
a1bafc3109d713e Jingbo Xu 2024-03-08  204  	return &io->bio;
a1bafc3109d713e Jingbo Xu 2024-03-08  205  }
a1bafc3109d713e Jingbo Xu 2024-03-08  206  

:::::: The code at line 201 was first introduced by commit
:::::: a1bafc3109d713ed83f73d61ba5cb1e6fd80fdbc erofs: support compressed inodes over fscache

:::::: TO: Jingbo Xu <jefflexu@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
