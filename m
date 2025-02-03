Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906082AE90
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596827; cv=none; b=dqzk1zn1q/VHRUcKMjkSgpo16VcrLXyN0f521CKoE3k55Z8QwnWz//sqlOg07Qa5agI77Gtd13UydMNodmg8K3xoLi2I007A/HSlqFAFEHBS6lG1YYFp6gek1Y4rdfoXf8WuKcsmm8YsxbYcjcaqP5c52RiwkOdI9pJKwgIqR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596827; c=relaxed/simple;
	bh=tJoQWEIIIHsXUMlxz9/cPNclpizGy/mqUWDRpf/1Se8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrGBm0mrMBmhYV89d1okWUzvandVt4Vaj2VMy6Q24PFA0WYU8cbirsMTjbtjQ61t30JS91BFiW5SO0Szex9lWquP14WPPWukHOEyQ1kg8FZZxt5F+IJ2MQBfVeiTE8B96lQohDZraPRRMHIXzMd6FazW1JHXdo2/4z9z/jbSra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA158DxX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA158DxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738596826; x=1770132826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJoQWEIIIHsXUMlxz9/cPNclpizGy/mqUWDRpf/1Se8=;
  b=iA158DxXfhHHjgO9wAulDhlumVm0pd4LBcTeHEl1UJCQSWzDgrdeFB7m
   4eT+NRy/Zcee+/DjctymgNB5YGubRqHunQUYADIWbVwX65NDDOYYCrr9P
   ftRfem+1NjhTfV++RaVsVU/8pxEsNZjCNT1Dayx1JvtVmob+rcGNJkpHp
   duRDMBcxvqbwN05/rHoFJd6U5H5PXkDQu2aP3VnhbKzFkLtF03Pgexuaf
   nYfknEKb9NnAyjt2SIz6EG3+524JPAfai03oCzJ3pYfiUZ3wLvz8k5do6
   4MsGcoewh2M+ajYDJ2aV0AxXL6YWxU2a9hGkdLP44cvl58dTXt/C75iJu
   Q==;
X-CSE-ConnectionGUID: Zrof6bdLR4yZwiE8tNSLbg==
X-CSE-MsgGUID: 4oCuNVPiR32b7FMJ4r3tig==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50482521"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="50482521"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:33:46 -0800
X-CSE-ConnectionGUID: UybdnQUmQU+jT1tu0BIc0A==
X-CSE-MsgGUID: T6lldEdXQq6nHUnOeuVLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110776572"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 07:33:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teySD-000r72-0j;
	Mon, 03 Feb 2025 15:33:41 +0000
Date: Mon, 3 Feb 2025 23:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Michael Shych <michaelsh@nvidia.com>, linux-doc@vger.kernel.org
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 4/6] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/ABI/testing/sysfs-driver-mlxreg-io
Message-ID: <202502032336.lauIV68J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   515c0863b300bdc059f8760ffa0804a0dce63896
commit: 7199a0f557cb1538991c03eb3b183dc4b002d0aa [4/6] mellanox: Relocate mlx-platform driver
reproduce: (https://download.01.org/0day-ci/archive/20250203/202502032336.lauIV68J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032336.lauIV68J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-driver-mlxreg-io
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
