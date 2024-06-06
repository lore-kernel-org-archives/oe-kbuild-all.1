Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941863EA72
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717655712; cv=none; b=QlMPgBo5DQaJ444IPR1eFSVuDO/DeOM5ME3fIeyANYipVPWF+ahVvum8KhbGZdFhR/nWubHxbvz4wZxhMIa+AZL0S94aj31R9dyKFd3+lvmdxCRwVG++Pb/sxGl4Bx2OpveunI8H7fqLXWNheBdqq5ajz0ymETlz8TD3sudPKs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717655712; c=relaxed/simple;
	bh=IDwTm8ne3tQERc9oAjpdiOsTpEVmz0KtUNve6HXXI0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXwxZB+dtqxFK3UNs7syQdglm5f9aH2RMDGJ/JVNoke5ty8IP8Ug/tF4SORs6X6TXjiBlj5gg7vKGmW+GybGvRCFGuRjJMoXwUWyW8QnMmcctZeahBFGYt11vQ9D61o+2fyC4URI9VvSa+cIADltiy36TYTcneOrn0R3b8nSQAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oko6zctt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oko6zctt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717655711; x=1749191711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDwTm8ne3tQERc9oAjpdiOsTpEVmz0KtUNve6HXXI0Y=;
  b=Oko6zcttC1VfYl1yZaJyF0gYu5n+tUvHC3dpvBC2cSS2YaK7nhvXI80R
   2sSloo8sH74fn1aRX1L9FiSr5YtBx157m0uA0eNbDL7pHiNDjKY5aHMMN
   b5JoN2ZdJxUSVlr/YvKH/hBr9NOPk8Bn3N5GSB9op5j+5P81Td1OPi9VX
   ruvA7mH3jP14rXL1adyvNQp3l2XmuMK0pIBYBUQhMHCNCWS5Igq8YBWG1
   6DtkybYxbUVPisnfb+8m5DwipRGbExolfVjZaranUeX0g4asm3ZvUwynE
   9eWkNrNqg/ZJEZVJGS1wQYSuD3xg0yAbVntEWjHFWlJoy1KBsvyKzUH+n
   A==;
X-CSE-ConnectionGUID: X4xtDITDQkelvf7lNJ5TUA==
X-CSE-MsgGUID: iAqow6cPRDCKmoLvkTr0xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="17237987"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="17237987"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 23:35:10 -0700
X-CSE-ConnectionGUID: lq6i8TFIQh+eAdTqQKBzMw==
X-CSE-MsgGUID: u9ZainnyQRuRKEaiumv7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37955450"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2024 23:35:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF6iI-0002l2-1R;
	Thu, 06 Jun 2024 06:35:06 +0000
Date: Thu, 6 Jun 2024 14:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-6.11 25/29] or1k-linux-ld:
 fs/nfs/nfs3proc.o:undefined reference to `nfs3_init_localioclient'
Message-ID: <202406061432.BzK6CFGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   252b0c685ae2eafa0ced0682a496e9eecf23d1ff
commit: 51975d922764190b4745b87458026ad1303c4ec4 [25/29] nfs: implement v4 client support for NFS_LOCALIO_PROGRAM
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240606/202406061432.BzK6CFGi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061432.BzK6CFGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061432.BzK6CFGi-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: fs/nfs/client.o: in function `nfs_free_client':
   client.c:(.text+0x4d4): undefined reference to `nfs_local_disable'
   client.c:(.text+0x4d4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_disable'
   or1k-linux-ld: fs/nfs/client.o: in function `nfs_get_client':
   client.c:(.text+0x23b4): undefined reference to `nfs_local_probe'
   client.c:(.text+0x23b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_probe'
   or1k-linux-ld: fs/nfs/inode.o: in function `init_nfs_fs':
   inode.c:(.init.text+0x168): undefined reference to `nfs_local_init'
   inode.c:(.init.text+0x168): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_init'
   or1k-linux-ld: fs/nfs/pagelist.o: in function `nfs_initiate_pgio':
   pagelist.c:(.text+0x4d0): undefined reference to `nfs_local_doio'
   pagelist.c:(.text+0x4d0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_doio'
   or1k-linux-ld: fs/nfs/pagelist.o: in function `nfs_generic_pg_pgios':
   pagelist.c:(.text+0x139c): undefined reference to `nfs_local_file_open'
   pagelist.c:(.text+0x139c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_file_open'
   or1k-linux-ld: fs/nfs/write.o: in function `nfs_initiate_commit':
   write.c:(.text+0x8ac): undefined reference to `nfs_local_commit'
   write.c:(.text+0x8ac): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_commit'
   or1k-linux-ld: fs/nfs/write.o: in function `nfs_commit_list':
   write.c:(.text+0x1bb0): undefined reference to `nfs_local_file_open'
   write.c:(.text+0x1bb0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nfs_local_file_open'
>> or1k-linux-ld: fs/nfs/nfs3proc.o:(.rodata+0xe0): undefined reference to `nfs3_init_localioclient'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
