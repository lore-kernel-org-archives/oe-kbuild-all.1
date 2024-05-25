Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D6CBA31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716660422; cv=none; b=NUQhzUtA3+S8CJoeh/qTcW+piUrOXQblka5Apf8ueAbuuOLRBxGh50HEfaD3TuqT5KwtbjKcejb2Uq/YYDKTLdSbmeSqa0Q1bkuTRv48NCKzqVaDoHmRuXDl2KH0dRbgDuGMYPa60zl7b593aJOYlyPifZWQtZaUHZeBeAuNs0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716660422; c=relaxed/simple;
	bh=5yavnr1wxf2IaYzmOsjeI/1xtHekUBrOrBWfWfywxOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TpTm2onkS/4HTPIge7Baf1BD3a4rmzRq83WgMrcz+Ky7EYw/BA/BPZFHZ3aIKQMCGpDHh3BD63tBaExq8OHqI0/AlDpd//lEjILpniOH286NJz6FClB4FJcX24wxwA98bPpZQqHnzy+RWbFCgFocJSmNGXVyARDyAamgEemt9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLuy2/SF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLuy2/SF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716660421; x=1748196421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yavnr1wxf2IaYzmOsjeI/1xtHekUBrOrBWfWfywxOc=;
  b=NLuy2/SFILkkeNQai/towyo4sOIg/IP7DquELXXNr4NbADL20NdgTuHU
   ZvX7xGxu09dznu/pxtoX5U1ijWvOoEfw7VEPjZ0dQHyMVHggUFV9UTtXI
   1kZwUk8SQf3IBhnIwdy7M9vObbuGZTYXd2KGisaAaXFw/iIt6FFmZm+AA
   RN/1bAIau2hqrPpjFfJZXFnr+WXBVdVc7gnttthml79bnYTK6lwJ2nuLA
   QG0jCwgNL37X7PAvOuHInBDJJuITXuTPZE63vIzarebyClUdP7N0ZYVGf
   iXsmeV/MbUwLepqvoUzox7pP6dfaffl3sMAm0YKS9Ujp5MrzMaC/SKuxF
   w==;
X-CSE-ConnectionGUID: ZA/IaGDmSEW7qeRI/pR/9g==
X-CSE-MsgGUID: sEBxRB9NQMOvBRaZfQ8X0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="35538476"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="35538476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 11:07:01 -0700
X-CSE-ConnectionGUID: 6+jeUWhdR2OMaTUI+PpgeQ==
X-CSE-MsgGUID: aO4fYrCuSYuVhtLp/Ug6DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="65140336"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 May 2024 11:07:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAvnD-0007H9-1a;
	Sat, 25 May 2024 18:06:56 +0000
Date: Sun, 26 May 2024 02:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8162/22498] drivers/md/dm-integrity.o:
 warning: objtool: do_journal_write()+0x134d: stack state mismatch:
 cfa1=-4-40 cfa2=-1+0
