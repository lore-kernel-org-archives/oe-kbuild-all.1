Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D53364E9A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230083; cv=none; b=OBDQbcUdIyczgGRuCMECgu0UAsrDT+ueBZ3GOabYaB4xMWYjZau6ZpAtpDMt5bLrpOJturiFS7Mz2wmyaDnTHdP4tPcxh3AC4kCl6rmE96vH2Ky1O+F+drTG+uuHj3mbz2AKnvAomZdWvI5PC8oeDf9Iu48lhWSR863pACWcoHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230083; c=relaxed/simple;
	bh=u46jUF8IirQf334VLi4gPJlkUEzkM7rjgtMj5KDnzvs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fjrTh6RkgCZz1gsEvcr01Kq0OdMPg7WxT31GEzeF/DuQMH0X4pGLATLQG0+4EcDEqaRbHvqY73j+WAOWGxL2kH1MF8z1aDLDQHx9f20vvUi++XBp/JYt94JgrHhKVlkuLIt1Sa2lylj5sdq/PZLGkJNAQffN0SZLMXaQpJXP238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxoriPy2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxoriPy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778230082; x=1809766082;
  h=date:from:to:cc:subject:message-id;
  bh=u46jUF8IirQf334VLi4gPJlkUEzkM7rjgtMj5KDnzvs=;
  b=fxoriPy2lYrl9qN9J6Ju1DdY//Kj20fuqRYv0Fl7MbagT8CSjNLSZTXP
   UODhO2OM348cyZ90syPuRg9H53lT54/KTllhs39g0lfRzf9qPZ52EHclC
   +BenrjkNtkapAc22zXg0rrmPY4WzW4Qtn80aoe1AGtNJ0VXXBin/MGp/N
   Topwhpll59zpx8/+ZUn1TQepjjaqHRSAE/Vw1J5EStG/0HL/jXyQrt50S
   CyIDOJDusiE2VLXxm0BxKqQyiOL8ZmLB+bzOxqC3MgnLkZzm/I+PNGLKL
   z/ypbH1h3/1uTQrCSASzKns19ugZHsxJa4QYig/NyA//mVCXi2sf3xfGj
   w==;
X-CSE-ConnectionGUID: IwOBh5pTT5yCDrCummeswg==
X-CSE-MsgGUID: 82CZM4cETaOtjxFu0Yc65Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="66721577"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="66721577"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 01:47:55 -0700
X-CSE-ConnectionGUID: prb3mU/ATIS3+pMOfpUOZA==
X-CSE-MsgGUID: 7FNM4tdDS0O0DlCss3EKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="274830074"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2026 01:47:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLGsA-0000000078D-3JV1;
	Fri, 08 May 2026 08:47:50 +0000
Date: Fri, 08 May 2026 10:47:32 +0200
From: kernel test robot <lkp@intel.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org
Subject: [alexs:docs-next 3/4] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/translations/zh_CN/xxx.rst
Message-ID: <202605081019.xC04fpcw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next
head:   962820bece3c1b0b848d0cfd9b9b10002536a736
commit: abf912ed5d786d4c4c66d8ffae229dc099f139c4 [3/4] docs/zh_CN: restructure how-to.rst patch submission workflow
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260508/202605081019.xC04fpcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081019.xC04fpcw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/translations/zh_CN/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
