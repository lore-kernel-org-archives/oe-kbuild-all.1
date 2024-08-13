Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4857E1A707F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583264; cv=none; b=WYArDtfafZHMhMKNkRfmqUmeDP/iG+4ou+tmXSCGr7V+dzGIhbZMIKy/w5i+Apn4VCZyJad1o/srfOtk7DtPVjXa1XR3bb+kwjgVyjuaQDEEiluQf1KBwpNrx2zcUwi9G8IkZQArdRKSms04B8H7U3+ZPmWmausbyLWFBUEBn4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583264; c=relaxed/simple;
	bh=wii20uAFwA0Hva9CAlMTdYHq43WPKMRZX481oCB0G/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PqBAmWEKWBld3xQjCGMjWFCqAbUVNlb1oldoHDBrB/jC0oj77m/GVyrknFwFhaPrX5AzBB0Afg2h0aqU4DCAHFs50IQtxc9htt5eVliIMMPNGwEqPEWUACowOLqK7tvtXUAPxr4d/aCvNC+20YvQ/9+c7UvsqJZr+rL6r/iRI5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJZxAUPu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJZxAUPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723583263; x=1755119263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wii20uAFwA0Hva9CAlMTdYHq43WPKMRZX481oCB0G/w=;
  b=UJZxAUPutsKygn81RGLe85Ssu+C/1RAefg+bcPkGcCjHVxg+g4ziTdIz
   V660inHxZWlFn2rVkTOgJvj2YHWBJ/J4JYohIGLHBp4s8OW3KsV4dtro9
   u3P+Vvos/F6XUiknVT9WHkdMUCAky3avhXWst2DdAr9nzdwGysbHKlPku
   Acp22NSIHK+PXFwG8S2rGYn+dJtQj9jrbgdTWjKlU1fY21mK4LaYdWkuo
   ivA2YmYm4PzgjPUcum6Qptop8RfeAUcZjW3VJkKh+O/vk5eYL4vEyMZx/
   NU8pgUV70xHauqqhopmPd2EWQVa0XqAymWoegt+dBROrbtALN3JtF9uct
   Q==;
X-CSE-ConnectionGUID: Hx+tajA4Qc2metkhHZww1Q==
X-CSE-MsgGUID: +5zPRicRTU+XnuRKhlKaLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21641003"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="21641003"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 14:07:40 -0700
X-CSE-ConnectionGUID: TbxdHviIQEytEZK0jFAYHQ==
X-CSE-MsgGUID: OjllNDUTSPChxyanK95NPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="58747990"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2024 14:07:39 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdyjx-0000jI-02;
	Tue, 13 Aug 2024 21:07:37 +0000
Date: Wed, 14 Aug 2024 05:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: /: failed to match any
 schema with compatible: ['mobileye,eyeq6-epm6', 'mobileye,eyeq6']
Message-ID: <202408140537.DgUJFGmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b4aa469f04999c3f244515fa7491b4d093c5167
commit: fbe0fae601b780622fcb7034a479fa161645b9f4 MIPS: mobileye: Add EyeQ6H support
date:   9 weeks ago
config: mips-randconfig-051-20240814 (https://download.01.org/0day-ci/archive/20240814/202408140537.DgUJFGmH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140537.DgUJFGmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140537.DgUJFGmH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: /: failed to match any schema with compatible: ['mobileye,eyeq6-epm6', 'mobileye,eyeq6']
>> arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: /: failed to match any schema with compatible: ['mobileye,eyeq6-epm6', 'mobileye,eyeq6']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
