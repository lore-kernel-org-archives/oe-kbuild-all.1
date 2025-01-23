Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B84120CCCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627065; cv=none; b=ICvK0HTI6a+h7apIgEl8XmMxOmLkXgIzOfgf4JT7IsWxwPfz/74oBv+1oHPJHxwLJBk3beCUlaMRINH/SWlt11qjbkWl4ox+MDh0/nQ3lI21vuptg6GTgF6jIjvSwU3HzhYf7Bra9MwMq1s2Bmt0+puzRWxeTEeOmJSXkly7F2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627065; c=relaxed/simple;
	bh=A0/5WzeLU090/9n7a36gXt0YvUO+0AIepe/Xdq4A320=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpjbDdrv/V9sitQN3DDjWyKftAu2HtA2EGTwYlqj4uB1RhJ1Iy/8o+/CUS9vwyXIlE7JYtd05ZYd/hknYfvWccGpgEIMET7WaIz2eB7cNB+WM8iECOnNG9MaRZ5KbUVySqTchfdCFGRazN7Pvfp4Ru4RxFwxA6Zl/ITp9Y6PGSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWuUQVDh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWuUQVDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737627061; x=1769163061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0/5WzeLU090/9n7a36gXt0YvUO+0AIepe/Xdq4A320=;
  b=dWuUQVDhzZuecdVeXZzCobSvNjx5KQldjPQnxAjSt0CbHyk7WeWBRzSm
   SQ7G2lRpekeOIkmtGyJozK3buHzVQQQV1q9Uex8UD619la4c1rr4uA/Xk
   m5Qc02DbuRCj0akXVlFID1YLpXmR5eEjKVLxgI0t7ZQ8A+BuQ5WJnGuue
   NCFqX0/LIJAvJ/rN6xKFcpQ12aG5hfjKIjKITEm5PeH/0ZVwCqwfFWE7X
   AnIh8uyhrgNmCzRurScmQRQ5lyUypTxWF7+a33xcrs3K8SeqUJWEanbph
   jvYVavhG5lo8sCPkkO3yRgO4jRLZjgc5yVBiHmddkxeS1AToFRpD6oPJM
   g==;
X-CSE-ConnectionGUID: 6lALtmHSQYiAfhkDDqHK4w==
X-CSE-MsgGUID: 6NUs/36/St6MIDW+uVG1lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48709072"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="48709072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 02:11:00 -0800
X-CSE-ConnectionGUID: 0RMdHWTIQTKFyyvrzNLRjg==
X-CSE-MsgGUID: CFCYNW07TeG7dsEN4oTzpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107333422"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jan 2025 02:10:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tauAf-000b2g-1K;
	Thu, 23 Jan 2025 10:10:45 +0000
Date: Thu, 23 Jan 2025 18:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2712/2712]
 drivers/firmware/efi/libstub/../../../../lib/lz4/lz4_decompress.c:488:5:
 warning: no previous prototype for 'LZ4_decompress_safe_withPrefix64k'
Message-ID: <202501231827.ODrxloSs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8af3d979a0d4bd2f18127293d843277437e74c6e
commit: e467807275555a062593aa1e89f3201644ef0ea5 [2712/2712] efi/libstub: implement generic EFI zboot
config: arm64-randconfig-001-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231827.ODrxloSs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231827.ODrxloSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231827.ODrxloSs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/../../../../lib/decompress_unlz4.c:10,
                    from drivers/firmware/efi/libstub/zboot.c:17:
>> drivers/firmware/efi/libstub/../../../../lib/lz4/lz4_decompress.c:488:5: warning: no previous prototype for 'LZ4_decompress_safe_withPrefix64k' [-Wmissing-prototypes]
     488 | int LZ4_decompress_safe_withPrefix64k(const char *source, char *dest,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/efi/libstub/../../../../lib/lz4/lz4_decompress.c:510:5: warning: no previous prototype for 'LZ4_decompress_safe_forceExtDict' [-Wmissing-prototypes]
     510 | int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/zboot.c:162:1: warning: no previous prototype for 'efi_zboot_entry' [-Wmissing-prototypes]
     162 | efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
         | ^~~~~~~~~~~~~~~


vim +/LZ4_decompress_safe_withPrefix64k +488 drivers/firmware/efi/libstub/../../../../lib/lz4/lz4_decompress.c

2209fda323e2fd Gao Xiang    2018-10-30  487  
2209fda323e2fd Gao Xiang    2018-10-30 @488  int LZ4_decompress_safe_withPrefix64k(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  489  				      int compressedSize, int maxOutputSize)
2209fda323e2fd Gao Xiang    2018-10-30  490  {
2209fda323e2fd Gao Xiang    2018-10-30  491  	return LZ4_decompress_generic(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  492  				      compressedSize, maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  493  				      endOnInputSize, decode_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  494  				      withPrefix64k,
2209fda323e2fd Gao Xiang    2018-10-30  495  				      (BYTE *)dest - 64 * KB, NULL, 0);
2209fda323e2fd Gao Xiang    2018-10-30  496  }
2209fda323e2fd Gao Xiang    2018-10-30  497  
2209fda323e2fd Gao Xiang    2018-10-30  498  static int LZ4_decompress_safe_withSmallPrefix(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  499  					       int compressedSize,
2209fda323e2fd Gao Xiang    2018-10-30  500  					       int maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  501  					       size_t prefixSize)
2209fda323e2fd Gao Xiang    2018-10-30  502  {
2209fda323e2fd Gao Xiang    2018-10-30  503  	return LZ4_decompress_generic(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  504  				      compressedSize, maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  505  				      endOnInputSize, decode_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  506  				      noDict,
2209fda323e2fd Gao Xiang    2018-10-30  507  				      (BYTE *)dest - prefixSize, NULL, 0);
4e1a33b105ddf2 Sven Schmidt 2017-02-24  508  }
cffb78b0e0b3a3 Kyungsik Lee 2013-07-08  509  
2209fda323e2fd Gao Xiang    2018-10-30 @510  int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  511  				     int compressedSize, int maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  512  				     const void *dictStart, size_t dictSize)
2209fda323e2fd Gao Xiang    2018-10-30  513  {
2209fda323e2fd Gao Xiang    2018-10-30  514  	return LZ4_decompress_generic(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  515  				      compressedSize, maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  516  				      endOnInputSize, decode_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  517  				      usingExtDict, (BYTE *)dest,
2209fda323e2fd Gao Xiang    2018-10-30  518  				      (const BYTE *)dictStart, dictSize);
2209fda323e2fd Gao Xiang    2018-10-30  519  }
2209fda323e2fd Gao Xiang    2018-10-30  520  

:::::: The code at line 488 was first introduced by commit
:::::: 2209fda323e2fd2a2d0885595fd5097717f8d2aa lib/lz4: update LZ4 decompressor module

:::::: TO: Gao Xiang <gaoxiang25@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
