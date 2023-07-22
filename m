Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D57F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690058823; x=1721594823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dt2Pd3xwelWBykpABQ5Y1MLXXdWNyLcC3Gz4kE8mFXs=;
  b=CvOTwBOkkGzbw87XZg8vvqzCcf3GXWeC9wMSmHdv+kpjrMyO6Tz9Z8Jd
   GR4mubd7qJ5HAlF1/d5Z8ve/UU4ZZfilEdWanJ9VMuFX9mg5/mY7iwCNi
   DMAVHaq/+oKC37DAWwPZzk9EsJRuMtt9hUk2OA1+zjkCwgPkFVPnmc5Pg
   OksU3f8lJwsY2FMgpR43vXW/nKCN/dXdHYq9JDAYcjDSYz9dA80NM+0bc
   A3uwjbwHnJAgVtji4S7YaMNzMdc72MPuXunrjouqt5Y0nklNQfjDPTR8+
   TjQjeMd+9OiR3rp+Do+ZE6MiSI4CVNmewMr2UnIowAurfm7cTi3yRz5aZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="366117327"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="366117327"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 13:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="702414944"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="702414944"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Jul 2023 13:47:01 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNJVE-0008bN-2E;
	Sat, 22 Jul 2023 20:47:00 +0000
Date: Sun, 23 Jul 2023 04:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 15/67]
 arch/riscv/kernel/image_kexec.c:196:13: warning: variable 'flags' set but
 not used
Message-ID: <202307230403.m2MThclL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 2bb12b43ee7b79381279d53c1fb92bb72f2ddc47 [15/67] riscv: kernel: kexec: Add image loader of kexec file support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230723/202307230403.m2MThclL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230403.m2MThclL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230403.m2MThclL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/image_kexec.c: In function 'image_load':
>> arch/riscv/kernel/image_kexec.c:196:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
     196 |         u64 flags;
         |             ^~~~~


vim +/flags +196 arch/riscv/kernel/image_kexec.c

   189	
   190	static void *image_load(struct kimage *image,
   191					char *kernel, unsigned long kernel_len,
   192					char *initrd, unsigned long initrd_len,
   193					char *cmdline, unsigned long cmdline_len)
   194	{
   195		struct riscv_image_header *h;
 > 196		u64 flags;
   197		bool be_image, be_kernel;
   198		struct kexec_buf kbuf;
   199		unsigned long text_offset, kernel_segment_number;
   200		unsigned long kernel_start;
   201		struct kexec_segment *kernel_segment;
   202		int ret;
   203	
   204		h = (struct riscv_image_header *)kernel;
   205		if (!h->image_size)
   206			return ERR_PTR(-EINVAL);
   207	
   208		/* Check cpu features */
   209		flags = le64_to_cpu(h->flags);
   210		be_image = __HEAD_FLAG(BE);
   211		be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
   212		if (be_image != be_kernel)
   213			return ERR_PTR(-EINVAL);
   214	
   215		/* Load the kernel */
   216		kbuf.image = image;
   217		kbuf.buf_min = 0;
   218		kbuf.buf_max = ULONG_MAX;
   219		kbuf.top_down = false;
   220	
   221		kbuf.buffer = kernel;
   222		kbuf.bufsz = kernel_len;
   223		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   224		kbuf.memsz = le64_to_cpu(h->image_size);
   225		text_offset = le64_to_cpu(h->text_offset);
   226		kbuf.buf_align = PAGE_SIZE;
   227	
   228		/* Adjust kernel segment with TEXT_OFFSET */
   229		kbuf.memsz += text_offset;
   230	
   231		kernel_segment_number = image->nr_segments;
   232	
   233		/*
   234		 * The location of the kernel segment may make it impossible to satisfy
   235		 * the other segment requirements, so we try repeatedly to find a
   236		 * location that will work.
   237		 */
   238		while ((ret = kexec_add_buffer(&kbuf)) == 0) {
   239			/* Try to load additional data */
   240			kernel_segment = &image->segment[kernel_segment_number];
   241			ret = load_other_segments(image, kernel_segment->mem,
   242						  kernel_segment->memsz, initrd,
   243						  initrd_len, cmdline);
   244			if (!ret)
   245				break;
   246	
   247			/*
   248			 * We couldn't find space for the other segments; erase the
   249			 * kernel segment and try the next available hole.
   250			 */
   251			image->nr_segments -= 1;
   252			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
   253			kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
   254		}
   255	
   256		if (ret) {
   257			pr_err("Could not find any suitable kernel location!");
   258			return ERR_PTR(ret);
   259		}
   260	
   261		kernel_segment = &image->segment[kernel_segment_number];
   262		kernel_segment->mem += text_offset;
   263		kernel_segment->memsz -= text_offset;
   264		kernel_start = kernel_segment->mem;
   265		image->start = kernel_start;
   266	
   267	
   268		pr_debug("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
   269					kernel_segment->mem, kbuf.bufsz,
   270					kernel_segment->memsz);
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
