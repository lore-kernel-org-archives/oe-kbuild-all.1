Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C9361971
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578624; cv=none; b=doiBgyqrdkKzMKOXjhioGrGt+aTdn8l0dW8KlacmekstoorrKn9lONGIZzCwgBf7ERFmE150uHFAfNWK3HwQs3CiA6jOnDErw8Rjl9NOGmEHr8Y+IieRzCkOGuhCKagrhbadznYqt21A/RxjaCSpscu89KcBRbqlkpzb98P05tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578624; c=relaxed/simple;
	bh=A4JxTkn2i8ywgnNMjLBpVr18Rz4kBlM5P5yMIvn4oOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sBY/Ew8etx/jGJZj1sI/lzSI4XQNfNbtbggsEocLgqwj/bnXkGvastXddNIZMWHIjj+Z///QQEH2TxvrelkPVJd+935ILKPcmEwTXyocRujuWKf4koLbPTiQkH1z/d1Tjs6rKkygUYNC8PTVHnmVLfZ6zr6CBMXKUkNbSL9LtLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWwZI9oD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWwZI9oD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785578622; x=1817114622;
  h=date:from:to:cc:subject:message-id;
  bh=A4JxTkn2i8ywgnNMjLBpVr18Rz4kBlM5P5yMIvn4oOI=;
  b=jWwZI9oDjGrUdmgc4VmxBHcgXX+2s4UCIpTLzc656+Ou5qziFg15hKzH
   3tkmxJRKoAxlofcZmGkLoAnBXLe4fAG9emOOWuRZD9yWc1JhtLtu8oHV3
   e+m0jHEUC3QjwaSxQbkk7G8XLyRmsOcnuIsEy2rx8nVLiJREeyOHsqIUT
   Rjo30dKcQRpn4TmHO+spHgoJsE+pfND9P25OrlwIIDLqk8a/MLtp3FNNF
   GorEIlcyYunvMRrhNE2gKrcEqWLF+rOZkgl3p5xBoQSHuv8Af7aCotkjS
   QLwuzIUCnLDpjKNmFnXog/VRjBaEVg0HfbzQzSWSTLGsQ9OtXVemShZRu
   g==;
X-CSE-ConnectionGUID: YT8VAxbqQ9WP+9pJJiw3Ww==
X-CSE-MsgGUID: O6WXb2ltQl6oTeQig6oT+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96855199"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="96855199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 03:03:41 -0700
X-CSE-ConnectionGUID: wJkVni4/Rs6zuF2uPerG7Q==
X-CSE-MsgGUID: qQRSikx/RZO1gjdrRwIpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="264604003"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2026 03:03:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq6Z7-000000003RG-2302;
	Sat, 01 Aug 2026 10:03:37 +0000
Date: Sat, 01 Aug 2026 12:02:39 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/159] htmldocs: Warning:
 Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202608011129.fqoc7qKb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8604b0d9bc72c082338f572a56f18732ece59a5a
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [0/159] docs: cgroup-v1: Add IOASIDs controller
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608011129.fqoc7qKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011129.fqoc7qKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
--
>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
