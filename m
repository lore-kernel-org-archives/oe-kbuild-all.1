Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC304158DAC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715796544; cv=none; b=kiZYnxe+qluGZtQjyisJlmyQt7+mQcyxZXabs9LYczGxTBkX86m+onZtletASdmFd3M6tCrtvSVCop1MvxdknvXLh0T+9S0MQ+YkhFdNYQZaVZm3NNOocNvu76E/l1R//xMpSQd68sjlDWJAcprd7jWbWg6R/p/HVVegT1i7qWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715796544; c=relaxed/simple;
	bh=Y1qPJoWq+rDShOl0qxGn7htU2w6WtIyV4qUaH93yshI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVCd5i6DtA0UMToHnbuw84wJScc8t3m1rhgnyjjluxA3xv7038k2cE5Y+GdB1Y89alPL66ZsgEFwTYx0wu3FaKSmXmi896Dh5GDJazPmACQ8p/HTacPJf1Ph7mk3/z9HHHfYdiv9a4CV10Gpwa606G9eSLgIMwfYgzLnfa8yOJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2IjZux+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2IjZux+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715796543; x=1747332543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y1qPJoWq+rDShOl0qxGn7htU2w6WtIyV4qUaH93yshI=;
  b=M2IjZux+zpvJpcMV9P1ltY4cePflDwkDo/apNJZTXJv95mA45htVzpJh
   8R/JXJ3qxZj8Ta5BXk8En7yRt7pDQCwE04UduuA+vJVJlnWC8iCtgVHPd
   uTtF4Be8p+JgG/2i3oKkj5czdPPb/jAWmbEWhnf53WkvsKBY3N6EeDHPX
   OyetbGSRY09Jkp4thBQJZv/Z6Pw02JfM5PAQje0X3EKbKdrA9MADANFzL
   Qa3BkFaLKWqn7WCwBfb+Ccmb2GiYCJqdrfBgEW/coKEfSrP7biA2NyaPW
   Hvzp7csJ+P8McAXh2U4/O8QDMh4hp4j4bgYzJJuMp9Ogfeiuaba8+uVMR
   A==;
X-CSE-ConnectionGUID: FIDqnSCcQDm5GogMGkMTTw==
X-CSE-MsgGUID: Yh2hHx2GSZuu6xMnMrIAJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23268561"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23268561"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 11:09:02 -0700
X-CSE-ConnectionGUID: pWPGU1brSBu3eoEXx/2K3g==
X-CSE-MsgGUID: iS/E9wqTTn+ihKJRy6oCQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="36023535"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2024 11:09:00 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7J3f-000D83-1g;
	Wed, 15 May 2024 18:08:55 +0000
Date: Thu, 16 May 2024 02:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: [linux-next:master 12458/13213] undefined reference to
 `pci_epc_deinit_notify'
Message-ID: <202405160254.xCnm7yhf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82d92a9a1b9ea0ea52aff27cddd05009b4edad49
commit: 4ad7de1554060f01dcea5aafba37c3ddc257e8de [12458/13213] PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
config: alpha-randconfig-r052-20230726 (https://download.01.org/0day-ci/archive/20240516/202405160254.xCnm7yhf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160254.xCnm7yhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160254.xCnm7yhf-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/pci/controller/dwc/pcie-tegra194.o: in function `pex_ep_event_pex_rst_assert.part.0':
>> (.text+0x249c): undefined reference to `pci_epc_deinit_notify'
>> alpha-linux-ld: (.text+0x24a0): undefined reference to `pci_epc_deinit_notify'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
