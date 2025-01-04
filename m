Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4F1B7F4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 02:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735959351; cv=none; b=TcvVnisA3sG+H1e/9w3NG2GlWlH8BuMWckOMZjVut4TWaY0HFWwepu7iOEmcLPNJMUO20BJIxqVKxe/HKkO3t4goKj3eeqY7lluCKtVKtYe7jc0Sh2MTlN8q183w+P8eZ0kZjisCw0hhsH7h/soQMoCl2KzEePCXY4IrbvdNRYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735959351; c=relaxed/simple;
	bh=PagGeguDDRBwctf5A5SbBArmWj6S9/8YlorOb3Z6U0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GoQHuy3TTL1ygoxHrTJMhjBEMoOzvAmga8guoYMO1xKFLPXzoFYBBj9FTjcSyZNvqrX0Oq4R3X9fV9jbONPCwTmypIDRKPdd8NXZhAav06E14KxImS/mNcUoClYrLzUhawNXXB1syQh2LB3HnN20pVKWe/+n6BKG63vKdQIp7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtCozRUO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtCozRUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735959350; x=1767495350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PagGeguDDRBwctf5A5SbBArmWj6S9/8YlorOb3Z6U0c=;
  b=TtCozRUOWAg6d1Cc29s/PEnkRWpeZExUBRm1Q+B/sDFpmR+mk+82Y48c
   fKgPH0bqw/7R9LybzneglFJh1T3WsZPbygkeSWsqppqcpxcoaKIPnPmNP
   qk3vGqDMvu+8juD8HKeeLPp1J7Z2egEjHtsjBo8x4ADvf1z8Ar7TSCh30
   K5Fsil3XPXPxU2KYuHVNaB3Z3vZ6XL0CNotBg65c6TO3kmoYuKiWBlMqA
   MmCt8PMTz+3nbKE3SfeHhirVtSy+GCnJ+uNGpfguVJutBXameRDFbcPx+
   ZX01hClI7M1UqZ5IWyXMPS59y8hpMHadZ6Rz4W8IDmXw+nms1fn8R8FEf
   Q==;
X-CSE-ConnectionGUID: oykYb2+6T+S166zgNKBmHg==
X-CSE-MsgGUID: ZkjVu9C5QZatj2VjTcxeyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39883465"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="39883465"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 18:55:49 -0800
X-CSE-ConnectionGUID: sb5lHeyGRRybdD/MinkMTA==
X-CSE-MsgGUID: kEYUVxqZTn29PIovJR2vIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106970477"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2025 18:55:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTuKH-000AZ9-12;
	Sat, 04 Jan 2025 02:55:45 +0000
Date: Sat, 4 Jan 2025 10:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] aarch64-linux-ld: Unexpected
 GOT/PLT entries detected!
Message-ID: <202501041012.2ipprq20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f68a69f66ca48a57deda309141220b596900a093
commit: e0b14e5f9b0adf0e0a9e67ccc9e3c596da0aded1 [1/1] ANDROID: KVM: arm64: Add clock support in the nVHE hyp
config: arm64-randconfig-003-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041012.2ipprq20-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041012.2ipprq20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041012.2ipprq20-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__kvm_nvhe_trace_clock':
>> (.hyp.text+0x12194): undefined reference to `__kvm_nvhe___lshrti3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
