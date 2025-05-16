Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDED1A0BF1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420757; cv=none; b=a0PY9ueWeYxCJztPVeYnbVTpbR5vAFuEE9mjH/d35+XkklN6d1Nvc44n9cpxz3eFj4HJhFUUfP0Yq83NmMPSp3SldPGT/raVLXqy5PhOYvAMKmgYNoq7IVr0mCzUKt33JKa9Gpng/T5i/r/cuKI+dh+X9kxhrfTXvmnOKLAIhGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420757; c=relaxed/simple;
	bh=XjERl4+DCmF2f+ylgkc/OYEkoxQLi4NzAljS6H30lwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPG9RW2/ULEG9JCDYKIuJv98rOXXFRXLs4A6mYQB0JRlSZvSEX4cSioPTdXpT0qDxiPTnIi21+RD7AEWDSy9TB1AkhwVvHypD2wIa+A6ndhN3oKgSSr22HBCmqUkeK7tYIHY7B55pXyXkzUolHLYtwQRPkZQRhI+CauGVaHZ6RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1/D2FdN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1/D2FdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747420756; x=1778956756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjERl4+DCmF2f+ylgkc/OYEkoxQLi4NzAljS6H30lwI=;
  b=J1/D2FdNGenXbsDD+plRGr5cKEJs39HTqUUioYqEWKm4IDnn4uX1ba1R
   /hlUk9YDMH7of6Eex3/G3kqz3IGK1SaBGuFlfFgb0lwJue++KEvNBmSHN
   x6jxyFc1FcrBJOCUxgLueC5sz6Ey7U6fEEuSgddl75/MWDPveHaLRNpCT
   l9cBfqjnJo9BsvaixGjVi6q/jec4+Od7hFjFLbiXQAqcwRfx36dmmKNB9
   k0q5GnJ4IBWtpYdKu3om56TD4fGMB4pEFHcS7AdOyNWW1Us4BFLHgZY4g
   r+vy7LaLNIb+VJKzWEHhsi48CY43mHRiOjA1I5b1w4Z1FA5hBQkn1fS44
   A==;
X-CSE-ConnectionGUID: OEjaQRuYQFmh/LuXQsWifA==
X-CSE-MsgGUID: zVwJHHgIQE2yGCR69ATdHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60060863"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="60060863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 11:39:15 -0700
X-CSE-ConnectionGUID: QrJvClqwSZKaywJx3lrbOw==
X-CSE-MsgGUID: ZcDslqdZSYGyhIR7DCGNuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="139165509"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 May 2025 11:39:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFzxg-000Jci-1w;
	Fri, 16 May 2025 18:39:12 +0000
Date: Sat, 17 May 2025 02:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 141/141] arch/arm64/kvm/pkvm.c:756:5:
 warning: no previous prototype for function 'pkvm_enable_smc_forwarding'
Message-ID: <202505170209.VH7bpVjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5e97c36004c597634c5242f2d21ce921d0259cfa
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [141/141] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170209.VH7bpVjG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170209.VH7bpVjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170209.VH7bpVjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/pkvm.c:756:5: warning: no previous prototype for function 'pkvm_enable_smc_forwarding' [-Wmissing-prototypes]
     756 | int pkvm_enable_smc_forwarding(struct file *kvm_file)
         |     ^
   arch/arm64/kvm/pkvm.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     756 | int pkvm_enable_smc_forwarding(struct file *kvm_file)
         | ^
         | static 
   1 warning generated.


vim +/pkvm_enable_smc_forwarding +756 arch/arm64/kvm/pkvm.c

   755	
 > 756	int pkvm_enable_smc_forwarding(struct file *kvm_file)
   757	{
   758		struct kvm *host_kvm;
   759	
   760		if (!file_is_kvm(kvm_file))
   761			return -EINVAL;
   762	
   763		if (!kvm_get_kvm_safe(kvm_file->private_data))
   764			return -EINVAL;
   765	
   766		host_kvm = kvm_file->private_data;
   767		if (!host_kvm)
   768			return -EINVAL;
   769	
   770		host_kvm->arch.pkvm.smc_forwarded = true;
   771	
   772		return 0;
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
