Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74622579E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777099273; cv=none; b=sCBfkOcBV1S36PNyOt+3lxD1/RZY+VUZkX1Avuy2/yzKme4wOyXWP5gARKrbYGeX76zkexhrDplnnFBrnVpzkBpIOtbD/QDQyXeCleyrSjohrBjMFNuF95/QCJu78USYt/5wBj23qE75rHTXGwGOwuu+PDzJjhqJI5pPryaniqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777099273; c=relaxed/simple;
	bh=mAeloenRWyEAMEFu87uI5yHfEvt7WOXBdSUYSRj9M74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nvm8kYTCxdv9EOivepaTnySLyabZGxVzpqihyU3GMIuxUJ/ka0yupFnC9vEcT5Y4TCFBPJlPMvwzUQL9zJ5IbD46LZvaiVyyAkiNmuXEpsm/zVB8fuak3ouV/R2caNSGRRuE95YE3Nhu3epujhe7MEUkE6AoV79sxuqtN5fDU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1LLzSJU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1LLzSJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777099271; x=1808635271;
  h=date:from:to:cc:subject:message-id;
  bh=mAeloenRWyEAMEFu87uI5yHfEvt7WOXBdSUYSRj9M74=;
  b=T1LLzSJUmWDWrQsnw7RsYGr8N+m/J6UTbHKOEoCvxF+iH9S6CtIl+6Rx
   hQfy4DP/AEzS6kDrnHx30thC3suEtKs0O1nvOtWZt9uMwbO8c05L2cEGz
   5pTFZu7FYnmT0gnu/CJ4JqFAXzxSIfl4sMAhYW04VgjIGXYuhi0lP9b0L
   VEY4MO+URwbj8K8YV5V9Pmbk9fR91p3nLnDM0JZd7Qaw3+8dyV1d9eXcf
   UCuwNgajISYNmbW1vly1xcQ4hCG2K6Q4cUD66DLroUwHOgkPvQ66NpEEh
   4jk6rp1IOo6H1pWFSJMirUuiYoEFwPhB1O3snzY5eiLmHSCOmBJBQ+8wE
   A==;
X-CSE-ConnectionGUID: JUmanB1DT0yCF36rAm0E8Q==
X-CSE-MsgGUID: YNFuiiLrSkmXP3Fx/nKrbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="103539127"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="103539127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 23:41:11 -0700
X-CSE-ConnectionGUID: bp0M2Hs9SqWjFJmIf/a8iw==
X-CSE-MsgGUID: gKsaUQtMSgOTagDreilhOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="232284938"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2026 23:41:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGWhP-000000003Mb-2wrO;
	Sat, 25 Apr 2026 06:41:07 +0000
Date: Sat, 25 Apr 2026 08:40:37 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [arnd-playground:config-gpio-legacy-7.1 13/22] htmldocs:
 Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
Message-ID: <202604250859.NfTnk3Wo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.1
head:   bbb302c86fdfa7705d8511a74c4b6db205cd2683
commit: 6b2a645daeb0f325ab9601d75e52d17334c3535d [13/22] p54spi: convert to devicetree
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260425/202604250859.NfTnk3Wo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604250859.NfTnk3Wo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
