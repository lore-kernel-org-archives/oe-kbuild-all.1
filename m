Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAC7E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 00:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720139080; cv=none; b=fRMQqFj4On5YSDv5vAtmKAjge9fcFopYcASXAbmva1AB15n6F663w+Ru8/KnXjadKk5bIjS9yXx+hbGmCLO7Td/9X5CMAYmbECmIfbu0aioxtgJa1c9z/zl8rz+ZzPCPCnjiCPoXWgywiJdXqciYjPLPuyVK5b3SuqtKb14iaFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720139080; c=relaxed/simple;
	bh=EP7a6yiOxQL59aPnJFWc9xNmUdEK17l1dSk+mo10Xrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLogNOocsRKgoU4QOP+NBtO0TA08D2CUTKqCiPr0d9RnrUHnT6BFJKXRHPEMQiQeO4lxx+N0UIQeEukAlwWCA88FOoprQ8ZL0TAxHU3orEtxpFNUmYpK2+aOSX+M+UA7miMwVmfUoIhkpKkbTi228VOnJLRQVFwjJ/sg0tOd8Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUqWl8S+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUqWl8S+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720139079; x=1751675079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EP7a6yiOxQL59aPnJFWc9xNmUdEK17l1dSk+mo10Xrs=;
  b=hUqWl8S+D0a39g9oenvQQAW+l3HoQTVjmirpDegtGmPHsPzfPCDzvtby
   ESJtDb8UkFyCOOBuoJACwegwudZvOhBUDClSJS5RsTStpJ9csvfYzeOhx
   +66T4bM+k7cXXjKlF3u6hGiD4TfKxkEyfBGjXwnoTHnCq2ubifNnkY2QU
   Z6wle6Hal6P4UEwcsAytSZNYXoDGwcEPIVZHAQ+BCjm9Cvr50CC22cpOs
   kIfKJRaKKBNs3oyWIyN9mjUr0+GwapyHut5eV2OPYPcl8Sa6LiId2ujIH
   f/IeZ4dKNamfgVOjDkp5TwR8Y9Rren9fa84wTpTGCuIoDMVcZehXCdf2B
   A==;
X-CSE-ConnectionGUID: 6ODPR7T2Q8SgMSDntE5MRQ==
X-CSE-MsgGUID: zKsuIwolQN+dCw4JUqnKcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="34966783"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34966783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 17:24:38 -0700
X-CSE-ConnectionGUID: GBoFfAutQ72Y6wx5017mnQ==
X-CSE-MsgGUID: sZxM/pj5Qu2cyu9+ceqnrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47158347"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2024 17:24:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPWkc-000Rgt-1u;
	Fri, 05 Jul 2024 00:24:34 +0000
Date: Fri, 5 Jul 2024 08:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Philippe Cornu <philippe.cornu@foss.st.com>
Subject: [linux-next:master 8712/10451] dw_mipi_dsi-stm.c:undefined reference
 to `of_clk_del_provider'
Message-ID: <202407050851.m83loRm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 185f99b614427360ec3a91dc5b3fc6220bed4742 [8712/10451] drm/stm: dsi: expose DSI PHY internal clock
config: sparc64-randconfig-001-20240531 (https://download.01.org/0day-ci/archive/20240705/202407050851.m83loRm7-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050851.m83loRm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050851.m83loRm7-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `dw_mipi_dsi_stm_remove':
>> dw_mipi_dsi-stm.c:(.text+0x554): undefined reference to `of_clk_del_provider'
>> sparc64-linux-ld: dw_mipi_dsi-stm.c:(.text+0x55c): undefined reference to `clk_hw_unregister'
   sparc64-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `dw_mipi_dsi_stm_probe':
>> dw_mipi_dsi-stm.c:(.text+0x6f0): undefined reference to `clk_hw_register'
>> sparc64-linux-ld: dw_mipi_dsi-stm.c:(.text+0x740): undefined reference to `of_clk_hw_simple_get'
   sparc64-linux-ld: dw_mipi_dsi-stm.c:(.text+0x748): undefined reference to `of_clk_hw_simple_get'
>> sparc64-linux-ld: dw_mipi_dsi-stm.c:(.text+0x74c): undefined reference to `of_clk_add_hw_provider'
   sparc64-linux-ld: dw_mipi_dsi-stm.c:(.text+0x7a4): undefined reference to `clk_hw_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
