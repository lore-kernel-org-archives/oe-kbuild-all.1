Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFB837FF70
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379995; cv=none; b=i6RYpHjlPNm37TYeoohnEkvNfCbNaCpkYwo+wv+cTcMIV9kg4cM8bWeeXOi1jDIE5k3KhBw/7RqjzcqKmQ14YJKDF1OivbIH20dquPQg4tnId6EfclCaA9JCygYQCA1/QgtqwZtdM003caRf7jGXpDoIf7iFoLy7WjoOAgqXxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379995; c=relaxed/simple;
	bh=FpbGobcUnn9BvrhoRngQbgrWv8+ZNcmz4Jg3YXrezBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgTbBQH84HGCfofspIo+krrVV1fzc0KzAkBqtbNJAr+M1DOhmbBLVawi5JZHxaYM+e8CqAN8/TSBDeHlP5Ml7xgzG01h0anu/uFn+gC578x2KfQ3h4CuKlHwknMsdQE8yra5AMuK+tmPgzn0DsjxUUkz1CAtYzyyqYAVCtyUsVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+LmSw/O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+LmSw/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379980; x=1799915980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FpbGobcUnn9BvrhoRngQbgrWv8+ZNcmz4Jg3YXrezBk=;
  b=U+LmSw/O12DgnJnHfUWrekvJyGqDkffucsjabviEudF91qu1nQ3yMnqG
   /NPVUjWMnEdAz4Sof+iWi7y96q87I02eXkfAeTbeiboqDuFDTrVC2EOW0
   cd1/PUONfAySoyfsRKCpxtINMJcxh4gIik52NQaeULirzr5EVenUrJ+T9
   243Duupo3ueUoCusQ2M9RpM/NxiwSAJtGSCuzCA+n5RS5s0e3ai4bKRp2
   l8tv8Y0i713Fcnuu5vNcf2E3LqjFJcRRiEgAdeFMKdSXMf+Ws6IS7oDpN
   7JPOiWwmphIiS3qi+xI2iU3yafbyFX++xksVkTkNEOD2GnQRpYacbYXUF
   A==;
X-CSE-ConnectionGUID: 8fzAwBo4QtG5TaTPgv8Q/Q==
X-CSE-MsgGUID: 5skBAfdTRs26TNPABJ+nUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80394579"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="80394579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:39:28 -0800
X-CSE-ConnectionGUID: d7i21hmySbO6IqYbAmb+Lw==
X-CSE-MsgGUID: I70zfkCESle5ChLBYCnRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209079255"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 00:39:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfwPU-00000000G5I-1s7m;
	Wed, 14 Jan 2026 08:39:24 +0000
Date: Wed, 14 Jan 2026 16:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: junan <junan76@163.com>, catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, junan76@163.com
Subject: Re: [PATCH] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
Message-ID: <202601141630.sCPCgSYw-lkp@intel.com>
References: <20260114013859.498148-2-junan76@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114013859.498148-2-junan76@163.com>

Hi junan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/junan/arm64-kconfig-Make-STRICT_KERNEL_RWX-visable/20260114-094935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260114013859.498148-2-junan76%40163.com
patch subject: [PATCH] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260114/202601141630.sCPCgSYw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141630.sCPCgSYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141630.sCPCgSYw-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: arch/arm64/mm/mmu.o: in function `map_entry_trampoline':
>> mmu.c:(.init.text+0x578): undefined reference to `rodata_enabled'
   aarch64-linux-ld: arch/arm64/mm/mmu.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `rodata_enabled' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> mmu.c:(.init.text+0x578): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: mmu.c:(.init.text+0x584): undefined reference to `rodata_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
