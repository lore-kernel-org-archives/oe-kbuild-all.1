Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1791E22FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734102803; cv=none; b=n0NnapETpJezEo3TtlbYLwCA9h4Hx8g6sF9dnKn32deJCQU2+DDdt52IeHX5fSotr1VIM8T1Zs8KKX7vKj2FZi7QJsvtJRmB6n8uk1YBCVB1e9VNGc02pHyHI98AzBk/w+J4FUD1OUOR9Ne4tyb6SJ4vYtxaB73zcaWjlh7suHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734102803; c=relaxed/simple;
	bh=qMc9ojWyPgQY+DAZUTV6CW0S1KQyUB255zPEb70UJoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFTk0tig62eubYURq9qdVmvoWGZMDx2EgeDC0dzHJ5tTNWtoV9Uw35k+zgMVdrzwhJdwQcT4YZUt4w995tdI3i538gflbMOpWCWjPRyB5kazhTRtfncBTD1Y0lKmEGCMOFmcWYZuXDIkX8WFh/9AjuNQbKWp5SRKMDECgdG1Hb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TY3XhvQD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TY3XhvQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734102802; x=1765638802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMc9ojWyPgQY+DAZUTV6CW0S1KQyUB255zPEb70UJoM=;
  b=TY3XhvQDumFA1zQyEcSAtxA/H8J+ac+8XfR63YW5/JPfMWd7ZyNRfpV6
   2wJ/6cwR9I7Cs7+6UYXFGNKaqyg0DwHk7o/Ddzx76hv0Q9KCaQKHV3nP4
   6r8ihgEMo+x/Q80k40vZT5VgQ6G7+ndIuzrCRP7JFVlUDzKF5bK6FOJJf
   LPzoHc6TXpW/dTk45ssSYDp8HGFVKz6TNprZ3gw+IW0/qKFuzOrsr+Rz/
   yJqzxhtSqunqxRCGcLe6vnPkj8vmv4Bil24frPWQLJdd1yB01fyXlaWfj
   J2RISaM/5t9JM338IxzYzI9X0scE3z/Dhq0If5UYtn8kHu6Kagso3TJUX
   Q==;
X-CSE-ConnectionGUID: ViJn57LnQ1KsCs1psmEzTA==
X-CSE-MsgGUID: MbLn4bVsQD+FmyLLTXO0rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38236548"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="38236548"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 07:12:00 -0800
X-CSE-ConnectionGUID: +ZNnM5j+TbyHqPL6wmR9Hw==
X-CSE-MsgGUID: +Xxvv/BSRwylzG1zMGPgww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127555965"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2024 07:11:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM7Ke-000C9J-2V;
	Fri, 13 Dec 2024 15:11:56 +0000
Date: Fri, 13 Dec 2024 23:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636] arch/loongarch/kvm/vm.c:115:30:
 warning: variable 'vcpus' set but not used
Message-ID: <202412132352.24cSlwix-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: 35da19c3c6d4b053eba09a0daa6063eae81e928a [1636/1636] LoongArch: KVM: Add PCHPIC read and write functions
config: loongarch-randconfig-001-20241213 (https://download.01.org/0day-ci/archive/20241213/202412132352.24cSlwix-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412132352.24cSlwix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412132352.24cSlwix-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kvm/vm.c: In function 'kvm_vm_ioctl_irq_line':
>> arch/loongarch/kvm/vm.c:115:30: warning: variable 'vcpus' set but not used [-Wunused-but-set-variable]
     115 |         int type, vcpu, irq, vcpus, val, ret = 0;
         |                              ^~~~~
>> arch/loongarch/kvm/vm.c:115:19: warning: variable 'vcpu' set but not used [-Wunused-but-set-variable]
     115 |         int type, vcpu, irq, vcpus, val, ret = 0;
         |                   ^~~~


vim +/vcpus +115 arch/loongarch/kvm/vm.c

   109	
   110	int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *data,
   111				  bool line_status)
   112	{
   113		bool level;
   114		struct loongarch_pch_pic *s;
 > 115		int type, vcpu, irq, vcpus, val, ret = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
