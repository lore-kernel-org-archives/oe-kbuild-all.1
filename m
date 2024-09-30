Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8913DB92
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727686265; cv=none; b=NI/veCD3y7OjKa5+d31CDNtdkpsasSneHwH/xu2sfD7kuEKAro8XCja/GytbEc00xV778+9NSN0YHmiSF7d5iEURpsctl4PcJ4Hhh0FQckxfnXsmnZRrOpcG1aT7Hox0JsOloPvKd2Tl3kPCBeOEK4ub8WuKH3IPHhNQofkBbTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727686265; c=relaxed/simple;
	bh=yZyYoC66mZuebWuci7IPplarMnFD3yZyJKMXxlsV5cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3v3X8CAotYuHbqMdcaTLoamBXSVD8QN1GkUbaI4+qmJpEkXE0MzXrXZRBXfMO93v4j00rfEcnKn3LXc9uZgaGbY+dr3cTfT/BsSmqLLsLPVr8Dax5uEz9nGqr4k/Bd/Rc4mZyv3PYwI2oXb1S4nDbdSyiU2C4MWRdVfC6Y+70s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOL41gm+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOL41gm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727686263; x=1759222263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZyYoC66mZuebWuci7IPplarMnFD3yZyJKMXxlsV5cM=;
  b=mOL41gm+aKZH1R0NYukb+EiWhLK0mcWjDjQXQXhgP5+3e7JAn4ipIB25
   OTLPOqUUtXizFNXNX01rSHuDbK/X1ByDnQsOhcvp59zGZjs7EYIS2EGnz
   aRp2y9AMZ70lWYvZTnRt36J0AZo1kkZoGs9jRwxocRTmLh3yzSJ4DC0vm
   PNU6Fu7IrFuUtn/qcFujefg/DFpJQTN05enk4xDKk4wbCifBxXbvTszR9
   UVF89wRUCj0JeCxSVFIOlau3vgYpZKjGU23hNlZ6QzTrSkF3jazqILaqT
   cJd4wz1yob3Cp6UgsQ5MKj1Jjw35dh53XIeHXESmss1KXJpz/NLkNpkaE
   A==;
X-CSE-ConnectionGUID: j9k8uXQmQ4Cv51PMFD0UQA==
X-CSE-MsgGUID: ZQ38IEFCQAmGbu45g+XuRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37904765"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="37904765"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 01:51:02 -0700
X-CSE-ConnectionGUID: azLyLsFQS1WN6ao90V8i0w==
X-CSE-MsgGUID: xKNlqbPbQceZB4zhQkGwvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="96559771"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2024 01:51:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svC7P-000PFT-2G;
	Mon, 30 Sep 2024 08:50:59 +0000
Date: Mon, 30 Sep 2024 16:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7229/14254]
 drivers/net/ethernet/mucse/rnp/rnp_sriov.c:304:13: warning: 'check_ari_mode'
 defined but not used
Message-ID: <202409301601.gC4P89Gn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e4fe1cc5cc1a347dec844c60d34f6141780f05af
commit: bc0e7c9b35e0290125847e322dce4609f83f2dc9 [7229/14254] RNP: Fix warnings
config: loongarch-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301601.gC4P89Gn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301601.gC4P89Gn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301601.gC4P89Gn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnp/rnp_sriov.c: In function 'rnp_pci_sriov_disable':
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:396:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     396 |         int err;
         |             ^~~
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:410:9: warning: no return statement in function returning non-void [-Wreturn-type]
     410 |         }
         |         ^
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:412:9: error: expected identifier or '(' before 'return'
     412 |         return err;
         |         ^~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:413:1: error: expected identifier or '(' before '}' token
     413 | }
         | ^
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:304:13: warning: 'check_ari_mode' defined but not used [-Wunused-function]
     304 | static bool check_ari_mode(struct pci_dev *dev)
         |             ^~~~~~~~~~~~~~


vim +/check_ari_mode +304 drivers/net/ethernet/mucse/rnp/rnp_sriov.c

   303	
 > 304	static bool check_ari_mode(struct pci_dev *dev)
   305	{
   306		struct pci_bus *bus = dev->bus;
   307	
   308		return bus->self && bus->self->ari_enabled;
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
