Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108421843
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 02:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713665470; cv=none; b=U8P6vrdEgIvVAAUchJmvD/wMgNU/B+Z8/gBbeuos+Owor9oglrzI88hWZXL0nxKFnGxNAs3i1UIL0k0d2y4Kt7R6GJRVHWSt/Zq8AiB2i48jNc/1e9m5ccyxkTP4Tqm3CUmZ91iQL6arHq5zrdSoEGzkJs81Pz559PyIXXMDeQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713665470; c=relaxed/simple;
	bh=uaiolg2ALV4zPVXakMs0UT+DQKPnDabpNz6ZiK2G6Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srS3SgyZI82SkX4737l1O5RF4I/UZqor594q3YT/CQ1BXe0epPv6ZHPOr2FSk68m5OkeoN3+xaXZ0PVCqvKS9oKb+/VXu8zdsbxI23xxBtRYOKZBNidyaAZkEICvlYQ61qs2dNys4qIa34lz9zRHnrxM6nopGoHa4xKa6eWc4fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaYAJpRt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaYAJpRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713665468; x=1745201468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaiolg2ALV4zPVXakMs0UT+DQKPnDabpNz6ZiK2G6Ms=;
  b=CaYAJpRtFnx9HbYJhpFLbcozLUw9j7to7QCc1Tly2XGnhrgOw2GmLBJy
   u5W7zWgpmofVjg+TR1gBJUYoAFWq6cKmsdowBQjlsUPt4YD+ArAtocEmY
   EwaUYzPsfqqv56S0+plOutLKPIixBRRdwbpKwY3/zkmnZpifvhge4tSfs
   VQPETsfHOAv3N2ZrB/KNAJ73KlbCRD1Fnuvc7Qk72xkKd6tuesf6/J0rr
   MkSAzCE2B6Gw5FKOu2IYxrsVIqpFVbXUp6ORgJva56hH9W+9UeeCpRpmc
   afWYg0WBioHwQIQgvU69brpopLupS7zlU9QN28pJWlUO3qsPOXEMbNImF
   A==;
X-CSE-ConnectionGUID: ujwJVd2tShyUD134duqmdA==
X-CSE-MsgGUID: Rf/RnXy7Sd+I90NmolnKDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="13012128"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="13012128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 19:11:07 -0700
X-CSE-ConnectionGUID: gMgQTWaWTjSBYorF/d9epg==
X-CSE-MsgGUID: bh567T4QQkaLJFUKo4WStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="28201136"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2024 19:11:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryMfX-000Bd0-2T;
	Sun, 21 Apr 2024 02:11:03 +0000
Date: Sun, 21 Apr 2024 10:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7116/7122] init/main.c:613:(.init.text+0x358):
 relocation truncated to fit: R_RISCV_GPREL_I against symbol `__setup_start'
 defined in .init.rodata section in .tmp_vmlinux.kallsyms1
Message-ID: <202404211031.J6l2AfJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
commit: 603cac6a968ab44e179e820fc0e2ca3ac2e1d829 [7116/7122] Merge branch 'sysctl-next' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git
config: riscv-randconfig-001-20231020 (https://download.01.org/0day-ci/archive/20240421/202404211031.J6l2AfJk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404211031.J6l2AfJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: section .data LMA [000000000099b000,0000000001424de7] overlaps section .text LMA [0000000000104040,000000000213c543]
   riscv64-linux-ld: section .data..percpu LMA [00000000024e2000,00000000026b46e7] overlaps section .rodata LMA [000000000213c580,000000000292d0dd]
   riscv64-linux-ld: section .rodata VMA [ffffffff8213c580,ffffffff8292d0dd] overlaps section .data VMA [ffffffff82000000,ffffffff82a89de7]
   init/main.o: in function `rdinit_setup':
>> init/main.c:613:(.init.text+0x358): relocation truncated to fit: R_RISCV_GPREL_I against symbol `__setup_start' defined in .init.rodata section in .tmp_vmlinux.kallsyms1
   net/ipv4/ipconfig.o: in function `ic_dhcp_init_options':
   net/ipv4/ipconfig.c:682:(.init.text+0x9b4): relocation truncated to fit: R_RISCV_GPREL_I against `ic_bootp_cookie'
   net/sunrpc/auth_gss/gss_krb5_mech.o: in function `gss_krb5_prepare_enctype_priority_list':
>> net/sunrpc/auth_gss/gss_krb5_mech.c:213:(.text.gss_krb5_prepare_enctype_priority_list+0x9c): relocation truncated to fit: R_RISCV_GPREL_I against `gss_krb5_enctypes.0'
   lib/maple_tree.o: in function `mas_leaf_max_gap':
>> lib/maple_tree.c:1512:(.text.mas_leaf_max_gap+0x2b8): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `ma_dead_node':
>> lib/maple_tree.c:560:(.text.mas_data_end+0x110): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mas_extend_spanning_null':
>> lib/maple_tree.c:3662:(.text.mas_extend_spanning_null+0x69c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mas_mab_cp':
>> lib/maple_tree.c:1943:(.text.mas_mab_cp+0x248): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mab_mas_cp':
>> lib/maple_tree.c:2000:(.text.mab_mas_cp+0x15c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
   lib/maple_tree.o: in function `mas_reuse_node':
>> lib/maple_tree.c:3416:(.text.mas_reuse_node+0x17c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_slots'
   lib/maple_tree.o: in function `mt_free_walk':
>> lib/maple_tree.c:5238:(.text.mt_free_walk+0x15c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_slots'
   lib/maple_tree.o: in function `mtree_lookup_walk':
   lib/maple_tree.c:3700:(.text.mtree_lookup_walk+0x94): additional relocation overflows omitted from the output


vim +613 init/main.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  606  
ffdfc40976dda1 Olof Johansson 2005-09-06  607  static int __init rdinit_setup(char *str)
ffdfc40976dda1 Olof Johansson 2005-09-06  608  {
ffdfc40976dda1 Olof Johansson 2005-09-06  609  	unsigned int i;
ffdfc40976dda1 Olof Johansson 2005-09-06  610  
ffdfc40976dda1 Olof Johansson 2005-09-06  611  	ramdisk_execute_command = str;
ffdfc40976dda1 Olof Johansson 2005-09-06  612  	/* See "auto" comment in init_setup */
ffdfc40976dda1 Olof Johansson 2005-09-06 @613  	for (i = 1; i < MAX_INIT_ARGS; i++)
ffdfc40976dda1 Olof Johansson 2005-09-06  614  		argv_init[i] = NULL;
ffdfc40976dda1 Olof Johansson 2005-09-06  615  	return 1;
ffdfc40976dda1 Olof Johansson 2005-09-06  616  }
ffdfc40976dda1 Olof Johansson 2005-09-06  617  __setup("rdinit=", rdinit_setup);
ffdfc40976dda1 Olof Johansson 2005-09-06  618  

:::::: The code at line 613 was first introduced by commit
:::::: ffdfc40976dda18d923cd001d44bf0ee55da1af4 [PATCH] Add rdinit parameter to pick early userspace init

:::::: TO: Olof Johansson <olof@lixom.net>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
