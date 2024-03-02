Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328EC10E5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 00:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709340734; cv=none; b=StwM3ouukwd1K6KE7HyrXrV2+Q63ndsDfpzEtrLD73+ucBJ2oWOEtConin0XH0CjeBCn9e6j4maoEBSvbO/kP/29G5RVhcvf3mo5PiWw3ncgGEJ+YB8gI5Q0vVVTJn7SkGJfdIYG1k9k2WcOfF6V4vPw+IaBh0QV/AsjtDw3d/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709340734; c=relaxed/simple;
	bh=Fi25zEviNs0gYOOftP8GwTeFU31Ou2kcbMGqF7M6vL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzvVi6l5gJqRRYF3nnLF4O/4lAE+lND0araInpv3X1m/jSiiPrj+d9qUdspGXnV0186AM42mHXFgauIgdksnIKGDfIB+o9puaF/uHEGjSl6YsivthNgFjUqIfoWvQF2L4Z9QrJ87ytra8+oXd7lPV3YPW/gDLXs+/h/Yqzo1Otk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPlLSM07; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPlLSM07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709340732; x=1740876732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fi25zEviNs0gYOOftP8GwTeFU31Ou2kcbMGqF7M6vL4=;
  b=NPlLSM07VTraa/mgsljbchJHatvKzFCHDXpHE7b/IB69LMf6aNpwnQrd
   5eX3WHJgXHNSk1JwLuvysycFUnfchoO2snAFlaMmmELxFrSOWqH6UJMyG
   ISVcJasrVj4pjW2JmFIyV7Wc8jPbtH+YDY+QBZRGq+yCEThAU2KUS+dOr
   lzqfR9GmuvstmZcBUFlkIapKpsIAdcHAjk/55nv0RFWJTMvI3ZZ8vmEh8
   zoTOTjYwwAiR64qlPANwvSoGV5FnLVjJDK1uz+sthWE4yLGIHMwUI9m/H
   pVeb8fO0jRSLr772M93JkgLrNFTbR90yRrRcFCOAlRyMMhoTrAdzNgJaZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4478500"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="4478500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="12883179"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2024 16:52:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgDbk-000ECb-0C;
	Sat, 02 Mar 2024 00:52:08 +0000
Date: Sat, 2 Mar 2024 08:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Richard Weinberger <richard@nod.at>
Subject: [linux-next:master 9546/11394] drivers/mtd/ubi/nvmem.c:34:16:
 sparse: sparse: incompatible types in comparison expression (different type
 sizes):
Message-ID: <202403020803.FQFeCxpT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: 3ce485803da1b79b2692b6d0c2792829292ad838 [9546/11394] mtd: ubi: provide NVMEM layer over UBI volumes
config: mips-randconfig-r113-20240302 (https://download.01.org/0day-ci/archive/20240302/202403020803.FQFeCxpT-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce: (https://download.01.org/0day-ci/archive/20240302/202403020803.FQFeCxpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020803.FQFeCxpT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/ubi/nvmem.c:34:16: sparse: sparse: incompatible types in comparison expression (different type sizes):
   drivers/mtd/ubi/nvmem.c:34:16: sparse:    int *
   drivers/mtd/ubi/nvmem.c:34:16: sparse:    unsigned long long [usertype] *
   drivers/mtd/ubi/nvmem.c:34:16: sparse: sparse: shift too big (32) for type int
   drivers/mtd/ubi/nvmem.c: note: in included file (through drivers/mtd/ubi/ubi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +34 drivers/mtd/ubi/nvmem.c

    22	
    23	static int ubi_nvmem_reg_read(void *priv, unsigned int from,
    24				      void *val, size_t bytes)
    25	{
    26		int err = 0, lnum = from, offs, bytes_left = bytes, to_read;
    27		struct ubi_nvmem *unv = priv;
    28		struct ubi_volume_desc *desc;
    29	
    30		desc = ubi_open_volume(unv->ubi_num, unv->vol_id, UBI_READONLY);
    31		if (IS_ERR(desc))
    32			return PTR_ERR(desc);
    33	
  > 34		offs = do_div(lnum, unv->usable_leb_size);
    35		while (bytes_left) {
    36			to_read = unv->usable_leb_size - offs;
    37	
    38			if (to_read > bytes_left)
    39				to_read = bytes_left;
    40	
    41			err = ubi_read(desc, lnum, val, offs, to_read);
    42			if (err)
    43				break;
    44	
    45			lnum += 1;
    46			offs = 0;
    47			bytes_left -= to_read;
    48			val += to_read;
    49		}
    50		ubi_close_volume(desc);
    51	
    52		if (err)
    53			return err;
    54	
    55		return bytes_left == 0 ? 0 : -EIO;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
