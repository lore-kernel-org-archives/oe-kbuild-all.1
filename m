Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC7E1F12EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729514781; cv=none; b=OU45BDGf2NsjvFPTQUNx6C+dOP2RNIlkmFZ6BixLSwLp0nh7iMK3xHR+/nSDO72hjF+EEqtT6ide2Mmel0GtqkU9fmFWQ2K5C3ssiKmOEzWLmN5iJpOARywn6Gv0XBIo3J8NObODCXP6bdgUyIXcCMvCKRPMiS2PQPsDuVZTAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729514781; c=relaxed/simple;
	bh=hLae/DJmx63aQ9hNwqi1StBu18BKbIFlowygmH3N4RE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEyqCJ5SM2nbkkEomK20LFUvCNMibkWNAkRwN6425Urb04jihvLQ3T8nFhVaITI3l4IrR7uO1Tb7z8/IlWhryN4eQod62JAXQJMydeDF4svEHo1AjE0virfFbkMEgmz0iwC2O73KhB5H+yZJKJ60+bBba7OF3xzDCq9sSCbsJsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwSFAjQr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwSFAjQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729514779; x=1761050779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLae/DJmx63aQ9hNwqi1StBu18BKbIFlowygmH3N4RE=;
  b=LwSFAjQrxmAOn/dEF1Zu3KFjHb8dmGjul3K96ktBaOTTMyXeL+pTpyEr
   Cvx2LnPHqilSmWsjahCfEyMUb0G4MDaBFaa+rC3FzRfS0nV9TwvnEYIlO
   R5dgQIbWbPLqzvx3cxDpVqV5CBTwbZ6cVEcE0UjAOdaqPl0IIrR14y4Hh
   lbaXY8RMnpr8svQfoEG4ZW2zZzzr87u8CwFyQfsoxXQ7PWeHAIKyL9l75
   d3sR3WISOCRcjeZ4xvp54RtNhChAqR2o8LnIDiLVzi6dP1TT/TSxEfCTM
   W9rRiW+epQ8h6gcTOrbdwv8yeFqplW5EBsUKm4agwFG625R8YdAL9fSBD
   w==;
X-CSE-ConnectionGUID: Z8o8ZgNVQ8OGar72UNjMww==
X-CSE-MsgGUID: Lsex2pHORVeS0r8AWeN51Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32800038"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="32800038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 05:46:19 -0700
X-CSE-ConnectionGUID: kDegwUX1SkeIqMLavMnJow==
X-CSE-MsgGUID: OD/iVT7lTRO4P1FRk6adVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79594926"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 05:46:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2rnZ-000S9K-0c;
	Mon, 21 Oct 2024 12:46:13 +0000
Date: Mon, 21 Oct 2024 20:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1219/2444] htmldocs:
 Warning: tools/testing/selftests/pfru/pfru_test.c references a file that
 doesn't exist: Documentation/x86/pfru_update.rst
Message-ID: <202410212046.iv9ndL6j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 65b2d1f44f785bb8354d4664c27fcb02507e13bc [1219/2444] selftests/pfru: add test for Platform Firmware Runtime Update and Telemetry
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410212046.iv9ndL6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410212046.iv9ndL6j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/
   Warning: tools/bpf/bpf_asm.c references a file that doesn't exist: Documentation/networking/filter.rst
   Warning: tools/bpf/bpf_dbg.c references a file that doesn't exist: Documentation/networking/filter.rst
>> Warning: tools/testing/selftests/pfru/pfru_test.c references a file that doesn't exist: Documentation/x86/pfru_update.rst

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
