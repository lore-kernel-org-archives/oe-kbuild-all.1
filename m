Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A819E839
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775901260; cv=none; b=t+84E3M2eJXs2qFMlMJgl04TS9qdCFMsbiqBlDtzl7QTRvNL94NABObFlYhifmL/avB/IsCe8eTo4jCZbJ30F6X+XJnqxKp/mgXLaiF8CqWRIZUFv+UhKzngek8R0h6lYLVXPlFYXm1+Kts2BrI64zU737dNx+U0P2Ej4FSptPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775901260; c=relaxed/simple;
	bh=J6sgexIvWQ4H7pJ1CRBp7lA0YI10Py/MVqcgo3q08e4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qjMK34hp6BFiw5JAw01rBDit0kz8VeGbYS65L/Qu4fdlXtKHvMCEdUoye5fgryOF8G5slNHAtCZn0C80zHDTCvDw0Gl8jNAyNVpwgPydN9RhUVT9XxnRe9RNXv1dQHyuMTjVTpNyj7LRqjaWar2+hEI3JHlHhOjRAN4CXzFRLdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBQfRAyV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBQfRAyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775901259; x=1807437259;
  h=date:from:to:cc:subject:message-id;
  bh=J6sgexIvWQ4H7pJ1CRBp7lA0YI10Py/MVqcgo3q08e4=;
  b=kBQfRAyV5eUaD/syJQEP0AnnKc2HtuLeNJEm3JDGDxM1MS0bcY7l6z4c
   DSDA4/Y/MQHmUzE8HU6l7LXEt+tG0KxkhGYwhcLLjj9wVnvVuitPdN53k
   XHX9WBuoFPoZKXm5yyBvCbdyburMJI16yKW+QUUp/ZDPfg3LUQk0aZcUG
   0mcNHZ6Xp5djowmni6iwNyHNnT8PA2A3bEkUA6aoBLPMe0wctI2e6+A6p
   Cg2S/XXsOL1oIU+iQkiTLNz9fjzbf1M+YeN29OE594Jiyl75DdUqBUbbu
   Dys7BhhJ31DWLT/J7hipACgc710fuOq8Zxin7AAuMDlNwrn14R1EXH13b
   Q==;
X-CSE-ConnectionGUID: mgtTDh4LRTuhby5AD4KOhA==
X-CSE-MsgGUID: 8TZBKjkJR3yZQNnMSHIqrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76796059"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76796059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 02:54:19 -0700
X-CSE-ConnectionGUID: ALl+w+naQVO2Z/mxaNcJVw==
X-CSE-MsgGUID: zUJ3QmnTQLKV06UGjjc2KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="226599663"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 Apr 2026 02:54:17 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBV2d-00000000B2x-2k2Y;
	Sat, 11 Apr 2026 09:54:15 +0000
Date: Sat, 11 Apr 2026 11:53:32 +0200
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/kvm/kvm-intel.o: warning: objtool:
 __vmx_vcpu_run+0x1df: return with modified stack frame
Message-ID: <202604111141.RFAN43pa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-VMX-remove-regs-argument-of-__vmx_vcpu_run/20260411-113309
head:   635b58b9e7d3bc07ce5ff8110a7640fa73f72ee6
commit: 635b58b9e7d3bc07ce5ff8110a7640fa73f72ee6 KVM: VMX: replace vmx_spec_ctrl_restore_host with RESTORE_HOST_SPEC_CTRL_BODY
date:   6 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260411/202604111141.RFAN43pa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111141.RFAN43pa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111141.RFAN43pa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/kvm-intel.o: warning: objtool: __vmx_vcpu_run+0x1df: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
