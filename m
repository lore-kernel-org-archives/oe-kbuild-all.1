Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C691E5708
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518571; cv=none; b=idLjBlZPiPTBp+0WajCfyyWFaydEhSZxlFT9FULkRCY0FDr+7Mu/DvO7BzJkLQzYEc00zbhQDR4uTmzNsp/ZDptHdaFg0ooE+sgchDhW7RiJMyUv8OWg30OGBXcaeEPKdjR/BU76QhXLGPYXp+Lw18dpuShdzqg6e1IlJxKYuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518571; c=relaxed/simple;
	bh=t+vXHaq5Ukw1cXWPvzU/z+IIZ6zVyMcAklrfKmVoX4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9VV3i6f+DmtCUFCAqVfw7jjX4BX97jTWNT8iIWR8MlpyrAbDe8aBu9aDZ8RhJTdCQXvJRSEeI9C6de8pXO65dp5TDU1KOLBS0UcdOgS0otE5bPu6Yy2B4Jo+XQTtJTw39h3tdzynkkiV6rPnCIFz0n8X7TU9ZTCuRArBFCvT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2qF/g/k; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2qF/g/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729518569; x=1761054569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+vXHaq5Ukw1cXWPvzU/z+IIZ6zVyMcAklrfKmVoX4E=;
  b=a2qF/g/kcxJk4DwLDTszk5u7UuYVtfJdCnwxtQDboTEJgTcvKmD0T81t
   wVrkj+Rt2HzkQ3EFYd32UdqCNH65KngfbxD7gt42H+NDOa5ZqM8Y4X4/O
   +8HSK/jC7WaYKkV6xAa9KRIcznGyQd4JBBzqTXNu6jnQ458g0vGNA/lM8
   86NP7h52reAM37mUVDYMWkiDUvEmkDmaRnTcvcS3+cItgjJ7PhWpFbdkT
   eCmmfK0izGYOw1BOoFN3sonsF5uJSJBxsj0Mx5kDvvVvZwlFinvkC7aa4
   /I3K21lKUIzGlDnAyYz/t09L6CoAnfGQQhS0xkrgXwGVYXY22jejfCcqp
   A==;
X-CSE-ConnectionGUID: wMzYgru8TTmovMhlxGEdnQ==
X-CSE-MsgGUID: /JcC8aY2TyKIOv28us+uKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51548247"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51548247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 06:49:29 -0700
X-CSE-ConnectionGUID: sd37zUC2QFioA1RCslXnAA==
X-CSE-MsgGUID: UVXUtcU8TZKe7YoAv4yKeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84593008"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Oct 2024 06:49:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2smh-000SDY-11;
	Mon, 21 Oct 2024 13:49:23 +0000
Date: Mon, 21 Oct 2024 21:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1448/2444] htmldocs:
 Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file
 that doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202410212118.6yQhFDv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 2336b804587bad15f1c80013b1c80ed607d92839 [1448/2444] docs: cgroup-v1: Add IOASIDs controller
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410212118.6yQhFDv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410212118.6yQhFDv1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/bpf/ringbuf.rst references a file that doesn't exist: Documentation/litmus_tests/bpf-rb/_
   Warning: Documentation/devicetree/bindings/cpu/cpu-topology.txt references a file that doesn't exist: Documentation/devicetree/bindings/riscv/cpus.txt
   Warning: Documentation/devicetree/bindings/timer/ingenic,tcu.txt references a file that doesn't exist: Documentation/mips/ingenic-tcu.txt
   Warning: Documentation/driver-api/gpio/driver.rst references a file that doesn't exist: Documentation/driver-model/design-patterns.txt
   Warning: Documentation/hwmon/inspur-ipsps1.rst references a file that doesn't exist: Documentation/i2c/instantiating-devices

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
