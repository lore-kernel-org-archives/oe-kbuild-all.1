Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B4634F492
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635625; cv=none; b=H1jgcCMg9aZp3mDJEv2fOcnIPtkdoS/1AJp946y5tlWNgFBeTihgSW1OefO69Mhss4+mpLQrytypL3qt9fwtkfktNi3IMXvK/oHVOYoUYIFUC+hw5TVH0XC2aD+6ZGDs7Ps+vUfFFf+dN1fhuAw9XjegZJsHI6VwsMmqp4VpUH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635625; c=relaxed/simple;
	bh=2hAstQOuEQsW0YFZOAmDNg+Sn6OEfChHlRev0ZGolQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JL4suouNUIvfxLSdJD8UaLvb7XWthBTW9qPN8FPTRegGFuZn8WyCu6yRzZVuU0fh6g4PmSF7BYzxthLyhl1ECxvcDXn2DtmZzOeKbLYpvUXxzX8mccmfLpw0p1uwjwPTInQi8ktmsOpcBb9r5shk42hJ18OmSEazjExRRd8rX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmzW4L9g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmzW4L9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781635624; x=1813171624;
  h=date:from:to:cc:subject:message-id;
  bh=2hAstQOuEQsW0YFZOAmDNg+Sn6OEfChHlRev0ZGolQs=;
  b=lmzW4L9gMnioVsi2gIIx4H5MCrNWz69M4PoKobRYOCkhP6TkxsXQvf1N
   NVfhT0rrjEy6gRaZ1qLzSiygF2eeRQq3KOAxxOOFabz1mSgk9MsCAH2I/
   ws1c3T3Rk16juGwkuYY/zk7wcNw7kB4vxEudRfB4ASESZ9VWyagggmGaC
   0COPBwLNHbKkjC23RPUnImoyhFTgWwLlgtUzcHmQlJl6s1EzaegqUZC+U
   Rw2lPqRLYIFI3kSuWnOoj/Q6eIe3ZQzlrBOtOjdTXMrZuWn2kh8jMlemX
   52mUOkom6N770/Sh51y5whHFIE88GnDeMOpMgXSfNaPDwT4yUuz45VWer
   Q==;
X-CSE-ConnectionGUID: qX9OvtWJRpyhBx1awRyX/g==
X-CSE-MsgGUID: 7eWv5JD6SgGrYrv5mx993Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93794837"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93794837"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 11:47:03 -0700
X-CSE-ConnectionGUID: mX4xQaatTLubefqnjAr3Wg==
X-CSE-MsgGUID: r/gXFeyAQXm0DUkyNSvtag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247932838"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2026 11:47:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZYoN-000000005AP-2fUG;
	Tue, 16 Jun 2026 18:46:59 +0000
Date: Tue, 16 Jun 2026 20:46:49 +0200
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./usr/include/linux/pci.h:55:9: error: unknown type name
 '__u8'
Message-ID: <202606162035.jSAeTX9B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20260616-184951
head:   392d754f8b7c953e66a38e94f8a81883e94f625c
commit: 9effcebd7cc81134bb9fbda4e5adc7f9f3df08d7 PCI/TPH: Add sysfs binary file to export CPU to steering-tag mapping
date:   8 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260616/202606162035.jSAeTX9B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162035.jSAeTX9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606162035.jSAeTX9B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/pci.h:55:9: error: unknown type name '__u8'
      55 |         __u8  vm_st;        /* Volatile Memory Steering Tag (1 byte) */
         |         ^~~~
   ./usr/include/linux/pci.h:56:9: error: unknown type name '__u8'
      56 |         __u8  pm_st;        /* Persistent Memory Steering Tag (1 byte) */
         |         ^~~~
>> ./usr/include/linux/pci.h:57:9: error: unknown type name '__u16'; did you mean '__bf16'?
      57 |         __u16 vm_xst;       /* Volatile Memory Extended Steering Tag (2 bytes) */
         |         ^~~~~
         |         __bf16
   ./usr/include/linux/pci.h:58:9: error: unknown type name '__u16'; did you mean '__bf16'?
      58 |         __u16 pm_xst;       /* Persistent Memory Extended Steering Tag (2 bytes) */
         |         ^~~~~
         |         __bf16
   ./usr/include/linux/pci.h:59:9: error: unknown type name '__u16'; did you mean '__bf16'?
      59 |         __u16 reserved;     /* Padding to 8 bytes for aligned offset lookup */
         |         ^~~~~
         |         __bf16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
