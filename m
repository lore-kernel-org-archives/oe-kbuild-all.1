Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE736118
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679667688; x=1711203688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fq1BTtMuUe6eAqfA/voJiqIJ7yM3SL03TVBjbDKOxMo=;
  b=eEVZrjafxNDyT5VOZcYoHFaahGev3YDSHKf0fbAtfyRPwPddNd9Cb+NM
   uQPPPhMCp6AWqt6oFK8ks4+oBCff8sVHV827QSMmOyxjXAL9ErJNOXTt5
   EZF8V/kT2MEWBzBUknQQiXUNRIWtKCOhX2Mvsn+QMgJNZptZbHCCMiqHQ
   HPvYh89f6L4X+672CTiiXLeHriqYpaGEYDxF7+BSyjz4T6Dv9tD5Fqr50
   C84x+CqlnOTQIyyXzvJXme/QeGOSMGId0S1RIG0oEjbSLhpOjok4DOSzB
   zVy2vn0dlmTZFa6Vpz7WY7xzXsaw6CdcrODlXTL4fFACgGrT1NPrGH2C/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337289013"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="337289013"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 07:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676148714"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="676148714"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2023 07:21:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfiI9-000FMg-1K;
	Fri, 24 Mar 2023 14:21:17 +0000
Date: Fri, 24 Mar 2023 22:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 6/8]
 fs/cifs/smbdirect.c:2503:40: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202303242255.WI4MyXWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   b5fe3402030c1ea066167108866fd21881895594
