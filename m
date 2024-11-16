Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A42AD25
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768576; cv=none; b=noY8kSevseAh++wOoCV4KMhVIM7IbB3JIDOlYsJtaXd6pYIqc1QYqKhtsq1HqZmyXZns4kwWKC5XohUuB0ylgWFrSEI45tnbfRwR1PVWPUkOayGL4+jEE+rG38Yz1WFuzgL7L8E4dV/y8kI6du5DYNzVA/+65B3IkTwwRbCxWpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768576; c=relaxed/simple;
	bh=qf0r2h3N3NgrtJ1daOXkAJu61KJoFm5lTCoXS+8/v1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDd9sDBJB+Kd+/oBatsDBYgy86b+sPwmeAMTwpeD5oVXkb6500EMo+P/h3Lx+e5GsjE3wHKFEIdCh3IF+PLoqOdHs9MrhXZBf4ehd4BdWs520UZyzWssZOBzTGQuMRDkV42tShHZ+fIJ7QYqjHfIxn3OJHL6q+Up8AtTLabEJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDSE4d3C; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDSE4d3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768575; x=1763304575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qf0r2h3N3NgrtJ1daOXkAJu61KJoFm5lTCoXS+8/v1M=;
  b=KDSE4d3Ct52HJx4gDa1NEY9yGnEpTsNc4Gjh3xrNAQHtpegum+NMQy07
   QPyfuTWH1tiBmDbl4K5gTgQjRZifbqjXXbnz7xvuFDWnSQpqIz5Yulccj
   B/p9bNt03mrDNpZFOmbTpMVUY6pV6O4F0rPJoTOz+9Gq16Hl+frz+9Ga+
   r6YOxw+smPSe42cP3IvSCRd46831ZCZLNajr3ySKHY2unn9B5k0e42V9G
   G0lRo3WSUgWL791GOQc+ACj1qwzMHzzYBDwjD8O4PlsIPVAgXoX0ATaT6
   ADJZHzGHNjQpZbvo5Z717bgnf6vhfA/kSIPQODDJRW0soTuo2IYBdl79H
   g==;
X-CSE-ConnectionGUID: maxHG220QJOd165tgnZRUQ==
X-CSE-MsgGUID: CcY2kr0GQ8Kt/wulVKCY+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42294840"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42294840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:49:31 -0800
X-CSE-ConnectionGUID: i287+lKtQg6zBs9wZonZIg==
X-CSE-MsgGUID: SzFjOaz+TUaeq2zcsVsP+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89209804"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2024 06:49:30 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK76-0000h9-16;
	Sat, 16 Nov 2024 14:49:28 +0000
Date: Sat, 16 Nov 2024 22:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466] arch/loongarch/kvm/exit.c:768:2-3:
 Unneeded semicolon
Message-ID: <202411160232.2JVuDLjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 60f12ac296b9c755ff6f94fed1590a9ae2e6dfa7 [1466/1466] LoongArch: KVM: Add pv ipi support on kvm side
config: loongarch-randconfig-r051-20241114 (https://download.01.org/0day-ci/archive/20241116/202411160232.2JVuDLjW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411160232.2JVuDLjW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kvm/exit.c:768:2-3: Unneeded semicolon

vim +768 arch/loongarch/kvm/exit.c

   751	
   752	/*
   753	 * hypercall emulation always return to guest, Caller should check retval.
   754	 */
   755	static void kvm_handle_pv_service(struct kvm_vcpu *vcpu)
   756	{
   757		unsigned long func = vcpu->arch.gprs[LOONGARCH_GPR_A0];
   758		long ret;
   759	
   760		switch (func) {
   761		case KVM_HCALL_FUNC_PV_IPI:
   762			kvm_pv_send_ipi(vcpu);
   763			ret = KVM_HCALL_STATUS_SUCCESS;
   764			break;
   765		default:
   766			ret = KVM_HCALL_INVALID_CODE;
   767			break;
 > 768		};
   769	
   770		vcpu->arch.gprs[LOONGARCH_GPR_A0] = ret;
   771	}
   772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
