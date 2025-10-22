Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223F91ACEDF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 01:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761098325; cv=none; b=EotdRMU3K8wqOxs7czzjVOq24UIMvOvTML0nnogAYzHvPZ9Ljy/QUWzvQk7kxuRhlpS7Lb4X8w/DSTlbhU38X2oSOt+HwnxGUeh0L704DcvgW18Z+u/sK8ksMf2jVniqUQqOREDeWqQJFB8iKhzqsaJPvmqJr9UqAVn4eEp6/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761098325; c=relaxed/simple;
	bh=KnCXM8JdCYSwVxl412i159a3KJAUNnZpWZD1vkUXEY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/klzIp9JRpU8Qz66w+QFONNUFAp66R/2z3vSU1+sBZQOped++nMsb/OGHFU4pzz6hl5b195fkBxG63dGuFWR6yRXTSdNBQqxW05GQ5VY7dvmcO062IVWdeyMyYpm3+MpytyCZUWNJmjXD5BNzyTpo4ihLPzFlGFqDgHuvcFDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=curYs9OR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="curYs9OR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761098324; x=1792634324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnCXM8JdCYSwVxl412i159a3KJAUNnZpWZD1vkUXEY0=;
  b=curYs9ORv49urMIpUcaoTAnzNiSITDq+9ovAvnrMvIDrNaQBEGDAlasy
   zaRqsrB/BbS6qG2/vDdpPrSMB9vgUwcRp44CyvbncESaSNdbYZRTeelzA
   NfJfYQzM0dd+T/SBG4OMI4nvOOX2vFFcIenhkM8bP757mWn2FzrKCA+DU
   2ajs5I/V3ChMyRP0nmZB0hJVE9YphCesnANM2dY4tVphzXvcRXp6zusLx
   h3MRsuyZSLndiABeZGCdap9KWTff0kMiIJaJlJXuFToc0DkFm2QlnGGIr
   WssvEF0ApQvlmkFuCBhmSQ7KK0djG4KWxyBqEtBXbhxEduxkWJ7R7NH9Y
   g==;
X-CSE-ConnectionGUID: 2qX3dmcNTO+IaiPTPROyqw==
X-CSE-MsgGUID: QyTzVZ3DSFuFPeIYRzPycA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50810588"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="50810588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 18:58:43 -0700
X-CSE-ConnectionGUID: hM2Nw/tgSbeejoQof8M6Sg==
X-CSE-MsgGUID: p/fFIxzoRBCqdzNmpqqKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="214380750"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2025 18:58:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBO7c-000BvF-1c;
	Wed, 22 Oct 2025 01:58:40 +0000
Date: Wed, 22 Oct 2025 09:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl-v1 6/7] ld:
 include/linux/pinctrl/pinconf-generic.h:235:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202510220957.IqUqWmRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl-v1
head:   812dac031dbeccaf5456d0426f3f53768fb7902a
commit: d5760f78d45770285035484a982c145ac806056e [6/7] pinctrl: add polarfire soc iomux0 pinmux driver
config: x86_64-buildonly-randconfig-006-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220957.IqUqWmRX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220957.IqUqWmRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220957.IqUqWmRX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_all':
   include/linux/pinctrl/pinconf-generic.h:235:(.text+0x5a5088): undefined reference to `pinconf_generic_dt_node_to_map'
>> ld: include/linux/pinctrl/pinconf-generic.h:235:(.text+0x5a5488): undefined reference to `pinconf_generic_dt_node_to_map'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
