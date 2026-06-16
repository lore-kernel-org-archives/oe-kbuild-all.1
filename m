Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B83346AC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593669; cv=none; b=pX0spCPCZd6gG47flw9dd78qRIqFcuDp4KlWdSn64i1FHjZ1I9IjSqw94m9+pYGwzU+sv+a//2E74I7v+/Xp0ziXtV8Az+cT1FCFu5iNlsu0XN0OcoZZPOUXZIUmL1nQSMA8MdSdmkhuQSnw39nPQKCHQ9RoSh9N9TMsdBFK8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593669; c=relaxed/simple;
	bh=/afCHpI5e0JncairiYaqhIpWcsTlk4FMxlEHb2iPFtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZyW7ZSEkTlvXkq9fT1hBisUw/gPBMXHBvUTEK2zB+4Ej2H6B2jCM6Quh579XeC+sy0IyQ1EeCZoq1YWy5ToZqo2x2N0UcxWX4tduy4m+YAfUks0YIMkNPJpkpf8robrteKeVD1zEYPzRCax+IBWmdh/bpi6hTr79QrN7O8tF84Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/sdzWkl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/sdzWkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781593667; x=1813129667;
  h=date:from:to:cc:subject:message-id;
  bh=/afCHpI5e0JncairiYaqhIpWcsTlk4FMxlEHb2iPFtk=;
  b=F/sdzWkluYjnIjJnlmU8SW1HwyC4VuCmez0fX8Hx9Sr6xM6evEj7qJ32
   6GiEzfq6F8TixWqfxVppBboDfcQzH+6IxdZ1tfBZndSxqLrJrvPxFivUq
   ElX82UIQzN1L4tAn1pRUdrz/xBMN1fwbQiUDbgkGOReMXbNDaQdjheg0O
   STKw6aVikibaC582wARNKvuSZPU/HUEZXWDoqqncWxee/p1PGJM6XdA9h
   1yswE5qxv1FMaEd0Fl2CIJ85v/xasOX2hLllUJ/GcyaTUfXFMW4/3OaFy
   frwmoGE49v129ZysL6ezwxgNhmJgTO0Bd7LY8MAwe0eW7VyCgJSi5Te4Y
   g==;
X-CSE-ConnectionGUID: KUgcC+e5Q3mhv1MjT4rwuw==
X-CSE-MsgGUID: Yl4eKpaTRA2oj42lJYvqSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81358509"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="81358509"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:07:47 -0700
X-CSE-ConnectionGUID: HzFCvFzAQrmo3zaBiC558g==
X-CSE-MsgGUID: Q20eKCXxSzSmmp3tjyeTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="251605109"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jun 2026 00:07:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZNte-00000000Sq2-2soi;
	Tue, 16 Jun 2026 07:07:42 +0000
Date: Tue, 16 Jun 2026 15:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/hyperv_tlb_flush_races 26/31]
 arch/x86/kvm/xen.c:1610 kvm_xen_hcall_vcpu_op() warn: unsigned
 'vcpu->arch.xen.vcpu_id' is never less than zero.
Message-ID: <202606161552.mxgbSdDq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/hyperv_tlb_flush_races
head:   1fc5b5e066c6bee2c9266b52ef39867ea8929c59
commit: 7f6f6ad90ce3b2431d0c52431eecb022035022c8 [26/31] KVM: x86/xen: Punt set_singleshot_timer to userspace if Xen vCPU ID isn't set
config: i386-randconfig-141-20260616 (https://download.01.org/0day-ci/archive/20260616/202606161552.mxgbSdDq-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161552.mxgbSdDq-lkp@intel.com/

smatch warnings:
arch/x86/kvm/xen.c:1610 kvm_xen_hcall_vcpu_op() warn: unsigned 'vcpu->arch.xen.vcpu_id' is never less than zero.

vim +1610 arch/x86/kvm/xen.c

  1603	
  1604	static bool kvm_xen_hcall_vcpu_op(struct kvm_vcpu *vcpu, bool longmode, int cmd,
  1605					  int vcpu_id, u64 param, u64 *r)
  1606	{
  1607		struct vcpu_set_singleshot_timer oneshot;
  1608		struct x86_exception e;
  1609	
> 1610		if (!kvm_xen_timer_enabled(vcpu) || vcpu->arch.xen.vcpu_id < 0)
  1611			return false;
  1612	
  1613		switch (cmd) {
  1614		case VCPUOP_set_singleshot_timer:
  1615			if (vcpu->arch.xen.vcpu_id != vcpu_id) {
  1616				*r = -EINVAL;
  1617				return true;
  1618			}
  1619	
  1620			/*
  1621			 * The only difference for 32-bit compat is the 4 bytes of
  1622			 * padding after the interesting part of the structure. So
  1623			 * for a faithful emulation of Xen we have to *try* to copy
  1624			 * the padding and return -EFAULT if we can't. Otherwise we
  1625			 * might as well just have copied the 12-byte 32-bit struct.
  1626			 */
  1627			BUILD_BUG_ON(offsetof(struct compat_vcpu_set_singleshot_timer, timeout_abs_ns) !=
  1628				     offsetof(struct vcpu_set_singleshot_timer, timeout_abs_ns));
  1629			BUILD_BUG_ON(sizeof_field(struct compat_vcpu_set_singleshot_timer, timeout_abs_ns) !=
  1630				     sizeof_field(struct vcpu_set_singleshot_timer, timeout_abs_ns));
  1631			BUILD_BUG_ON(offsetof(struct compat_vcpu_set_singleshot_timer, flags) !=
  1632				     offsetof(struct vcpu_set_singleshot_timer, flags));
  1633			BUILD_BUG_ON(sizeof_field(struct compat_vcpu_set_singleshot_timer, flags) !=
  1634				     sizeof_field(struct vcpu_set_singleshot_timer, flags));
  1635	
  1636			if (kvm_read_guest_virt(vcpu, param, &oneshot, longmode ? sizeof(oneshot) :
  1637						sizeof(struct compat_vcpu_set_singleshot_timer), &e)) {
  1638				*r = -EFAULT;
  1639				return true;
  1640			}
  1641	
  1642			kvm_xen_start_timer(vcpu, oneshot.timeout_abs_ns, false);
  1643			*r = 0;
  1644			return true;
  1645	
  1646		case VCPUOP_stop_singleshot_timer:
  1647			if (vcpu->arch.xen.vcpu_id != vcpu_id) {
  1648				*r = -EINVAL;
  1649				return true;
  1650			}
  1651			kvm_xen_stop_timer(vcpu);
  1652			*r = 0;
  1653			return true;
  1654		}
  1655	
  1656		return false;
  1657	}
  1658	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
