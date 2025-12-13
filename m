Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDBA1862
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765662926; cv=none; b=mIgxBQdRJkNI8h5mkf2b5IgLalE1etMIQAFXfRx2Wb7Naj2frvUw7652npSVWgWH9Xi/fNKy735XVO4lyZq8SlTENdfN6YiQ9g1DPVXBBekGmsH10jXzYLVmzSZTOdLJ0uQK2/S//rETxMSL84U/wnLNGAGp2rlTD2VWmq0TNPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765662926; c=relaxed/simple;
	bh=bWAOZDgwDKwLs0Xm4H4mlqRt50MuU7kbnDu0in1521M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQ05YOe1bOc/029H4y4YB+FPE6q1InTQBtsST30QGlo1By0sA+0YccYsadiZqQPIDededy+BtAcRmYsg1hTBihmKNbdZh/UHYk6tETyaR7WQKuNp4IvHsE7H1+nGtzacVCUcuwy2a9fZUlkPe6dl/dQNt/KEP/KtvnQoZvxZAS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJ0Fnfes; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJ0Fnfes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765662925; x=1797198925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWAOZDgwDKwLs0Xm4H4mlqRt50MuU7kbnDu0in1521M=;
  b=jJ0FnfesGRZyY9dQ2iF79XhPF9DFoaWAKbfFs4dxtr3PKoBS30jBACq3
   QLSnuNz4uo2Z2exTvjM0o3VgkHMdfGvNfcnCNrBlh7l9/bPe5fAdNpn3J
   p332VflNZDeyhle72tUpW6dGMTt+YJR0YWJ5E6BbchjOavkXoGF5CikeK
   kxfH7tS3AjopdbC5wpCx/rXTmjsfFEV3wpgI07KQhbOyWtWMJGXxIsF08
   nOXqHFaRPZ4oyym195yMLC42mmd37JhlnLoMGA1mewD2X6MWBEtcR0Ppj
   onplfXTWuLthaXrsyx3DXW7M+j9mGXOE1n63e3AJWppxToxVeQ05ehNol
   g==;
X-CSE-ConnectionGUID: OUDRDOq3Tz6sTUbscBtzIg==
X-CSE-MsgGUID: SJC+3BjuRryPBOiVftzGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93099765"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="93099765"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 13:55:24 -0800
X-CSE-ConnectionGUID: BI90ZAbaSJq+1aGEZ/WT7g==
X-CSE-MsgGUID: iTFG37bpTHSzNmpMuqKPJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202473694"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 13:55:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUXaD-000000008FV-0VzB;
	Sat, 13 Dec 2025 21:55:21 +0000
Date: Sun, 14 Dec 2025 05:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 2/2]
 arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for
 'hyp_putc'
Message-ID: <202512140557.DtoZ3Eoo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   16188c9444ac9af88549d1db5dfe7760418a22b7
commit: ea53aa5d800829a9adc17df0b6615eb845a9314b [2/2] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251214/202512140557.DtoZ3Eoo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140557.DtoZ3Eoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140557.DtoZ3Eoo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for 'hyp_puts' [-Wmissing-prototypes]
      42 | void hyp_puts(const char *s)
         |      ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/serial.c:54:6: warning: no previous prototype for 'hyp_putx64' [-Wmissing-prototypes]
      54 | void hyp_putx64(u64 x)
         |      ^~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for 'hyp_putc' [-Wmissing-prototypes]
      60 | void hyp_putc(char c)
         |      ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/serial.c:66:5: warning: no previous prototype for '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_putc +60 arch/arm64/kvm/hyp/nvhe/serial.c

    59	
  > 60	void hyp_putc(char c)
    61	{
    62		if (hyp_serial_enabled())
    63			__hyp_putc(c);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
