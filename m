Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28451A0BD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612550; cv=none; b=Nayprs2beXoBko8WIkotCi00vVyHKmhq/IZmFaQHjYIktFjBrtz6sWWcm0DakWO5Qo+VQGqIytKkVQb3OXurwxAayBiiUakSjNjL4/BGYuKd9g7G0z2Ms1pJqDOC3sWd35iTXrekCpndk1pXRkYJqsJ9qC4YAjECJw2k8E81dWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612550; c=relaxed/simple;
	bh=GGOxIlLziBtdlBOGAhtXDrgFi8zah6FVifLqgGQp/BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhlOvka2YvBul2ZqcvGv1yvCO4dpcHHuO75sX7KTlK2CQlrQrGqYDwnsH+Gv1N3EXvfdX4VWA0zh67hH4/XpL6I4ukK7LFXlDnGonzIeiRiOYtL6LR4gg7qpO7PzDxlZ6NfhmpTJSTW8643EpTggIYGLbAoqpKczLk93zyVYz/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNI+EmcN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNI+EmcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729612548; x=1761148548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGOxIlLziBtdlBOGAhtXDrgFi8zah6FVifLqgGQp/BE=;
  b=GNI+EmcNghoz2D5dmLQyTnlcwnDyGG8HQGB6NtkQvxFxDz9QTvtkChEK
   ThUOAFUKbX7r3WJXxtomJTUpsmJfdsSIpxP3ixsjEDsAmpLLYcCyQbSp2
   zOaCKZJbP2LuCA9UTDwgsGdHVvgBtj2K8CNOZDJQJ3nl84Hk9BL08AFIP
   fglf9iiTqe5DuoXg58JcVvYcaO+lexYgrSGxuDzbh1utKhhZeQUvibw++
   Zi1otixTtW6NwyUHCenaadRRRkyYkn9Jfz2d23W13PeeHsioOnkSAVaRg
   F2k6pwY/odAUE6pEMW5caVyzm7RBtnhiTGuMs4HHH+46tP0I5mzmWV4Wi
   g==;
X-CSE-ConnectionGUID: zTiOdxZvTP+GlTZcVmWQcQ==
X-CSE-MsgGUID: XbbJmT5hSXWsduF2FryytQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40553539"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="40553539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:55:48 -0700
X-CSE-ConnectionGUID: EpLBslgARe2IE8qW9/srQA==
X-CSE-MsgGUID: xkUcSLcFQYi7PpSnKV6YVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="110692531"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2024 08:55:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3HEU-000TlC-1C;
	Tue, 22 Oct 2024 15:55:42 +0000
Date: Tue, 22 Oct 2024 23:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1020/2444] kismet:
 WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS when
 selected by X86
Message-ID: <202410222356.3yvu5zUL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: dc5a05bb7d9999c314434d9e7b2ff1f66184c9e0 [1020/2444] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks selectable
config: x86_64-kismet-CONFIG_PCI_MSI_ARCH_FALLBACKS-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20241022/202410222356.3yvu5zUL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241022/202410222356.3yvu5zUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410222356.3yvu5zUL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS when selected by X86
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - LG_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && ACPI_WMI [=y] && INPUT [=y]
   
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
