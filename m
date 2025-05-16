Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5232367BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747437522; cv=none; b=b40qoxuMS4MIDmrWppWh2H/Ev+xnOjYLEe+ZfDkUXVAgTo35aIIvXZ/Dnf847DHlYwoskOu9EvPKfGY0u4GWtEF1ONW6Z6yDwbyxcn+7Wi/dmaqY4RHKbsRUYqBO1bEETUO8hYxbw5XxiBDQmMMEewS8GamLZe/X7QSHXaK8juc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747437522; c=relaxed/simple;
	bh=Dw/7OBhx/FSDQY2PNzPNmdmSayTEBQOrA6vSWMuHBiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tVHA/1oL9YW0cckEL9xrEubCbLG0KDeYfX7bKPvHZrSqJ0RC7k+soPKBxD1Fl5q1hQZ3H5IHRcFi761eSMBhxDm8EvqSZCoiukiV8CAXCasbitMiIVQ5NJxse5bwz+GR/3TFfIa6NRnuR5/MPKkD8v0X84lNFSUpLvaTFij7GWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCYoWMDg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCYoWMDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747437520; x=1778973520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dw/7OBhx/FSDQY2PNzPNmdmSayTEBQOrA6vSWMuHBiU=;
  b=aCYoWMDgIKrQn6e5X7+gi53j/Usk8cej9GX8j0ooJEzfLoMyVT+MdKkX
   5bLijafcJAhdfI0bTKoa+eLgv3lqQJtnVrQGwfOmH0KnHA/aLBdSngCKp
   e31t3fTDc3p6NOwMFMnT+Sm+U2SJMyIx+nMKkM64SgEU3ZKPzNTkgVELJ
   2fdFSTuM4ZoltuF3obY7TjNZsr49Dju07pJQln5ZRLlS/eYiMcfdwmdgv
   rS0LicvZwfxbIz4ijBUUYm0Mi1mKKrT2eoR/2KcCXQ1/7oSzVlR5ECBwA
   xREEqcWXHvhJklP1vYJuiVUWCV0y0drOi9zbcfr2UeClIhUQf9A9t7QWL
   g==;
X-CSE-ConnectionGUID: XNs10+YcS+mzxev81uoJqQ==
X-CSE-MsgGUID: bD/djw7tSSy6n2Y4H+YKPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49489827"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49489827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 16:18:37 -0700
X-CSE-ConnectionGUID: Y773/JRhSvqJ86iu1/g/QQ==
X-CSE-MsgGUID: fkKVWwljQseDIATgJZX3vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143942930"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 May 2025 16:18:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG4K2-000Jmd-2W;
	Fri, 16 May 2025 23:18:34 +0000
Date: Sat, 17 May 2025 07:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1639/1639] net/can/j1939/main.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202505170752.BGWpf4BO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9f24885126c03082a677c4d607a2e3502781c858
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [1639/1639] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-005-20250516 (https://download.01.org/0day-ci/archive/20250517/202505170752.BGWpf4BO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170752.BGWpf4BO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170752.BGWpf4BO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/main.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
