Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15824FC8C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418976; cv=none; b=qp98qtGTeNf81opQPLt+zWHIQc4VP1/rW0vaCHNmTJfmdQ9NaCx+WrnqJ0PbaL1YA5NCHlOoyraZdefQandODQ7gWrHygvQQpHFqAgaJv6nyXnsZZ3WudMIQX2aBW1OfHOZoPJ4echud2F0Zm/6Y43KMa+Eq+drRXzO48W1UOrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418976; c=relaxed/simple;
	bh=1r5oCVKpops7PN6G6nl7KctpJflsftS4G/OlCoB5mGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NaEUm/D9qQPy9BTqGA/ZtFWgUOD9hymFITDm2fhtbl7fYRaL2CzvMpyzvABzcJXKH5EDvXZD9QHqpidETDu7hzgzUWT1ifBQb19Pkcytah8GRCfUs4tVVgLRRSG9vzI7SMJUPUbB7VeXY+qgYclisfn6R//VUMH2AJqECU3Icbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egSUdSfT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egSUdSfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792418975; x=1823954975;
  h=date:from:to:cc:subject:message-id;
  bh=1r5oCVKpops7PN6G6nl7KctpJflsftS4G/OlCoB5mGg=;
  b=egSUdSfTcMTmH0GfC5wmM/xKjN5gCp7PlawG9O+/lGq6gpGMMlioaBp+
   zpH0t5ROdVynwfS7qCWi6kJbHK1W1MnlJpWHuzaxy1CtXtR15hCN14wtH
   CfP8PpGfNpxCiXFOeToaXxEJQqabP+qUvHjVdO2iVWUg3riST0xXFD8Ac
   UUmoagfvBkWCrcseyjODjMsRBslCjb7o5gIzBiWgx4e3TKvcSUeSagEFd
   IkdfrFps/+SGBT+y2P4Bijze51Eh40xahWQCXdIZ9zcAwWkkxWvcJi51X
   6D/J+r3Gm5a4c6FTz4Mhx4axga2OnnhpwKjFvCrbEubfTLZLRAOYTjOek
   Q==;
X-CSE-ConnectionGUID: AnUNPf4RTLuODwfSsjcaDA==
X-CSE-MsgGUID: oXIhJA/KQ5aoDxV9p0fg2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1206571"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1206571"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 07:09:35 -0700
X-CSE-ConnectionGUID: eUpIAXDlQ++/Bzx5EfuPeA==
X-CSE-MsgGUID: +c3WnANsRfCrHo9gpV2aFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2643794"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Oct 2026 07:09:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIo3O-000000005e3-32Io;
	Mon, 19 Oct 2026 14:09:30 +0000
Date: Mon, 19 Oct 2026 16:09:00 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Salter <msalter@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Justin M. Forbes" <jforbes@fedoraproject.org>,
 Jeremy Cline <jeremycline@linux.microsoft.com>
Subject: [snitzer:kernel-7.3/snitzer-nfs-fixes-canary 5821/7369]
 arch/arm64/kernel/setup.c:220 init_secureboot_mode() warn: unsigned 'chosen'
 is never less than zero.
Message-ID: <202610191657.xSS2rjdB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/snitzer-nfs-fixes-canary
head:   c0c4fcd143f7ac71dcea2f5b67325fcca37563de
commit: 10f592edc6b4ce30ca4b2edd412198afdd2b6cd6 [5821/7369] arm64: add early lockdown for secure boot
config: arm64-randconfig-r2202-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191657.xSS2rjdB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191657.xSS2rjdB-lkp@intel.com/

smatch warnings:
arch/arm64/kernel/setup.c:220 init_secureboot_mode() warn: unsigned 'chosen' is never less than zero.

vim +/chosen +220 arch/arm64/kernel/setup.c

   211	
   212	static void __init init_secureboot_mode(void)
   213	{
   214		void *fdt = initial_boot_params;
   215		u64 chosen;
   216		const __be32 *prop;
   217		int len;
   218	
   219		chosen = fdt_path_offset(fdt, "/chosen");
 > 220		if (chosen < 0)
   221			return;
   222	
   223		prop = fdt_getprop(fdt, chosen, "secure-boot-mode", &len);
   224		if (!prop || len != sizeof(u32))
   225			return;
   226	
   227		efi_set_secure_boot((enum efi_secureboot_mode)fdt32_to_cpu(*prop));
   228	}
   229	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
