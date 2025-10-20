Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF40262FD1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 20:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991087; cv=none; b=kM/FETpOp/R+naVXaZqiUF/7/Ed4NQwib03ZoLORI5r7+Fu95yiG7NSbnBFBYxcioaqaLgVHWg3AwGhb7cMSAPeQngnnEnBiEWprn5pYewNA6UtQrnyiVxVbrJUuFB7Nfare3GCDafFPfp82J+TdGf6JZM7sU+SO6iqsoI4SNss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991087; c=relaxed/simple;
	bh=Ll0BsQ4sKYSdzTlsqFfYEH+19D5hC4LiHNOvkV9pweY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hv2d/v8B8Nja5k5/66l8xGksOuMI39JlIHIdPzkOljzg3X94eKE4l1z6nbs6TJsHyWxOa4cbULhip9thguP2PXxtBzxVxPUoalBTh84nOBwOxIrmngXzzUJTgy39oxtR+46ZFJ6B5H045TLqL2aryGecYs4kS/1dvibV4+J1FOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjxXXH72; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjxXXH72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760991086; x=1792527086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ll0BsQ4sKYSdzTlsqFfYEH+19D5hC4LiHNOvkV9pweY=;
  b=XjxXXH722eh1kCBmeGdzKiljlHi4uLMTLiZPohx42gx3kM20vyHtCrAC
   DRkb+aDIiPVzdniLM5+HEP9e+yZd+OBD/LSGQmDjYJKqDphVKabS1d1CA
   BLyKQMIm/VZ23U+wU6YIB9NYqe8foIRPutZ5rIiMLW8aLgqhFY7i7Oxsc
   NiBbA9D5wJ9/3ZaybEXYqCTmi8B7nZHas5eW3s8Qr/cpNfgi5WOxArgEc
   oMvO1jRKpv+IYIKBODw7iitSPCtfk9cwGmc7yYCA4cOJ5baRB0T94oug+
   rDZsjUhpvnPOvo8e8i20F7ovxoZnn8jUhTORCrZOge5Efkc1jxR+o1Jd6
   w==;
X-CSE-ConnectionGUID: HSEngBovRPyhsayxlzuydA==
X-CSE-MsgGUID: anViSN2TTn6YkKS/9YCCqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74457762"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="74457762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:11:25 -0700
X-CSE-ConnectionGUID: pTRx6fXASQCcfUVhvbAkhg==
X-CSE-MsgGUID: YPYtgK9MSAqtwZty+Cdw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="184188098"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 13:11:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAwDy-000A87-2S;
	Mon, 20 Oct 2025 20:11:22 +0000
Date: Tue, 21 Oct 2025 04:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gic-v5-acpi 4/7] Warning:
 drivers/pci/msi/irqdomain.c:480 function parameter 'domain' not described in
 'pci_msi_map_rid_ctlr_node'
Message-ID: <202510210405.xqXshPkt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gic-v5-acpi
head:   2507aff522df8a03ac3b31cfd2f5cf564bf77be1
commit: 1fc48ea1aece10f58e4e7a09bb4c4b8ce20ea7d9 [4/7] PCI/MSI: Add ACPI/IORT MSI controller/RID mapping implementation
config: loongarch-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210405.xqXshPkt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210405.xqXshPkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210405.xqXshPkt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/msi/irqdomain.c:480 function parameter 'domain' not described in 'pci_msi_map_rid_ctlr_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
