Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217862C234A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766129948; cv=none; b=jtKRuSgFPnmHiZiAVAxBKkoKkeLxAI2fLo3nHC4QlHqKxgQGSeT8v/wJ+yvVOKx35KBwn+di71s1MhVK4x+pMYE3svV1yjfgVoghsuBrVME7GUE5MA/7K5AJ3Vy4ZueVJV1UCfyIGDHI3annuTSl/Ye78eDWFaV0E+drCskHxDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766129948; c=relaxed/simple;
	bh=yTM4Q2mgka3daLEXdVgJWGg4HW/okNP3U5fcJJzixjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/YrqvQNGTHD7j7Lj5bhmP4mOqZFbgtUkYwUQSTVv/HJXQgOxRo2SBUBDx3d2pla8nxweyfYs5DqYRmQedyfoYhw1MkfwCsNdVtBOX/0Lf14xMaRdyS3rhfBF/edj6ZYvtWit4/h4S7/WFQj3m+kKyp4NhKZcmUP2JeSHy3QJnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIrOb5j5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIrOb5j5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766129947; x=1797665947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yTM4Q2mgka3daLEXdVgJWGg4HW/okNP3U5fcJJzixjw=;
  b=IIrOb5j5G37cwWdandOIod6NvVIPNfY5VaVpvn6kVenUA0CNBC6TYo0B
   FWoWsMJ+Zr3UxA7sifnu6Z5rksqMyPOlnPzmxaO4/Zr5zMXXnKJFBpf4c
   PNhy8WfFyhj0flGMTTbgdb5LFd83Yscx77D9yMWFRyzo0pmP8GZ8swDyL
   FbjC0fD0f6FO7tLRY0xsZxY8EZMyB1+W27D9rR2t7P9Q8cVyCZd3IuBNE
   2nsEigRQkP1r2edC/3+5nKeO/v6muxp05pDLK9ouundGvQ0+25Ewu66dt
   ywuqBxbgX+iSj/EMi3TPFLooG0H+30l/LP5ru/M3FBrX068fB5dRdRo4W
   A==;
X-CSE-ConnectionGUID: /EqT7+S4S++rhHj6P4yJYA==
X-CSE-MsgGUID: SgK3th24QpeNpkRnEG0xuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67983764"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67983764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 23:39:04 -0800
X-CSE-ConnectionGUID: 2ut3GdVSQb2UY4YvN3IAoQ==
X-CSE-MsgGUID: uSIVyW/eSSi+jmZGf8rWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203186697"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 23:39:02 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWV4l-000000003Dn-3zsM;
	Fri, 19 Dec 2025 07:38:59 +0000
Date: Fri, 19 Dec 2025 15:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 arch/arm64/kvm/arm.c:1906:6: warning: no previous prototype for
 '_kvm_host_prot_finalize'
Message-ID: <202512191544.ZdzBVvtV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 68bd98a28aa622358c73420792329221c86fbe0c [0/4] FROMLIST: KVM: arm64: Wrap the host with a stage 2
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251219/202512191544.ZdzBVvtV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191544.ZdzBVvtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191544.ZdzBVvtV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:1906:6: warning: no previous prototype for '_kvm_host_prot_finalize' [-Wmissing-prototypes]
    1906 | void _kvm_host_prot_finalize(void *discard)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/_kvm_host_prot_finalize +1906 arch/arm64/kvm/arm.c

  1905	
> 1906	void _kvm_host_prot_finalize(void *discard)
  1907	{
  1908		WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize));
  1909	}
  1910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
