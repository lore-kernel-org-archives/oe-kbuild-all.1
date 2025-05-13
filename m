Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D11DF74F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179743; cv=none; b=rtDHso3qd02wOCo3jCXra+J70tdUwiBDIxCE5GFqCcqKiOq1Llz8muNB6EIMYjB53UARyisWZ4L0JRcQ3fanAjB+4uZn5H7jYG2sAG6BRsOhhQ95uVnPnnFmEQc4uSAw2r4jWbF3m5MgUfq3TEKlvY6pW1cZverUtQNsVMwou0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179743; c=relaxed/simple;
	bh=GeZ/WFXryfNxjS8jVtAp31df3T3SVN2lQLtZPWs8lcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDq6Kwb8RJ33zaRwqaV1AjvagpL1yLAlk+odkWwJG+Bi+nbEXbdctfjg28qSEI3pDckZZ+BfZXsiS7JfbOaRgNH+XaDTfDZnayA6pcrIeyimM5NtUg48sP/oAqVse3qYY08p5/tb01scuw6lmBRZrgjVD7xLAULfkIaz08yX2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnipIybF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnipIybF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747179740; x=1778715740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GeZ/WFXryfNxjS8jVtAp31df3T3SVN2lQLtZPWs8lcI=;
  b=lnipIybFge0iI8/E7wMKIq1I+cqbCxXKb6rfpfzdrMoFdYtrNgew+tjS
   HXoqIhkhabB/9ylh/9JfHVLeB9uNmaojCvLxprz4bsZbSSZYWdjjfcBds
   tXvM20bPLj9u10hjAPi0f+m/Q5QHGYoxcBPtkHAplKBGfdOvttLwHDlBM
   039khbKVEfizTdn3i++WZ+oCCtQA3dCjHNUF6vrfGTlkVW/nfELGrI3HB
   ZNXjZCStGaBbEUlraTgRGUWY8i6/rvsx5lyQ6uTUOTND2Xx3NjUyRF7qN
   QIOFIRtUsFBtB4Bskd3uqf5vzuno2dWOgfCB63lw2dVdB2mJ97XSlOI8A
   Q==;
X-CSE-ConnectionGUID: fCVrwBn9QE6LdYNLXpJkkQ==
X-CSE-MsgGUID: gKUBLClySGWhwt6jgTYxlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59280888"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="59280888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 16:42:19 -0700
X-CSE-ConnectionGUID: v0yTV19dQeuceOicvIpoHA==
X-CSE-MsgGUID: 6bPaynHoSLuI9tWJO/vxgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="168801044"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 May 2025 16:42:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEzGK-000GVI-0S;
	Tue, 13 May 2025 23:42:16 +0000
Date: Wed, 14 May 2025 07:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220]
 drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast
 to restricted __le32
Message-ID: <202505140714.hwzBwdOl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   855c2a6945da5d74f3e50d601537000d0989d5a3
commit: 663a9a1c191fd26f1d8cb44edb6e0e50dd0536b2 [2220/2220] !14287 [OLK-6.6] SCSI: Support Linkdata HBA/RAID Controllers
config: x86_64-randconfig-123-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140714.hwzBwdOl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140714.hwzBwdOl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140714.hwzBwdOl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.c: note: in included file:
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:107:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:107:17: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char * @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:107:17: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:107:17: sparse:     got unsigned char *
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:127:25: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char *reset_key_vir_addr @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:127:25: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:127:25: sparse:     got unsigned char *reset_key_vir_addr
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:151:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:151:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char * @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:151:17: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:151:17: sparse:     got unsigned char *
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:188:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char *reset_key_state_vir_addr @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:188:35: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:188:35: sparse:     got unsigned char *reset_key_state_vir_addr
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:261:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:261:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char * @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:261:9: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:261:9: sparse:     got unsigned char *
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:280:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:280:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char * @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:280:17: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:280:17: sparse:     got unsigned char *
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:549:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:549:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char * @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:549:9: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:549:9: sparse:     got unsigned char *
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:584:37: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:661:37: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *reg @@     got unsigned char *[assigned] reset_addr @@
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:661:37: sparse:     expected void [noderef] __iomem *reg
   drivers/scsi/linkdata/ps3stor/ps3_ioc_state.c:661:37: sparse:     got unsigned char *[assigned] reset_addr
--
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:720:17: sparse: sparse: cast to restricted __le32
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c: note: in included file:
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:317:21: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:318:23: sparse:     got restricted __le32 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1572:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1572:31: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1572:31: sparse:     got restricted __le32 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1573:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1573:29: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1573:29: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1578:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long sasAddr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1578:46: sparse:     expected unsigned long long sasAddr
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c:1578:46: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
--
   drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd_err.c: note: in included file:
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h:30:16: sparse: sparse: cast to restricted __le32
--
>> drivers/scsi/linkdata/ps3stor/ps3_event.c:23:16: sparse: sparse: symbol 'ps3_event_code_pd_count' was not declared. Should it be static?
>> drivers/scsi/linkdata/ps3stor/ps3_event.c:39:16: sparse: sparse: symbol 'ps3_event_code_pd_attr' was not declared. Should it be static?
>> drivers/scsi/linkdata/ps3stor/ps3_event.c:54:16: sparse: sparse: symbol 'ps3_event_code_vd_attr' was not declared. Should it be static?
--
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c:24:22: sparse: sparse: symbol 'g_ps3_host_info' was not declared. Should it be static?
--
>> drivers/scsi/linkdata/ps3stor/ps3_pci.c:436:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reg @@
   drivers/scsi/linkdata/ps3stor/ps3_pci.c:436:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/linkdata/ps3stor/ps3_pci.c:436:21: sparse:     got void *reg
>> drivers/scsi/linkdata/ps3stor/ps3_pci.c:456:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *reg @@
   drivers/scsi/linkdata/ps3stor/ps3_pci.c:456:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/linkdata/ps3stor/ps3_pci.c:456:23: sparse:     got void *reg

vim +30 drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.h

97a2bb6ece556f liujie_answer 2024-12-24  23  
97a2bb6ece556f liujie_answer 2024-12-24  24  static inline union PS3RespFrame *ps3_cmd_resp_frame_get(struct ps3_cmd *cmd)
97a2bb6ece556f liujie_answer 2024-12-24  25  {
97a2bb6ece556f liujie_answer 2024-12-24  26  	return cmd->resp_frame;
97a2bb6ece556f liujie_answer 2024-12-24  27  }
97a2bb6ece556f liujie_answer 2024-12-24  28  static inline unsigned int ps3_cmd_resp_status(struct ps3_cmd *cmd)
97a2bb6ece556f liujie_answer 2024-12-24  29  {
97a2bb6ece556f liujie_answer 2024-12-24 @30  	return le32_to_cpu(cmd->resp_frame->normalRespFrame.respStatus);
97a2bb6ece556f liujie_answer 2024-12-24  31  };
97a2bb6ece556f liujie_answer 2024-12-24  32  

:::::: The code at line 30 was first introduced by commit
:::::: 97a2bb6ece556f3882263ee8df2b77f10c511311 SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