Message-ID: <202405260123.NWtyQKRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4ba26291c36f420273a2546b25d2c0db3115d226
commit: 56bc1719652e7a937bc9856f76f0c0fbf8ce1b23 [8162/22498] objtool: Support GCC 9 cold subfunction naming scheme
config: x86_64-buildonly-randconfig-005-20240525 (https://download.01.org/0day-ci/archive/20240526/202405260123.NWtyQKRm-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260123.NWtyQKRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260123.NWtyQKRm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-integrity.c:3606:12: warning: no previous prototype for 'dm_integrity_init' [-Wmissing-prototypes]
    3606 | int __init dm_integrity_init(void)
         |            ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:3625:6: warning: no previous prototype for 'dm_integrity_exit' [-Wmissing-prototypes]
    3625 | void dm_integrity_exit(void)
         |      ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c: In function '__journal_read_write':
   drivers/md/dm-integrity.c:1541:105: warning: array subscript s is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
    1541 |                                         *(commit_id_t *)(mem_ptr + JOURNAL_SECTOR_DATA) = je->last_bytes[s];
         |                                                                                           ~~~~~~~~~~~~~~^~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   drivers/md/dm-integrity.c:87:58: warning: array subscript <unknown> is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
      87 | #define journal_entry_tag(ic, je)               ((__u8 *)&(je)->last_bytes[(ic)->sectors_per_block])
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:1561:49: note: in expansion of macro 'journal_entry_tag'
    1561 |                                 char *tag_ptr = journal_entry_tag(ic, je);
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   drivers/md/dm-integrity.c:87:58: warning: array subscript <unknown> is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
      87 | #define journal_entry_tag(ic, je)               ((__u8 *)&(je)->last_bytes[(ic)->sectors_per_block])
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:1561:49: note: in expansion of macro 'journal_entry_tag'
    1561 |                                 char *tag_ptr = journal_entry_tag(ic, je);
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   drivers/md/dm-integrity.c:1591:55: warning: array subscript s is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
    1591 |                                         je->last_bytes[s] = js[s].commit_id;
         |                                         ~~~~~~~~~~~~~~^~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   drivers/md/dm-integrity.c:87:58: warning: array subscript <unknown> is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
      87 | #define journal_entry_tag(ic, je)               ((__u8 *)&(je)->last_bytes[(ic)->sectors_per_block])
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:1601:107: note: in expansion of macro 'journal_entry_tag'
    1601 |                                                 integrity_sector_checksum(ic, logical_sector, (char *)js, journal_entry_tag(ic, je));
         |                                                                                                           ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   drivers/md/dm-integrity.c:87:58: warning: array subscript <unknown> is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
      87 | #define journal_entry_tag(ic, je)               ((__u8 *)&(je)->last_bytes[(ic)->sectors_per_block])
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:1599:56: note: in expansion of macro 'journal_entry_tag'
    1599 |                                                 memcpy(journal_entry_tag(ic, je), checksums_onstack, ic->tag_size);
         |                                                        ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   In function 'restore_last_bytes',
       inlined from 'do_journal_write' at drivers/md/dm-integrity.c:1958:4:
   drivers/md/dm-integrity.c:1915:47: warning: array subscript s is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
    1915 |                 js->commit_id = je->last_bytes[s];
         |                                 ~~~~~~~~~~~~~~^~~
   drivers/md/dm-integrity.c: In function 'do_journal_write':
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   In function 'restore_last_bytes',
       inlined from 'do_journal_write' at drivers/md/dm-integrity.c:1969:5:
   drivers/md/dm-integrity.c:1915:47: warning: array subscript s is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
    1915 |                 js->commit_id = je->last_bytes[s];
         |                                 ~~~~~~~~~~~~~~^~~
   drivers/md/dm-integrity.c: In function 'do_journal_write':
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   In file included from drivers/md/dm-integrity.c:9:
   drivers/md/dm-integrity.c:87:58: warning: array subscript <unknown> is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
      87 | #define journal_entry_tag(ic, je)               ((__u8 *)&(je)->last_bytes[(ic)->sectors_per_block])
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/md/dm-integrity.c:2028:71: note: in expansion of macro 'journal_entry_tag'
    2028 |                                         if (unlikely(memcmp(test_tag, journal_entry_tag(ic, je2), ic->tag_size)))
         |                                                                       ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
   drivers/md/dm-integrity.c:87:58: warning: array subscript <unknown> is outside array bounds of 'commit_id_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
      87 | #define journal_entry_tag(ic, je)               ((__u8 *)&(je)->last_bytes[(ic)->sectors_per_block])
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:2033:61: note: in expansion of macro 'journal_entry_tag'
    2033 |                                 r = dm_integrity_rw_tag(ic, journal_entry_tag(ic, je2), &metadata_block, &metadata_offset,
         |                                                             ^~~~~~~~~~~~~~~~~
   drivers/md/dm-integrity.c:83:21: note: while referencing 'last_bytes'
      83 |         commit_id_t last_bytes[0];
         |                     ^~~~~~~~~~
>> drivers/md/dm-integrity.o: warning: objtool: do_journal_write()+0x134d: stack state mismatch: cfa1=-4-40 cfa2=-1+0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
