Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1344207F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777938; cv=none; b=BoOnALcqlao7vlDJgJoq0rbP7hGGIQlWClsBSUjWd5X9/MFBRMA/gnry4YzVxzKGT6lrdk4xgIGYX3tibKvJGK2D6YyWbhkQpn+VfQcfZv9AnLUHIqzEoNbwxzNOChJNsGk6y+paPwQa1mi8TIc2SetScmuLMqVdWPmNmbMCZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777938; c=relaxed/simple;
	bh=R8IjUW/kA5mbXFySflN9AaRt4k54Jgkwkl4MfnHr0VE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ws9fsgUYiMTQND7w2bG11BAPQNJ5IUs9WVplZijo6xtlyabhaI5KT4TkVVED4N8oyRtCgzvK5xgbhok9VFWWH60qOM8VHquzIMpAeHTJhiq1v9TcHislmx04YxfzMjM2/r0hzO09DUfo+n8DXm6fnvA45bcJRI2sS9x0B1ra2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeqT6r/0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeqT6r/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777936; x=1773313936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8IjUW/kA5mbXFySflN9AaRt4k54Jgkwkl4MfnHr0VE=;
  b=jeqT6r/0KL8MeteG+5LBYQ6Y3fv6SvguO1lDN1PGPV0E6dWCisZeMQ4Q
   kBo0ZujkGYKITqAy2jG9FwE39ttWqQn8uNoa3C7bFA+jZ3JqczWrVkFK7
   4z9p79yp9xTirFUYfK5Bt1WOhVweADqKJ/6oJd4hE/YbgNOKtgS1ihYCL
   5trvKyRdyta0ScjzAoLH9N1L9k/7uwQV7E/Hq9MjNg3iK3aBlwhxcrVfg
   r2BzWkpQxLSssdQLC6H+7mpeh2OO9lbQIcrGodJw8ZHR0KLi8fkdSpppP
   gFf2stNcXiXrZfuzoeCILPXbnp6IXddXEDIXjlyMGG6yB+NC7Ifm0XDO3
   A==;
X-CSE-ConnectionGUID: SLDc2Uh/RaqkbP6ZKSaM2Q==
X-CSE-MsgGUID: tSJOj91gQ3y1wkTxTwP4HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30432934"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="30432934"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:12:15 -0700
X-CSE-ConnectionGUID: 5sF3/R8tSGG+gMWghL0haA==
X-CSE-MsgGUID: MASVcJHES02H7XRhHvjuBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120632836"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Mar 2025 04:12:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsK0S-0008QI-1J;
	Wed, 12 Mar 2025 11:12:12 +0000
Date: Wed, 12 Mar 2025 19:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-02 1/1] ld.lld: warning:
 vmlinux.o.lto.vmlinux.a(privcmd.o at 1788478).o:(.discard.ignore_alts+0x0):
 has non-ABS relocation R_386_PC32 against symbol ''
Message-ID: <202503121928.1aPe79oD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-02
head:   6e2d50b6dcaa791d469102a137f5c06b0f40c28b
commit: 3216484550610470013b7ce1c9ed272da0a74589 [1/1] kbuild: use obj-y instead extra-y for objects placed at the head
config: i386-randconfig-r064-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121928.1aPe79oD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121928.1aPe79oD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121928.1aPe79oD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: vmlinux.o.lto.vmlinux.a(privcmd.o at 1788478).o:(.discard.ignore_alts+0x0): has non-ABS relocation R_386_PC32 against symbol ''
   ld.lld: warning: vmlinux.o.lto.vmlinux.a(privcmd.o at 1788478).o:(.discard.ignore_alts+0x4): has non-ABS relocation R_386_PC32 against symbol ''
   ld.lld: warning: vmlinux.o.lto.vmlinux.a(privcmd.o at 1788478).o:(.discard.ignore_alts+0x8): has non-ABS relocation R_386_PC32 against symbol ''
   ld.lld: warning: vmlinux.o.lto.vmlinux.a(privcmd.o at 1788478).o:(.discard.ignore_alts+0xc): has non-ABS relocation R_386_PC32 against symbol ''

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
