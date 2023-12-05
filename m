Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBE41747
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrUQO6Wl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701780692; x=1733316692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCUTbhz9Gp778nei1oQnAVF7TiLMD1eyHKaR6gZwK1A=;
  b=DrUQO6Wl0LmfZTtKw6PHI12Yom/nQyQEBzTkPNE0hXd6fmRXSidKD6wQ
   m26ykPo++H7eWtWTrFv8TbzRyy33opTLsqccldF7hNfyGv4FFvpmVmc4m
   Htj2PwqQYOc+FV/ia689WuMuIAYOjpZ4iouo4+TNaMEUxIw/GfKB6A7vi
   5edf5+bn7M8DTvlBEHDoPlEHvRDEYEpzMQk9t9wBx7C8MZQIObJ0MVxNk
   KrjFmref9SL7Y157jFUe8HmLNDtLsQR5qTESDy+es0X4G7vZkpxLY1Qoj
   GIgIAJf2gRLTeBHz7nJpisnbeDG16dP4o2MSf5YEUgGisk9pQwbwLwCRi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397785142"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="397785142"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:51:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="770903777"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="770903777"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 04:51:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUtc-0008zK-0V;
	Tue, 05 Dec 2023 12:51:28 +0000
Date: Tue, 5 Dec 2023 20:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: powerpc.c:(.text.kvm_vm_ioctl_irq_line+0x3c): undefined reference to
 `kvm_set_irq'
Message-ID: <202312052031.mOVxL4jW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: d663b8a285986072428a6a145e5994bc275df994 KVM: replace direct irq.h inclusion
date:   1 year, 1 month ago
config: powerpc-randconfig-r033-20220206 (https://download.01.org/0day-ci/archive/20231205/202312052031.mOVxL4jW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052031.mOVxL4jW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052031.mOVxL4jW-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/kvm/powerpc.o: in function `kvm_vm_ioctl_irq_line':
>> powerpc.c:(.text.kvm_vm_ioctl_irq_line+0x3c): undefined reference to `kvm_set_irq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
