Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1E95A4D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711022212; cv=none; b=c3GmDlpn6kKilgSvBlw0Y4KtiS7//ccnlUSCEGIsY75HEJwlTP0xXmmLlVkwE/FNY/XqkL396+sDMEY5VumI7Sj4+Ya1wI2/iDPax2dpwKqlchMz1dixG3TRId3ceiS8EQTEDEe+XY6h7WuYJNB4pbiSNRdrP0KNG5Ei0hEXVgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711022212; c=relaxed/simple;
	bh=bky3VJFkbdt2oB22U26hr7eCa5pB8XE4mN0GOl8JF0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=krdDVuG4WjPxl5CqiJ+mAwWsfADVqnkWmeCMcZZb8CSvPI5PDvzbKqiKfAKXlD6Uzpuox9suZ6IHJoVg3Be6UG/dKnowJwGt2En7vrZGY4i+zqRgbCXz/pJm9Fam8BOsgRbGcrKqYa1gphnP2NNap7ch40k2zLtXyoxMhN3Pi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqZ48eRI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqZ48eRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711022211; x=1742558211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bky3VJFkbdt2oB22U26hr7eCa5pB8XE4mN0GOl8JF0I=;
  b=eqZ48eRIAuOcQjtgaW7wRKcRjrFSTpyr6Af9p3UZW02Rrs5sYt3NcbiM
   eJHH55zvroshuqOAuiimAfjNl76tkTS2wL12rTMmeX+KBf6LJMfXN2fbO
   qk/ZAtONB84/8h8QYlDfZzKKIWh2A20F0AZXm64bwZLtxWcG2Fh9I7DoC
   Daje6NigxPPlmV0mVWnaNMNc+55aiubnhHpQ0DOfjvYk1JeLqMwsgfk2w
   wlkJ+nCJDOu9MpB1uEjWjZ7/isVHlcQnsC6r7mYrGM8iyegba60A3LjeT
   N06+Uo5P5VPrt7ziZ+xCzt2dA0buDMLovbAxf31zfk8rYHAY6iTvcmZBh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16644700"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="16644700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="14483939"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2024 04:56:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnH2I-000JOR-27;
	Thu, 21 Mar 2024 11:56:42 +0000
Date: Thu, 21 Mar 2024 19:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Helge Deller <deller@gmx.de>
Subject: [linux-next:master 13900/14187]
 drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:228:13:
 warning: unused variable 'ret'
Message-ID: <202403211931.wVl6ymAV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7528c088874326d3060a46f572252be43755a86
commit: 0688d3b1d882dd1dcf73305306e71ebf1653f595 [13900/14187] fbdev: panel-tpo-td043mtea1: Convert sprintf() to sysfs_emit()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240321/202403211931.wVl6ymAV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211931.wVl6ymAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211931.wVl6ymAV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c: In function 'tpo_td043_gamma_show':
>> drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c:228:13: warning: unused variable 'ret' [-Wunused-variable]
     228 |         int ret;
         |             ^~~


vim +/ret +228 drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c

f76ee892a99e68 Tomi Valkeinen 2015-12-09  222  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  223  static ssize_t tpo_td043_gamma_show(struct device *dev,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  224  	struct device_attribute *attr, char *buf)
f76ee892a99e68 Tomi Valkeinen 2015-12-09  225  {
f76ee892a99e68 Tomi Valkeinen 2015-12-09  226  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  227  	ssize_t len = 0;
f76ee892a99e68 Tomi Valkeinen 2015-12-09 @228  	int ret;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  229  	int i;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  230  
0688d3b1d882dd Li Zhijian     2024-03-19  231  	for (i = 0; i < ARRAY_SIZE(ddata->gamma); i++)
0688d3b1d882dd Li Zhijian     2024-03-19  232  		len += sysfs_emit_at(buf, len, "%u ", ddata->gamma[i]);
0688d3b1d882dd Li Zhijian     2024-03-19  233  	if (len)
f76ee892a99e68 Tomi Valkeinen 2015-12-09  234  		buf[len - 1] = '\n';
f76ee892a99e68 Tomi Valkeinen 2015-12-09  235  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  236  	return len;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  237  }
f76ee892a99e68 Tomi Valkeinen 2015-12-09  238  

:::::: The code at line 228 was first introduced by commit
:::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & displays for omapfb

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
