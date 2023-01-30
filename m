Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB533FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675092428; x=1706628428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+b31D6x2nWpOJ1qlN6VLq1wwX1QYGMT+e15vXeSFQU=;
  b=VGORr6StDlXKwpMkFEayOS6PWGSOxkPiuxZBe9EyCHQPFvqW6hwrfRY+
   cQbjdOJFl1yCuhOs9jTISUw0d0aAH/Y3Mye/wr2yyQpfH2kwpWIv8MAub
   dWJwUGOK2iUucRTMvpe5sJrwH/SoLq7xrokTS+KN+j0dzu1ueeZ/XJl8J
   FotlRO38Y7mncb576Qvtg5RQYk43LDsdWfmksdnIDE5Z1YZBMHIUv/Odj
   jwiqeLnnuoi7cOm4k97wQct7EWn04d/tNzjrtiIed2QHhuaP4itqEOaC0
   kCvq54w3RJ53uOmCSYPTvkLKvU3EJrYAfkVp22cWK258LKlyQJNBanK4W
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311203581"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="311203581"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 07:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="788062623"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="788062623"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2023 07:27:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMW3m-0003hW-0A;
	Mon, 30 Jan 2023 15:27:06 +0000
Date: Mon, 30 Jan 2023 23:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:file_build_id 1/4] include/linux/buildid.h:31:13: error:
 no previous prototype for 'build_id_init'
Message-ID: <202301302306.4YB8aaQ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git file_build_id
head:   19769e82685efd26d7714d6f12601da7e48086e8
commit: 39dec2be008ec7c98f7ea818bc2c0f15a3586ef2 [1/4] mm: Store build id in file object
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230130/202301302306.4YB8aaQ3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=39dec2be008ec7c98f7ea818bc2c0f15a3586ef2
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf file_build_id
        git checkout 39dec2be008ec7c98f7ea818bc2c0f15a3586ef2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:14,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from arch/alpha/mm/init.c:20:
>> include/linux/buildid.h:31:13: error: no previous prototype for 'build_id_init' [-Werror=missing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: error: no previous prototype for 'build_id_free' [-Werror=missing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/alpha/mm/init.c:261:1: error: no previous prototype for 'srm_paging_stop' [-Werror=missing-prototypes]
     261 | srm_paging_stop (void)
         | ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/kallsyms.h:10,
                    from include/linux/ftrace.h:13,
                    from include/linux/perf_event.h:52,
                    from arch/alpha/mm/fault.c:28:
>> include/linux/buildid.h:31:13: error: no previous prototype for 'build_id_init' [-Werror=missing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: error: no previous prototype for 'build_id_free' [-Werror=missing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/alpha/mm/fault.c:85:1: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
      85 | do_page_fault(unsigned long address, unsigned long mmcsr,
         | ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   alpha-linux-ld: crypto/cipher.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; crypto/api.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: crypto/cipher.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; crypto/api.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: crypto/compress.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; crypto/api.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: crypto/compress.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; crypto/api.o:include/linux/buildid.h:32: first defined here
--
   alpha-linux-ld: crypto/scatterwalk.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; crypto/algapi.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: crypto/scatterwalk.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; crypto/algapi.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: crypto/proc.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; crypto/algapi.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: crypto/proc.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; crypto/algapi.o:include/linux/buildid.h:32: first defined here
--
   alpha-linux-ld: crypto/shash.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; crypto/ahash.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: crypto/shash.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; crypto/ahash.o:include/linux/buildid.h:32: first defined here
--
   alpha-linux-ld: crypto/scompress.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; crypto/acompress.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: crypto/scompress.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; crypto/acompress.o:include/linux/buildid.h:32: first defined here
--
   alpha-linux-ld: crypto/testmgr.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; crypto/algboss.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: crypto/testmgr.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; crypto/algboss.o:include/linux/buildid.h:32: first defined here
--
   In file included from include/linux/module.h:14,
                    from arch/alpha/lib/checksum.c:13:
>> include/linux/buildid.h:31:13: error: no previous prototype for 'build_id_init' [-Werror=missing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: error: no previous prototype for 'build_id_free' [-Werror=missing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   arch/alpha/lib/checksum.c:45:9: error: no previous prototype for 'csum_tcpudp_magic' [-Werror=missing-prototypes]
      45 | __sum16 csum_tcpudp_magic(__be32 saddr, __be32 daddr,
         |         ^~~~~~~~~~~~~~~~~
   arch/alpha/lib/checksum.c:54:8: error: no previous prototype for 'csum_tcpudp_nofold' [-Werror=missing-prototypes]
      54 | __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
         |        ^~~~~~~~~~~~~~~~~~
   arch/alpha/lib/checksum.c:145:9: error: no previous prototype for 'ip_fast_csum' [-Werror=missing-prototypes]
     145 | __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
         |         ^~~~~~~~~~~~
   arch/alpha/lib/checksum.c:163:8: error: no previous prototype for 'csum_partial' [-Werror=missing-prototypes]
     163 | __wsum csum_partial(const void *buff, int len, __wsum sum)
         |        ^~~~~~~~~~~~
   arch/alpha/lib/checksum.c:180:9: error: no previous prototype for 'ip_compute_csum' [-Werror=missing-prototypes]
     180 | __sum16 ip_compute_csum(const void *buff, int len)
         |         ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/module.h:14,
                    from arch/alpha/lib/fls.c:6:
>> include/linux/buildid.h:31:13: error: no previous prototype for 'build_id_init' [-Werror=missing-prototypes]
      31 | void __init build_id_init(void) { }
         |             ^~~~~~~~~~~~~
>> include/linux/buildid.h:32:6: error: no previous prototype for 'build_id_free' [-Werror=missing-prototypes]
      32 | void build_id_free(struct build_id *bid) { }
         |      ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   alpha-linux-ld: lib/crypto/utils.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; lib/crypto/memneq.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: lib/crypto/utils.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; lib/crypto/memneq.o:include/linux/buildid.h:32: first defined here
--
   alpha-linux-ld: fs/reiserfs/do_balan.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/do_balan.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/namei.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/namei.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/inode.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/inode.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/file.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/file.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/dir.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/dir.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/fix_node.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/fix_node.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/super.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/super.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/prints.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/prints.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/objectid.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/objectid.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/lbalance.o: in function `build_id_init':
>> include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/lbalance.o: in function `build_id_free':
>> include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/ibalance.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/ibalance.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/stree.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/stree.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/hashes.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/hashes.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/tail_conversion.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/tail_conversion.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/journal.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/journal.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/resize.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/resize.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/item_ops.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/item_ops.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/ioctl.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/ioctl.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/xattr.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/xattr.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
   alpha-linux-ld: fs/reiserfs/lock.o: in function `build_id_init':
   include/linux/buildid.h:31: multiple definition of `build_id_init'; fs/reiserfs/bitmap.o:include/linux/buildid.h:31: first defined here
   alpha-linux-ld: fs/reiserfs/lock.o: in function `build_id_free':
   include/linux/buildid.h:32: multiple definition of `build_id_free'; fs/reiserfs/bitmap.o:include/linux/buildid.h:32: first defined here
..


vim +/build_id_init +31 include/linux/buildid.h

    25	
    26	#ifdef CONFIG_FILE_BUILD_ID
    27	void __init build_id_init(void);
    28	void build_id_free(struct build_id *bid);
    29	int vma_get_build_id(struct vm_area_struct *vma, struct build_id **bidp);
    30	#else
  > 31	void __init build_id_init(void) { }
  > 32	void build_id_free(struct build_id *bid) { }
    33	#endif /* CONFIG_FILE_BUILD_ID */
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
