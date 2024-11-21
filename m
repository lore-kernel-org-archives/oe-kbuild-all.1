Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1C14F10E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 19:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732217381; cv=none; b=FoOFGqoqI4Jm7MWmqlBrvwq2V8gZ2+PgfoUC7MlmZlcLfraMSsME+b8mEaAWzqRP8Bx+eBzuwDe1viWvE+Ob2GZ2WQV4SoJfHacHv5mET7jsBSma74/X4tpUvLyaTKK+ZMMp3WlRXoJ+tXTz8lwEOKZFNJzbvvoIjWSEdUPKRKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732217381; c=relaxed/simple;
	bh=JjK/H0JcoI2oNVdny5gYJS2VsYS79Nnm+1ASZb87bFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fpSniUXb+eGI5UjrJn+tajJx6Q+gbY+va+8Q42qzrXBi1UzpQRsUn+8GeiXi2hGUeNNt+j9XNP85RTjtYiEEgPDBqzfcOQJDTy1DhI0RPd1OdgCIuzzfIJG9/DUzYu11ERtU3GsCzgdax4OtFMDEl/Gnw+z9JGPEV+b27jEnow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWKrt7+X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWKrt7+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732217379; x=1763753379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JjK/H0JcoI2oNVdny5gYJS2VsYS79Nnm+1ASZb87bFc=;
  b=XWKrt7+X6c/jERoxd5mh2oO1LfgKimc0OFYOoDmafxgRHAwFpQHl8mIJ
   02UBZMSutGdrn7l6IGy9X2aIVUDKKNBBz1O2JY+bv0MLLhNraBS724cLK
   6dbdnmu8iObub8hcRgmakRUFh/eBPbJFevjfQC6Sfr7jSUzcAs+xi7lRt
   J23ywMoxsDcaZygZTsL5sDYzvWbbTXWLe4z1kIL0NQmtOY6blwSA8SLtd
   oJwNK6apKDBj6AFd8+e18wATD0VI3wDYNOl3Z2xtlWTJTtC/OnGHXlrh8
   R0EHnIIc/jPa1pNCroUQSO+EWL3ikSDN08/q21mne9JUVGYSzfTXaIppj
   g==;
X-CSE-ConnectionGUID: /7qEXBdESzewcTApJguJjQ==
X-CSE-MsgGUID: NnNCOzh2S4ujm0dut9TZJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="57752593"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="57752593"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 11:29:39 -0800
X-CSE-ConnectionGUID: 8LoVmwPcRXiciiA41bRq1A==
X-CSE-MsgGUID: ARX6hCV1SnKWRuProir/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90769165"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2024 11:29:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tECrw-0003HN-0Q;
	Thu, 21 Nov 2024 19:29:36 +0000
Date: Fri, 22 Nov 2024 03:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2462/2462]
 drivers/firmware/efi/libstub/../../../../lib/decompress_unlzo.c:46:12:
 warning: variable 'level' set but not used
