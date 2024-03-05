Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B22579
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 00:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709596952; cv=none; b=Yecv3PXxJyYq1mhAPcJNuYoirL5MZgYn9CFAlXLNxutz6zU/xBOIbGbMtrS7yJ8M/PoSPBUZl/iOq4jdnvdO5uAaVGUxr0MNzW2pZaEBKtcvTu6kZX+t9MX0CIqXmj5i8ZacGZkvqZ0LD5sooTDtk3m2z3Mjqgh3Ztp+y2Riv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709596952; c=relaxed/simple;
	bh=0ArGEVDugqnh8M0zMMk/ikHEesQh2Q5J8COcPTh+Aow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpZUdHkV62qegpkzqFjMbukcxCKl8pL42B3vPMI8POVliNTv4T0w8+e6wkivScLJToaaMM+rNRe9mUDB60Gl9Bmc9T2KqCfZz02ll1h03nFYuTKzquC2s+CxfXM0qacMvv8oBcS7PTUKx+8uW9HFKJvlJx5mGr71A5lckALZh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdLQitJf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdLQitJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709596949; x=1741132949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ArGEVDugqnh8M0zMMk/ikHEesQh2Q5J8COcPTh+Aow=;
  b=WdLQitJfh2LwK6H0UV1J8OKDLymDmQk0OXDhCw0XegQfzyYOiYpZvxtE
   9jxo4VsuT2YdKP0CixhqtoNPnlDvtMsMjGd1RiItvyB/l80zUVL9GmCQW
   iEi83fKSo2o+L9+pvtLUjGwKY4uueHutuxcnJotvdyYF6hnH68YMpw3wb
   WgaULYVmfex3hlSdbZqMfArDLL5foesAcNNAPhjqmJEmpVo1xNZs4ZeIU
   8MfktRx9BL3SmbJ8AOyqo21Io20kcabWOPzf/xDgnk7+4n3d1WB378fIC
   h2RAdL1HLaMdug7lvN8jUsESnvbwb9BalmLt8aIdX08Ho7YaNVA2PXAyy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3975110"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3975110"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 16:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9125172"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 16:02:26 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhIGE-0002qb-2o;
	Tue, 05 Mar 2024 00:02:22 +0000
Date: Tue, 5 Mar 2024 08:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Warning: tools/testing/selftests/pfru/pfru_test.c
 references a file that doesn't exist: Documentation/x86/pfru_update.rst
Message-ID: <202403050728.8618u0TK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 1e03d1f6e22308791f0e8eed14abe9736cd34b74 selftests/pfru: add test for Platform Firmware Runtime Update and Telemetry
date:   9 months ago
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403050728.8618u0TK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050728.8618u0TK-lkp@intel.com/

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
