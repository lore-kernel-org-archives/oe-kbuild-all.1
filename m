Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDC3A4506
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899114; cv=none; b=RgyxKNpyyp5xJa1LYlJRka4pb46T87F/dPEzdKPiM+tqxDv9peoNBX0bQe2bZINJnLn0ObAk5KbJBQAFubyohaVvZTPASrLrfyJDXuB+feMN6Q/MyaDECXlcD3+69dJyqcph8XXQuAmf+IKDH/Ag+2vyAd1lcIOQohDvP7HDGKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899114; c=relaxed/simple;
	bh=P7dELDQNGqqPQuie5RrFfLtkdPUGYl6FvV9kSQKHDjo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jGyWZxCK3/doq7H4JCofDik6MhvXmTl1wnhvJpgXONVPPGSzfjJytmHM2SW/RA+wqXMmhN9mgu22PV7nwN26SCC1Y6g1IDxIIEGgaWTAPlXE6/cnEhiGh0x575/PLs+6mVhGCvAjlVKBVSPIVYj8DyE+Ceuzoh91aSRUZrxeU8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUJ/aWCt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUJ/aWCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772899112; x=1804435112;
  h=date:from:to:cc:subject:message-id;
  bh=P7dELDQNGqqPQuie5RrFfLtkdPUGYl6FvV9kSQKHDjo=;
  b=eUJ/aWCtK7gQ2x74WWT9nyOt5YWWigIoJ21B33o5AAJ8qe2lhKIvG01g
   rk5C/DEjBcwzWTb5AYfbVMn2es7q05S1CtRzglYXYOglbYttVVbkwu0od
   BnKUWVNwrN06BJGq5UryBLDXPy3WDOPVHFXk7h7/cRECzVwmJ7jtrbwzO
   IhRik7hy2hcu3ZUu5qMVAnAGWODuJRitdsSk9OGYUF0jzkYg467In5PHB
   CV3QMckhTzaH5MkNL50F8FG/1PuHwLvUunMxucNKgoDJM+NmQlEeSRx6R
   z2HxM5g3rxT9rNR6lI+aMZxT0kKJDQ/BF5Dgh13xTIJk973TQ7xIPmUw9
   Q==;
X-CSE-ConnectionGUID: MMTkXGuUR8qCRV31JKxvgw==
X-CSE-MsgGUID: DwQwHNv2QdqTS2N6iJVTJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="91557556"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="91557556"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 07:58:31 -0800
X-CSE-ConnectionGUID: g71Ctaf8ToewTT1h9qHUSg==
X-CSE-MsgGUID: TY5Dct1nQG+8rgYH+qvWNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="218522872"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 07:58:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyu2s-0000000028T-2DpL;
	Sat, 07 Mar 2026 15:58:26 +0000
Date: Sat, 07 Mar 2026 23:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 212/212]
 arch/arm64/kvm/arm.c:1906:6: sparse: sparse: symbol '_kvm_host_prot_finalize'
 was not declared. Should it be static?
Message-ID: <202603072301.oqYwDLMC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   bb2ec6c2bb3c364e30471f039815e0ba4935608b
commit: 68bd98a28aa622358c73420792329221c86fbe0c [212/212] FROMLIST: KVM: arm64: Wrap the host with a stage 2
config: arm64-randconfig-r131-20260307 (https://download.01.org/0day-ci/archive/20260307/202603072301.oqYwDLMC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603072301.oqYwDLMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603072301.oqYwDLMC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:1906:6: sparse: sparse: symbol '_kvm_host_prot_finalize' was not declared. Should it be static?

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
