Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B04261B6D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 21:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069062; cv=none; b=bQqbuR7rjU9XXMbq4OZMjCSqfo1PMkjNafYRlE+lr35giTY+T9NgwxcbGHlISbIAxUcw6RkltMk4bXZ/qwFOUxxu16hRPDcrA3vWPRIkndyvsE7NixobAXAjfbj0ZU9027Fn+SSRZ8wPHFSg9bNT1gz2b9HUkZxWNmtcRBkNKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069062; c=relaxed/simple;
	bh=sXURQtlT9DjK0VYIOII0RlnX0nCu55haij5cXRvqpzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fRw9a0vTLzIreux9wB6eEsdgo2aerkWy0E7nEpdm1DhUg835vwwveDHUn7zsS+fCRFskXWcxcRJ6/yOoBSnBoRxtB0Qi0ylwDXWz5mbYV+iH1BiV2z+bNp5m5h+TInLW0mAG2C+Ho0vYR7+xfgLZVX7ozEoKqETp4IrvAWk/G8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPBYwEm6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPBYwEm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069061; x=1794605061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXURQtlT9DjK0VYIOII0RlnX0nCu55haij5cXRvqpzY=;
  b=DPBYwEm61BAg27Z6NKTDzy1NH4sADS58R93rqdl0/nMw6w/snSg7eO63
   tE+T3n4NOEd1w+2dggP9G/iCYZlE21o0FqxyJefV5Spz2IF5HFvQ6z/kI
   sQrtFaPky609kUIuUbIapaRDXrxD0pZsN4qyPQxy/5TdlBKaXiVaerbO4
   NOu7E6Tj2kBeU2C1ifBh8BEFoeWzeRzQhctjVAWyAHW+kAYB61CVWqAYJ
   5xMVAWRyL3Xvosqc6m6KPGRgvcJuC6SUHiWwxabIi8tfJjsgaC99gHTVk
   0c0oU0pWxO/52RkMzNVqyM+/+hGy7mRJL7aAq6euN2tcRdzbX8n8motB8
   g==;
X-CSE-ConnectionGUID: AdtpC8p0TwugrMkuoPNaIg==
X-CSE-MsgGUID: COGUUVX3SoiZ+vwbZeAV1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65202011"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65202011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:16 -0800
X-CSE-ConnectionGUID: fTJMrQb/TEulNeB3JuVwpw==
X-CSE-MsgGUID: NQYsROk0TJKKhXVC72c3Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189435652"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJend-0000000017i-0q3D;
	Thu, 13 Nov 2025 21:24:13 +0000
Date: Thu, 13 Nov 2025 22:23:49 +0100
From: kernel test robot <lkp@intel.com>
To: doubled <doubled@leap-io-kernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 405/8066] htmldocs: Warning:
 Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file
 that doesn't exist: Documentation/Configure.help
Message-ID: <202511130032.gevVvSte-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b179ce312bafcb8c68dc718e015aee79b7939ff0
commit: 4e841f7e418d8d0187951ae017672d27aa5a17fe [405/8066] docs/zh_CN: Add scsi_mid_low_api.rst translation
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511130032.gevVvSte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130032.gevVvSte-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
