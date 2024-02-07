Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A161CD21
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 06:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707287265; cv=none; b=k5HTmH8v6E/uGvAMrkfopE9XoEXkp/v5hQ5+xB/NZ6aLbVcaSriPF+L9gMHQWmJZmErD8V5FS8uI1sneJucorRKhx0rVnS3N8bw74XldmIcX7AuYIha8pUVYAjPZA7gdGB1lJhsjW4hwCs2swHe5+oqxG5BnPrsNxv4svGzJ4f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707287265; c=relaxed/simple;
	bh=EQhVKF6lrs3BMJaecpK0G50o7Xaea/k7paQd439LTzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SN2I4LUiZxPBvvM5t1ee1oprDt3O2ZgrFKH9PtI6V7Dltu12UF97KA5PdSO2duLcSJ1zlrY0iM7oTn07N6fo7k6drW1vYUsj+mgGfpw8bAUFGHbIxPObkcTKwr205pvtm+LWVGwMs2ghvxMFY+6aqdqPmUf6eUMBMMK/DQsbLbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqIQxVBO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqIQxVBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707287264; x=1738823264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EQhVKF6lrs3BMJaecpK0G50o7Xaea/k7paQd439LTzw=;
  b=MqIQxVBOk0DqhYY8PSJIeL+0b8tMLxRCMkPanG0N4J1Pg9A60K5T09Ze
   XUDj3d3GrDzP7Del8uqD/O7ywroDIOe8QHm0q424Ll0IvoTmpqu5krk6q
   ygIZgtAS0rK1NVabjoUzn/YrFwOBZZdEaSRCjMxlCoRjKulft/BVz4xes
   FO8HL174EGpkZC3nx+Taku56Y7pBfUNm+ojwvRgR3/3Xl+LvF/dOHx1s1
   Yp9pH+TqYAeHGRpJzymgOy+/qKLaKP/ZoGZ4XldGIU+KAx7Z4mxgcvSbO
   55y/mOCAM+Wjbp0uQNDcgqfMav9xl4d8gqMYyU6nm3fzW7lTDq8/kRaDw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1196232"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1196232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 22:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="32064816"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Feb 2024 22:27:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXbPG-0002Gu-1N;
	Wed, 07 Feb 2024 06:27:38 +0000
Date: Wed, 7 Feb 2024 14:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_on_each_match_symbol: .text+0x97c): relocation R_RISCV_PCREL_HI20
 out of range: -524417 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202402071416.ejGGvihf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99bd3cb0d12e85d5114425353552121ec8f93adc
commit: 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998 kallsyms: Add helper kallsyms_on_each_match_symbol()
date:   1 year, 3 months ago
config: riscv-randconfig-r064-20240120 (https://download.01.org/0day-ci/archive/20240207/202402071416.ejGGvihf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071416.ejGGvihf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071416.ejGGvihf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x97c): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x988): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x990): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x16c): relocation R_RISCV_PCREL_HI20 out of range: -524416 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x19c): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x1a4): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x1ac): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x1b4): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x1c8): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
