Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5191A0AF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 16:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729699559; cv=none; b=fp9ZGCBHHXEWYQdEjp91hcnDGiJkTfjVqixKuiS2a3VDMDHqiMoSFIpt1XjQI7cwLweNHOXunKA2J8gG4qFUdEUMCpZOCodV3XLlp64fzbTtDsLbgi3vbzzN2/xzmnJYRjejV/zupw5+A5FZ3Rm7kjU+4ViKFb9Oh7LaxqvZWaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729699559; c=relaxed/simple;
	bh=hP8MxrxbzP4cGAdqmA76ELHKI7HgEwOKHWD7cIzboqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6QyqmhsMFpM3FE/o8HT04/qcgUF/peIkJE4hXeUd/bHDSn9qqppPbyXUTMKY46X7pCwiirC5NR2MBP258FMdpUfLGBPVGxbZUopmexlCCN3yr2riouJYlhnbFX7NzpCnuVjCZKmjkRVzT3gwD2dPc9CN5Bs9m2UlIVSY0vbQX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts2ru8Hk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts2ru8Hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729699558; x=1761235558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hP8MxrxbzP4cGAdqmA76ELHKI7HgEwOKHWD7cIzboqo=;
  b=Ts2ru8Hkj8krb21VZjSgFUYHgJ2djmLugWBF+iL5o1nJSy0m6vu+9Bkn
   xUOg5AptLjYbj/f7V/lKlmMs+2v+b0WDm53MTS8khSUSIvjSc2EJpm07D
   9kVUH7LMk+xwt/KeZM/z62KwhogVpbaT0A53d74Unuj4XvS5FeWzyKaye
   6vWScqo54rKhywFFDXVQyHavpABCjL2hlvNZtTOXWRgIdLGhK/fWXJfcm
   /FAEqxtNor5Z21YTOr4o2iG569a9cehlmmcNV+9nuAteNRLAQxNosly6E
   3Ua4uDmaidHX0Pozpm1a66Bk70Y1mC5jyT2DiV+kT5t3DAAv4G5+cr0Ns
   w==;
X-CSE-ConnectionGUID: KXFkK2KtR1SkjrHUMtgXvQ==
X-CSE-MsgGUID: iuAqtfO7QE2EMc8p6/ytpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="16920812"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="16920812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 09:05:46 -0700
X-CSE-ConnectionGUID: YCHDgn+TSvu7JmuJTpL6/A==
X-CSE-MsgGUID: RsPeD6OTRya8IdytmvISLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80681044"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 09:05:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3dri-000V7F-0W;
	Wed, 23 Oct 2024 16:05:42 +0000
Date: Thu, 24 Oct 2024 00:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc32-lib-v1 27/30] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_POLY1305 when selected by BCACHEFS_FS
Message-ID: <202410232326.D15jQLIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v1
head:   df44c9de0d037caccc2bce95125af64a941c4419
commit: 7290ac04d052de4256b4089db93f26194018aa81 [27/30] lib/crc32: make crc32c() go directly to lib
config: nios2-kismet-CONFIG_CRYPTO_POLY1305-CONFIG_BCACHEFS_FS-0-0 (https://download.01.org/0day-ci/archive/20241023/202410232326.D15jQLIR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241023/202410232326.D15jQLIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232326.D15jQLIR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_POLY1305 when selected by BCACHEFS_FS
   WARNING: unmet direct dependencies detected for CRYPTO_CHACHA20
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_POLY1305
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - BCACHEFS_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
