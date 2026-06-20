Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3DF330315
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jun 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781978438; cv=none; b=NNOrbbIRFOXEBZYbsZt1qudPI5v4W+aRZ4BQV3VAR9kqgmzH1mBz5x5dEG8dk1bx+LYWC4ZGP2nuquiqykglW3v/fy2mE87krU/LyIz9YmhG2MkZFSsAj8t48wJiIaa+Ve7wY4yw7PePul586SD5ujgx75RedKMLPXu8Sa+/PBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781978438; c=relaxed/simple;
	bh=vufYTHg5KbZsl2Z1Y7JLC29LOL/oWg0GcpcgNuxRnuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CX8+k6CS69pVuEMaa25sEKVVxT5xb0H1mD65DrXZCKMYC/zcm+Z7PjAFKsQ27hJb3uEDmQEU8QBmmRv8YVWUzw/5qE5mIJnZvaNphQA/YydDvceUsnVzoJd4Rm7rC6upIn8VvIsY1tIo++G0DX5RQ0wt53YT5WXiPCVALOkOkXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD5t3mqb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BD5t3mqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781978437; x=1813514437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vufYTHg5KbZsl2Z1Y7JLC29LOL/oWg0GcpcgNuxRnuI=;
  b=BD5t3mqbejQh6z/LpbLsT/z2nd/LTA0kKlM8m07DZq078iG4TGJHrWgX
   YRPVrwMfywx5PdO616Lc4T9WEZ2F6vx9fXxqgy8ziEONXO4bs6xO95i4K
   FwIXlMjR0dvuQkgMy+7pOYEXE8rR78K+h2ycj9VyKRdJiUGBsyBU+5hJz
   8TVjB+h3WoK2waSGvr29yIiBb1z8MU1xRYGrv432aqz8wwpd8/gIAWK0V
   +uCVi+4mdG6+qAOW18vnZP/sL8oFf5DabLUshuZZy651A9BVLP01cI7g3
   cVl2aqpbCPTHa4nXIRj+vFLGsdZs1VjcLcGXqUEJY9WHtObCK347xU5B0
   w==;
X-CSE-ConnectionGUID: 48uIYOw3Skalglu33hug4A==
X-CSE-MsgGUID: FXdz0842SsOayjCB+LBhcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="81751913"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="81751913"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2026 11:00:36 -0700
X-CSE-ConnectionGUID: nzFAam2GTR6D61ouAbIsJw==
X-CSE-MsgGUID: zqHMjKGzSayrrHBJ/TCD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="248899306"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2026 11:00:35 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wazzc-000000005k1-2xLg;
	Sat, 20 Jun 2026 18:00:32 +0000
Date: Sat, 20 Jun 2026 19:59:39 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [stefandoesinger-zx297520:mfd 2/124] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/zte,zx297520v3-*
Message-ID: <202606201944.Xa050xUX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 1e6a3951315be7aa7acb8380b0bb39dde1507e4b [2/124] dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260620/202606201944.Xa050xUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606201944.Xa050xUX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/zte,zx297520v3-*
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
