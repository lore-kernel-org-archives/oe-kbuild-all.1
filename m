Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48DE1865A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716329807; cv=none; b=RCKwJzwzlv+qZEeY7UTdw+79BrA5FaRGpvQuLWRxTr53/rXZcZ8IYpq4SP7vTiy/sUhOue4jNpLMotZ1EbPRZMt3UgAbx4ftcuQIXgTKt2UcT7L5A6sf4PvB0ATqiD59sJnDBaQb1MptxpuBFJfAPybGkl0HmV5VMno5zZ/u/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716329807; c=relaxed/simple;
	bh=oS19RhmXgV6mnw2L54V1eC4Q3QSUZUXqZdTNpF32Q4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f7asabKNp2pWlhpvTKYpvvODcaZmPJG+/AKYaNyIc8UuWezWVafFW1PcKU4fAPEHXtaXaGCZ6xvSNB4WOtZcOxAVKcoTV3xupc9j2zjM727pdHvr1BMwqtegpKdXq5OEnmQWDtfaS4ZqTfSmUmqGbLdfmQzrFrgCUt7vMUZ5e1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD+WGKG3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD+WGKG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716329806; x=1747865806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oS19RhmXgV6mnw2L54V1eC4Q3QSUZUXqZdTNpF32Q4w=;
  b=SD+WGKG3DdPLUIqXLhe5s1Oyvf4q95aqiFUkaWJgOj4PZAiDce/8jrs3
   HlLRIwltQPet8sb0DvVcYGXkTDIBS7f4kNIA77X7CYWiwYyfoysWNd/jZ
   77i6HJQIiGs451R2k2DKHY/I9OuifuiQ7BJFIeaxyR9PbygyFup2ildLs
   biNu4XN2KY7Ea4ApA+EusxOnc1RyoBPXmPz0dQTXSlRMsBcdzXgGWIBXP
   k0gfcNuSwk0f+/BpQVl0Fdqt4vqG85uFzfZcdX5DeDa22DzahBHmn6sgX
   GTHNqpRhHx2pbdZNzc5IEc7KU3dln2K0Uomk7Cymnw8Iq/fyGwRafr+Tj
   w==;
X-CSE-ConnectionGUID: bHcfR2VaS/uyrPHX6u4uUw==
X-CSE-MsgGUID: T+VKjSGxRfuiJZSlQ2XJQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30076043"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="30076043"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 15:16:45 -0700
X-CSE-ConnectionGUID: 6sqZbCtoSNmpExcBn4pWTw==
X-CSE-MsgGUID: y88wy+m/R4Cc8yZ5OHUQvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33209493"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2024 15:16:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9XmR-0000nV-1y;
	Tue, 21 May 2024 22:16:30 +0000
Date: Wed, 22 May 2024 06:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v2 6/8] tpm2_key.c:undefined reference to
 `look_up_OID'
Message-ID: <202405220642.KhHSXiqP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v2
head:   58801dd5ac1fcc4f2397f7a86b36efa71e583033
commit: 68803235ce8d4c2907d93ac0990194cbaec5336f [6/8] KEYS: trusted: Move tpm2_key_decode() to the TPM driver
config: sparc-randconfig-001-20240521 (https://download.01.org/0day-ci/archive/20240522/202405220642.KhHSXiqP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220642.KhHSXiqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220642.KhHSXiqP-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/char/tpm/tpm2_key.o: in function `tpm2_key_type':
>> tpm2_key.c:(.text+0x150): undefined reference to `look_up_OID'
>> sparc64-linux-ld: tpm2_key.c:(.text+0x188): undefined reference to `sprint_oid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
