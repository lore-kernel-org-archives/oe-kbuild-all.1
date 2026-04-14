Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3654B38423D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 21:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776201373; cv=none; b=FFp/fVbM/fHmP0FlGW+tblbZ4EsTxm/y34ll4INvQgiXlnSenHcJ2AZTds4vy4/OKaZ6xuRe4snwcH4HvvvykggDtujItTlUupEXR6uWj8ajRIBDUb49dh5JO5gXqBjwoQvUtWnr8JTme3aZwfxNIbdFrokagnkkZy4ahSyKfZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776201373; c=relaxed/simple;
	bh=wWoTxJ3mFq/Ox7vCxJGO2vr50BU/70o/Cw/HTyyI54s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BXFcQ7YvWCIQhU+SfyG9GYTJG2QPOKMnM2t/1mYqu35IvqJAYeUBHqKpw7kx1NXDbKuzrKf8wUpEHMo2+kZQAA6MnddFIufy3raENyYDUsRDONgtttIrRHT84HlhgbsNTXJs5o1RfLNobasF4v2mHPvk/WuKZI48LYxfPTPOTRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxAMCpCR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxAMCpCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776201371; x=1807737371;
  h=date:from:to:cc:subject:message-id;
  bh=wWoTxJ3mFq/Ox7vCxJGO2vr50BU/70o/Cw/HTyyI54s=;
  b=KxAMCpCRk8eEsQ1edjn/7gHLSYuBOqKD/su6nfnx/6bp8I0j/lpixQ9q
   5l7ujXse2CrzHT8UZwOlL23AHpSA07u8Llcvjno1wwtxWQ36etwwQQAFw
   3OBmSGYAooy4WCDmAbgmCp3hDIzveyEeE7Z0ZE2VP58JPQI0o1SexMYuh
   dnT0J97XaH1x1piBdcG34+4hiqAyflTt/EHtltQMKP3a/JOSEeJ32PFuU
   +DLZYZoqF5SNKWtdtWCSC2+dgsR1+ja3/T9m9EdhzSr/Z0EKoSnbBXqz9
   FmEnB9wlFszRbFJZkOcNk/ryY4bYYcRiMC7vyS+4sd/Nim1xupVHjfWjP
   w==;
X-CSE-ConnectionGUID: g3lYQWZxToWIPLX59b7+TQ==
X-CSE-MsgGUID: xrOVHRirT72J1l4DkHFBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="64713174"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="64713174"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 14:16:10 -0700
X-CSE-ConnectionGUID: znbDkyzrT96N2H3isSOwKw==
X-CSE-MsgGUID: cIw10dHMQ/y5+QkzWUIztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227566041"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2026 14:16:09 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCl79-000000001sL-0ggS;
	Tue, 14 Apr 2026 21:16:07 +0000
Date: Wed, 15 Apr 2026 05:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 72/73] {standard input}:28:
 Error: invalid operands (*ABS* and *UND* sections) for `|'
Message-ID: <202604150553.2EY3SDop-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   7815cf2d85bdc74581749a4c7b2ef1a639ba07fe
commit: e452086291368868913da98b03d32bbe2b4c872f [72/73] fuse: add kfuncs for iomap bpf programs to manage the cache
config: mips-randconfig-r133-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150553.2EY3SDop-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150553.2EY3SDop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150553.2EY3SDop-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:28: Error: invalid operands (*ABS* and *UND* sections) for `|'
   {standard input}:37: Error: invalid operands (*ABS* and *UND* sections) for `|'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