Message-ID: <202411220334.X00IT0yA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4ad5a7cc835421f3f2799db98ef2f9d5143f076
commit: e467807275555a062593aa1e89f3201644ef0ea5 [2462/2462] efi/libstub: implement generic EFI zboot
config: arm64-randconfig-003-20241121 (https://download.01.org/0day-ci/archive/20241122/202411220334.X00IT0yA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220334.X00IT0yA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220334.X00IT0yA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/zboot.c:21:
   drivers/firmware/efi/libstub/../../../../lib/decompress_unlzo.c: In function 'parse_header':
>> drivers/firmware/efi/libstub/../../../../lib/decompress_unlzo.c:46:12: warning: variable 'level' set but not used [-Wunused-but-set-variable]
      46 |         u8 level = 0;
         |            ^~~~~
   drivers/firmware/efi/libstub/zboot.c: At top level:
   drivers/firmware/efi/libstub/zboot.c:162:1: warning: no previous prototype for 'efi_zboot_entry' [-Wmissing-prototypes]
     162 | efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
         | ^~~~~~~~~~~~~~~


vim +/level +46 drivers/firmware/efi/libstub/../../../../lib/decompress_unlzo.c

7dd65feb6c603e Albin Tonnerre 2010-01-08  40  
d97b07c54f34e8 Yinghai Lu     2014-08-08  41  STATIC inline long INIT parse_header(u8 *input, long *skip, long in_len)
7dd65feb6c603e Albin Tonnerre 2010-01-08  42  {
7dd65feb6c603e Albin Tonnerre 2010-01-08  43  	int l;
7dd65feb6c603e Albin Tonnerre 2010-01-08  44  	u8 *parse = input;
5a3f81a7029daf Lasse Collin   2011-01-12  45  	u8 *end = input + in_len;
7dd65feb6c603e Albin Tonnerre 2010-01-08 @46  	u8 level = 0;
7dd65feb6c603e Albin Tonnerre 2010-01-08  47  	u16 version;
7dd65feb6c603e Albin Tonnerre 2010-01-08  48  
5a3f81a7029daf Lasse Collin   2011-01-12  49  	/*
5a3f81a7029daf Lasse Collin   2011-01-12  50  	 * Check that there's enough input to possibly have a valid header.
5a3f81a7029daf Lasse Collin   2011-01-12  51  	 * Then it is possible to parse several fields until the minimum
5a3f81a7029daf Lasse Collin   2011-01-12  52  	 * size may have been used.
5a3f81a7029daf Lasse Collin   2011-01-12  53  	 */
5a3f81a7029daf Lasse Collin   2011-01-12  54  	if (in_len < HEADER_SIZE_MIN)
5a3f81a7029daf Lasse Collin   2011-01-12  55  		return 0;
5a3f81a7029daf Lasse Collin   2011-01-12  56  
7dd65feb6c603e Albin Tonnerre 2010-01-08  57  	/* read magic: 9 first bits */
7dd65feb6c603e Albin Tonnerre 2010-01-08  58  	for (l = 0; l < 9; l++) {
7dd65feb6c603e Albin Tonnerre 2010-01-08  59  		if (*parse++ != lzop_magic[l])
7dd65feb6c603e Albin Tonnerre 2010-01-08  60  			return 0;
7dd65feb6c603e Albin Tonnerre 2010-01-08  61  	}
7dd65feb6c603e Albin Tonnerre 2010-01-08  62  	/* get version (2bytes), skip library version (2),
7dd65feb6c603e Albin Tonnerre 2010-01-08  63  	 * 'need to be extracted' version (2) and
7dd65feb6c603e Albin Tonnerre 2010-01-08  64  	 * method (1) */
7dd65feb6c603e Albin Tonnerre 2010-01-08  65  	version = get_unaligned_be16(parse);
7dd65feb6c603e Albin Tonnerre 2010-01-08  66  	parse += 7;
7dd65feb6c603e Albin Tonnerre 2010-01-08  67  	if (version >= 0x0940)
7dd65feb6c603e Albin Tonnerre 2010-01-08  68  		level = *parse++;
7dd65feb6c603e Albin Tonnerre 2010-01-08  69  	if (get_unaligned_be32(parse) & HEADER_HAS_FILTER)
7dd65feb6c603e Albin Tonnerre 2010-01-08  70  		parse += 8; /* flags + filter info */
7dd65feb6c603e Albin Tonnerre 2010-01-08  71  	else
7dd65feb6c603e Albin Tonnerre 2010-01-08  72  		parse += 4; /* flags */
7dd65feb6c603e Albin Tonnerre 2010-01-08  73  
5a3f81a7029daf Lasse Collin   2011-01-12  74  	/*
5a3f81a7029daf Lasse Collin   2011-01-12  75  	 * At least mode, mtime_low, filename length, and checksum must
5a3f81a7029daf Lasse Collin   2011-01-12  76  	 * be left to be parsed. If also mtime_high is present, it's OK
5a3f81a7029daf Lasse Collin   2011-01-12  77  	 * because the next input buffer check is after reading the
5a3f81a7029daf Lasse Collin   2011-01-12  78  	 * filename length.
5a3f81a7029daf Lasse Collin   2011-01-12  79  	 */
5a3f81a7029daf Lasse Collin   2011-01-12  80  	if (end - parse < 8 + 1 + 4)
5a3f81a7029daf Lasse Collin   2011-01-12  81  		return 0;
5a3f81a7029daf Lasse Collin   2011-01-12  82  
7dd65feb6c603e Albin Tonnerre 2010-01-08  83  	/* skip mode and mtime_low */
7dd65feb6c603e Albin Tonnerre 2010-01-08  84  	parse += 8;
7dd65feb6c603e Albin Tonnerre 2010-01-08  85  	if (version >= 0x0940)
7dd65feb6c603e Albin Tonnerre 2010-01-08  86  		parse += 4;	/* skip mtime_high */
7dd65feb6c603e Albin Tonnerre 2010-01-08  87  
7dd65feb6c603e Albin Tonnerre 2010-01-08  88  	l = *parse++;
7dd65feb6c603e Albin Tonnerre 2010-01-08  89  	/* don't care about the file name, and skip checksum */
5a3f81a7029daf Lasse Collin   2011-01-12  90  	if (end - parse < l + 4)
5a3f81a7029daf Lasse Collin   2011-01-12  91  		return 0;
7dd65feb6c603e Albin Tonnerre 2010-01-08  92  	parse += l + 4;
7dd65feb6c603e Albin Tonnerre 2010-01-08  93  
7dd65feb6c603e Albin Tonnerre 2010-01-08  94  	*skip = parse - input;
7dd65feb6c603e Albin Tonnerre 2010-01-08  95  	return 1;
7dd65feb6c603e Albin Tonnerre 2010-01-08  96  }
7dd65feb6c603e Albin Tonnerre 2010-01-08  97  

:::::: The code at line 46 was first introduced by commit
:::::: 7dd65feb6c603e13eba501c34c662259ab38e70e lib: add support for LZO-compressed kernels

:::::: TO: Albin Tonnerre <albin.tonnerre@free-electrons.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
