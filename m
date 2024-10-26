Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D6D2AE90
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 20:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729976007; cv=none; b=tJ5xqfLTKc9balkcs2p7WtY5SDGX6FwDtn0ZIIGbUshs4YrKeZdDVzNhlgcBUwEOtPKD138kUXKotCWzAvp79oYyb5KyqwadfbKiP9bjenfQgP/+J6ZZDKtAi+iiE2EUqfRzHjGMuSp9TMdkR0i6sLu2FDlU7LMK7uZhIm41Hdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729976007; c=relaxed/simple;
	bh=st1EeDi1igrL0sqTna2CIMPP8HS5A4Qk/jNOVZgWvG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtCl8Tldl7itwtoYMJZfh47SAsAK4Xo/Xqg6BoxsGebTTMXsmLkt71w+OP+dZ5DLcpx9bgDf3oTGmAitg0U2otuWWabThgKZl9Q7yAEKpTQd4h2NbUvkuELDXHbxak0ttsgMSuk24ugIzAw7YEC5fTHqLnlZnrjNA7phGTdwr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYwdJg96; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYwdJg96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729976005; x=1761512005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=st1EeDi1igrL0sqTna2CIMPP8HS5A4Qk/jNOVZgWvG8=;
  b=jYwdJg96NA28/bp4tfLYxn6taSwXCrFYqsuB1MwOx5OGz02dPdDgyKNe
   TEAGH/TlJ5a9uQMFoZ0OkipoZcvC6nu9zRmW4PpSAu4xFey483Onuo5z4
   /Yw0O4rtX2IgHovzxCc5TwEZ6wlZMnmv+1gCSotOKakiwg71rfGBsnXjz
   xDadIArw3tphvVwSs11cJ4OM8bfzapyXuhPFfqhW16g+iYA6jSptILyZD
   YGYdiy9xFwXf6h1bsQVGQsnjxgAMaesTajMpbJ7D9JiP+rX8502+N2Tut
   p+zQL2xkY9WasCWBNucCPT+yDVuVIhCfBH3iOC7AIte7WzKE/g/McKnPe
   A==;
X-CSE-ConnectionGUID: fS+ef5UpQ22BjLuU595NdA==
X-CSE-MsgGUID: QUOFmr3wQBSrFGlEu8G9cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="40995270"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="40995270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 13:53:24 -0700
X-CSE-ConnectionGUID: QDIe/EUoTAmY77zboeY7QA==
X-CSE-MsgGUID: TASpsMmiQqWFlD6/6hk27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="82068840"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 13:53:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4nmi-000a1w-1K;
	Sat, 26 Oct 2024 20:53:20 +0000
Date: Sun, 27 Oct 2024 04:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 701/15331] error: unknown target ABI 'ilp32'
Message-ID: <202410270424.nEC5EwVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [701/15331] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-004-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270424.nEC5EwVg-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270424.nEC5EwVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270424.nEC5EwVg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
>> error: unknown target ABI 'ilp32'
   make[3]: *** [scripts/Makefile.build:373: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.lds] Error 1 shuffle=3671098848
>> clang-16: warning: -Wl,-soname=linux-ilp32-vdso.so.1: 'linker' input unused [-Wunused-command-line-argument]
>> error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:84: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o] Error 1 shuffle=3671098848
>> error: unknown target ABI 'ilp32'
>> error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:90: arch/arm64/kernel/vdso-ilp32/sigreturn-ilp32.o] Error 1 shuffle=3671098848
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:87: arch/arm64/kernel/vdso-ilp32/note-ilp32.o] Error 1 shuffle=3671098848
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=3671098848
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3671098848
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3671098848
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
