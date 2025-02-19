Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9401ADC86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739995126; cv=none; b=U8Gh1JeZldRZYK8qb3fkHLBNGMhCLWlBanXW2/1B7VE0dKrD4deFTDgRKDvgtNRKRCDqwgpnur6s1oNLYIsnRlxXnYE92aRpT3BTyHquV0nYtY/gH+jkBnWnMqKmKkrr2peHQMfMy8Uv6TBeXzmWYyCILQgYwsda8/OlF3ZZh+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739995126; c=relaxed/simple;
	bh=EhSm9gHvj21/UIyPf7LusD7QLkNVeUr1q82CCNDE6j0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q1Bp/JOGWdpgcMUKtzF+KSPwa9QnuwYqG0+UtEgff1b/b7R579S7e2Dy+D3RKZzI/zY1JP5uAWh0TaKUNrt3r15TgwEWVhRXLvArgmEtadc9gZG+KEETZfHElzJlk7LhYP7CoB+4hsjIkDUvT+Xf3+4jRB5TGgmk89fU4sTzmjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPiB2gPd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPiB2gPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739995125; x=1771531125;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EhSm9gHvj21/UIyPf7LusD7QLkNVeUr1q82CCNDE6j0=;
  b=dPiB2gPdCHyB2GJXoPDca1289aIbenW3UhUkes/k3hRzRJSjAwF+gE9n
   iZ94asorjPJo440cKdsLtPME+i9+K8mNHgBDkv5TQP43zj0UYGzYVlEy0
   Rxa1WbpvCoTqWLTmTwLFlv4GwUwsbtjjGLg3b5TEpmW+oyHiwOuSZkr4y
   VP8wx/W2h7e69YpOWVCaP36pS7r7F5PoxFd/BIprEaQRNUo2BcDJGd5wC
   XeXc0Hnv4GomC7HfdEwP8PGHu9IkTt5VFQ0yPPSTP9Rny+1RrRatVZ1i4
   6ygExLiVheTwgtDqtrBok88VoYNpjF8trZfEeeDbBmZ3bTPoaEqYpZcFI
   A==;
X-CSE-ConnectionGUID: 01p/reN+TTmSfZ3geFIpQw==
X-CSE-MsgGUID: 0zFzHkqTQmO3cpSarqdL1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40618372"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="40618372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 11:58:43 -0800
X-CSE-ConnectionGUID: RUvggAxYTOmCDatnFL7aJw==
X-CSE-MsgGUID: lgVQKYgxRF+q7SlhQdPJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152020121"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2025 11:32:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkpoM-0003N5-0R
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 19:32:46 +0000
Date: Thu, 20 Feb 2025 03:32:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] drivers/gnss/mtk.o: warning: objtool: missing
 symbol for section .init.text
Message-ID: <202502200310.30H6CDVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Loys,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: d4584bbfcf2a8f5b6605be9eba465bba59ce68c8 [1/1] gnss: add driver for mediatek receivers
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250220/202502200310.30H6CDVb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200310.30H6CDVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200310.30H6CDVb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gnss/mtk.o: warning: objtool: missing symbol for section .init.text

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOSF_MBI
   Depends on [n]: PCI [=n]
   Selected by [m]:
   - SND_SST_ATOM_HIFI2_PLATFORM_ACPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_SST_TOPLEVEL [=y] && X86 [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for PCI_LOCKLESS_CONFIG
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for PCI_LOCKLESS_CONFIG
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
