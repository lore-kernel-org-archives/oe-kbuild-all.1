Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1A618054
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 03:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727924516; cv=none; b=hbi5v65EGNb5FzoAKtxsRfcZgmsPfYS1Mru/7xGTY9gT3CoI/Hpcr01Yf6ytJORIXc1o2I6BaTVUaXLPRbX6LMIM/n6vVSA4VN1AXqtgILiD/1QAwOj0bT9fPpMURPQR+L0skmOePUcj8BGh4cC1nWv0yVb7M/ruxqO2blPzDZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727924516; c=relaxed/simple;
	bh=aeRmIaR+POMtgc/9du5xvBkLglkRSK9cWJwZbC/2R4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxkUJ9+tyIM4DqPnCUdo6C78GJEfauRmjFcN5oz3u7Cj3XIY8WDeauXzFqnLeplBOcgaq1HpfornZ2iZQi/t9VKi8RFS7nIPU8AuyjATyJrp+2pKl+Z1mCMEDmfxkXMYnacUp3HXn2Kmv5EoLs1+WBLrEKDPQ79p4nBJ60BtALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arcQIDNV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arcQIDNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727924513; x=1759460513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aeRmIaR+POMtgc/9du5xvBkLglkRSK9cWJwZbC/2R4g=;
  b=arcQIDNVS1IscFtqielT9Clv+AJrSfUdvJiR9k0mSVQLDzM8dAOGCy4z
   inDNOlPPPO4jY10EVdIoozy5ys+QTIg6g6HoB8MvZTMiTFGjEjWRjKg7p
   O3XJvE0pCTFvm+2QHviHx3trvVpQADWsgD5F7dffnngqWyD/SzXOHjmr5
   ikmzNybYqM9msxHe9iA3m0qOXaBkMnE+jTHF+w123zZncVmPverw1a8H3
   EnrZggScrAhbIlVzoa7VGI/vJlRXpNPiY0NwxeufJANKpKuAAB28T+Awf
   q3uW3p5OqVsmWAAoRdJ56JH4oAX+zZipESKEyvH/jYZxb1XYngPjo4DAu
   Q==;
X-CSE-ConnectionGUID: YNa+SZU3T2edX7qmY1ItyQ==
X-CSE-MsgGUID: nxHCs7bGT2i9gBPkqrVHEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="14728287"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="14728287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 20:01:53 -0700
X-CSE-ConnectionGUID: g3wLz/uIQ42xTCrsFovC4Q==
X-CSE-MsgGUID: on4ptkV8QMaQYpo4BDPa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="73794092"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2024 20:01:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swC69-000UsF-1f;
	Thu, 03 Oct 2024 03:01:49 +0000
Date: Thu, 3 Oct 2024 11:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [bvanassche:scsi-remove-slave-configure 12/22] htmldocs: Warning:
 drivers/scsi/arcmsr/arcmsr_attr.c references a file that doesn't exist:
 Documentation/scsi/ChangeLog.arcmsr
Message-ID: <202410031058.BCRFO1FQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   04647d025d819d5dc2818f230f1d9c9fe59406a3
commit: 01b5e165f509f2b8b0a4c7c78f613042e694e845 [12/22] scsi: arcmsr: Remove the changelog
reproduce: (https://download.01.org/0day-ci/archive/20241003/202410031058.BCRFO1FQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031058.BCRFO1FQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: drivers/scsi/arcmsr/arcmsr_attr.c references a file that doesn't exist: Documentation/scsi/ChangeLog.arcmsr
>> Warning: drivers/scsi/arcmsr/arcmsr_hba.c references a file that doesn't exist: Documentation/scsi/ChangeLog.arcmsr
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
