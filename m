Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62381724
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740763939; cv=none; b=i2s4SMZrFVzXQlR0RYkuIeHHZBo75kk715LxKTbS8kjTdpmJPcHAckIpATTFfJAbMLLt8Rg1pGzSe+BThDM39C9xUnTHnOHGixemR5LZEfhahAINFs6KiVXQ7N6sLaclLza3e/znBGyoLb407i1YDii5X1daZPkx0+jqveVS/VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740763939; c=relaxed/simple;
	bh=K7ev2F94z1DrO4TNLZtjY+mf1xwi+9x2/bBwwbvDb1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7vLnkDpu1I0xazyk2Ut9LLb9jKnJEZrj50L6C0B3Mbo31qFIi+oqLhzkqc4KOZdwEVAmI+o+f4GguyT1hX3SPSxlTmGdj2LtvJO/nBCkzrS5XRiXG9xCncYUT1k3T70P8H8o6CZi+yVu6MUt6RydFz9/cfdjG2HE8PvjQ6/RJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5coGEde; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5coGEde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740763937; x=1772299937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K7ev2F94z1DrO4TNLZtjY+mf1xwi+9x2/bBwwbvDb1s=;
  b=i5coGEdegMMtnFL+N8NkSGjfV94dSMLZ6zSPPcYLJ9Nk1tBtNDPfuO7Z
   u6Y2e66Xt2pNSbL4SQqaeVUOoJBwl1GKvq4cUnRGuGb6xT+W8LhKknSt8
   ULJ7CgHUy4QBVnNxi7Lf7elJhErfE0wL+RX88NBHT7xjKlEH8c+AZznyk
   ThTD8g6csOlpzqV14fqM4O9l0n7sPaOwJGUHYDPdOP0zKckIwhYJHqIZ2
   nh8fU3qfVEDBgPewVJqk/EAunl/9akKR+Dpmp01SqaX8Efo4BLMRR1VUd
   zoCwA286V/63967djTJKs84/Vwy6Dq50wg5KhzHBaoSXCPe6yvC+0pVe+
   Q==;
X-CSE-ConnectionGUID: yMN5xUgqQmm0m9RMvj5WjA==
X-CSE-MsgGUID: s09aGk9US1Wb7Sv28HemBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="59239441"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="59239441"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 09:32:16 -0800
X-CSE-ConnectionGUID: dxuj0hxVT6mxGdFvTzNoUQ==
X-CSE-MsgGUID: SziPm5pcRuCOY3soJG5MQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148305363"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2025 09:32:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to4Dc-000FHY-38;
	Fri, 28 Feb 2025 17:32:12 +0000
Date: Sat, 1 Mar 2025 01:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] htmldocs: Warning:
 anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist:
 Documentation/dax
Message-ID: <202503010146.iSXRUuNE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   33e283448f335063aab245460a2d3b85ac627b9d
commit: fe8f11ee359281843344fa5de03bb89360319831 [0/1] anolis: sync changelog from release branch.
reproduce: (https://download.01.org/0day-ci/archive/20250301/202503010146.iSXRUuNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010146.iSXRUuNE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
>> Warning: anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
