Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCC438911B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715953; cv=none; b=h5ZJElLh4X30OxkJfkRIgopwhAfF2GzZjosOU5qKpJGUyYhcNpnDOIML9MVPJtFct0ZaraJVDxf3t4bJr/580Gi/zfEyqBz/ENORPxatqUbGsQoQtdLPJdHpAtwbH871zxXcZNUafw3LkiD/b47nt5TWwATLwdUAWR7pQUnioe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715953; c=relaxed/simple;
	bh=jtX/uLxJlh6WWkzSUAVrcYE8V6Ii+sW+2Vb2dybzlvI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q5yAGzRM8cLkMxxbNlkAN5IlEBByB7XXnAXioLhW6EfFPrMsDQ8j9l9s3WIviUiyqPByvJebeBGY9PQuaNN+C3iKYUxTEmZsXGe8yXCCvW5TpoiQXdASUnEat3McJDCddT/09OoawJDmB3bvo/D8Hw1ghcgNn96dMfhCfFxH9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ygb3KGGM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ygb3KGGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778715951; x=1810251951;
  h=date:from:to:cc:subject:message-id;
  bh=jtX/uLxJlh6WWkzSUAVrcYE8V6Ii+sW+2Vb2dybzlvI=;
  b=Ygb3KGGM4Ze9szDOMSxHNKPvqS4DPhzklvQCKGlrxUOdK/fhGIjxiUA6
   9bbSDsDV6b36LG/yFJNB51o/brjV4XRpTfRUpUMVagZ8+xjoAMD1SwBh4
   lJ4Q+sJlTqEhzYWFWbmdhBmQEfB93vY6gKOP+1xBD2U3yK5nRgpRlBi69
   3eBBavgRE7Iu07F+yOoClQ1OxzMnux4u6jVFA6I7d+8PYhJwWR3ZfAT0L
   +x7uI4QB5vSmEDy0tpbj+eyBTkgIn6f3/wZmzNrAfGa7I0agQmb/jhZGe
   KGhRQ+ibHYS2MEZ+O8mx+/RfuUMlVwnwAgzVt94UoiXjClTbtA8Fn3TO6
   g==;
X-CSE-ConnectionGUID: 3luhsvy0RDevgnSWQnNEIg==
X-CSE-MsgGUID: QDVse8BAT+aXENQ1O4yEyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97081269"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="97081269"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 16:45:51 -0700
X-CSE-ConnectionGUID: iImDLczRSeSLrEiHIz6oug==
X-CSE-MsgGUID: 0vyXOAWNQmO7g8OlifDa7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261975394"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2026 16:45:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNJGs-000000008fZ-2tZV;
	Wed, 13 May 2026 23:45:46 +0000
Date: Thu, 14 May 2026 01:45:28 +0200
From: kernel test robot <lkp@intel.com>
To: Arun Muthusamy <arun.muthusamy@gaisler.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: htmldocs: Warning: drivers/net/can/grcan.c references a file
 that doesn't exist: Documentation/devicetree/bindings/net/can/grcan.txt
Message-ID: <202605140136.sOIQXON8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Arun-Muthusamy/dt-bindings-Add-vendor-prefix-for-Frontgrade-Gaisler-AB/20260513-205730
head:   31312b375f2dafa975c5a345fa15faf7109be4e0
commit: 1013cce6a71c91fcc54e6896393aee8d6b22de0c dt-bindings: net: can: gaisler,grcan: Convert to DT schema
date:   11 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260514/202605140136.sOIQXON8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140136.sOIQXON8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: drivers/net/can/grcan.c references a file that doesn't exist: Documentation/devicetree/bindings/net/can/grcan.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
