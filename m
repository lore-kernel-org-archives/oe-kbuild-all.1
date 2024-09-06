Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634636130
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 03:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725593043; cv=none; b=A68hzxw84l/mGdoDHJvXFaKhvNJHrTKYymGBc0VcuDQoHhTjXdm3+HAW6q7cyWfRcSqVO68Jg4tsmGx/3ovY579hVOAw04GKeKsWsRV7g5zAtjDc3KnmIItTnC/5hcTGd24OOhXyTepBi+/qO7Z5HvXyfVr0Wvrq83rCm+NQ1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725593043; c=relaxed/simple;
	bh=CrOAxfOaQ29hQlqieiEttT8fnS2eGJ5m1fMWyiAqJyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwUryzD3chxSymcpYmlrE1mM/BYPNX8WfG8QflaUKUtl5RrxFi/Z0nteTeQ2fgBSIHIc7u7s4anditGOxCt9eYMvJBsutSXfFyFMyG5H20Lv0esl/mhWBXJXsIyTLYfo2iP2uRFHRZXwp8e8S49krDUJP0RIxF8SNdDl/5jrfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2BH6z3Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2BH6z3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725593042; x=1757129042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CrOAxfOaQ29hQlqieiEttT8fnS2eGJ5m1fMWyiAqJyI=;
  b=l2BH6z3Qp0bpG9GeCbXyOq7lZdtKXpXadBXh2ukxbCrfKfqmY9FCO0xW
   ESsFAAAU7ioGIp8/LAFoD0xSjicF1F4vSt4x5oJraCCVH1I2BNeMwiRf8
   VTxtSDlnddkb+Ynp7mGCJ085ljIgNqFT4WVX9KPVMr49eWeiw/vKaR/IC
   6DdDKdlLU66BPWoMKeTeLeHStaJ5ATsFAGmI2e5OWbV8Oj9APPePkTZc0
   AdM1OJmE/K7t6Qv78v2iFRxSZrlDXirQGtFdIR+SJMiUB3e42S+lg0vvb
   4Yw2kEkhCgGRKJiOKmbN4ndxtfiYXKrNYpAstqzS7Dsq6brb1KlPBfQWP
   Q==;
X-CSE-ConnectionGUID: d6dZfqgCT9iJGdRnq9iPiw==
X-CSE-MsgGUID: Z262f+JmRfqA0gGAxfkKmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35012704"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="35012704"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 20:24:01 -0700
X-CSE-ConnectionGUID: D2VR9zDvRoOWouvqSjZFnA==
X-CSE-MsgGUID: JSDMunLURc6c5U6CPg6Nmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70393843"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 20:24:01 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smPZm-000AYz-1x;
	Fri, 06 Sep 2024 03:23:58 +0000
Date: Fri, 6 Sep 2024 11:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 pci-epf-vntb.c:undefined reference to `ntb_register_device'
Message-ID: <202409061136.YXWZqzH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   14e468424d3edcf23167133d6ee2f3e3c6c5a022
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: x86_64-buildonly-randconfig-006-20240905 (https://download.01.org/0day-ci/archive/20240906/202409061136.YXWZqzH5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061136.YXWZqzH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061136.YXWZqzH5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `pci_vntb_probe':
>> pci-epf-vntb.c:(.text+0x2042): undefined reference to `ntb_register_device'
   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_cmd_handler':
>> pci-epf-vntb.c:(.text+0x2708): undefined reference to `ntb_db_event'
>> ld: pci-epf-vntb.c:(.text+0x2861): undefined reference to `ntb_link_event'
   ld: pci-epf-vntb.c:(.text+0x2a0f): undefined reference to `ntb_link_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
