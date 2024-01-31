Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB21366
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706665012; cv=none; b=I77UQbLeqIpjy7P7bdQrHR/0emOZGpKNsHA+r3rfqU8jcOPlqZNaacVNsfsj3dl+Rsnh3OsGWrHJuuPhEDyKCvPQptsoVMrRY9AhZ+dCnp9Ng3daRI1zCKvnIan3UEZdBhYu0lPL/tWXJp8PpFt58WmYcfHZD59ZTgStxtjji6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706665012; c=relaxed/simple;
	bh=CmrYwQSNiNcm8AnqPoXX6qloGcIKF9N0Z9bfi/2ZaKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qz16NwylmOdIn0Efb23Hr9SdUdLWwiRW3SZ+7Rbh5Cvpr82ptgIRrrXaOsJ0wOkvmmEpKTphiwawoWaUN0LSYPwwgccEhofNvOjiEt0Ot917ACkHyle6OJhBEA6MZdEtl8iWhlhxkdbPktGYJA2tU54vj8pO+5VqoKcs4b2ZpuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bx41mgjk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bx41mgjk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706665010; x=1738201010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmrYwQSNiNcm8AnqPoXX6qloGcIKF9N0Z9bfi/2ZaKk=;
  b=Bx41mgjk1Iej1WcexiKlqxQWnV9ASowd+47m2LiotZtN3WfE29P8eD6T
   g4FWllRLvMxpO1q8Plyr1C4V5RjHKBUDludIvDaN21yhLOIwrGvVZ8cVM
   phvDWyaqkSdwj5/n9O89EmPaJvxa7nbPUC1oDK7WdOSl/InfTE8ROaGXE
   zuUFkb/ESwGp1eTaBT3knTMIwsj8ocsHiNzVQbGK3MvjSnWNpPsMlY2QA
   m/UkZUTFX/OL0Y6+DkkYPbQZIQHAl6kYjrLHSylajo6cqEh2axQRm/qhr
   t4+leXbRUd7b2Yt39WB1XP55zoh2ZZaLhP/3ZY8mGKYn9bTSXXUYzZ4Ga
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10831254"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10831254"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788389173"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788389173"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 17:36:49 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUzWv-00011N-20;
	Wed, 31 Jan 2024 01:36:46 +0000
Date: Wed, 31 Jan 2024 09:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [linux-next:pending-fixes 269/310] drivers/pci/bus.c:440: warning:
 Function parameter or struct member 'top' not described in 'pci_walk_bus'
Message-ID: <202401310949.NbpFjuGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   60b9561aaa2811b5bff20d52b08d72bd2183f7cb
commit: 69fb843fdbd91d283773e054df20c420d7bddcd8 [269/310] PCI/ASPM: Fix deadlock when enabling ASPM
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240131/202401310949.NbpFjuGe-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310949.NbpFjuGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310949.NbpFjuGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/bus.c:440: warning: Function parameter or struct member 'top' not described in 'pci_walk_bus'
>> drivers/pci/bus.c:440: warning: Function parameter or struct member 'cb' not described in 'pci_walk_bus'
>> drivers/pci/bus.c:440: warning: Function parameter or struct member 'userdata' not described in 'pci_walk_bus'


vim +440 drivers/pci/bus.c

   425	
   426	/**
   427	 *  pci_walk_bus - walk devices on/under bus, calling callback.
   428	 *  @top      bus whose devices should be walked
   429	 *  @cb       callback to be called for each device found
   430	 *  @userdata arbitrary pointer to be passed to callback.
   431	 *
   432	 *  Walk the given bus, including any bridged devices
   433	 *  on buses under this bus.  Call the provided callback
   434	 *  on each device found.
   435	 *
   436	 *  We check the return of @cb each time. If it returns anything
   437	 *  other than 0, we break out.
   438	 */
   439	void pci_walk_bus(struct pci_bus *top, int (*cb)(struct pci_dev *, void *), void *userdata)
 > 440	{
   441		__pci_walk_bus(top, cb, userdata, false);
   442	}
   443	EXPORT_SYMBOL_GPL(pci_walk_bus);
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
