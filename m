Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A810789
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwnFeWTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702692717; x=1734228717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mk04rrhglzlnKRj4rU6q6XAZMQ6RH6mGyKTXgP4qQ0A=;
  b=VwnFeWTmdUyk/sJWEQuoHlnpw9eL+tvo3tw4JOB2ZDu7epwpFF55uajJ
   fHLEGB1j/TD/4+FBmx0ZpQfiwls6NJq//okRBfeHSM4NhGt/KNUzja/14
   qif9m65nrAq5gEKLxAnJwFQjTJYmok8BA5HQf9C8j1FFUDNufaesDTSYP
   Obgq9exO9+YCF86w3X5lHXokJb8qI+90xfF8vJMUQnC4wq5MoXuDg8Ruv
   IPmH88woBOVLYzSLryq8Uc/1LeKEf+ybkdfLBnK1Ss0HHgqKuA+g7Fqw1
   p0Ing9RoStzPWr2Y60G/+p5o7X+Oy8OGwIa9b1qm/iyWqxpr30RW96h2l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="375505172"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="375505172"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 18:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="778470046"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="778470046"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2023 18:11:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEK9f-00012I-0r;
	Sat, 16 Dec 2023 02:11:51 +0000
Date: Sat, 16 Dec 2023 10:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: filemap.c:(.text+0x4960): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312161000.zSaZMSRO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3bd7d748816927202268cb335921f7f68b3ca723
commit: 2580d554585c52a644839864ef9238af5b030ebc mm: use folio_xor_flags_has_waiters() in folio_end_writeback()
date:   8 weeks ago
config: csky-buildonly-randconfig-r002-20220807 (https://download.01.org/0day-ci/archive/20231216/202312161000.zSaZMSRO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161000.zSaZMSRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161000.zSaZMSRO-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/filemap.o: in function `folio_end_writeback':
>> filemap.c:(.text+0x4960): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x4978): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x4990): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x49a2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x49b8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x49d2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x49f2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x4a0c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x4a4a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x4a50): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   filemap.c:(.text+0x4a66): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
