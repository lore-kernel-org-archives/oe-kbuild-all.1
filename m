Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041EA2DC79A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786586652; cv=none; b=PHemxkbY0VQ4PTS+eMtAbXMBVNFn1dQ6Xyd9+xl1N42+yg/gRUaZ+xz+Q2njavTQmagN27dPIJ8pWp+A/w8nozD6QUB9UogLPEggiPiRhhcMBMoVp3VSOFPIb2vwLpKNKH/+mZKjGGtS8RJIJ+6L3OkegetD2yt8bi550VaVV4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786586652; c=relaxed/simple;
	bh=JLvoirZtoe4LVW05T44I9NKk38NwUT1l+A17KQXTfNk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gnnFrX8Ly5A9bCZjqkcq1w4cjTFahMvCKWH8sglaZqQSErFiMNccBYrCZDzkLw6ahaP82gS9h+Xitcv82r0qjDtFFjV+DzQkK2lcpC10YmKkh/lbTVdpOrCQZjbkpGgL0Wni0Z/bYoLogwMFhbyCAvDHNh2kXUzkXmN4Ko+hXeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLQ71wWx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLQ71wWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786586651; x=1818122651;
  h=date:from:to:cc:subject:message-id;
  bh=JLvoirZtoe4LVW05T44I9NKk38NwUT1l+A17KQXTfNk=;
  b=dLQ71wWxehFgyS25o+aKMyHTGqoZzBmupy9Y9/bPf+VU5VwhTvo3gom6
   Loc+WP4tR8Zs0cqqSwdKLZRNqE5sNlJFHaYM5DV+TUsJPKRtOE9dOifQ1
   SAl4GWBiJ8AIU8eydKv7WGNpKICqE/D/sW1hUhUvQy81wjAiOU0O/5dAQ
   lirGd/FjCpADj93Axh/nujkwGExXoaRiUPBFW6UP64vlULIpvwfp86GLp
   TNalsRI9jc/i/aYxajxDGkLXSXe8JdVFplR3pF1+4k8taXfkWu4obwTqB
   GnWRsypHDCwp4xKQDnRQdq7+4U/ja1dT+xp6OgKxT7Ao33atEQXlvKDga
   w==;
X-CSE-ConnectionGUID: Ud7PixybQTa82dRMg0rsmw==
X-CSE-MsgGUID: kgk6HcNgSQCpCF+/g5UEJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97743228"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97743228"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:04:10 -0700
X-CSE-ConnectionGUID: BxMllQYWQ2SwX3pvXy08Aw==
X-CSE-MsgGUID: dh1KC4nwQkCaAHc70o6cUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="287259678"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 19:04:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKne-00000000SSk-2nlf;
	Thu, 13 Aug 2026 02:04:06 +0000
Date: Thu, 13 Aug 2026 10:03:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 0/1]
 fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named
 'min_coredump'
Message-ID: <202608130938.1vWiRlzs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   fef9d3af7341ed75e169bb9507a10efee916fb58
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [0/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-001-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130938.1vWiRlzs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130938.1vWiRlzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130938.1vWiRlzs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/compat_binfmt_elf.c:144:
   fs/binfmt_elf.c: In function 'init_compat_elf_binfmt':
>> fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^
--
   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +2143 fs/binfmt_elf.c

  2140	
  2141	static int __init init_elf_binfmt(void)
  2142	{
> 2143		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2144		register_binfmt(&elf_format);
  2145		return 0;
  2146	}
  2147	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
