Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11A23A6B6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029430; cv=none; b=EhEPqHs20tdyaS7N30Y6HOPCcWoQ49vCTfx+PC6PtJovquVj99hQa/rH13i3CR4s3aFDzToUWEV9XTs0Q1HoBq2yXvTv+5yRf6DycRT2vEe9vXUtD4VDurKNZH5QPHwX0W5ZVNYBoGrMXdpTnNKfTelqXzcyTAsXj9m2/CiHvek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029430; c=relaxed/simple;
	bh=HhNOHI0hG8mErZgI8Bdx/AT8LzJmN025sKj3n48GzQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ToZugfMTdRDPzeDM4xvVZabdCqxqFzlXkZCUC951fMZo8R+BtRmhZxPP9jq4DVJIzsCxBu1W6GtppiIWDh8N+jF2dagc1B3dmRMw5sIN33K+h0SmHF+0xyyYcDh++adjHrRq5hfXw1tkwO/kFKHhcfBcNWTc3Zw2sh75hPssvFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEYM5E6J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEYM5E6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777029425; x=1808565425;
  h=date:from:to:cc:subject:message-id;
  bh=HhNOHI0hG8mErZgI8Bdx/AT8LzJmN025sKj3n48GzQE=;
  b=NEYM5E6J/zB+oo5Tbw8lxcqMWxBqfp/9B9faJyqOIWsdf86fn6FXBZ4e
   R2LNtho3j9Mci9yaqeEbP5BVMlL3MF4fI77Op7KS4ZPybLQUhxRvzuolC
   aBwzv5hLZ7LZoa6SSMJv4Wrq/6/lmNJ5/9FHx+i5y0PZnn5gN0fwVB9HJ
   BtXEVRFSSqF8iB+yHNXnl6DBvMQQAfwCx1Knnymo8fIpzkfix6XVDX6Pi
   /oNfBkZQqopfUXbRAdU6KFoiffw38V9iqWLdppmS07tFkTqr8PjKoXiii
   jvzToRIzcY/iQ3Da9ZR57lausXP7TxNqT54jdpsqgfZxyEaQa7+PL2chF
   A==;
X-CSE-ConnectionGUID: J5mvYIJRTB6mtf3B4GoGbA==
X-CSE-MsgGUID: ruIPebsSSQOKJYRmNYrKXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77172803"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77172803"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:17:03 -0700
X-CSE-ConnectionGUID: aytIPKTpQUWMmFvJKCsv7g==
X-CSE-MsgGUID: 447fFGIoRbmdWnt4dtdXHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="236900643"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 24 Apr 2026 04:17:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGEWp-000000003FJ-1O3Y;
	Fri, 24 Apr 2026 11:16:59 +0000
Date: Fri, 24 Apr 2026 13:16:09 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/2] htmldocs: Warning:
 Documentation/trace/coresight/coresight-cpu-debug.rst references a file that
 doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202604241309.LELYTnUc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e5b00516ece60ce220f481acdcb970b904fc28a7
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [0/2] coresight: docs: Fix a broken reference
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604241309.LELYTnUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241309.LELYTnUc-lkp@intel.com/

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