commit: 1df3431f995d6bb7a731770a7393c3011b52a581 [6/8] ARM: mm: Make virt_to_pfn() a static inline
config: arm-randconfig-s033-20230322 (https://download.01.org/0day-ci/archive/20230324/202303242255.WI4MyXWW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=1df3431f995d6bb7a731770a7393c3011b52a581
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout 1df3431f995d6bb7a731770a7393c3011b52a581
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash fs/cifs/ fs/netfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242255.WI4MyXWW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/cifs/smbdirect.c:2503:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *p @@     got unsigned long [assigned] kaddr @@
   fs/cifs/smbdirect.c:2503:40: sparse:     expected void const *p
   fs/cifs/smbdirect.c:2503:40: sparse:     got unsigned long [assigned] kaddr
--
   fs/cifs/smb2ops.c: note: in included file:
>> fs/cifs/cifsglob.h:2216:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *p @@     got unsigned long [assigned] addr @@
   fs/cifs/cifsglob.h:2216:29: sparse:     expected void const *p
   fs/cifs/cifsglob.h:2216:29: sparse:     got unsigned long [assigned] addr
>> fs/cifs/cifsglob.h:2216:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *p @@     got unsigned long [assigned] addr @@
   fs/cifs/cifsglob.h:2216:29: sparse:     expected void const *p
   fs/cifs/cifsglob.h:2216:29: sparse:     got unsigned long [assigned] addr
--
>> fs/netfs/iterator.c:243:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *p @@     got unsigned long [assigned] kaddr @@
   fs/netfs/iterator.c:243:40: sparse:     expected void const *p
   fs/netfs/iterator.c:243:40: sparse:     got unsigned long [assigned] kaddr

vim +2503 fs/cifs/smbdirect.c

e5fbdde4301711 David Howells 2022-10-27  2465  
e5fbdde4301711 David Howells 2022-10-27  2466  /*
e5fbdde4301711 David Howells 2022-10-27  2467   * Extract fragments from a KVEC-class iterator and add them to an RDMA list.
e5fbdde4301711 David Howells 2022-10-27  2468   * This can deal with vmalloc'd buffers as well as kmalloc'd or static buffers.
e5fbdde4301711 David Howells 2022-10-27  2469   * The pages are not pinned.
e5fbdde4301711 David Howells 2022-10-27  2470   */
e5fbdde4301711 David Howells 2022-10-27  2471  static ssize_t smb_extract_kvec_to_rdma(struct iov_iter *iter,
e5fbdde4301711 David Howells 2022-10-27  2472  					struct smb_extract_to_rdma *rdma,
e5fbdde4301711 David Howells 2022-10-27  2473  					ssize_t maxsize)
e5fbdde4301711 David Howells 2022-10-27  2474  {
e5fbdde4301711 David Howells 2022-10-27  2475  	const struct kvec *kv = iter->kvec;
e5fbdde4301711 David Howells 2022-10-27  2476  	unsigned long start = iter->iov_offset;
e5fbdde4301711 David Howells 2022-10-27  2477  	unsigned int i;
e5fbdde4301711 David Howells 2022-10-27  2478  	ssize_t ret = 0;
e5fbdde4301711 David Howells 2022-10-27  2479  
e5fbdde4301711 David Howells 2022-10-27  2480  	for (i = 0; i < iter->nr_segs; i++) {
e5fbdde4301711 David Howells 2022-10-27  2481  		struct page *page;
e5fbdde4301711 David Howells 2022-10-27  2482  		unsigned long kaddr;
e5fbdde4301711 David Howells 2022-10-27  2483  		size_t off, len, seg;
e5fbdde4301711 David Howells 2022-10-27  2484  
e5fbdde4301711 David Howells 2022-10-27  2485  		len = kv[i].iov_len;
e5fbdde4301711 David Howells 2022-10-27  2486  		if (start >= len) {
e5fbdde4301711 David Howells 2022-10-27  2487  			start -= len;
e5fbdde4301711 David Howells 2022-10-27  2488  			continue;
e5fbdde4301711 David Howells 2022-10-27  2489  		}
e5fbdde4301711 David Howells 2022-10-27  2490  
e5fbdde4301711 David Howells 2022-10-27  2491  		kaddr = (unsigned long)kv[i].iov_base + start;
e5fbdde4301711 David Howells 2022-10-27  2492  		off = kaddr & ~PAGE_MASK;
e5fbdde4301711 David Howells 2022-10-27  2493  		len = min_t(size_t, maxsize, len - start);
e5fbdde4301711 David Howells 2022-10-27  2494  		kaddr &= PAGE_MASK;
e5fbdde4301711 David Howells 2022-10-27  2495  
e5fbdde4301711 David Howells 2022-10-27  2496  		maxsize -= len;
e5fbdde4301711 David Howells 2022-10-27  2497  		do {
e5fbdde4301711 David Howells 2022-10-27  2498  			seg = min_t(size_t, len, PAGE_SIZE - off);
e5fbdde4301711 David Howells 2022-10-27  2499  
e5fbdde4301711 David Howells 2022-10-27  2500  			if (is_vmalloc_or_module_addr((void *)kaddr))
e5fbdde4301711 David Howells 2022-10-27  2501  				page = vmalloc_to_page((void *)kaddr);
e5fbdde4301711 David Howells 2022-10-27  2502  			else
e5fbdde4301711 David Howells 2022-10-27 @2503  				page = virt_to_page(kaddr);
e5fbdde4301711 David Howells 2022-10-27  2504  
e5fbdde4301711 David Howells 2022-10-27  2505  			if (!smb_set_sge(rdma, page, off, seg))
e5fbdde4301711 David Howells 2022-10-27  2506  				return -EIO;
e5fbdde4301711 David Howells 2022-10-27  2507  
e5fbdde4301711 David Howells 2022-10-27  2508  			ret += seg;
e5fbdde4301711 David Howells 2022-10-27  2509  			len -= seg;
e5fbdde4301711 David Howells 2022-10-27  2510  			kaddr += PAGE_SIZE;
e5fbdde4301711 David Howells 2022-10-27  2511  			off = 0;
e5fbdde4301711 David Howells 2022-10-27  2512  		} while (len > 0 && rdma->nr_sge < rdma->max_sge);
e5fbdde4301711 David Howells 2022-10-27  2513  
e5fbdde4301711 David Howells 2022-10-27  2514  		if (rdma->nr_sge >= rdma->max_sge || maxsize <= 0)
e5fbdde4301711 David Howells 2022-10-27  2515  			break;
e5fbdde4301711 David Howells 2022-10-27  2516  		start = 0;
e5fbdde4301711 David Howells 2022-10-27  2517  	}
e5fbdde4301711 David Howells 2022-10-27  2518  
e5fbdde4301711 David Howells 2022-10-27  2519  	return ret;
e5fbdde4301711 David Howells 2022-10-27  2520  }
e5fbdde4301711 David Howells 2022-10-27  2521  

:::::: The code at line 2503 was first introduced by commit
:::::: e5fbdde430171175f32094c8059eea0d0e2487ae cifs: Add a function to build an RDMA SGE list from an iterator

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
