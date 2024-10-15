Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F0E1E764A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990952; cv=none; b=QIokxIe723VtG7yrcO0p+V56Mtt/enuCf67YvTZAbSuFhs9m9+zGgrXd3OYPVn9oc/mNnvmWPOk6KS5y6QYNMNJkpCG7RnPcpSvtYE+Dr5V+vNL8aUiJ2novwrmdum959pEElqZI9iIMlc77ZY0KL2HwgiIlvUQJtBC20+REWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990952; c=relaxed/simple;
	bh=lVjSrVnRY50pqp9Ex2c6t/OnmaWLV0LVKclb/uocaLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V5XULLbbbZE7+E5A4OhEMlO8TmhDl+r3x7nXPviQpLej7jBt5H3B4Tlum3f7Q9eI3HWTXfKXLFo3jTRUM3xEIW0evrqgD+VIciHdTAoUihpbZ2BY5u5JMdq3NS7Iue55Jdefnsbcq66XrsDBf+mI0a9KvD19sEJmuFusr5tOrYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTORbCVV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTORbCVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728990951; x=1760526951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVjSrVnRY50pqp9Ex2c6t/OnmaWLV0LVKclb/uocaLs=;
  b=MTORbCVVXjkBNvlCSXVpQlpxftkRmfeSTle7GWJr6uhFYlcNwriU9f0p
   lfmIxvqr5zvcu3LVCR7QCN2gfoju53kfFndBhnKFJy04kzHdpvR0A/ASZ
   uQ4YulF38AlZe7mugAjvm8AGp9kYR9xRBcXO4jDF+28Ea00LyIxhqrP/J
   5PV+pyWwQCQVzQwjM6lXC/TpI/Nza/3tKii+dOR3BKAFAJ2Ds3Ii7q9hL
   pk0adblaZq/gFIhO5Hf+z1IauwgryZN9KmDYqe0/yXjz7ak5zjlke5eHm
   0UA8RiAlnzSoCji9tua4o8ZlFZAFy8tophfiJSx9fi3hb5cX2jKqR73Nq
   Q==;
X-CSE-ConnectionGUID: HTPxBdRGSzmfb66Mt5XTJA==
X-CSE-MsgGUID: ek/Ye1BjSyixCpjB9y1yOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45849976"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45849976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:15:50 -0700
X-CSE-ConnectionGUID: r1LUvOWIQB25Wb+Oxew+oQ==
X-CSE-MsgGUID: QnhVx835QSysj7QZF95J+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77813178"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2024 04:15:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0fWk-000I1d-2P;
	Tue, 15 Oct 2024 11:15:46 +0000
Date: Tue, 15 Oct 2024 19:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rt-rebase 190/440] kismet: WARNING: unmet
 direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by
 IPMMU_VMSA
Message-ID: <202410151933.lsgoPBgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   08788bbb26e6f92122914516e7d36ade297a3f3e
commit: 5fa6f02b9ffaaf475cb48b2a6d3e31bfd2ba4735 [190/440] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
config: riscv-kismet-CONFIG_IOMMU_IO_PGTABLE_LPAE-CONFIG_IPMMU_VMSA-0-0 (https://download.01.org/0day-ci/archive/20241015/202410151933.lsgoPBgA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241015/202410151933.lsgoPBgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151933.lsgoPBgA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by IPMMU_VMSA
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y])
     Selected by [y]:
     - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
