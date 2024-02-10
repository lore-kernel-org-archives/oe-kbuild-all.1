Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87626AFC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707564203; cv=none; b=IMyPVv8TwXlVVsExJJTe0bl//UsuOeO1NRItkhSQLYLRSzbrl+gczz36kUlvx4Mxbce0iopMMtZ7E32u8DEqRSFYIbIKu9LfQp9rcRlXjISxw4tMXhi4OY0A//wWP2QTgZWqimSapGZd1ra2Dn9K191XuUTCga17brMLVWnigbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707564203; c=relaxed/simple;
	bh=Jt2XHCZBJmyLtQKThagcyln3XnnHY6Ko/uxU2R0urIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2RCR2OpD/z24Jnos5FYnPbduuG0xHB81iIxm+MwOwWHCM+Kq71doythg2UA4Llxq4vYcT65JxAoMrlYD4e/1wYjLpqMseRbDG0DKEnYT0qazPWhtUcUmVNutk+PrPy84hwgNAa2DsB77xvVCTpIfbxSruDE5UeeZx0AHXGPH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PH4BL3OT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PH4BL3OT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707564200; x=1739100200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jt2XHCZBJmyLtQKThagcyln3XnnHY6Ko/uxU2R0urIU=;
  b=PH4BL3OTkzwd7gl4vAVOhZDTFOk2ulKpIZEJ9hV973/CR3TundzVHj4g
   Hfm1you8IaIbvipsCBuZFEcWxsDMacbIJxKLff7fzwXI8CE3QmVn+bGBU
   UgmPwGPSVXPSnZZdcyV13NDN7F/CY71vWeYcvTB9FV3n97E/47IGuI6oL
   9LnzNrp3DpjDHDPoLV7u9fZvmbCrkz8wz3urTlkyi45ZzPh80dos/bOIT
   BPyLk2IjCso0WpdTmrgVJQO5vylPhY391+OpDVJXGnIZj+vETa6L2uxpP
   uHV418pioVkttsIHbGoLF5ZznS4OX1cCbmd9dDk3FD9CQMDulJ8IBBZz6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1689237"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1689237"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 03:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="6809180"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Feb 2024 03:23:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYlRz-0005bW-14;
	Sat, 10 Feb 2024 11:23:15 +0000
Date: Sat, 10 Feb 2024 19:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, Lukasz Bartosik <lb@semihalf.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_2 9/42] drivers/crypto/caam/caamrng.c:195:17:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202402101901.H9XOF9QZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_2
head:   5146eacff4028adae1aabf9af4bcf217ea17a472
commit: f8d052f79bf3d7d6a368d0618852557817f74b4a [9/42] dyndbg: move flags field to a new structure
config: powerpc-randconfig-r133-20240209 (https://download.01.org/0day-ci/archive/20240210/202402101901.H9XOF9QZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce: (https://download.01.org/0day-ci/archive/20240210/202402101901.H9XOF9QZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101901.H9XOF9QZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/caam/caamrng.c:195:17: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamrng.c:195:17: sparse:   also defined here
>> drivers/crypto/caam/caamrng.c:195:17: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamrng.c:195:17: sparse:   also defined here
--
>> drivers/crypto/caam/caamhash.c:597:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamhash.c:597:9: sparse:   also defined here
   drivers/crypto/caam/caamhash.c:609:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamhash.c:609:9: sparse:   also defined here
   drivers/crypto/caam/caamhash.c:648:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamhash.c:648:9: sparse:   also defined here
   drivers/crypto/caam/caamhash.c:663:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamhash.c:663:9: sparse:   also defined here
   drivers/crypto/caam/caamhash.c:667:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamhash.c:667:9: sparse:   also defined here
   drivers/crypto/caam/caamhash.c:671:17: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamhash.c:671:17: sparse:   also defined here
   drivers/crypto/caam/caamhash.c: note: in included file:
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here

vim +195 drivers/crypto/caam/caamrng.c

e24f7c9e87d46fa Yuan Kang                 2012-06-22  174  
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  175) #ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_RNG_TEST
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  176) static inline void test_len(struct hwrng *rng, size_t len, bool wait)
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  177) {
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  178) 	u8 *buf;
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  179) 	int read_len;
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  180) 	struct caam_rng_ctx *ctx = to_caam_rng_ctx(rng);
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  181) 	struct device *dev = ctx->ctrldev;
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  182) 
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  183) 	buf = kcalloc(CAAM_RNG_MAX_FIFO_STORE_SIZE, sizeof(u8), GFP_KERNEL);
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  184) 
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  185) 	while (len > 0) {
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  186) 		read_len = rng->read(rng, buf, len, wait);
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  187) 
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  188) 		if (read_len < 0 || (read_len == 0 && wait)) {
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  189) 			dev_err(dev, "RNG Read FAILED received %d bytes\n",
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  190) 				read_len);
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  191) 			kfree(buf);
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  192) 			return;
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  193) 		}
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  194) 
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12 @195) 		print_hex_dump_debug("random bytes@: ",
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  196) 			DUMP_PREFIX_ADDRESS, 16, 4,
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  197) 			buf, read_len, 1);
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  198) 
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  199) 		len = len - read_len;
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  200) 	}
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  201) 
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  202) 	kfree(buf);
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  203) }
2be0d806e25e7b0 Victoria Milhoan (b42089  2023-06-12  204) 

:::::: The code at line 195 was first introduced by commit
:::::: 2be0d806e25e7b068113187f9245575914daf0dc crypto: caam - add a test for the RNG

:::::: TO: Victoria Milhoan (b42089) <vicki.milhoan@freescale.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
