Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00CE3CD0A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696362456; x=1727898456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XhWX0mo6IDkzAmNiLip4Nk12hj871k8GglZsu47twrQ=;
  b=ay9QoFM7073NZ4lK7ZMWMwDIxpO+Uj2uY1Lf4kTQEHsZcTL/rRL0ssdr
   hhr9IBscwQIBe2AR3V3WJSiXGesACGrVl/XndSBeUkoi9PL7BaCklnsDh
   zeMszB4ZXaqryS9tzflTjh35+GFe/Vk6jgNeH55fCIthWOyo+R85s7YuU
   /pMDYgyjF880PbWfXc/wi/ZJ7yxYZtwg/2bpLdlvrRIp46an+FMwG7+q/
   /+i8WVTd6Ht07apAvZrgl0szxi8rQu9Lckb9VHN7f+/5I3uqf41wIuaKy
   DOaS3SNFfckUzVeMe7nTx75nl9qIh0uHo+V0Ap3ZFvrzfoiI8uVFLcSti
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382872570"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="382872570"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 12:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754567338"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="754567338"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Oct 2023 12:47:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnlMH-0008mS-2q;
	Tue, 03 Oct 2023 19:47:06 +0000
Date: Wed, 4 Oct 2023 03:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Nikhil V <quic_nprakash@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] PM: hibernate: Move to crypto APIs for LZO
 compression
Message-ID: <202310040306.hi7B23MY-lkp@intel.com>
References: <486273fb828eb56d1895fee49481f5c035df8300.1695711299.git.quic_nprakash@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <486273fb828eb56d1895fee49481f5c035df8300.1695711299.git.quic_nprakash@quicinc.com>

Hi Nikhil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc4 next-20231003]
[cannot apply to pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikhil-V/PM-hibernate-Rename-lzo-to-make-it-generic/20230926-170135
base:   linus/master
patch link:    https://lore.kernel.org/r/486273fb828eb56d1895fee49481f5c035df8300.1695711299.git.quic_nprakash%40quicinc.com
patch subject: [RFC PATCH 2/4] PM: hibernate: Move to crypto APIs for LZO compression
config: sh-sh7770_generic_defconfig (https://download.01.org/0day-ci/archive/20231004/202310040306.hi7B23MY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040306.hi7B23MY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040306.hi7B23MY-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/power/hibernate.o: in function `software_resume':
>> hibernate.c:(.text+0xd0c): undefined reference to `crypto_has_alg'
   sh4-linux-ld: kernel/power/hibernate.o: in function `hibernate':
   hibernate.c:(.text+0x1218): undefined reference to `crypto_has_alg'
   sh4-linux-ld: kernel/power/swap.o: in function `compress_threadfn':
>> swap.c:(.text+0x5d8): undefined reference to `crypto_comp_compress'
   sh4-linux-ld: kernel/power/swap.o: in function `decompress_threadfn':
>> swap.c:(.text+0x728): undefined reference to `crypto_comp_decompress'
   sh4-linux-ld: kernel/power/swap.o: in function `load_compressed_image':
>> swap.c:(.text+0x9ec): undefined reference to `crypto_alloc_base'
>> sh4-linux-ld: swap.c:(.text+0xe7c): undefined reference to `crypto_destroy_tfm'
   sh4-linux-ld: kernel/power/swap.o: in function `save_compressed_image':
   swap.c:(.text+0x14f8): undefined reference to `crypto_alloc_base'
   sh4-linux-ld: swap.c:(.text+0x169c): undefined reference to `crypto_destroy_tfm'
   sh4-linux-ld: crypto/lzo.o: in function `lzo_decompress':
>> lzo.c:(.text+0x50): undefined reference to `lzo1x_decompress_safe'
   sh4-linux-ld: crypto/lzo.o: in function `lzo_compress':
>> lzo.c:(.text+0xb0): undefined reference to `lzo1x_1_compress'
   sh4-linux-ld: crypto/lzo.o: in function `lzo_sdecompress':
   lzo.c:(.text+0x144): undefined reference to `lzo1x_decompress_safe'
   sh4-linux-ld: crypto/lzo.o: in function `lzo_scompress':
   lzo.c:(.text+0x1a0): undefined reference to `lzo1x_1_compress'
   sh4-linux-ld: crypto/lzo.o: in function `lzo_mod_fini':
>> lzo.c:(.exit.text+0x14): undefined reference to `crypto_unregister_alg'
>> sh4-linux-ld: lzo.c:(.exit.text+0x20): undefined reference to `crypto_unregister_scomp'
   sh4-linux-ld: crypto/lzo.o: in function `lzo_mod_init':
>> lzo.c:(.init.text+0x30): undefined reference to `crypto_register_alg'
>> sh4-linux-ld: lzo.c:(.init.text+0x38): undefined reference to `crypto_register_scomp'
>> sh4-linux-ld: lzo.c:(.init.text+0x40): undefined reference to `crypto_unregister_alg'
   sh4-linux-ld: crypto/lzo-rle.o: in function `lzorle_decompress':
>> lzo-rle.c:(.text+0x50): undefined reference to `lzo1x_decompress_safe'
   sh4-linux-ld: crypto/lzo-rle.o: in function `lzorle_compress':
>> lzo-rle.c:(.text+0xb0): undefined reference to `lzorle1x_1_compress'
   sh4-linux-ld: crypto/lzo-rle.o: in function `lzorle_sdecompress':
   lzo-rle.c:(.text+0x144): undefined reference to `lzo1x_decompress_safe'
   sh4-linux-ld: crypto/lzo-rle.o: in function `lzorle_scompress':
   lzo-rle.c:(.text+0x1a0): undefined reference to `lzorle1x_1_compress'
   sh4-linux-ld: crypto/lzo-rle.o: in function `lzorle_mod_fini':
>> lzo-rle.c:(.exit.text+0x14): undefined reference to `crypto_unregister_alg'
>> sh4-linux-ld: lzo-rle.c:(.exit.text+0x20): undefined reference to `crypto_unregister_scomp'
   sh4-linux-ld: crypto/lzo-rle.o: in function `lzorle_mod_init':
>> lzo-rle.c:(.init.text+0x30): undefined reference to `crypto_register_alg'
>> sh4-linux-ld: lzo-rle.c:(.init.text+0x38): undefined reference to `crypto_register_scomp'
>> sh4-linux-ld: lzo-rle.c:(.init.text+0x40): undefined reference to `crypto_unregister_alg'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
   Depends on [n]: CRYPTO [=n]
   Selected by [y]:
   - HIBERNATION [=y] && SWAP [=y] && ARCH_HIBERNATION_POSSIBLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
