Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F42417C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756548844; cv=none; b=jwxAcYTBDi+ZnZ8NhWdBV6rx03ebsFfYgIHwQiz6z+telgY2tugbE9g8L+7+94RDKZ9SdV7btRa1l4JGsGsEo0COWraUWVUGlqwxz24VpNkeccIGVUQEMTBYrsuyujA70rS/X0/m5q3qVdF8DTPktk9o2KV6EhlEhtfa4Ogi0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756548844; c=relaxed/simple;
	bh=yawGRQm4KIjMfy+4ghao+32IJ1OFenHBUaUaeIRTBrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxuNHdr5ndt+UVkZAqAhAgKvmQB4MOCsvlonNUhzDPlIDHQqhyKtmsno6HwKib59hka+mDIVbCMQMKgjfkZQ9RKtHH/4vVnjaRX1rQL64Zdt6hYNLW0SslWhQ4oIepOtMnyammB5BROo83paezI+GwOG4n1BkC0pKAwUfLkOmFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHSnPATA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHSnPATA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756548842; x=1788084842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yawGRQm4KIjMfy+4ghao+32IJ1OFenHBUaUaeIRTBrU=;
  b=JHSnPATAV7ue+OITQqo+Pg+C2UwGVopmO7GBSfkSI9kf0MO6RgS1a0/X
   /kXYFjobXrAPFyx0QwZSqJi236vRhCmrjyGlGPl99xedNhTsPjMto7E31
   3tbmMJU/Ef0QOtfdnLlNLj04tMZxKYXNeY6t9FDFpvl+I6SKzGjOihpaQ
   GL5lSi8smIi3n2nTBcxQTauobCiwWSGs2n4vIvtiB4fLDa9WR1YiY+j9r
   mef8c2Jh2P6SLv3twHqaqf56FkwKM0R6+brUsr1IPRey7LBEi33bemhuR
   XETkZFtU7ugcsUiVYzI7DNmraFOde9rPJesvVVCMTXMQaM9ytoOXEi+jK
   w==;
X-CSE-ConnectionGUID: sB+fu3XiSceQyMYk61E40Q==
X-CSE-MsgGUID: l7+fxoPlSai8CLW/W4oKxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="62640830"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62640830"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 03:14:02 -0700
X-CSE-ConnectionGUID: yUbuzdu6QDCKdbyzEd1XnA==
X-CSE-MsgGUID: OZBk0RxYScGgnHtoxq7aGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201472871"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Aug 2025 03:14:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usIac-000VIb-2i;
	Sat, 30 Aug 2025 10:13:49 +0000
Date: Sat, 30 Aug 2025 18:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/tdx_populate_cleanups 20/21] kvm_main.c:undefined
 reference to `kvm_arch_vcpu_async_ioctl'
Message-ID: <202508301854.7d4zyHHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/tdx_populate_cleanups
head:   7277396033c21569dbed0a52fa92804307db111e
commit: 44a96a0db69d9cd56e77813125aa1e318b11d718 [20/21] KVM: Make support for kvm_arch_vcpu_async_ioctl() mandatory
config: arm64-randconfig-001-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301854.7d4zyHHJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301854.7d4zyHHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301854.7d4zyHHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: virt/kvm/kvm_main.o: in function `kvm_vcpu_ioctl':
>> kvm_main.c:(.text+0x78e0): undefined reference to `kvm_arch_vcpu_async_ioctl'
>> kvm_main.c:(.text+0x78e0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `kvm_arch_vcpu_async_ioctl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
