Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027B15CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 01:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708997706; cv=none; b=t2H0IVWLm0ytVzyN4jNvWIyJTdTTn0VpuOk0sMliuDMo4ylReq2Bz4y9eka5qJ3dySrju9pXxobQjjdaTUigxVMR++1JNAktm7XoWGQ5u1oIMHnN5sxfvxL17Up7sQgqgDNKWhPRr7TQdEML9GQBQW4lxSKECvmWIjmvFyjvJ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708997706; c=relaxed/simple;
	bh=MamqqKrQieCv6OADsK1CHB6usvph8ujJHYMqxQx7wMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mRgu9lnNhewXe6D3TaWzAh8KTWZF4EGEuATF8bghYCYi2XE6dK+87WK+m8RqWzaUwZwdV+NiaBvmgjPvt25cC7sGoI1LBRJwZwOFji2Oy8Iles67Di2FvFaaRL7auCOQ/FrQC5oeh3X2vTl9Zc5x+qz50pYTHIqEWejcv3jiDtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmQwkfSy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmQwkfSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708997704; x=1740533704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MamqqKrQieCv6OADsK1CHB6usvph8ujJHYMqxQx7wMM=;
  b=AmQwkfSyysvtDFfzAtabpEeNFhR2GiHp7gArWQ0xpRKz9OfdbSgpGKZ9
   uxsUg3Mh34KxJ2j6PVQD+k9+yeE9Oc0bPPgS5BzBriAPwtoKUHBJuRfBg
   gFmf3KVz4qTM2pRmDHP57wTYV1ktY++xbq7f79t3fr+H9Cvmhsf2SeXDh
   POOyBezxeUg2chcNlw8f35aNR4XDIz8VophuwIRRjyJ55UzIftAn/SxNF
   LEssqpUUpy28iqBbJwCeS1f3KMvQPacLeZkOMUX/ox0rgfuwn/wKuYK+l
   kTBQ+AsCAKa47Aw3da/GjsYU2tpGVqZ7vIEZ0P6PeoI4NV9EFOvQglflT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14757274"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="14757274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 17:35:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7406510"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Feb 2024 17:35:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1remN1-000Apl-0r;
	Tue, 27 Feb 2024 01:34:59 +0000
Date: Tue, 27 Feb 2024 09:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Regan <dregan@broadcom.com>
Subject: [mtd:nand/next 22/25]
 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:79:41: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202402270940.gmVLVRg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
head:   65a7f244b15684856241d04b8f3287d9124bd1ff
commit: c52c16d1bee5c3b074989e839eeceed2a0a8cc43 [22/25] mtd: rawnand: brcmnand: Add BCMBCA read data bus interface
config: riscv-randconfig-r131-20240227 (https://download.01.org/0day-ci/archive/20240227/202402270940.gmVLVRg0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce: (https://download.01.org/0day-ci/archive/20240227/202402270940.gmVLVRg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402270940.gmVLVRg0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:79:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +79 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c

    70	
    71	static void bcmbca_read_data_bus(struct brcmnand_soc *soc,
    72					 void __iomem *flash_cache,  u32 *buffer, int fc_words)
    73	{
    74		/*
    75		 * memcpy can do unaligned aligned access depending on source
    76		 * and dest address, which is incompatible with nand cache. Fallback
    77		 * to the memcpy_fromio in such case
    78		 */
  > 79		if (bcmbca_nand_is_buf_aligned((void *)flash_cache, buffer))
    80			memcpy((void *)buffer, (void *)flash_cache, fc_words * 4);
    81		else
    82			memcpy_fromio((void *)buffer, flash_cache, fc_words * 4);
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
