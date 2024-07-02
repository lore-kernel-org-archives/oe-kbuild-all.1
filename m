Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B7154449
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916854; cv=none; b=qevfmyMOXT/PXeP2REvKpsRivWrZ1diL2sUWstpsXx/oH8Pa6jH7095/g2O6ZLthTxSaIQlcH9bPqXfgi7y71MBSM8EknsdHAAy2mWFk9C3oEwfgxqDudDwNcaf0B6UcUcVVzQToboO/J1JMAVGGtUKfqAGwv7q+V4pt7HDcC0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916854; c=relaxed/simple;
	bh=LyQY7uH1zuzzvMCjOZs4vScS3Dav/kuXAitme7jJo+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYjAXQ2ozjL5wvyCfDWOdP5AXEGJSVd9Zvl9Z/isI3gEM5/j00GF8iBH0IbjO4qqsgX1ovKSUpL65MmtD6PPCREFNLymOIDNAofe7zRIG3VKlJUmKVhrocTiEKS8xHFmk1x7CCHSEcO44hgN+7gnIdvNxpIEYEgV3c3IlvWLAPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWKSz2oB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWKSz2oB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719916852; x=1751452852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LyQY7uH1zuzzvMCjOZs4vScS3Dav/kuXAitme7jJo+Q=;
  b=CWKSz2oBXeBFjY8gh3UNKW7ve9XURCcG9qm0awDNrSxeNyv6m47d2sMm
   5pCe5qtvN0osn130jiPkZBWdZm+Y38n8Wsd6ush5Dj1d1h3rKLCxVmJQt
   1C1u+1FSN28RNvarlqfe7fsYOzItT853WvoLYhAUIiFQb3Z5M0vRKyzzL
   1WWnKnl+4n46Mn5w/w/i2IAmPGFhEC24jtAwWO88LlNTSf7cClB6L2Tmc
   Ns1+dTP1lCdtgqkiLuwiIuhQuY7raZOOeZGWInVdo9Uvtcb//rXXOkwKf
   heYcRrRcijs2vAPpRP9ZaKRsCAupgRNbAW48XRKDZSKOkzDNl0emGiwEn
   g==;
X-CSE-ConnectionGUID: Gd1cL4IURNKhk17tHRJVAQ==
X-CSE-MsgGUID: mwQRWCW6QC6hfxshCt7mnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16909831"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="16909831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 03:40:51 -0700
X-CSE-ConnectionGUID: jTfWAAnTQ3W7aBl6PfvYFA==
X-CSE-MsgGUID: rut9CfscSfi4dtib/E1ULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45653482"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2024 03:40:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOawJ-000O3I-1G;
	Tue, 02 Jul 2024 10:40:47 +0000
Date: Tue, 2 Jul 2024 18:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 9019/10049] drivers/irqchip/irq-gic-v3.c:47:23:
 warning: 'broken_rdists' defined but not used
Message-ID: <202407021807.cBuWVBVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
commit: d633da5d3ab1a0eb26a2213d65da1e189e82f8ab [9019/10049] irqchip/gic-v3: Add support for ACPI's disabled but 'online capable' CPUs
config: arm-randconfig-r034-20220810 (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407021807.cBuWVBVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407021807.cBuWVBVa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:47:23: warning: 'broken_rdists' defined but not used [-Wunused-variable]
      47 | static struct cpumask broken_rdists __read_mostly;
         |                       ^~~~~~~~~~~~~


vim +/broken_rdists +47 drivers/irqchip/irq-gic-v3.c

    46	
  > 47	static struct cpumask broken_rdists __read_mostly;
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
