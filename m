Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4161C139
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692812669; x=1724348669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMcDu8/efmWQqcbCMV3AaAAvtAQJrv9A/hoNMWOAHG8=;
  b=l2E7/RagX7t1sGdqFeuJNnDyc3KRQTkQRJ/2P12OiHpM9bTYi9lT3fVL
   PCeoxHAnvXN9hSPg9dm1N3fy7W9kSE/9Ios4KyRd6rQA2Mv5VwQAmkNma
   v4uEcXkxujUyyH+u4YdB24Cz3IkrCUS2MZhEQfgwdAH0cccsaz82JQ7QU
   jsy12RI4p/3kcRLoQPgKtQl/OBMudnqZXzjug0jqXM2TeE1DEH14HNSkT
   OWvTr9Oe6j34ahhYGuNipyUK7hctbeDOASOQ5qp3n9B2OF3KemKyUejGw
   z5JDBzlg/D5N18KzUsn8A9erO3h2ncNpEbjcYOy6cDlVmzpjGj9Hf8cSN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="371644858"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="371644858"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 10:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826817980"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826817980"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 10:44:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYru6-0001OB-24;
	Wed, 23 Aug 2023 17:44:26 +0000
Date: Thu, 24 Aug 2023 01:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-lpa2-v4 33/61] arch/arm64/kernel/pi/map_range.c:30:
 warning: Function parameter or member 'prot' not described in 'map_range'
Message-ID: <202308240103.JgtPcRvu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v4
head:   9008d04c49a096b76a306257c177ad6220d6e37f
commit: 7110671a7bf4a513f53e0a6262d64ee106b5acca [33/61] arm64: head: Move early kernel mapping routines into C code
config: arm64-randconfig-r026-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240103.JgtPcRvu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240103.JgtPcRvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240103.JgtPcRvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/pi/map_range.c:30: warning: Function parameter or member 'prot' not described in 'map_range'


vim +30 arch/arm64/kernel/pi/map_range.c

    13	
    14	/**
    15	 * map_range - Map a contiguous range of physical pages into virtual memory
    16	 *
    17	 * @pte:		Address of physical pointer to array of pages to
    18	 *			allocate page tables from
    19	 * @start:		Virtual address of the start of the range
    20	 * @end:		Virtual address of the end of the range (exclusive)
    21	 * @pa:			Physical address of the start of the range
    22	 * @level:		Translation level for the mapping
    23	 * @tbl:		The level @level page table to create the mappings in
    24	 * @may_use_cont:	Whether the use of the contiguous attribute is allowed
    25	 * @va_offset:		Offset between a physical page and its current mapping
    26	 * 			in the VA space
    27	 */
    28	void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
    29			      int level, pte_t *tbl, bool may_use_cont, u64 va_offset)
  > 30	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
