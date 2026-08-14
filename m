Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F503DA7F6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 20:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737618; cv=none; b=lb8GpBJSkq9xx3huh8htvqsc1h4opskRLMiaW+xJyUimtYcU7ZTJDUPjEv4eWC0MTFLt1Ezps9efdYTwQEXkuGP7gqnQ/h/q95fFp0URNsoORGMw1vrx/uckXjZKN7DXTNPU7RDzYGjogZVggkzC5/Mca48MPbDvSDsLXD1NX9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737618; c=relaxed/simple;
	bh=yejNEu7IFwF/DMYIcLeMMMSuTE+yBgED1C3V4O5lf9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWMT69z2aWaGL/fZBaIHJxsVq8MzxuAAPY6hA5bd4Ul7PWWrzkODL3zKhjTvhIdWUdI3+sG0dab5KWd8n8DbFDS7tDU9iOffMLcFYnf94DGH/oVVVElplGnCQDeYAsY9JUgEKGQVW54I8P/QS475MSruRAMHMU5wFnczTeaj8ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjfm5yZi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjfm5yZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786737617; x=1818273617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yejNEu7IFwF/DMYIcLeMMMSuTE+yBgED1C3V4O5lf9U=;
  b=cjfm5yZizsDrQkbT+giPoAf0sAVtan1K6zmyHroLya/OCSIY8zZirK2R
   CnYb7jYk23A4ZddYuyy3q/VNd6BvPKdb2/d52lTOBswTqNXTZxHiBEj6w
   +rJYagyZStYqckgKm8HKvjqP35YlB9b4T19XmQ2s1KSBT0DtgLE52V87j
   BMKfbE1u5S8K9NoPYlmzOtkoUlD07kS13eD/IOVg7iAb/3lizHN3aTzW6
   4y3LMOZ2h4d6y8kpX2r45ZOFD4vjdRoMPRWeflsC5m45EQNuSCoCoxSPc
   gf7lVPCoUGKTufr0+LPUxXcEhx8bWIrrRriCArSpNtpWZaG1XgDKdbDCJ
   A==;
X-CSE-ConnectionGUID: mrRt0xy0QFCNInNUq8Wvow==
X-CSE-MsgGUID: cuFCug4GSIimU1A1kNN1QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87449940"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87449940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 13:00:12 -0700
X-CSE-ConnectionGUID: hq7ddOIqTFu876iPiTuvgg==
X-CSE-MsgGUID: u/6YRs9WQPGVEYD+tzrCZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="302544647"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2026 13:00:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuy4V-00000000a0s-465e;
	Fri, 14 Aug 2026 20:00:07 +0000
Date: Sat, 15 Aug 2026 04:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: WenTao Liang <vulab@iscas.ac.cn>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <helgaas@kernel.org>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, WenTao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] fix: PCI: dra7xx: dra7xx_pcie_probe: fix missing
 device_link_del on phy   error paths
Message-ID: <202608150306.dhMPPe3n-lkp@intel.com>
References: <20260626154809.53770-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626154809.53770-1-vulab@iscas.ac.cn>

Hi WenTao,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.2-rc7 next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/WenTao-Liang/fix-PCI-dra7xx-dra7xx_pcie_probe-fix-missing-device_link_del-on-phy-error-paths/20260815-023710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260626154809.53770-1-vulab%40iscas.ac.cn
patch subject: [PATCH] fix: PCI: dra7xx: dra7xx_pcie_probe: fix missing device_link_del on phy   error paths
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260815/202608150306.dhMPPe3n-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150306.dhMPPe3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150306.dhMPPe3n-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_resume_noirq':
>> drivers/pci/controller/dwc/pci-dra7xx.c:918:17: error: label 'err_link' used but not defined
     918 |                 goto err_link;
         |                 ^~~~


vim +/err_link +918 drivers/pci/controller/dwc/pci-dra7xx.c

   908	
   909	static int dra7xx_pcie_resume_noirq(struct device *dev)
   910	{
   911		struct dra7xx_pcie *dra7xx = dev_get_drvdata(dev);
   912		int ret;
   913	
   914		ret = dra7xx_pcie_enable_phy(dra7xx);
   915		if (ret) {
   916			dev_err(dev, "failed to enable phy\n");
   917			dra7xx_pcie_disable_phy(dra7xx);
 > 918			goto err_link;
   919		}
   920	
   921		return 0;
   922	}
   923	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
