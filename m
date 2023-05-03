Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC7D524
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683121791; x=1714657791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcFWkundwO6Thr/HTdkKDJ1agYR0eVGQRTjp4WlhHww=;
  b=EFXq8MxVM8yKRIyNPo7PT4fSkZ4Ol6HsqJSn0s/hGIhVoH4O1grs6Ox1
   UxXeCNY8hPesCc97Vj9aoEVzUxVc0OmUPVg2Gm9USdDEDT/1KS5U5YADB
   3d8oUqlRKoLUN2WAJp5q6WwfpUyWEDvC0F/psWLlUcdFnna1IMHOpNFNi
   egY5JnkRPU3uwLZ0qPYGJlLfWWNo9HtQs8CNoCVEP6rJ1QLuf1JgOrtD8
   oSpY4TAaW3X6O95RBoYwgBL/wwZD+zm7Ts7XFCGIuvMeb58SlU9/H+iMM
   Y3fpliZqDxCef5XdI/YegxCgzfRnbH5yygyxnCuiOf707hyRi+RY4r7Rs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348699277"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="348699277"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 06:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="690694619"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="690694619"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 May 2023 06:49:19 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puCr8-00022S-0v;
	Wed, 03 May 2023 13:49:18 +0000
Date: Wed, 3 May 2023 21:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:io_uring/get-buf-op 10/11] drivers/char/mem.c:704:34:
 sparse: sparse: incompatible types in comparison expression (different type
 sizes):
Message-ID: <202305032122.fYKyiZAk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux io_uring/get-buf-op
head:   d4d86a65af9ecafa81981e7b1ba804eaac7de023
commit: adf5ce0124b4b76a4ff143a16f598124e7116bad [10/11] TEST: mem: testing ->get_buf impl for /dev/null
config: parisc-randconfig-s051-20230430 (https://download.01.org/0day-ci/archive/20230503/202305032122.fYKyiZAk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/isilence/linux/commit/adf5ce0124b4b76a4ff143a16f598124e7116bad
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence io_uring/get-buf-op
        git checkout adf5ce0124b4b76a4ff143a16f598124e7116bad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305032122.fYKyiZAk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/mem.c:704:34: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/char/mem.c:704:34: sparse:    unsigned int *
>> drivers/char/mem.c:704:34: sparse:    unsigned long *

vim +704 drivers/char/mem.c

   692	
   693	
   694	static int zero_get_buf(struct file *file, struct iou_get_buf_info *bi)
   695	{
   696		struct iou_buf_desc *d = bi->desc;
   697		size_t done = 0;
   698	
   699		if (bi->off)
   700			return -EINVAL;
   701	
   702	
   703		while (done != bi->len && d->nr_bvecs < d->max_bvecs) {
 > 704			size_t cur_len = min(bi->len - done, PAGE_SIZE);
   705	
   706			get_page(null_char_page);
   707			bvec_set_page(&d->bvec[d->nr_bvecs], null_char_page, cur_len, 0);
   708			d->nr_bvecs++;
   709			done += cur_len;
   710		}
   711	
   712		d->private = NULL;
   713		d->release = zero_get_buf_release;
   714		return done;
   715	}
   716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
