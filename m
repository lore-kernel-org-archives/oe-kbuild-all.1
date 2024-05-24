Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA417578
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716537668; cv=none; b=PpMtLGxmMuQurnL5TO9MbKetLiStJvPAqFIFXzikLVAFGL5lsDhuJsEi7TCfhp0vPiVylXKaJeMBr/8cFiKCUCTupGimRSup8f7Ie7ZHuYQBd4pNbDjObhvnqR59xeASXT4Epyb410QkWB+Syz/JHCV1xzMaGj06WQXEIf4VFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716537668; c=relaxed/simple;
	bh=87T67KBXxPA7jrY/UddHmM0lz4G4Ww89gwrmmgletlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ik1lFAkayifKP4GMQsRMpGVBHjwKtlZcJyvZ2u2u0RO4pHbkOy1t0b55TF88FLvHSuO8QmDs1mdQkGRxTDopyC/4wQK4rRcu/Lz219bHeKLaMPajXh3gWoTQiwyM/sLYdx056x73BdYkv3QK8rerxj8uYXKkVOLEu3NxZ7v9oQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3/DmdeI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3/DmdeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716537667; x=1748073667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=87T67KBXxPA7jrY/UddHmM0lz4G4Ww89gwrmmgletlE=;
  b=H3/DmdeI4yyTMate5kmVDUfT6eNyZxkSFSnx13tf0X9Vw5eoVWwTA6U3
   rGtIiw34qgfvekV6lTlr1EH5Ve9z8hJ3Vlt+oKeROLZGJ5XZvS1NiAbfJ
   Yqy8GebaaJzH1iYxUBsPnwG9zR887BB3qqVSaBmNxR/G83hdt48hIHt1T
   ZxsCY8O0pzSqbXGsCY+bj7w8Ew9XdzxUjbBG05Ii0hW7+c7pO8XkLIQPb
   K7HdCdDtQXnT7pr099xwtT2QZSePX7uarfMRIzDlK1onjKUH3S5+6ffhx
   fI+vOxB48D3n5zK/KxLSP4WIHTChB93/qwIYBxMqKZ24mxmz3MGbjw9v2
   Q==;
X-CSE-ConnectionGUID: zdGPcs2DTGa4f/OMQde1tA==
X-CSE-MsgGUID: sHi3wX9gQtybdVO6C4awWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30437368"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="30437368"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 01:01:06 -0700
X-CSE-ConnectionGUID: 4R8iU/w2RBmHgCpFf8T5HQ==
X-CSE-MsgGUID: iXioS3PQT2mATgMf/dSf9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="38525475"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 May 2024 01:01:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAPrK-000473-3A;
	Fri, 24 May 2024 08:01:02 +0000
Date: Fri, 24 May 2024 16:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v5 5/7] loongarch64-linux-ld:
 tpm2_key.c:undefined reference to `sprint_oid'
Message-ID: <202405241541.ynM2oH67-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v5
head:   6792a0a1349f0af45bcde20fb31454bbb249fc80
commit: b6a7a78fec52559fb6a14b9b3696f96eec3a1458 [5/7] KEYS: trusted: Move tpm2_key_decode() to the TPM driver
config: loongarch-randconfig-002-20240524 (https://download.01.org/0day-ci/archive/20240524/202405241541.ynM2oH67-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241541.ynM2oH67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241541.ynM2oH67-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/char/tpm/tpm2_key.o: in function `tpm2_key_type':
   tpm2_key.c:(.text+0x1e8): undefined reference to `look_up_OID'
>> loongarch64-linux-ld: tpm2_key.c:(.text+0x254): undefined reference to `sprint_oid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
