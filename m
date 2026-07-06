Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA2644D035
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331152; cv=none; b=Av4Oy7E9PKZ6d179egXWalWphJBnTh8wT9qJV+xZakwNRDj1jDKml93Fn+SB1Wzk/PqunGvGsVkvP0/NH88QV7phkgPgWlUPOIIBvKjxXI5jXtmsvByk+Y5MMho9PoN762yOFdUCQLIGLFPx4rWCgqd1GFEsVY8CwJKiOhjlj0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331152; c=relaxed/simple;
	bh=q189WGn34qM2moSB3qZyY2303QsSTnuM/pRUOyObkRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ct12XBoNyzYJuRzHIv8Fh4k32rcoEC5TaAcjYtQh3ucoKf2Df69VDP2aV0NQYMAiwyu0Va4ibcqafGnI1xFZqkWC1xKFMkLnABiS2EjJUEwVzwVZz3epEIV0FAwGdc8aqHXA2jeGRDEui3122+9JmiMYfUin2b6mEW2d8v7a9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOZGzA4S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOZGzA4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783331148; x=1814867148;
  h=date:from:to:cc:subject:message-id;
  bh=q189WGn34qM2moSB3qZyY2303QsSTnuM/pRUOyObkRU=;
  b=BOZGzA4SaSsvsku8nN6FGY4+ArVfyNIMeXWQEmV3RTYzNI8MMUZs5nuw
   xM8PFeMWnkD7J1YUIT9OLo763W/3Iwl3kiPun3r/D0uWUu5R4dr8P90hh
   q0UD+Z3TRBzSSo3TC1W+Lv0+FvJltJeniq4fFoLd0+yahjl7QdtQLnCcX
   Yaib8yWojwjzfxsM2OWYP0TQErLJFrSgErInKRBrIQbyYqK9Gyf7asj2Y
   hzByIYNP0hKQyP+qReu8yBvNEA4QNSAX2GvQ3fqWpy+eOsMVgrGmUV/MK
   it8XoOfsrHQ2isqBAfWZwnWUkCSS1v3DyEKlGSRjFp53WvgRLk672QCKw
   g==;
X-CSE-ConnectionGUID: h/xyVqJ7TWyqicXU3jcPLA==
X-CSE-MsgGUID: I+o4smwCSfmWABOUOrXnVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83824007"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83824007"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:45:41 -0700
X-CSE-ConnectionGUID: fWIsxca7SlqG0q+YMUITKA==
X-CSE-MsgGUID: up3BtbU2SRKszq4Na6yE0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="276881893"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2026 02:45:38 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgftQ-000000002A9-21Aa;
	Mon, 06 Jul 2026 09:45:36 +0000
Date: Mon, 06 Jul 2026 11:45:25 +0200
From: kernel test robot <lkp@intel.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org
Subject: [alexs:docs-next 3/7] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/translations/zh_CN/xxx.rst
Message-ID: <202607061141.fmjoYjew-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next
head:   bc2e3e1124b7362f83c5fb8557274bbca3da1a74
commit: 359c3caf50481aa08b0ab761436e4b70ad027f73 [3/7] docs/zh_CN: restructure how-to.rst patch submission workflow
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260706/202607061141.fmjoYjew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061141.fmjoYjew-lkp@intel.com/

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
