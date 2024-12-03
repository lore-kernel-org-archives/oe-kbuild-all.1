Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48264BA42
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 01:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733187784; cv=none; b=gPGy57G3UVnSf37lIksRWWUNqgHyW7+15PzkxQp7T0ULEFtl3Odfo1XElQdA6m0SSC2kB59NevdvV60p0/4m+gJ7NAHjQwGm4rAAZpow3sMyVwgaOIeDuo/KZ+GcBjoo/NdK0x2ocgNWNn42aTPykNtTjWXjDED2DuJpDaCFlC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733187784; c=relaxed/simple;
	bh=jH0Azjg6JCYU7wW/7G8uHSRkQrXQ2/UwpQ3jpxkeHwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7dN8Nl2DWuGgN8X3wGSbNPlLwrkR4l3YXWRwKW7rQcPb65U8J9GCvzeL2qdEDA1XqvLN7v4hHAVe+VKn599wgsjN52MLpqWITmLefFCIJU1nNm8D9+ZgdacF6T4CLNPU8U9aFGMhLcDJ6hLH5081rmMUNec+3p616m1O+WJ9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eblde7Jq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eblde7Jq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733187782; x=1764723782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jH0Azjg6JCYU7wW/7G8uHSRkQrXQ2/UwpQ3jpxkeHwQ=;
  b=eblde7JqHv3XjvzzC46ZWnCkDW3LTIb/pXr/sDWsZb5PbHjucd17kntD
   o+SK9lBDWu4f51CllqHefh+h/xZCU6F8W3Vbjou0RMsczjwClWQL58ykP
   LnYHwWXOtR9+By6FWPDhAF5svBaGxcG2ZN3O/BkUKYaR3MOl4ZyyoFvTa
   C9qzKiMGSTZQwJauF4D0tYOe3ix0rx42xFKJDHdSFFSFk6oLalsQYOkQ0
   j6T/ikFT79K/rITp4kTr6OyjalWB2H8LNdQF5wgk0GPYmlX/+IUXVnwP6
   UF6YbONqUul16qv5zQm2zWL3F48S5F6buOuhPescBy0D66Q1vguMZVqsF
   Q==;
X-CSE-ConnectionGUID: cK7RaRkVQzOlAMZ1Wpbuiw==
X-CSE-MsgGUID: nJa73MyPQ6umrokuuI1E9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33512475"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33512475"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:02:59 -0800
X-CSE-ConnectionGUID: GhibhPDeRLaQBP86Mx09qg==
X-CSE-MsgGUID: a8WqvuhtQy+Sa5PDrAbcBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93599356"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2024 17:02:52 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHJR-000367-1J;
	Tue, 03 Dec 2024 01:02:49 +0000
Date: Tue, 3 Dec 2024 09:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: =?unknown-8bit?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [avpatel:riscv_sbi_sse_v1 37/37] arch/riscv/kernel/asm-offsets.c:
 asm/stacktrace.h is included more than once.
Message-ID: <202412030854.Rk1atgpF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v1
head:   bf7506e7bec204376453e68c7d7c3ab7ff37dcaf
commit: bf7506e7bec204376453e68c7d7c3ab7ff37dcaf [37/37] riscv: add support for SBI Supervisor Software Events extension
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030854.Rk1atgpF-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/asm-offsets.c: asm/stacktrace.h is included more than once.

vim +18 arch/riscv/kernel/asm-offsets.c

  > 18	#include <asm/stacktrace.h>
    19	#include <asm/sbi.h>
    20	#include <asm/sse.h>
    21	#include <asm/suspend.h>
  > 22	#include <asm/stacktrace.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
