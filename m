Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A27EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 21:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705699218; cv=none; b=cX7Y/e9vBT9aNI31KIRYJnRC7Xaqu1h4bvr5e1kBh9tXiOw4F95I2clwVaImkOcIN5W9RtcAZAmkXxEaqavrDu9ygcC8htKoAWG6si8D5Zh3nYOokticPoY9IER49q9tfWsHbX3O/aPUFCtc4ibBUpTOppR9Nnr2pJexM7QIjj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705699218; c=relaxed/simple;
	bh=5s7ZE5PF1mbudZ/NUPnUHpRKLW0TNxBf4DkfK95Y918=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dC75um1lO73vhDsCE7Ko8fkPVwzIut7Rn8g7e59Y7ecsE7RT3y3XwNwHjYPUoz9vJJpG72hpr0+31jHdrfuc/cDWXwh8Yvm9pXzGJrBjuXyx4nInFTg8sRG+7Vp/5xc4SeMkrww75Jdt87nPWUoLXCFzYa/YzT4ls4VWceY136A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUgNt02O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUgNt02O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705699218; x=1737235218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5s7ZE5PF1mbudZ/NUPnUHpRKLW0TNxBf4DkfK95Y918=;
  b=OUgNt02OAt5JRM0eQ64i3BYTeVGsjkjAZMpwRYeEZV+u7SmxSzNIz0y4
   0Tfs5aN7yiPLh3yzjyjXEO6P6BtCkypmK6MMTw7WBW/OWg9+bbZ2rM1kd
   5AJIHb6/agM2sykW1Zo8lQgxkh6jSHwVdZzohZY7qNXx3aiI0/srbrcIc
   8EpFyf4dQq0NiPN6SQJNSf+QWZDa0fMQJydnBU8sBzRT3/W/hH+vGJRky
   h287S1fwC/w8SC7SEd4Ryau1VTApIRsqd98oE/jiY5oqYeQD1NO8/T9vY
   VKQ/skJDbFUq7Kvgm8X09/jw46DR/kKcRCUBralLpO8RXlYNm+aGI/wqx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="743087"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="743087"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 13:20:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="785152671"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="785152671"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2024 13:20:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQwHd-0004Qm-0k;
	Fri, 19 Jan 2024 21:20:13 +0000
Date: Sat, 20 Jan 2024 05:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 7/13] drivers/cxl/core/cdat.c:518: warning:
 Function parameter or member 'out' not described in
 'cxl_coordinates_combine'
Message-ID: <202401200541.XDmRpH3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   b720bb8edd5a52abe7d5c888245352e3dbaefdb1
commit: 879a6b06427a2ec0f1f5f5f9ff943cf65d1acebb [7/13] cxl: Split out combine_coordinates() for common shared usage
config: x86_64-buildonly-randconfig-004-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200541.XDmRpH3C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200541.XDmRpH3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200541.XDmRpH3C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/cdat.c:518: warning: Function parameter or member 'out' not described in 'cxl_coordinates_combine'


vim +518 drivers/cxl/core/cdat.c

   508	
   509	/**
   510	 * cxl_coordinates_combine - Combine the two input coordinates into the first
   511	 *
   512	 * @c1: first coordinate, to be written to
   513	 * @c2: second coordinate
   514	 */
   515	void cxl_coordinates_combine(struct access_coordinate *out,
   516				     struct access_coordinate *c1,
   517				     struct access_coordinate *c2)
 > 518	{
   519			if (c2->write_bandwidth)
   520				out->write_bandwidth = min(c1->write_bandwidth,
   521							   c2->write_bandwidth);
   522			out->write_latency = c1->write_latency + c2->write_latency;
   523	
   524			if (c2->read_bandwidth)
   525				out->read_bandwidth = min(c1->read_bandwidth,
   526							  c2->read_bandwidth);
   527			out->read_latency = c1->read_latency + c2->read_latency;
   528	}
   529	EXPORT_SYMBOL_NS_GPL(cxl_coordinates_combine, CXL);
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
