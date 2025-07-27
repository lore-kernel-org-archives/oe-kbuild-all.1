Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF51C7009
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753613093; cv=none; b=PXz5ROoPH59fk69a4nAwjx3SgwQW6rGDNdrUKTlNZvXoodZC/dBsE30Llskij73nVzJKYgPSmJcKa0IMkrL/RNPdQid3IfcHVdbPpSjnwHE0ReZ4xIGYfjcjU7mew/e69zBXNx11C9IOpseWpdu7u5FDxieVLzcXZ1WZ8hvoPh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753613093; c=relaxed/simple;
	bh=4uN0MT+OmqrmkGmnlk5oHRGnkpZU1ylfKZ6b4CyAVjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHNDHp1liYFKltEjmbuXHVjkFsu+YEITnT6kE5hr6HeCbAQzjdhCVTQw/rR/aom3zqlRQOJhpJ5WMq0C3/UCO+dfifUX0GEpzRBSGZowOOhxqHZUwB/C2IdiEsPbYjf1Nk8iMu2Wm8jDEeKkpk9iOzUhBI0pBkIIH73Mlj1YE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clo2h9MA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clo2h9MA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753613092; x=1785149092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4uN0MT+OmqrmkGmnlk5oHRGnkpZU1ylfKZ6b4CyAVjw=;
  b=clo2h9MABG1p7CMnBlsu1k22AdIJWvE5SqhXTqAWK8b2JuCcgEnDxhG2
   QvTFB3ads4xGTGMQgYx/64lZhgXbWeOYGQx9D0sn7MxxZg8aVqZE8MMkV
   H0hNzTFUrBK8MEYiToeP+Jm3p8tIhRT1eXjXm8nl2jKnsgR64/30GIepN
   OBkhpsmqSzKaeDAO9skdJDN4HG1HyYplM4+W+fi84XRdUcZp0QhAp1XqA
   Mz2WWo0bRooap4Od/l0Q9CZ+6jwOBlmd7fNEcaUQdkmQqC2+Bhj1wrSi3
   Pi5UeUP4PqDFPz6w1ofIo9dv2DH/o+JxbxrJtZTH3ch95vMQD9EmndsBj
   A==;
X-CSE-ConnectionGUID: 8SkHmNb5TRmlA/XhwgyKAA==
X-CSE-MsgGUID: CWpO0msZQw2uH5cjgCClLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="73466411"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73466411"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 03:44:51 -0700
X-CSE-ConnectionGUID: j2WMkDPfR9Kj1VS5cQRQwg==
X-CSE-MsgGUID: 2zAJbefzTJSW1e/7ptvhYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161295494"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 27 Jul 2025 03:44:50 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufys3-0000Pn-29;
	Sun, 27 Jul 2025 10:44:47 +0000
Date: Sun, 27 Jul 2025 12:44:28 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 2/2]
 drivers/pmdomain/imx/gpc.c:228:11: warning: initializer-string for array of
 'char' truncates NUL terminator but destination lacks 'nonstring' attribute
 (21 chars into 20 available)
Message-ID: <202507271208.UyiTyid3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   219982f95faa822f6c76ba60e2c7629536e3e7dd
commit: e2ad626f8f409899baf1bf192d0533a851128b19 [2/2] pmdomain: Rename the genpd subsystem to pmdomain
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20250727/202507271208.UyiTyid3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271208.UyiTyid3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271208.UyiTyid3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/imx/gpc.c:228:11: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
     228 |         { "imx-pgc-power-domain"},
         |           ^~~~~~~~~~~~~~~~~~~~~~


vim +228 drivers/pmdomain/imx/gpc.c

721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  226  
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  227  static const struct platform_device_id imx_pgc_power_domain_id[] = {
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17 @228  	{ "imx-pgc-power-domain"},
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  229  	{ },
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  230  };
721cabf6c6600d drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  231  

:::::: The code at line 228 was first introduced by commit
:::::: 721cabf6c6600dbe689ee2782bc087270e97e652 soc: imx: move PGC handling to a new GPC driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
