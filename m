Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD981DDF4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714845705; cv=none; b=nTL+LoVGgIfR68vw1Ztt2KVd7dk2yDejoqureW292Y+RTmBUutmGy3cX3TWU98lwdm9vV6WUGh7i+LB4foFJo16wDP9CpedO1WCbyod3frMM93IpSycAFyWfhIekNtLUr9Q218Yg44lU/yyRO1rY8DnBAuc2q4TwOCwZScEA6AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714845705; c=relaxed/simple;
	bh=eq0ilrXTONcrwUk1TMjg00g1q4fquyM/+nHNZQ89zds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7ncZUSqI0IQb6l9dLXy1h2ghl0QfUIDt+W+jm4OXPCTJnw5h82Z7JAVaEo8BmP4q7PkUFpvSKH5OGWv3axl2F8IIFqK+IrWj2ONB8dcIwoTS/XJPsx2wOtXU1avUu0c/fCkJ3+NVQiDt/lM/5P1S2w1V/rqkpLzmQTesSa0QzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRlq3HqF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRlq3HqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714845704; x=1746381704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eq0ilrXTONcrwUk1TMjg00g1q4fquyM/+nHNZQ89zds=;
  b=SRlq3HqFEyc2r9Q/2u7UwK45k4TNPiNFqdVqErDchJmdKzLpiwuKu4kO
   tG3gzQz5H8UzMJCb+ogN252XA0oAvmlU/W8jI3AFijJMx5qiEKHCma6Xc
   PEMtq+MjzC2P2ToBoh30XDnS+C5GrQk3VmzI0HfByS+VqIT/HjcTBqi0Y
   u7hU/NWRDNBLZugzMWB+3NbV+K/8zQzvP65ia+sNZ/rQr3bExlB0kJfAw
   ZLOJvEivte+ysh8IeHbwnOGSUungYJmf2GNtP9Rr4xmURNmUuGAe45/R7
   XQ73H+8FpcvHExE4/9Rs6qdY4ux4AlgFhVLxcbvnMclu3UpCGVQfzXULT
   Q==;
X-CSE-ConnectionGUID: cka9paxuQrWgwr+8y1AXYQ==
X-CSE-MsgGUID: 1WiMPyoUTQyNAmszn2H5uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10487390"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="10487390"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 11:01:44 -0700
X-CSE-ConnectionGUID: Nmrd5Bz8Rf+JERVneQAnlQ==
X-CSE-MsgGUID: WE2D/EqaRaWOTwX8lWfthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32562283"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2024 11:01:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Jhc-000D2o-00;
	Sat, 04 May 2024 18:01:40 +0000
Date: Sun, 5 May 2024 02:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10940/10967] riscv32-linux-ld: section
 __ksymtab_strings VMA [c200ca9c,c205783e] overlaps section .data VMA
 [c2000000,c260b147]
Message-ID: <202405050153.8qR3BcBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: db22dcad6dd79a11cd9be2d068843a1e18969104 [10940/10967] Merge branch 'kunit' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
config: riscv-randconfig-r006-20230814 (https://download.01.org/0day-ci/archive/20240505/202405050153.8qR3BcBm-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050153.8qR3BcBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050153.8qR3BcBm-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: section .data LMA [0006e000,00679147] overlaps section .init.text LMA [00001000,00087e21]
   riscv32-linux-ld: section .exit.text LMA [00087e22,0009a2a3] overlaps section .data LMA [0006e000,00679147]
   riscv32-linux-ld: section __bug_table LMA [00679148,006b4973] overlaps section .text LMA [0009a2a4,016ba269]
>> riscv32-linux-ld: section __ksymtab_strings VMA [c200ca9c,c205783e] overlaps section .data VMA [c2000000,c260b147]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
