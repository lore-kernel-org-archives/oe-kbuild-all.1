Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8499D352031
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780035409; cv=none; b=P0RuwxMcsAsn3uvh2C8iHYhwxugco/XSPftK0AygGeqEHlb9sCM1QPvk0aToomB+QbPS3jHHM47yA4iu7wjg/2Z+4Z1boDZu+irVd1y7M54NqM5l0qKFIztB9GNS1abt5LHN/4loZ+cblMRbFCpX/ZxR0imJEEEMXfaI8UI8Sjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780035409; c=relaxed/simple;
	bh=w8w/FM/UX38s665t1deg3KA3JecWubUV08fWR4KvccY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a8p0pfHvv6WT2UkjkMXsk1Mb5AODNfG6XOTj2gZHS7M/L0xoTBYxEUiLgG1TYhhSklaOr3l/Ix46j2mR8/N+US411GUfjCun5LuUYQKLVpHVo8EDKHIpzHrAqu39Pykd82mZmy4Uv9cFwCiR3h+dGfMb9KH+y5IU36X7peDoi8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lM71bswv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lM71bswv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780035407; x=1811571407;
  h=date:from:to:cc:subject:message-id;
  bh=w8w/FM/UX38s665t1deg3KA3JecWubUV08fWR4KvccY=;
  b=lM71bswvhBUz7Txx2/5k3x1GPZlD1NYm8t1NEWazplCKcmMDB8BOBmpD
   SzlfCfHwb1iqCOWZuDQrbA6xMXJolwTpRHVCL9pd4cd19IreJpjM2oTYL
   CnNGHpnox3MDnbOon4BuxSfEV5QKPk2T21OAzvI1DVgTfu3mz93wemgcq
   uMmpLFy1eP58eh9rhLwsn/n5mlFa2DiXnGgJaz3IWHe6NmZpdoXJKWvO9
   wUW25tG8hIWtbMOBvvIhOm0kvDLE3Z97uiBOG48DP3EJTX0YhIa4Rt6ZA
   lnWiiuZC6n4XKqoh6a2VAE+iAlmEBqGtksN30MFAhtMAwRkU4uOeRHm4Y
   Q==;
X-CSE-ConnectionGUID: ZAxzB42kSdaKFBNFPBXHmg==
X-CSE-MsgGUID: k6kiXbFvQq2cwBeFh1Ly7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80911114"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80911114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:16:47 -0700
X-CSE-ConnectionGUID: d+0A8CkOTP259ep7/78ONw==
X-CSE-MsgGUID: XEAQLM4JT6S4Xt80YVYBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="246771592"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2026 23:16:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSqWP-000000006pg-2nVX;
	Fri, 29 May 2026 06:16:41 +0000
Date: Fri, 29 May 2026 14:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: arch/x86/kvm/vmx/main.c:63 vt_vm_destroy() warn:
 inconsistent indenting
Message-ID: <202605291434.AzaACnVe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8fde5d1d47f69db6082dfa34500c27f8485389a5
commit: 8d032b683c299302aa8b5fbce17b9b87a138a5f5 KVM: TDX: create/destroy VM structure
date:   1 year, 2 months ago
config: x86_64-randconfig-r073-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291434.AzaACnVe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8d032b683c29 ("KVM: TDX: create/destroy VM structure")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291434.AzaACnVe-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/main.c:63 vt_vm_destroy() warn: inconsistent indenting

vim +63 arch/x86/kvm/vmx/main.c

    57	
    58	static void vt_vm_destroy(struct kvm *kvm)
    59	{
    60		if (is_td(kvm))
    61	               return tdx_vm_destroy(kvm);
    62	
  > 63	       vmx_vm_destroy(kvm);
    64	}
    65	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
