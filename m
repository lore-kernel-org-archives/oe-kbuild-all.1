Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940841714DF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720146; cv=none; b=UrDco/o82E3zZUzQ+Dp8SRJJJWsoPGTagd5ir8fzf/hcP3KHUTTLmHoJ54thhH3N75qDGRu2EEV6GQqtDaxJJ1giAq2IKubfie9TB+Lg1RaqXOkDpYM1Qa9a5YwygLeVoixX4/KqIj1EXF6dskPV3R2OI3vdrUrgrDdHVK+pGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720146; c=relaxed/simple;
	bh=Er0ppci1e3Qq1P/QHO2xqYT5McimtlrgHzBKOVCaDn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/H3RW31Sj/6r9FujedFXvynrmfmOELIOfnucDcxizgO4m2dPtccVUa18MEznQXlwFuNxMegLr2E0m/SPUeVEFyGYCsrwXFZTvU6Iy0PcNpgX+d5SweiUUtw+WgnlHk7YZ6zxuzbSDYNf+VS0WzOIdipgjWTtAwgr/eVUWx9srw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3s4YrWG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3s4YrWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720143; x=1765256143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Er0ppci1e3Qq1P/QHO2xqYT5McimtlrgHzBKOVCaDn4=;
  b=h3s4YrWG2iZSSPI5eUIqbpEMVgpDCrmWGSObAjmbY4jb3t8VeAxC6/2t
   +vCIX5v9qQ8ssZ5QdFbyiXrc9VDmZECUFK3gNgSnUqFwrXwybDfyon8YK
   RuFLYeksZzU40MAm2wSm6hAoeKs7ekPCQVPCVGMTYnB3xCD5T0E2AJ7Jv
   GamIJzlZLDdd7Dy+8WyYd2RVo5im2VMS6oaoV1NTBB5GTme8ksBM0IQ4S
   PfXhWK4j9swc+q9cup07lEbzrgtb5MvywwTbcCecgKc1K6HLeI2JAShId
   l5OJyUA2/I+HafpHrmXlWDg8Fp/gGpvuwC/DxjuXwQhvLknhMsxwvyhfC
   g==;
X-CSE-ConnectionGUID: VSize7zpTbqRJvLRajofcA==
X-CSE-MsgGUID: CYYAmHxQQoaJV44t4N8P3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45015906"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45015906"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:55:42 -0800
X-CSE-ConnectionGUID: vSnZbT+LRAytURHJ1yuPAA==
X-CSE-MsgGUID: oFZEPkn6Q7C2JdlHaP+abQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95753995"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:55:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVo2-0003wV-0e;
	Mon, 09 Dec 2024 04:55:38 +0000
Date: Mon, 9 Dec 2024 12:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse:
 dubious one-bit signed bitfield
Message-ID: <202412090615.w2vIvo64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: a398c3637a33330c134f067e06df959550d44f7b [2544/2544] drivers: initial support for rnpgbe drivers from Mucse Technology
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241209/202412090615.w2vIvo64-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412090615.w2vIvo64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090615.w2vIvo64-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_common.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:148:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:148:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:148:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2477:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2477:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2477:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2509:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2509:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2509:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2546:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2546:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:2546:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3838:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3838:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3838:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3841:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3841:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3841:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3932:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3932:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3932:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3935:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3935:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:3935:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4135:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4135:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4135:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4203:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4203:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:4203:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6780:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6780:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6780:17: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:768:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:768:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c:768:9: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c: note: in included file (through include/linux/kernel.h, include/linux/interrupt.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/interrupt.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/wait.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c:278:25: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c:278:25: sparse:    void
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_param.c:278:25: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ptp.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/timer.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ptp.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ptp.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ptp.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sfc.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sfc.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sfc.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sfc.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sysfs.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sysfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sysfs.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sysfs.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_debugfs.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/wait.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_debugfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_debugfs.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_debugfs.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h, drivers/net/ethernet/mucse/rnpgbe/rnpgbe_type.h, ...):
>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:158:38: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:159:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:160:54: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:161:41: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:162:40: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:163:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:164:35: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:165:39: sparse: sparse: dubious one-bit signed bitfield
   drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h:166:40: sparse: sparse: dubious one-bit signed bitfield

vim +158 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.h

   136	
   137	struct phy_abilities {
   138		unsigned char link_stat;
   139		unsigned char lane_mask;
   140	
   141		int speed;
   142		short phy_type;
   143		short nic_mode;
   144		short pfnum;
   145		unsigned int fw_version;
   146		unsigned int axi_mhz;
   147		union {
   148			unsigned char port_id[4];
   149			unsigned int port_ids;
   150		};
   151		unsigned int bd_uid;
   152		int phy_id;
   153		int wol_status;
   154	
   155		union {
   156			int ext_ablity;
   157			struct {
 > 158				int valid : 1;
   159				int wol_en : 1;
   160				int pci_preset_runtime_en : 1;
   161				int smbus_en : 1;
   162				int ncsi_en : 1;
   163				int rpu_en : 1;
   164				int v2 : 1;
   165				int pxe_en : 1;
   166				int mctp_en : 1;
   167			};
   168		};
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
