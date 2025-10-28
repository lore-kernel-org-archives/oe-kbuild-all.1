Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B2433B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 22:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761692333; cv=none; b=oPjHENQ6BXHqChjWzEO++BLbtey7Lztff8YFEST5YM2jIpMkOowK5WJV73xkuI7XQOH8EZGv/dXKZiN755UbTgkFnLnjCTd6bnZhZHYmr0Vd1BUEaJg4QJq+gXysvUU+CswAV/Ay40xcxSVTei0ZbGSqJt/E5UBoG4E4wpsmZG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761692333; c=relaxed/simple;
	bh=hxiq53g843jW8vywhThUlpcuCrEn3RUq8GUgHmHcUuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tw9tSptaPB2ZKR7H3N6os1/q53JLew070HpSQXcwr+0nl3G6GUBqj0SwfJpj58+rH/3JGU3L6WtH+GphA5BeZWrNygcNn9XjVOU95Gi4sBTzPewBPM68oCdbw8BdTsQ6ehBvz1BUnfWFSv4pluwH8rfKCBFhenVXfd8AESrP1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2apc9/z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2apc9/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761692331; x=1793228331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hxiq53g843jW8vywhThUlpcuCrEn3RUq8GUgHmHcUuM=;
  b=i2apc9/z/QUxqSqnX7fR1VFB81Q85zupyESBlJm3wROxecDWQxNKlW4R
   Tn08JTw1CgSDdthvPzbFXQSwbC6/fZneNqhUJIgcAhW8wdOgYT18C/4Qz
   ApHEu5Kc15UPXX1R2FYKjCse68Ug0qkN3s0Z6E0ruIKeR0Xb3kIrT2L6K
   PJpdURn1Iw2JFLv5KZkTYDvc4bytPhtlRmzZ+MnO8dTVhCpi/i2IMbdxV
   eZvDHj7GJUKWL6m93gSAxKly3V70HCd5VW2ucqTiItP/BmffkGvuTgUpA
   OYmA5rKgLn8rLZYFjXI2mB0R2+oybmeynqO9JTtBHzm+zdh80fKcM+gDP
   w==;
X-CSE-ConnectionGUID: dho02vX9QHalAv7dUwQwGg==
X-CSE-MsgGUID: 3nB6Ve6DRcyx9n9mtUFrKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63691106"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63691106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 15:58:51 -0700
X-CSE-ConnectionGUID: xQhfMh4GRDeA6gTSjQ/c9w==
X-CSE-MsgGUID: y66lPoArTXOc5Cyg/w8jOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185371457"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2025 15:58:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDsdh-000JqX-2K;
	Tue, 28 Oct 2025 22:58:27 +0000
Date: Wed, 29 Oct 2025 06:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 41/57]
 include/linux/riscv_sbi_sse.h:44:16: error: implicit declaration of function
 'ERR_PTR'
Message-ID: <202510290600.Iqaad5xV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   3f71314c58520f6fada72d7f0364429fc3e8bf50
commit: 9b88b132cc8aab2bb34e7e8dad4187c526e60d1e [41/57] riscv: Introduce HEST SSE notification handlers
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251029/202510290600.Iqaad5xV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290600.Iqaad5xV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290600.Iqaad5xV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
   include/linux/riscv_sbi_sse.h: In function 'sse_event_register':
>> include/linux/riscv_sbi_sse.h:44:16: error: implicit declaration of function 'ERR_PTR' [-Wimplicit-function-declaration]
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~
>> include/linux/riscv_sbi_sse.h:44:25: error: 'EOPNOTSUPP' undeclared (first use in this function)
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                         ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h:44:25: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/riscv_sbi_sse.h: In function 'sse_event_set_target_cpu':
   include/linux/riscv_sbi_sse.h:52:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      52 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h: In function 'sse_register_ghes':
   include/linux/riscv_sbi_sse.h:58:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      58 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h: In function 'sse_unregister_ghes':
   include/linux/riscv_sbi_sse.h:63:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      63 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h: In function 'sse_event_enable':
   include/linux/riscv_sbi_sse.h:68:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      68 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   In file included from include/linux/cleanup.h:6,
                    from include/linux/jump_label.h:78,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from drivers/acpi/apei/ghes.c:21:
   include/linux/err.h: At top level:
>> include/linux/err.h:39:35: error: conflicting types for 'ERR_PTR'; have 'void *(long int)'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                   ^~~~~~~
   include/linux/riscv_sbi_sse.h:44:16: note: previous implicit declaration of 'ERR_PTR' with type 'int()'
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~


vim +/ERR_PTR +44 include/linux/riscv_sbi_sse.h

3e89594245fa2c Clément Léger 2025-09-08  38  
3e89594245fa2c Clément Léger 2025-09-08  39  #else
3e89594245fa2c Clément Léger 2025-09-08  40  static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
3e89594245fa2c Clément Léger 2025-09-08  41  						   sse_event_handler_fn *handler,
3e89594245fa2c Clément Léger 2025-09-08  42  						   void *arg)
3e89594245fa2c Clément Léger 2025-09-08  43  {
3e89594245fa2c Clément Léger 2025-09-08 @44  	return ERR_PTR(-EOPNOTSUPP);
3e89594245fa2c Clément Léger 2025-09-08  45  }
3e89594245fa2c Clément Léger 2025-09-08  46  

:::::: The code at line 44 was first introduced by commit
:::::: 3e89594245fa2cf4bd298955d807fcd625294f22 drivers: firmware: add riscv SSE support

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
