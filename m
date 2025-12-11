Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990127510B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765426001; cv=none; b=epoIIkU4Z6HOoml+67k9I4D9zAY/LkM6lg/gENETyo5zJ6FUc/muV8HEFGyBnhXyAfOJRO9PO53w+/VvPGSRKGTLW4isTWNeBNcEXxSMGxxaDXfyvEYWLXLjtW90Q1Q12FfWh3nEq2sobqvLgWVzjlGx15ufpNydWTBbkRo7Mac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765426001; c=relaxed/simple;
	bh=nIY0JGMKq/52cBijskPj3nQbzzNqGSMzvn/33vgOBaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1U8IB0IQd6urFVoTcYveGdP//6grQu7gL/UGod/3vYpoj2bBqjfU1+w95gKCJ+UTaAI6nYKKL/hD+CoexXoSGhptL5fg4jQwT3vsDGdz/ewEg+sRNI3Jl+JZokXgH4PpmhiMEDQ+68noqw+SNnUnCgvTOs/hNNgtjr9q57Veko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJlm+dRq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJlm+dRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425999; x=1796961999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nIY0JGMKq/52cBijskPj3nQbzzNqGSMzvn/33vgOBaA=;
  b=MJlm+dRqjeKseRGSuYYB+y+SwMTTZFHR6eeMcRBBoID/tFqRDnu6eOY0
   PPM1pgEePRyGL3ERP1B4whIRAErWvdiL73TuKXAKXAcFXA/JWNBjHVKiP
   ++s2vzeixo7Jd16ylsbVervhll4+yGXgz3ddRC4SktWJo1nTiDQI51RtD
   PDkISowOkBIjYvbpl6/1EzwT2A65NHoUjsC/Pl5gMsrfXB+WVFUxIDahd
   LkscmFHFolr3QjxmgdNd7qrrnJfAyTVBI6CyHteGH156vBR0DqCNEZYc9
   R3ORNgBGk7898FeRen4/GVkHLVOGFO07mV3vFN80dGjP21T6Qruz+iQIW
   w==;
X-CSE-ConnectionGUID: aRXSUUMWRYaE5vJqmkwNIw==
X-CSE-MsgGUID: U9nOkTaVTVaDhcDJy7vBLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="85011625"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="85011625"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:06:39 -0800
X-CSE-ConnectionGUID: s4kqQ0MZQFCaXaMfY821vA==
X-CSE-MsgGUID: xmqvWZDBTVi+993buY0c9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201787698"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 20:06:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXwq-000000000to-09o9;
	Thu, 11 Dec 2025 04:06:36 +0000
Date: Thu, 11 Dec 2025 05:06:26 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] htmldocs: Warning:
 Documentation/trace/coresight/coresight-cpu-debug.rst references a file that
 doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202512110557.Qfr3FrdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31d0ea3bf1bd93e960f341e4da1ff033eacefab2
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [3/3] coresight: docs: Fix a broken reference
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110557.Qfr3FrdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110557.Qfr3FrdE-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
