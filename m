Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2779C4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730605934; cv=none; b=ZWM57Rr3lWET6B65zcT10kEZihMTwne009ial4au0AE1or6T0JmbIxqcH1fg/XzobgdCVAs8GwU78BPosT5Jpkmm2zVgDbcqBo3kQGMBp+XSCVztu3R7OtslegMZDN2Q8YiF7p+BEG79qhrB/C2RbrJPz1ukmFmWM/cSObuTKVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730605934; c=relaxed/simple;
	bh=z1S9UO18U2DBwIjGsUknPmpPF7pOiS9tbHRuIQ4GTJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqiM2Slck0rzTW+AZqKW3Y4rsFMagyJm+1iiTNUd+ZZaoH1KO/8Dm6KA0yTbu5CXM8wSao1CSGny38cAN1Rk/5IEcqFZVy53RKn05+ec2VLgK8Z7ksF6qkA/Q3AHnWTgvQtLNoLhOUyW3DHWMgL10/wWPI0DgTnD2a9/FXbIAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDSgDQaf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDSgDQaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730605932; x=1762141932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1S9UO18U2DBwIjGsUknPmpPF7pOiS9tbHRuIQ4GTJY=;
  b=KDSgDQaf1Fye7l5CyNbebbnCIylN6DTg7VGGM0xmwGfPcD88cTCZ46yY
   4leXAows+A228bHOB5bBDb9nTZuFilVTrjx1yYmddUVVQCao5Ou5joAIs
   sCtSXLDkECW1d7dysb2lTEho74kXlcNPOmoattAc+1gQ98COSzdmyXseB
   WCkYC1wvv+wvC37MjknIdA+HUtx4QXnaeQd/XfdJmIVtoiVi/1fVISrw8
   eiaTKyzLqjxOkd8t8+7LsjEF/tcdkBjEEcLPv3CzcFc7G5W7JLVhzmDI3
   PvkgzhrWFVTTbrbecpZI73iDCyCkCvQNzhlJXon9ilOH5iBefXeT3wkCg
   g==;
X-CSE-ConnectionGUID: ZbWHJPd4TlWMwPOwBI6jCg==
X-CSE-MsgGUID: eUEjmcMuQ6W/YDRDxGYGag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40871673"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40871673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 20:52:11 -0700
X-CSE-ConnectionGUID: M+BNBSwTTn+D04QXHh9V2Q==
X-CSE-MsgGUID: r6kpZJV9S2ymbI/LIwYcBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="82850665"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Nov 2024 20:52:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Req-000jer-1K;
	Sun, 03 Nov 2024 03:52:08 +0000
Date: Sun, 3 Nov 2024 11:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/apple-host-bridge-hook 6/7] ERROR: modpost:
 "msi_create_parent_irq_domain" [drivers/pci/controller/pcie-apple.ko]
 undefined!
Message-ID: <202411031109.VooDLSXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/apple-host-bridge-hook
head:   4109e0e2e9d3fb7de4ae6f3bade444cdc07c9b9a
commit: a6ad040d8cacc42d4ca565d71469ae10dd9cb371 [6/7] PCI: apple: Convert to MSI parent infrastructure
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20241103/202411031109.VooDLSXC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031109.VooDLSXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031109.VooDLSXC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "msi_create_parent_irq_domain" [drivers/pci/controller/pcie-apple.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
