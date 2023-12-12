Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10564144
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 21:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uo7eYKVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702418230; x=1733954230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdr5HKMuhE7W4JQItfhwG/Y0riRuwPZtFof6TIMWQVI=;
  b=Uo7eYKVG6x0ycJ8W+jrPpZRNZ2vrAt5kqRPeXK/vT/BUQW0WKq5fEVc5
   zuiW7qxARr+H58Z0eEnZMlpHIqRZcGzhea6mhnHxFY8pXXz0A+p/pJOrp
   Z3W2gW08kQ/R2tnpdgOgYGYl0UUegbPVwBcLAmf5tCb5a1eCFpG0LAn7+
   s8uVwfIf1azGIXPKMR7nHmtapoRHXCyrcGHqxFbzXJ+KzhwFOrosTQceO
   kpRDM55QnjuGUcKP2jgIDeR2me+wm2iwOLLEZKv3rUqaYMl2adHZ3dqx4
   bJk9No544A0kB9Oi1PVuhmcuzyTEk5DTL7KyXKbBVuTO+8k0ESM/ZAbu1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="461350442"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="461350442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 13:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="15177907"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2023 13:57:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDAkS-000Jll-1c;
	Tue, 12 Dec 2023 21:57:04 +0000
Date: Wed, 13 Dec 2023 05:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Ying <ying.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: vmscan.c:(.text+0x40d2): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312130533.oeTRauf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf52eed70e555e864120cfaf280e979e2a035c66
commit: 90b41691b9881376fe784e13b5766ec3676fdb55 mm: add framework for PCP high auto-tuning
date:   7 weeks ago
config: csky-randconfig-001-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130533.oeTRauf8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130533.oeTRauf8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130533.oeTRauf8-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.o: in function `lru_gen_add_folio':
>> vmscan.c:(.text+0x40d2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x40e8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x40f6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x40fa): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x412e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x4174): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x4180): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x418c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   mm/vmscan.o: in function `move_folios_to_lru':
   vmscan.c:(.text+0x419c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x41a0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   vmscan.c:(.text+0x41f8): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
