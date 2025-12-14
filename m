Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8AE2749EA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765750013; cv=none; b=H2wKmoL9wAQvtZWXa7KIfwtrw9MBDFlc9Cgvx0NOs8LD/F8yB76kziN/OceK7e17nANaok4InWvqmp2HseaISzRmIoBR2OLNu7UbyY1XuT0ISfJC4vyxWuHsrMpBQKKkBoJ1Pvm/zbwUrPQtRZ74lVDkcWtBKsbTGBLPnUVmt5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765750013; c=relaxed/simple;
	bh=4Aquobis4T2W3C0BZdzJzjSORL8Y9MVkbRVhxmzi3oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1VNnPlocPP+GRew7q/1AcFrP+2ECMlDwtQb2dBJs6+oXIOC6o9JafebYgorurfD7jWmYwPy4HDxSggBrb3UmdODsypkZBL9dFXT4jEM3V+JZLr/TK8zvvZY2sjT2q0yrx1LekcUga61gcRLII7j1NKGRTV7/XsvawXc+MLw7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RF66SYbA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RF66SYbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765750011; x=1797286011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Aquobis4T2W3C0BZdzJzjSORL8Y9MVkbRVhxmzi3oA=;
  b=RF66SYbARPZLncRFIx/DUnEKE0ioq7qcWWI3oPiHOQ1hyT0mxWZjfvyi
   1Ab3wXVW5OVofeDA7U3RjBSX8GqVHKGzJi4eWxjUgj1n6JgKOkKnez7aU
   A7j52WGAB84mmSnIVizwIMQpJvIoRT9s68M5lYp4tU+Kxe8gaUFvizGii
   ANHlyFANsxIWKRolzms7wLgKYRv1iHaFyHtSKA5DkHIXIr/W99dxTL00D
   tT8uVCJtUa4gHF547hrA02JyqAhS0likY3ihYmKH06JSjApKq567m7gF8
   OH6z8M1LavLAGy0lnGlTs77YpbasISS7Ht+ia/vw97TGa/FsHq10nEv+D
   Q==;
X-CSE-ConnectionGUID: IQry1MQFQK+2bShnN61Fiw==
X-CSE-MsgGUID: VSKPlqVcTmap5aQWmg+qug==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67409861"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67409861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 14:06:51 -0800
X-CSE-ConnectionGUID: hYXx+1kBSUCqgZ63pg/NUw==
X-CSE-MsgGUID: 2AeY4CNsQ8ONeJHym25OpQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Dec 2025 14:06:49 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUuEp-000000002Ti-0etw;
	Sun, 14 Dec 2025 22:06:47 +0000
Date: Sun, 14 Dec 2025 23:06:37 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-netnext-rss2 16/37] kismet: WARNING: unmet
 direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
Message-ID: <202512142309.iNuXDlQI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-netnext-rss2
head:   9f65663bfdad717c57c939e8289964fd6739884b
commit: 642116d33dd10f6e427fbc9c75a2824f4061873f [16/37] net: pcs: add driver for MediaTek USXGMII PCS
config: alpha-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_MTK_USXGMII-0-0 (https://download.01.org/0day-ci/archive/20251214/202512142309.iNuXDlQI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251214/202512142309.iNuXDlQI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142309.iNuXDlQI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=n]) && PHYLINK [=y]
     Selected by [y]:
     - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
