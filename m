Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206C0802
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 01:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740362060; cv=none; b=doh8Df2PRkn8qJPGTfHoJ18UrMLxcwubQTfXE1YEjFVaTsyybF1/IP3D0YIBkAB0Y99ara3SMDwFaqFs6DaBzVUMOX8URMaPF5DYqIf0wQ5Pvy6Lo9dGf+n8OtFjbrimvgvQyzDn6hgwWEsb579KEUpzn+nYHGx8h75LWYlATHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740362060; c=relaxed/simple;
	bh=4z78s7yfM+VsfcW4o1xl0pqvWYtQOUkjszN/4Xlk2qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvpeeOktTJdDT6dv9oF+YEHQeTw3A6a/o0at/tu16Uitm2eP5LoByS0kb556tFigXe8Y5RzKnn1WQy8WIqY78hwURjzN35a7ZagQ8DzQvzE5K9JNlqERxRwl0UCgyX8BVqYFgKZ20m4GlUjFkL/EaKa3jY/jrmLxaPOahe3yqmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBFp+GHi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBFp+GHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740362059; x=1771898059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4z78s7yfM+VsfcW4o1xl0pqvWYtQOUkjszN/4Xlk2qw=;
  b=CBFp+GHivuTGia31vm8cyCXYnGf+MHMmeRaswD6nZO54G8MWbzdTvTqU
   QEZoP1MXcjxiJemlRvlIxNx5Rtjps9eQ0Fd2MChbDc1pb5hIePenqpeD4
   6UlIMpChxxXfq1gYPbPhd6JT3ZyPfYS7GZlymAxhVJEw7QaVnRgrH0iIX
   OChaFJk8J4XAWIhm3yM230YwGhng/BOO3tbUn9CfTgo9biMie6aD/srhA
   WorsAD9Cy31+FTg5S5o4QCZg/bvloBC2XPaAMttvdNtePu61PmrSLfzRW
   Srf9Lp7T/Mt8LXjYAqLvMnnHtY/6X+wWsERmzgaQhpcv0DFBBaLM5vP50
   g==;
X-CSE-ConnectionGUID: yjNSj2oNRsiuniWzxy0AsA==
X-CSE-MsgGUID: URhpYq54QM6iKVCj8aLxkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="63574188"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63574188"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 17:54:19 -0800
X-CSE-ConnectionGUID: Vtb/z15cRdmjBkh9/T9VbQ==
X-CSE-MsgGUID: 1VGH8pFhQbGuADa1EltwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115729215"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2025 17:54:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmNfj-0007jj-1H;
	Mon, 24 Feb 2025 01:54:15 +0000
Date: Mon, 24 Feb 2025 09:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 'sifive_errata_patch_func.______f'; recompile with -fPIC
Message-ID: <202502240916.8dheDMgU-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d082ecbc71e9e0bf49883ee4afd435a77a5101b6
commit: f79dc03fe68c79d388908182e68d702f7f1786bc kconfig: refactor choice value calculation
date:   7 months ago
config: riscv-randconfig-r121-20250223 (https://download.01.org/0day-ci/archive/20250224/202502240916.8dheDMgU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250224/202502240916.8dheDMgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502240916.8dheDMgU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'sifive_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'sifive_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:99 (arch/riscv/errata/sifive/errata.c:99)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'sifive_errata_patch_func.______f.3'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:99 (arch/riscv/errata/sifive/errata.c:99)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'sifive_errata_patch_func.______f.3'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:99 (arch/riscv/errata/sifive/errata.c:99)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
