Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FBC2E3712
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754192055; cv=none; b=T/F/3SmaDUubE064tMU+VA2tyebuQAWZeMvzlCdm1Q9kRoZuTrccmMAZZJCNE0sRvXIW2IlwLNph9kAUhfoRyiVbCw3If954p/DOMWmivHVFN67Qc0qypOm4l0VT4X1dGP3bJ3SAS7ScNEZBL1eO1oeygJQ27pdnXj1sbGqefmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754192055; c=relaxed/simple;
	bh=myBujQ6RyNOveXhDIHycijF8JJ2kT1MbnKEtBWbl0mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Utj5SUqnQ5cZyt/ynBqNaZTET0PY4ncDjl4LErGEmbc/V56wuKO66KgaDNh2kyEUUScsj40q+86ab5Lq6cGUnVBfPmPvMdkf1bl62GI4B5EzBIxz8AoLJ3j4ahCEW9ZORoq3uiR+H8fIekQczcz1OXjPxy76heM/kSthjF8O5p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkMUWoYx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkMUWoYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754192054; x=1785728054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myBujQ6RyNOveXhDIHycijF8JJ2kT1MbnKEtBWbl0mc=;
  b=UkMUWoYxyScSDZcssRBqig7I2eHhRpTF7oaCZr7419SiQVtrgyXtTzeK
   YwSnVPN5EOcRrHC9NeATBiL/RNy7QUvywyM5b9Kt6MYy3n2yNCQoQAQJV
   VFfb4/B30nuAD4StZ4WAltRI+IydxbuylAzBlLENnMPsO3mQ5/bfMkOja
   Llqu0UYbMD/R/ghw8RcGtLYwpbi+HIGYiNGvLkP9vPVSbUPzXC/egRXMY
   I8ayb7JurVgNdzSOWqjd1XMZM4hlkO3Xt5C9m1YkNn8oKLiOzHe7FUQKD
   ggAQWo0fpmPuEt5Z5xZ+aH2twuXrdYWmZPUAULvO21JNLTUObWv+y4r6H
   Q==;
X-CSE-ConnectionGUID: RxRh2kr4Qy2dHpXfGCiorg==
X-CSE-MsgGUID: rmtzoFPDQx62OviLJ2JabQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56628821"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56628821"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 20:34:14 -0700
X-CSE-ConnectionGUID: lrnV8UWHSrK3YINnm/MUlg==
X-CSE-MsgGUID: /JQ0GuJgTO60U+ufAzda/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163150242"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2025 20:34:12 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiPU9-0005lE-2n;
	Sun, 03 Aug 2025 03:34:09 +0000
Date: Sun, 3 Aug 2025 11:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2630/2630] binfmt_elf32.c:(.text+0x1334):
 relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
 `arch_elf_adjust_prot'
Message-ID: <202508031133.IOru9Jwx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e5f0407c7ee0aba1c7b2ab0f516e9dfb707a0ee2
commit: 7de3ab4c3dd938fae3626a6344830b018eb7ba4f [2630/2630] arm64: introduce binfmt_elf32.c
config: arm64-randconfig-r112-20250803 (https://download.01.org/0day-ci/archive/20250803/202508031133.IOru9Jwx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250803/202508031133.IOru9Jwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031133.IOru9Jwx-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_interp':
   binfmt_elf32.c:(.text+0x1334): undefined reference to `arch_elf_adjust_prot'
>> binfmt_elf32.c:(.text+0x1334): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `arch_elf_adjust_prot'
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_binary':
   binfmt_elf32.c:(.text+0x3918): undefined reference to `arch_elf_adjust_prot'
   binfmt_elf32.c:(.text+0x3918): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `arch_elf_adjust_prot'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
