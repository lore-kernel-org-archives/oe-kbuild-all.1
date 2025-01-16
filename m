Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF191E48A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736995433; cv=none; b=NQZJ4jo6PGm3pu/3ifs/M/zhd8yJf7huqhDPA1tBdPZapnO35m7tXdJR+ti8OFuaImd168wLb0Byebk+eQOASMJw/AqcX2sdCR+sYbJZ1R4fEbIeH1t2I0ZOGR7ysZrPMDKyyjQS2Siba6GO7rD/5AvKx+R2FWHXTamOZvfvpEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736995433; c=relaxed/simple;
	bh=YO5FLAPyFo/F2H6YT30AG0WPrFiYGcjwxHGYAlTNMRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0DE8nHg+g31b47UJwM1yx76J4T5t72a+fK0WG0iKEX9ZC6145cvCyp9vR9x68bPYJIZgsahggqD+AToS/XMy6/FZE0vapbSX26omSp5tntdgyBXD/HId96r3jq98T8GnzZZ3DWD/svF01nlBFFwjMzw7sK6IXhV3BjYwZSbqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VszRyH5N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VszRyH5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736995431; x=1768531431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YO5FLAPyFo/F2H6YT30AG0WPrFiYGcjwxHGYAlTNMRg=;
  b=VszRyH5NuQDBnLzMoa4AKmzU6ncHPKV9i//WaTqO9wihHwUTOWtRP5nb
   QOc2wVkWLRAa3aM+icHwpbyrXp3LZBapnDwhVyCdUffOqJNgO5Fs1rR2V
   1BdEvn7q/xIp8Fl89n9q+nlGPrn6R4lwxwtzu+OF/PYKJGMKQVxx4xSr7
   haXgRIOvnt6hbkCpYveaNgG6sv4c4m+QP7sOpcNL1C3VqB01xgNZRvzAs
   4TnNmgJqDc2aywfnvOhN8Jk2ev69y3y1JoGQaGP3B1SPjyxeyNEskBb6k
   ns+vKewC+s8ni/cCOhbN7VWzYViSuMlw5azG2ZQeKrCrztXUrFEPFH1MB
   A==;
X-CSE-ConnectionGUID: UsuEiEEDTvKZvCUOoZKdTA==
X-CSE-MsgGUID: YTo7EhB3Q/mCvq0DpiSMEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="59836511"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="59836511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 18:42:26 -0800
X-CSE-ConnectionGUID: pW8e6GYqRxuzDOH5waClkQ==
X-CSE-MsgGUID: /GvSJrn6QC2MftGKFZX+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106205477"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jan 2025 18:42:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYFpu-000RAN-1q;
	Thu, 16 Jan 2025 02:42:22 +0000
Date: Thu, 16 Jan 2025 10:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 413/413] WARNING:
 vmlinux.o(__ex_table+0x1230): Section mismatch in reference from the
 (unknown reference) (unknown) to the function
 .irqentry.text:smp_spurious_interrupt()
Message-ID: <202501161054.8civpP18-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   9e34736090b5b2efb9a6c4308dff8c03668842a5
commit: 4aa8948673dc395262301386aecda9f9b11af8f0 [413/413] x86/apic: Always explicitly disarm TSC-deadline timer
config: x86_64-buildonly-randconfig-006-20250116 (https://download.01.org/0day-ci/archive/20250116/202501161054.8civpP18-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501161054.8civpP18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501161054.8civpP18-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> WARNING: vmlinux.o(__ex_table+0x1230): Section mismatch in reference from the (unknown reference) (unknown) to the function .irqentry.text:smp_spurious_interrupt()
   The relocation at __ex_table+0x1230 references
   section ".irqentry.text" which is not in the list of
   authorized sections.  If you're adding a new section
   and/or if this reference is valid, add ".irqentry.text" to the
   list of authorized sections to jump to on fault.
   This can be achieved by adding ".irqentry.text" to 
   OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.
   WARNING: vmlinux.o(__ex_table+0x1234): Section mismatch in reference from the (unknown reference) (unknown) to the function .irqentry.text:smp_spurious_interrupt()
   The relocation at __ex_table+0x1234 references
   section ".irqentry.text" which is not in the list of
   authorized sections.  If you're adding a new section
   and/or if this reference is valid, add ".irqentry.text" to the
   list of authorized sections to jump to on fault.
   This can be achieved by adding ".irqentry.text" to 
   OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
