Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8F39B497
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267271; cv=none; b=nkQdH4rWN85fUUMaarsZSA4hmMf+IFsH+PqEQHlAuY2Ofm3KjZvGwCDh0Z+AAkEaDMenuBF9AzJuMGc+eoCMFYP/pQPK+s2Z302vmeGm+XgHmCoHYIcZgzwt1FbwDFsWiFeTKDF4rt+lzlwmoPXsmZmzK9PgNxioF4n/Patx0oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267271; c=relaxed/simple;
	bh=LvsD0CY+4e4CLDFqDpG7MTI/QvdaXHZmnuyZ/1Hx+4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l9AWN+DcqJqkVH/I7qv0L+n7hN+sPVLpRH5Kix7aq6KQfHDSP7LbZncp30cU5TVn+OmXLnrSYd2YFdkm39Q3rrVbg8fSUJAeoqxKC4JH/j63sBOBdIlWcCXFgIp7T5I7+atjO4i7POSVE9RvFtH+yqXkdvSgh8YBzLfj1ac0B1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9oxpbim; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9oxpbim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779267269; x=1810803269;
  h=date:from:to:cc:subject:message-id;
  bh=LvsD0CY+4e4CLDFqDpG7MTI/QvdaXHZmnuyZ/1Hx+4s=;
  b=Z9oxpbim5BGS6j40IrISrvMabNO9H1lZqRGUhc/jp4fNx4Lid10LLH5N
   pSWHdtsNzxJW3IQKvDrVyWsLculs/fWO8+MYj+d/i2NW/Wpmu5mBNRoaX
   9XHWDWh3OsBaziLK7ougA5Thfn/laRLR6LJkspZqchkGqqnEenOOFDkCZ
   CIphUUprj8V+yoQaG0dh2aP57AmIdIZAi9BI1DLWtPIt8PDUF3Th2mGOa
   z/1Jc+m6ajhlhq8gEVuqU3CBTLV/J+fsVXkGOt4TZyhebEybHR0ldbzNn
   1zfN43u3RGUxvdVFk5kzptxkHLPXi2Azp6tIdo5dGFZtqMjZ5gAbGpfmR
   A==;
X-CSE-ConnectionGUID: DUW+qwZFRVSu6ZwVCskYfw==
X-CSE-MsgGUID: P84OsNl9QtWbEMdj4UQNdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80123892"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80123892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:54:29 -0700
X-CSE-ConnectionGUID: 5BWIfDL3TXCp9JdfIs6Pcg==
X-CSE-MsgGUID: B3LEZXiiRZ6SguOPPM1gQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245091793"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2026 01:54:27 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPcgx-000000002rj-1SDZ;
	Wed, 20 May 2026 08:54:19 +0000
Date: Wed, 20 May 2026 16:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: loongson-rng.c:undefined reference to `crypto_register_rng'
Message-ID: <202605201622.qWOiiZTV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27fa82620cbaa89a7fc11ac3057701d598813e87
commit: cdadc14359378c0cf02251c86ffbc606f55bfadd crypto: cryptomgr - Select algorithm types only when CRYPTO_SELFTESTS
date:   7 weeks ago
config: loongarch-randconfig-001-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201622.qWOiiZTV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201622.qWOiiZTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cdadc1435937 ("crypto: cryptomgr - Select algorithm types only when CRYPTO_SELFTESTS")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201622.qWOiiZTV-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/crypto/loongson/loongson-rng.o: in function `.LVL93':
>> loongson-rng.c:(.text+0x408): undefined reference to `crypto_register_rng'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
