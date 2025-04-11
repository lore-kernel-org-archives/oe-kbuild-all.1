Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75714A92E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408022; cv=none; b=f9f4p6IovBAfQH6qLK2NsZBSjfTmcYG8+fRFR8U7QvFyompi5jNUYno0NYRo0zmaHLvOiOK0OHBldFxCbPcyVa6XRs7ngVOmV8hORrkfvE4oInBKBJlEjiW3UClRdcFrE8y2dT2c0hGygMHid2pLQlMVtcoAbVbr7q9DiAYuqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408022; c=relaxed/simple;
	bh=AvW5p7+XTPY5ip3dZTjoLlVgdbF2UOgOOCLUCNQf8Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb1V1eB/7AGO6ZOWZpGRT6FpZj+lpYpdOQ34VY56K5/qzSjLRq/Dxwd8b3V7znceWhVy5b9gE48ahX2iV+ENkcJl1a7mAIC33QtQEHh9XLR8ncx++5qrRp6jtYsHCbWQuJcFvjOAodWxFUFERKUIWsEttprhRA4JeZmzvuY+hqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6btw0Sa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6btw0Sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744408021; x=1775944021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AvW5p7+XTPY5ip3dZTjoLlVgdbF2UOgOOCLUCNQf8Xs=;
  b=V6btw0Sak4uxvDsOkqCKlUtJRUH2dIT0cmnPVd6N9JABZ+Fxtqg9DJru
   hda19aPhPJbsp/Z82JWYQ4sDAcSflvOKkPOg7VRf6pG3rcNOK8i6A7dPv
   1H4xJh04KeYVkIV49C1HzNOuhqnvl0GSSnUe9V/pkI/gKW7Z1OtJWVw0K
   +IyTKuimyczMDqHemU3JahqUEv3KUBMYUQ/BdkkWKPiu06k394gaDGb4Y
   X0fLzMfzwV6TCujS+AgroqW0nhE6RDYuYClW057mNrfvM2kpNBYd3kQU/
   0gdjzf0WYw4gpkX/MjbAPFHMLhbAqg7nx3r9C4ipVFv87z2gyGXQjtm1l
   A==;
X-CSE-ConnectionGUID: oKx4sOFyT/KBSmFIu7A3OA==
X-CSE-MsgGUID: ya+jmxVCQ2qYOeAUpX1oZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46136211"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="46136211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:47:00 -0700
X-CSE-ConnectionGUID: 2eOd7YDkQReFiMETBHOKpA==
X-CSE-MsgGUID: HKLabM8tQDicEm9zlqr4Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129857894"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2025 14:46:59 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3MDA-000BP4-0r;
	Fri, 11 Apr 2025 21:46:56 +0000
Date: Sat, 12 Apr 2025 05:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: counter: Convert ftm-quaddec.txt to
 yaml format
Message-ID: <202504120545.rYEBkZGj-lkp@intel.com>
References: <20250410222509.3242241-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410222509.3242241-1-Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.15-rc1 next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-counter-Convert-ftm-quaddec-txt-to-yaml-format/20250411-062639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250410222509.3242241-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: counter: Convert ftm-quaddec.txt to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20250412/202504120545.rYEBkZGj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120545.rYEBkZGj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/counter/ftm-quaddec.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
