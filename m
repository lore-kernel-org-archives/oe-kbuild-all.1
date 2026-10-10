Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F949E124
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637107; cv=none; b=mN/KKXMy6xtc3KjO/k+5tQ6iK/F9ZZdxfzOENCfLl5Gpc8sLm4UYI6b9qoKUfgsn4sBVo732sxeThNlpAK9m5cBPzAQEc0fgTfW47Gu6wiwZK1jwd+gote6DLMUztz3LFuhWp+F/SwG8lMc5LR0jJVsv/0VNQ+xj+UnDZZ5mecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637107; c=relaxed/simple;
	bh=oxgK2bomVOODsaI1wr9EH+7T6v8j9S8LiVZlZA8E4es=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V4g3WH+FRmRiralyXqGtkoWgpYIckbqIsIQwM/6y/bAZ+7LdTAG2kISbWQqYeqhWiMAHs3eGmHNJ8KIitKvgY7SIv7+T0xdzJubi7yQQCNCfIHkPKj/OV5N5grsmDMtc8n4ALAQTNSxlTVrGXHk0n2p8iGmZil5r523qqTeNl1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evSFV3z8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evSFV3z8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791637105; x=1823173105;
  h=date:from:to:cc:subject:message-id;
  bh=oxgK2bomVOODsaI1wr9EH+7T6v8j9S8LiVZlZA8E4es=;
  b=evSFV3z8aenmptA9r5UcQvwtFvZYbYe0uTpyvlGAQLBE9ZG/2+djDBbb
   AuKlYDOPLQGj9BQth6Ie6fI8wIK1DxY9z6LM8tzrlEr2c0aEvRZWLBapf
   /0+vFD9K7ofnOgZ+JRKKm6UlFcpSVDTpRe5/g7Db2NfEwOpNo+BIB75LG
   6UYw85DMlqDxe6Vemar7wJLAzQLObyLfieTt9mOefUYDe9/b5Z0xXyjHd
   XtNKg5vsIol+GNPCjPV6E78Szgm13in/mJ8xfRtdX7DLjBxQZU6+A1QMI
   A9FXe/T8HIG8u7FnB9zb3xxOKugDwEV3DzVbzdc+aWfEX1WcEborWk6Oz
   A==;
X-CSE-ConnectionGUID: pqI0xTUIRn6uxhfM1dKp0g==
X-CSE-MsgGUID: /2nVI8orS0WUm12M2cMU6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="309880"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="309880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 05:58:24 -0700
X-CSE-ConnectionGUID: egxmGVpJTKOJt+hpWMVQ7Q==
X-CSE-MsgGUID: YP50bkjgQqeAJjoHLpU4Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="454203"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2026 05:58:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFWeb-000000008zn-0dcq;
	Sat, 10 Oct 2026 12:58:21 +0000
Date: Sat, 10 Oct 2026 14:57:31 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/14] htmldocs: Warning:
 Documentation/trace/coresight/coresight-cpu-debug.rst references a file that
 doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202610101412.GyQ3sbBS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [0/14] coresight: docs: Fix a broken reference
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101412.GyQ3sbBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101412.GyQ3sbBS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
--
   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
