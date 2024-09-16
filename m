Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D414264A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726512449; cv=none; b=GeQiQcPP5kObQ6jOR2njQklxUlVZWqW5HCsh7pDMGJLJEoEcVBWgNZqeZA3ofK8jaYykRSHFfnOSia4Rbtm5nv+jo9X+b03eWgfPZ+206+C43aYhujxuNXmmE5b7AWVZAsySfczRkBR3h5FdsTEbsQhrnEfphRhTTKe8DykKCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726512449; c=relaxed/simple;
	bh=KUH8CXZiJvcJocZ+tqvuwPSzyTTU5DG0eO/OPPn5LM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5S79Uj60hTz9vKgPxhjEGJEU/36NkSZKsg/p58OyJ7pvfuokeX2kBNqfUgSvXx++qXRsP5IaNUCtKM3QT+QFTSlX2Wlsoo0pmcCOLN5kj3dPd125pj5q+ZEPt6SbKWJWL/psoQoF+pwSYMkOW4H3JRagWiZl0gAb0vRetiHIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dh+oSmP5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh+oSmP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726512447; x=1758048447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUH8CXZiJvcJocZ+tqvuwPSzyTTU5DG0eO/OPPn5LM0=;
  b=dh+oSmP54roRuWVo2sQfFim7DMw2+lJ9/fhKKZwoI2i6UaJ/ecO5/gg1
   y2badfvwlGPERO9TYCgNqn0KAAQ0Sr/FVGbD87WyW0IH80twd8STyCvb6
   hkBfCP/Vxe0z7LzcS8f9OdQ44wsXL4w2iyYM8q7CLPd6k82p7lJBHMALP
   zXqaj8DR7WX0SIkl4QhMAkvPdIj4xuG4AoY65Ep26s3sVr2n3kR29JK4l
   wjhysNnijYHkjTZ34qLCKgor3AhZCkbjZ8NTCsVsAX7tkJcLPiB5hY9Bt
   QlIwctL9u2jqjD3hwE+RzAj6ouTsiNc4gDw8yoctrsEHoNQrfbRkUoIKf
   Q==;
X-CSE-ConnectionGUID: lDS96TnNSw+l/e0tyv6NIw==
X-CSE-MsgGUID: +i1d37nmSpefcHnZVSFIOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="50767886"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="50767886"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 11:47:25 -0700
X-CSE-ConnectionGUID: vrppW5jrQTizQL4EbAwaug==
X-CSE-MsgGUID: MIsPu8qHQQOSMLAl81Z4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68836779"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2024 11:47:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqGkr-000APe-1h;
	Mon, 16 Sep 2024 18:47:21 +0000
Date: Tue, 17 Sep 2024 02:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 1/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
Message-ID: <202409170255.9v51ItTx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   52ddaee5e8b84a5469f2e1b4f91d1b5bbff433b2
commit: d2ac28d9d3d591513dbff3c0746ab9f016989a5d [1/2] MAINTAINERS: Add Apple dwc3 bindings to ARM/APPLE
reproduce: (https://download.01.org/0day-ci/archive/20240917/202409170255.9v51ItTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170255.9v51ItTx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
