Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC62FB095
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765621652; cv=none; b=YTLFzuw5fdQEpyVfOt7GBFHSBx/UGZty/ba/y8K3Vq4BGsPqWQPjdS6nITne9CjQPtsvUExR2KrUQjtqeW+Oiakruymi2XbE2qvaHsvXdNk+JMoCXs3W5Q1k/q0S4Nmdpi9u8CpuOBptmU4NvDm0GS1ZyDyCbgSbtsY4Eq51fN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765621652; c=relaxed/simple;
	bh=BsmCCgCwrkazez8n+Lj0SztKsSNQ1OP/nssaATxkxyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcKsSt+bdXSkuIt1pjV3NOtKWVyenl5MN7IFapVVNaD7EM541rsfNgjRGOimpqRKmb0iqwGEtYh5wPbFEkp8w7C4t7I+vE/36qJ+AxO86NI9a1L/0c1GrsMAJd+rW3x5r/Fif8f4xZUHOXrWY4A62AHdgZIJzp88gulHY3O2JeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCAco6Lp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCAco6Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765621651; x=1797157651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsmCCgCwrkazez8n+Lj0SztKsSNQ1OP/nssaATxkxyg=;
  b=hCAco6LpmknZCKgU2HN8n+1N0zrZYRS8Ue4qWkObvU3YbW2Das7P8Pcg
   ZxZNrfeNOLxff9Nco/fyU/sVlKJNq4qITVKZEy4L6TAWcWdbKbCRDpqYB
   PxZo+C2OkDiznufJsEC7ERXeVdGRzQEO3fFbeAHpnrqA/NUcSc9VJ1iUA
   fstQ2PZxI+8ly/jsRdROLDCg4aA91VGvXRINUcMW7e80v+EVFl/iZY5Y+
   8o9qr2x6+MBC4ff1qw4vAO2R/rsSUL1q9/j6CW8kkPmJgNOZ/U0Hqe/Aq
   TnXrHBflDwPmc2J2df4ep67y3mzFGu4+2NNStd+HF08RCGItwTLJtuwFI
   w==;
X-CSE-ConnectionGUID: qp5/uemlQ6+1+mJm4ITlrA==
X-CSE-MsgGUID: EVvP0wbdTcGiOwAT2Dfnrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85015648"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85015648"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:27:30 -0800
X-CSE-ConnectionGUID: a3IPdtjSQTWQ0QHGHOhksg==
X-CSE-MsgGUID: C3zEIbQ5QFGbX/NrayI2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201712634"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 02:27:28 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMqU-0000000021k-2T2p;
	Sat, 13 Dec 2025 10:27:26 +0000
Date: Sat, 13 Dec 2025 11:26:31 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18] htmldocs:
 Documentation/virt/kvm/x86/pkvm-intel.rst:431: WARNING: Block quote ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202512131103.MZlpiABT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 0590cf65b7741ee0885c33f5dea06665f53a7326 [0/18] ANDROID: [DOC]: VMX emulation
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512131103.MZlpiABT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131103.MZlpiABT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/virt/kvm/arm/hypercalls.rst:229: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/arm/mmio-guard.rst:94: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/x86/pkvm-intel.rst:352: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/virt/kvm/x86/pkvm-intel.rst:431: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/x86/pkvm-intel.rst:431: CRITICAL: Unexpected section title or transition.


vim +431 Documentation/virt/kvm/x86/pkvm-intel.rst

   429	
   430	               host state      guest state          control
 > 431	 ---------------------------------------------------------------
   432	 vmcs12*:       host VM	      nested guest         host VM
   433	 vmcs02*:        pKVM         nested guest      host VM + pKVM*
   434	 vmcs01*:        pKVM            host VM             pKVM
   435	
   436	 [*]vmcs12: virtual vmcs of a nested guest
   437	 [*]vmcs02: vmcs of a nested guest
   438	 [*]vmcs01: vmcs of host VM
   439	 [*]the security related control fields of vmcs02 is controlled by pKVM
   440	  (e.g., EPT_POINTER)
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
