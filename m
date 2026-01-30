Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5809A314D13
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761427; cv=none; b=B1bPmZjdLpYj66ZgkESCbl4VeLz1L2iA6tBjSoZgxvu3nLYrCbXrmREaMa5EdKoBq6gbttVsjxJ/bMMrmP7aTkY/L2NgVfq002/kztv/3nYHObNJXJMC9T3kAGXBLyaxxEz1UG3eFmXRnnMyUmObMbWcUUYPy/LU7tEVIvb1v5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761427; c=relaxed/simple;
	bh=tlRZgxbCtvvhll8I6CSn++jpL3NquzxQUMlqdUG0jA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XwDiTxnyrBthprIo8VGH09YDSyMGEsOomYi6HKM5e+MpzRDRVrEDFW9CE4AO37xqQ+L8etHn/NeegxAxi0NjhmFFCCGLis30qpLBZvkl9hjXADui2Zsnc3ZIruUTZVWYGTIhHOWukBMvxXEvp/QT39RHIxCTjf5ZpkBFjXAp+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQFr0Dk+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQFr0Dk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769761426; x=1801297426;
  h=date:from:to:cc:subject:message-id;
  bh=tlRZgxbCtvvhll8I6CSn++jpL3NquzxQUMlqdUG0jA4=;
  b=mQFr0Dk+2348WTpB9UvwR/UsB6PcVy5O9W55ma6i516/mRXskC5H+I8r
   YaZ/BMcfOv4FO2b8Pyp6PiJ3aLPt1imWcGuM+e//vLm3Clvt3oG7Ck3Ec
   F19u3jgIOoA8Suhd4SsJogVvBl7NTifRZJPuPYsaYad1cZqVtzLJmUD4e
   9xQnPwhYlHAOdUHCr4OJ7+fHUXs28/Z4ngWbImaWGQOmUYsMrvz370UsQ
   Qj2KzxydjgKhAlV86vhgw0l4DD8ip4Z7kRhwLIWW+qL5o+WxaBioX/oq1
   STAVe9tBt0oudGhbDVUy+b/YmCgveIsvkCr1Q6Vje2Eeft4rErTO/hLBd
   w==;
X-CSE-ConnectionGUID: RjQx83bnSGiYU568Zx0ZmA==
X-CSE-MsgGUID: +YSGu0F9RwGghoVbS2IZUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70029783"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="70029783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 00:23:44 -0800
X-CSE-ConnectionGUID: //SPJZ0nQZqjAXPHwXH8WA==
X-CSE-MsgGUID: kxgVyW2LRo+djThNn+g2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208044690"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2026 00:23:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vljn1-00000000cNC-1Ij6;
	Fri, 30 Jan 2026 08:23:39 +0000
Date: Fri, 30 Jan 2026 16:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10260/10321] {standard input}:3761:
 Error: pcrel offset for branch to .LS0017 too far (0x3e)
Message-ID: <202601301611.LNCXCfvb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33a647c659ffa5bdb94abc345c8c86768ff96215
commit: 07a004be654e1aaab337a656e957ea2948ad473c [10260/10321] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: csky-randconfig-r063-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301611.LNCXCfvb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301611.LNCXCfvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301611.LNCXCfvb-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:3761: Error: pcrel offset for branch to .LS0017 too far (0x3e)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
