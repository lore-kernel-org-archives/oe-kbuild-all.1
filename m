Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E1494A01
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592757; cv=none; b=MRAzviBcqFztY5hseavDxUzYSnZ1Lu34NB0WzToBNf6Cvmbd24djz0g1hbODiRyqCQEx5IhjWK9nUNNJYmnwJlW0p0Z+SLwHVUJqV8vLdJ9z8IEw6ofFUp7ZgaS5jXtZB6AJLC0ZJqZonZphH9ej/rDtmM71jyoKgmoPfUrIWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592757; c=relaxed/simple;
	bh=eb43Izc74OSP40AzGeLRE8EKUocYJlftQoG0lP5yVeY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NdROGODKgnjhHME4+G5P6JEkPPJpGdidL+NpxsbfHPGUDSBo2juSwoJyl5AGmxbRwWMNM9gFHlr5h1v5kfRrbYpwOAmCIWtGk270hGj8Q190TQjMZ0cZBY2tZ41MMNq96gm6U4MBndH7qaM94Moml4UPsaeDtVm4Wo9dRSAW17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cb+fP+mu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cb+fP+mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780592756; x=1812128756;
  h=date:from:to:cc:subject:message-id;
  bh=eb43Izc74OSP40AzGeLRE8EKUocYJlftQoG0lP5yVeY=;
  b=Cb+fP+mutxpJeyvY52CxR7q3NCTN6wrffwxGpd/glQ7BAGbUluLE0Aho
   RmMRZ3us/khWGMxQ5u9gzw/mxdDDUE+wr9St9/th5ilJbTvqfGOv2JRbT
   p2pbVy8APPZyogv0OrpcteWylrIFVj6vGsifgGHqSKnzmBp++PCjtZw5X
   Zj5m0y+S7Ze9DN+bKiGxzzsZrQq9uipHzDz66ow4vanbX+ocxIzXbIchL
   v34Ap5oU82k3b0Pjz7xymPqk5hUt31FVDIn1jKpAd9q5dyZJ/6dO4L29o
   rTvvUi2vmU0RTpP9LpiH7NDG3aXUAH/7zlCLZ4pPMgvFo/XbjsqsUVGK8
   Q==;
X-CSE-ConnectionGUID: TYTSPL1hQ+GvAe9Rfaz/CQ==
X-CSE-MsgGUID: 8/eFhn1SRPK3aldosAYRiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81424366"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81424366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:05:56 -0700
X-CSE-ConnectionGUID: E660Et0VSS+9aKsv8mjW2g==
X-CSE-MsgGUID: 9ZCoNdPeQWKD9nSexge7hw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2026 10:05:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVBVu-00000000Eza-2Bw6;
	Thu, 04 Jun 2026 17:05:50 +0000
Date: Fri, 05 Jun 2026 01:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 164/164] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202606050141.pEsdU0So-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ebfa00052eb2eb7ab8e1e7afe14dfe29a9ca2c4f
commit: d0288d6e55e2b3d0a5c21aabfd191e4f7cf213ea [164/164] net: dsa: wire flash_update devlink callback to drivers
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260605/202606050141.pEsdU0So-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050141.pEsdU0So-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050141.pEsdU0So-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3515 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:3534 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
