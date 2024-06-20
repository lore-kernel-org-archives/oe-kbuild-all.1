Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E29B1990A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718872727; cv=none; b=n11UiJOjGoxDb4ufGnGKmuLkJVrCvCpOveU1+dJsiaSwj1l7DuLDh/jG1w1m66r9yQ9JY5Y6xkuQSDmODMTAk8ClRHwlVEqTYY/YDuxxTIw8J9Yed2pidsAxDGCoTH0T5NC5TZje9S5FTjeR1wUZBj8Ijym7Un3WlyGRGWFKzgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718872727; c=relaxed/simple;
	bh=DryLwhhu1GhT4grY4oZrSPjSGtBtBEecMMCQiZSy+As=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OEQGIMMIy22I6R8rJk6DvPVykDjLqSxX6fSqWEs2itw8rRUlF5xzB/3E92fULquVbtJUib9DrZNxosMuvrENfz8xMGzOLqXDAVt19vkvCKE/gKWJCu/s57cxu0jbu8Itfu6xn69nZeqyKgp5u4jJp0IDLXMntjEeq3ZRBREU+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzyuU47Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzyuU47Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718872725; x=1750408725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DryLwhhu1GhT4grY4oZrSPjSGtBtBEecMMCQiZSy+As=;
  b=KzyuU47Qmog1yjVYjk3UhhdulF9vspFPB6vMZw43VTu0G7vRB4/WKPeg
   TFB7kJYIX78dnoHn/aL8k/yzWouEG8L8Ubq2pGImLRTD/bjZXwqgdWVYc
   wHfgCeduDtflVKBwffoVDzBa8r/uIpoCvz2dtJ1z34kZzUmIFtPAUL1ct
   gwAb8qMig2o6ub59nhl09P1rFUwKrpPYwmsmhhKq3HT/UFMBVQA0x0P8y
   dKLdns7tNMpaLfsM2cQjozhAcrahKEmpjy98idENb2uJf0PZd4olKr3Bh
   0igijlPrFrrlsVXKbh/gL0nIQ+VdG6WASLZQkjomUdPmks9gf+jTzjOoT
   A==;
X-CSE-ConnectionGUID: 3jo8KhjgSxmglGL6cOTjwQ==
X-CSE-MsgGUID: NQlgTiVDSpywDzGCwgJE3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="12159288"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="12159288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 01:38:45 -0700
X-CSE-ConnectionGUID: FwWPb1XIQimZdHO7H9fRHA==
X-CSE-MsgGUID: cgXSOuwfQM+CAEn72wmtRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46619327"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 01:38:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKDJZ-0007Rm-1m;
	Thu, 20 Jun 2024 08:38:41 +0000
Date: Thu, 20 Jun 2024 16:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 4248/9999]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406201657.IFEpVZNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 77ed2ae0b7460ff740b3590e53a0f857b2be4dbb [4248/9999] arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240620/202406201657.IFEpVZNL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201657.IFEpVZNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201657.IFEpVZNL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
