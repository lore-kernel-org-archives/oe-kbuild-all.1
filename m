Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6201552F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175075; cv=none; b=d5zicoE0oJHpJjR7qRFBYEpkm+PXmmHxG3ooYfLdEBIvJjiWYD0CKcJrVUs9yBlTcmsIWmnanxInNN44Ygjjr+Z6jxLhbAkmBqNcwFRpRyzUyAHz/Mo9TEQcyDKEYCwJX3em3Fc4qBSoKSnwEV7VSOL/3BUtLWXn0k3tTCf05Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175075; c=relaxed/simple;
	bh=lCNkHPmRGqgX25X3Fs8oEGZa3/m4eXoMG+iq7jwOzR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6G6RGcJmyimN6jZvIZiR7DNGA/qAguC7wXmELY52Xh2Qh2RwCyx3+elS7wVlshFqa4Z8BDV65qrZQWs0/CERl9GF1R2dBERpFrOl9KXgPRlyNQkjKSVlIIabYgdOdxjbZUgMEbSPzLgGGLvqw2Tg4Dlj2xMsDkEk/8qr+1nOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REaWHv42; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REaWHv42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738175073; x=1769711073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCNkHPmRGqgX25X3Fs8oEGZa3/m4eXoMG+iq7jwOzR0=;
  b=REaWHv42P6PuRjEKz+roU4iznIvgq86OTv0VvEjp4pHvQ4oahP0/p5qR
   B8aAn4iEk1QSU1hHzJLHokSuO0dKkia7ZZQfmZOIrmAUk+f3sw/6xm0ea
   Zi5o26cUv0YijOxNuE0L9EJL/gqCxOjFY4K7PZl41fXjZ0W1mkG6JxATV
   cyuuFr+B74stsUVUfqqrm5PgWxVrX04HzQMj2ZajpAD3HFBtk7I6xTPSp
   C6SRZVDYI/z/mCHiIRWH9DqxfCHxdEdnemwLg465cMUIK5BxVZ0Xtgi46
   D9aK01TmTxoiso2ocyRH8ulcK5lFcYu/KlnboMlD5OexY0YvbVQLZO7PS
   A==;
X-CSE-ConnectionGUID: rm7uEaEjReWRyiluKrrOgA==
X-CSE-MsgGUID: HEqB1QenSqK0xFicWH7/Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38735101"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38735101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 10:24:33 -0800
X-CSE-ConnectionGUID: xwW+bHieQz6Ca0JeXsihPQ==
X-CSE-MsgGUID: j6KRCGcoTEOE37ygOg0yEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108962068"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2025 10:24:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdCjl-000jET-2z;
	Wed, 29 Jan 2025 18:24:29 +0000
Date: Thu, 30 Jan 2025 02:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1] ld: lib/decompress_unzstd.c:266:
 undefined reference to `ZSTD_DStreamWorkspaceBound'
Message-ID: <202501300217.6ZPxVBoW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   baac115536de71f4da800ec0d999b511c5511045
commit: 95a43fc99f147282c64e68baf1ea18041c7755ea [0/1] ANDROID: Incremental fs: Add zstd compression support
config: i386-randconfig-051-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300217.6ZPxVBoW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300217.6ZPxVBoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300217.6ZPxVBoW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: lib/decompress_unzstd.o: in function `decompress_single':
>> lib/decompress_unzstd.c:127: undefined reference to `ZSTD_DCtxWorkspaceBound'
>> ld: lib/decompress_unzstd.c:129: undefined reference to `ZSTD_initDCtx'
>> ld: lib/decompress_unzstd.c:142: undefined reference to `ZSTD_findFrameCompressedSize'
>> ld: lib/decompress_unzstd.c:148: undefined reference to `ZSTD_decompressDCtx'
   ld: lib/decompress_unzstd.o: in function `__unzstd':
>> lib/decompress_unzstd.c:247: undefined reference to `ZSTD_getFrameParams'
>> ld: lib/decompress_unzstd.c:266: undefined reference to `ZSTD_DStreamWorkspaceBound'
>> ld: lib/decompress_unzstd.c:268: undefined reference to `ZSTD_initDStream'
>> ld: lib/decompress_unzstd.c:301: undefined reference to `ZSTD_decompressStream'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
