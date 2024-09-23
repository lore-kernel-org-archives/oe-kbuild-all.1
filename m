Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A97EAF6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727089286; cv=none; b=eMoeIVldMyTFXlddCOK37gpByx/exrMIPbk21VP7V8fE87JmgKJR1VzMyGZ8/klskksISZQnb7wdYcd92Us3bqxscVmGIPp70Q+n4qjuZ/9C843h3f/hCgrVd3y/YKTuLXnUTHe+WBQu6VMQSgAyH3n4ZkIbZRV4Mt0r78dtAvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727089286; c=relaxed/simple;
	bh=Qx/BaWbvQJsTDUlYrvPp4dLv1Or/ycJxxopnNZ0Vh74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YxI73Jh4fQDrHHd4sDl5Mqss51maWK4gCyTLdnUQeUVNSLdIKxX0JoHzaCr5/RAMMjZ6TroQCSZwn+mLrVyH4+LQQn55BrxnIaC7YRRy01sUXjVBEDeG69jS7g1CMI6cxNi07qNyoU5LZOty4L6PqmEw4Nc84jrupCmnY5xg1ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDJSY7Jq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDJSY7Jq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727089285; x=1758625285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qx/BaWbvQJsTDUlYrvPp4dLv1Or/ycJxxopnNZ0Vh74=;
  b=FDJSY7JqCVd7fre+JJXlg+Sh4eJmXHBU4o3n/MjdKaQguwaw4zu6Pi24
   mYLuP1SldUG9IfntTtj40bFmciJueQKkGt5tRa6fEb5nPYawE9attWlP7
   QbGO6KCq4WlEI/cajRa2FWmr9YG/lqv3QoPHI6MdcqPjO4aghMk3a0z9t
   0YTMRGgsj2l0Qta7ezPUGtZrZgdegSPUM4IaD2URVQkFfx705jDCbfaEr
   AqoVtyUfrM6ygzu/MxbhlnNp4O8YXE6zEc/gft429/VykbayBv0y0DGU0
   8bwzVCXP2tpACB8ownsIS29LqCLDDiCFAyPl0rIpjQGUJQaSIrpHP6yNv
   w==;
X-CSE-ConnectionGUID: HJlXMnGSRf2xDOkuDfEE2w==
X-CSE-MsgGUID: TCxuw2JNSwu0Iq1WLuIyAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26184425"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26184425"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 04:01:24 -0700
X-CSE-ConnectionGUID: 9AUiGj4RRxWQ5lvIakK7hQ==
X-CSE-MsgGUID: fSNB/tyVQNuca1wLLPF9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="75146726"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2024 04:01:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssgog-000H8U-39;
	Mon, 23 Sep 2024 11:01:18 +0000
Date: Mon, 23 Sep 2024 19:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1219/2441] htmldocs:
 Warning: tools/testing/selftests/pfru/pfru_test.c references a file that
 doesn't exist: Documentation/x86/pfru_update.rst
Message-ID: <202409231807.S2kp28kS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 65b2d1f44f785bb8354d4664c27fcb02507e13bc [1219/2441] selftests/pfru: add test for Platform Firmware Runtime Update and Telemetry
reproduce: (https://download.01.org/0day-ci/archive/20240923/202409231807.S2kp28kS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409231807.S2kp28kS-lkp@intel.com/

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
