Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97813A41F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 04:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750047984; cv=none; b=HpmG21A0xXm+rt7FzIUcDmDiex7pRxZ47PwfkoaB9e+w/RE9AIFavxm/mfz2fuwM5La40tSzYrTkKlyvIz1Cz1ZJkBR59Tu9B/Egz2GdRHWXCJ5Cr/lSWuYfbPvDX7BuI6AIwoTr65x5oAls8nahQ4fzVHqsTxw/BUo4NvfwoHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750047984; c=relaxed/simple;
	bh=6zkWaebuOyBlAnNDpaVGDXg0tfHpCWpIi850gOJLl4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDmwnlceZ+nEK+Ti5Lz9WURKcJj/TLxWmKpbQhHORqfkC2BQ5RL2zCIbrEDtR8nnpJhvab1P5YPGD5vI83B/tmmgC6CRt7Pm3U3+m234y86LkDmrDftTcjsCaKHCCBWiOUBxtI4RN6OL6897eObDk8erS5KvN2zWAf+YI+fae20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVcgkE23; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVcgkE23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750047982; x=1781583982;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6zkWaebuOyBlAnNDpaVGDXg0tfHpCWpIi850gOJLl4A=;
  b=VVcgkE23DKn4DuPKoVbeOwzRN5/NOGPCfRz5L65NZoy9+FtzWxi3Dqfs
   /9pEChVZHHsDDSL/pPal3grZVAJWiOIY387RFDRNQ1nFnAeY/dU7NfRUn
   WVwe691sc9KBXuAJHlWpZYYExfiUMAgGJJdYF05u5E4/DKl4HLHM1Pbeb
   3WXH7XFfSSdRSpzQcG/XDyKU4UmsaN4lp0g2vDM7Dc4OnPuBsEiQb3VRV
   gH7Zt5G4nec4a34cmWeN0t2pmU8WjpfEisYF+GfPmFitYSqwZ+I+vf+v3
   hRGFRFfgHgGr8Hr2CYcKqt1X9KX5i/l4mbdDcaECmZsIjTVIXsg1E+6x6
   Q==;
X-CSE-ConnectionGUID: x7REHfcyTg+/2Mg86GX86w==
X-CSE-MsgGUID: oDe/D+dnSm6kaY88zTgLqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54800363"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="54800363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 21:26:16 -0700
X-CSE-ConnectionGUID: m2rASCsBQiWXmucf4b277w==
X-CSE-MsgGUID: 1g4SHIB5SNCFMsSPSdWIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149239914"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2025 21:26:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR1QC-000Ek5-0C;
	Mon, 16 Jun 2025 04:26:12 +0000
Date: Mon, 16 Jun 2025 12:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2968/2968]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess
 function parameter 'file' description in 'SXE_MSG_LEVEL_DEFAULT'
Message-ID: <202506161252.osClELwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   49ad0aeea0747f589e03fb0959d5582f166c8fdf
commit: 3c27aa8f615da8e36e1dc802839c98702187757c [2968/2968] Linkdata：net：fix sxe compile errors 'sxe_resume' defined but not used
config: arm64-randconfig-004-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161252.osClELwQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161252.osClELwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161252.osClELwQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess function parameter 'file' description in 'SXE_MSG_LEVEL_DEFAULT'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess function parameter 'author' description in 'SXE_MSG_LEVEL_DEFAULT'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess function parameter 'date' description in 'SXE_MSG_LEVEL_DEFAULT'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]


vim +48 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c

8cee206b555824 liujie_answer 2025-04-01  47  
8cee206b555824 liujie_answer 2025-04-01 @48  #define SXE_MSG_LEVEL_DEFAULT (NETIF_MSG_DRV | NETIF_MSG_PROBE | NETIF_MSG_LINK)
8cee206b555824 liujie_answer 2025-04-01  49  

:::::: The code at line 48 was first introduced by commit
:::::: 8cee206b5558245197158bd20895f95cc28d8468 Ethernet: Linkdata: Supports Linkdata ethernet Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
