Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631D023E34B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740742497; cv=none; b=TIHtN4R637lbUUj6luiM9i+pki0N7ps+Rimds40jiyt2fjN0kRFFwmZurohsL6A6dhVhzRXvb8Kwuxj5aYdnnUMdkuHNMuebPJ6J5wZ/MsQ9DmzOgpvcttJvOVq086QrOlUaRBNWYDXIA1LGO6vO2a4kFKh6fZMt/Q5bG6dZHJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740742497; c=relaxed/simple;
	bh=w7smiagamjUN2It1tNuoMMPlmewbfm/2CxJlCkACJK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAfM9KniJAvXIj4oa7xBoUMlfg71Gb4EP6cV4KHZznXWSdE6MetpG3IEF6R/GepevzJclKtRkGZZeI5H70fv6hQ6pptfrzdqS/x1fLhzhZuOLj1TVvYo6DSEzAGyN6shLZ1bIRDqPGBzmDHMbAIyMTohhv7w1nPlk2T0F/0rp5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQOs+6Lr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQOs+6Lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740742495; x=1772278495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7smiagamjUN2It1tNuoMMPlmewbfm/2CxJlCkACJK4=;
  b=MQOs+6Lr//0oR+wpmbhTQjuDQG0vbQ/shkBH4Wwin9rC1yH8P9O5Aom9
   WDv/RlcjvHjsLzwjvOqus0zrYC1mKAUwGFny3lTkYjDF8fJ7DrpPqxRHF
   CAxZoveX+nE02DDD89H1GKMk67fzQlqrOkcKD6J/cxRh0G/KNd2BLV7ZJ
   9iSdBLeMY7VS47OHQd2gXpNXZvdmDH4lZm2VLV0vcqY9deyUB3ZbHRBpT
   3Vg09VdKylvDoWMvcHWflFbkIaBCrf87LSxLC9chUC6ZdiCsRzok1caTg
   YzBhc4W0OhkrJ/MnkCYguv45P6fZcfsaq4JkFXC8T4IrJqzQs0fXWy8H2
   g==;
X-CSE-ConnectionGUID: pYg35fmcTOyj71enwqplQQ==
X-CSE-MsgGUID: Op19slMJQQi/ayMR45rbVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="53056830"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="53056830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 03:34:54 -0800
X-CSE-ConnectionGUID: B2XKL6a9RfKztF1kpQC6og==
X-CSE-MsgGUID: TarFOtQpT4WMBGVSkrVrxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="122262014"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Feb 2025 03:34:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnydm-000Eo6-21;
	Fri, 28 Feb 2025 11:34:50 +0000
Date: Fri, 28 Feb 2025 19:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] htmldocs: Warning:
 Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202502281933.3IdkKhgs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   33e283448f335063aab245460a2d3b85ac627b9d
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [0/1] docs: cgroup-v1: Add IOASIDs controller
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502281933.3IdkKhgs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281933.3IdkKhgs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
