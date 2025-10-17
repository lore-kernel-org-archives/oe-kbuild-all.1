Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093C2853F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 03:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760673046; cv=none; b=aasS4p9LzYC53nmT5bakHFxmLcFQbKio9FHh4f0rqzsbdewUPMGs4/v8oyANMADGIUFm4YTbeo+DX3FIMSozCYotIDYHycl4qK5ey5UddYSToeR9J2vYXzumKaoZHYVThktJpkan6zoBnsH2+Cw7Ox7RFQhm/SxL+kiWGvWfH7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760673046; c=relaxed/simple;
	bh=0DKX1wf+AV0q9vFSaKX5TZM4rIbpudc7gzWZRaCxC0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOiyk8NEVyt27mZn1xdR7SRbKUtoe3eOoG/5GQcYMLelArSLj5S2G3xTI47sch7TO2bswb8pJwfimzCltfwdWwnqbaCBovTpFWye2GlXe7IYN/TtNEleqqzkda69MjYW6ZLsafuHXq8xUuDorXxK2Oe/S3st2BX64YLBfiJPjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfLiMgUv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfLiMgUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760673045; x=1792209045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DKX1wf+AV0q9vFSaKX5TZM4rIbpudc7gzWZRaCxC0U=;
  b=IfLiMgUvfadwwbWiz82SZ6Pus7r1u/v3bwqSkQA6FNCW/LZIGUCLx3qC
   bwHYKPdJf38zYKKs+KyIkhDpqFLmIxxeSmXy+PHm8vyB5/loHF8HQhrxC
   lbRFgwBXWa06j3P2tbGADVIAl/JzGTbtGD071mzH+gImiILyByGNggg9c
   gEUNcy035UNiAWZTSCmzgka2kZiGtk43K4cvsEU+OJbQvGd/JjRPZ2Ore
   ZI9JFr9RZA9dXBW2WHmVLndskEJtKJPNIqoEW/peSE8oXgDFHTT+Pm+tk
   Hvwd0n0ZyJroD7MED3RMfZPEingLCqitlgtncy6otQq0nJPtRxSVCxzxL
   w==;
X-CSE-ConnectionGUID: J75Rbf+oSeK1mFWlFfGUXw==
X-CSE-MsgGUID: mPMqsUqvSB+kRxfAz8uQJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62088763"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62088763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 20:50:44 -0700
X-CSE-ConnectionGUID: KPb4yiluQhC+cPx2hjru2A==
X-CSE-MsgGUID: kAFP+OTXTKmnTZwveIOA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187908624"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2025 20:50:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9bUG-0005VT-39;
	Fri, 17 Oct 2025 03:50:40 +0000
Date: Fri, 17 Oct 2025 11:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2025-10 1/1]
 drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: error: positional
 initialization of field in 'struct' declared with 'designated_init'
 attribute
Message-ID: <202510171126.xXp9vXAk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10-2025-10
head:   9f7404df22344076e4d63864b2a60eefb0ce6fed
commit: a5c6c3431e4ff30a8abccdddaf2c0fa1e7707a77 [1/1] randstruct: gcc-plugin: Remove bogus void member
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251017/202510171126.xXp9vXAk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171126.xXp9vXAk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171126.xXp9vXAk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/elfcore.h:11,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from drivers/net/ethernet/qlogic/qede/qede_main.c:7:
   include/linux/mmzone.h: In function 'movable_only_nodes':
   include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   drivers/net/ethernet/qlogic/qede/qede_main.c: At top level:
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: warning: braces around scalar initializer
     202 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:204:17: error: field name not in record or union initializer
     204 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:35: error: initialization of 'void (*)(void *, u8 *, bool)' {aka 'void (*)(void *, unsigned char *, _Bool)'} from incompatible pointer type 'void (*)(void *, void *, u8)' {aka 'void (*)(void *, void *, unsigned char)'} [-Werror=incompatible-pointer-types]
     204 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:35: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:17: error: field name not in record or union initializer
     206 |                 .link_update = qede_link_update,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:32: warning: excess elements in scalar initializer
     206 |                 .link_update = qede_link_update,
         |                                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:32: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:17: error: field name not in record or union initializer
     207 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:46: warning: excess elements in scalar initializer
     207 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:46: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: error: field name not in record or union initializer
     208 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:44: warning: excess elements in scalar initializer
     208 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:44: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:209:17: error: field name not in record or union initializer
     209 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:209:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:209:41: warning: excess elements in scalar initializer
     209 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:209:41: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: error: field name not in record or union initializer
     210 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:42: warning: excess elements in scalar initializer
     210 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:42: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     202 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: note: (near initialization for 'qede_ll_ops')
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:22: warning: initialized field overwritten [-Woverride-init]
     212 |         .force_mac = qede_force_mac,
         |                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:22: note: (near initialization for 'qede_ll_ops.force_mac')
   cc1: some warnings being treated as errors


vim +202 drivers/net/ethernet/qlogic/qede/qede_main.c

e712d52b9f2a8ec Yuval Mintz             2015-10-26  200  
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  201  static struct qed_eth_cb_ops qede_ll_ops = {
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26 @202  	{
e4917d46a6537c5 Chopra, Manish          2017-04-13  203  #ifdef CONFIG_RFS_ACCEL
e4917d46a6537c5 Chopra, Manish          2017-04-13 @204  		.arfs_filter_op = qede_arfs_filter_op,
e4917d46a6537c5 Chopra, Manish          2017-04-13  205  #endif
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  206  		.link_update = qede_link_update,
ccc67ef50b9085b Tomer Tayar             2019-01-28  207  		.schedule_recovery_handler = qede_schedule_recovery_handler,
a8736ea83b80526 Igor Russkikh           2020-05-14  208  		.schedule_hw_err_handler = qede_schedule_hw_err_handler,
d25b859ccd614d2 Sudarsana Reddy Kalluru 2018-05-22  209  		.get_generic_tlv_data = qede_get_generic_tlv_data,
d25b859ccd614d2 Sudarsana Reddy Kalluru 2018-05-22  210  		.get_protocol_tlv_data = qede_get_eth_tlv_data,
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  211  	},
eff169608c25019 Yuval Mintz             2016-05-11  212  	.force_mac = qede_force_mac,
97379f15c21e7ae Chopra, Manish          2017-04-24  213  	.ports_update = qede_udp_ports_update,
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  214  };
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  215  

:::::: The code at line 202 was first introduced by commit
:::::: a2ec6172d29cf3aed92e9db40e83e36329db1dd5 qede: Add support for link

:::::: TO: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
