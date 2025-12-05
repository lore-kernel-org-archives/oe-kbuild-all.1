Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372E1E5207
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948547; cv=none; b=kqBxWq4SnCiqUZfk1zSN23sZlvhzeNdpjf4u25yAaH4VNF4IfkCDzHFMXNF/1MKpkPZgAssffbQgxIh85eQNzR4Pgn8gaz9HUxzcH0JYBgSP0IRP1u9r43J40NtyHFrNsaNyaqfMQKNA8S07Z0CDNZB0UZvITCn0jUGAeRo7jAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948547; c=relaxed/simple;
	bh=wUlzFCcnmgHKHGjskqoYhBs36UQY95mlKRoUth8qWxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnVWg0SIHyByTrfyBEcV0bC62mf672LAvWWpo2Fn7teZH+Kh0xj1AEXQye2kpZZMUf4vt87vciHL0invCLZGiJhNtmhaLwYnBIl8LJ6RSk8cOPltUhnFEkiBLMHeI0/cibH/x8EUZx29V3TAUSMZTgMluNIxqZ4K7k70FPKzYyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buQYkEKA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buQYkEKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764948538; x=1796484538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wUlzFCcnmgHKHGjskqoYhBs36UQY95mlKRoUth8qWxQ=;
  b=buQYkEKARdUDJx7O5PcdYE2I4NflCIhvl9i76iTXOe9rVL8MKyJx+/i2
   7f+sFSYLOmFABfN2WYwOPFnGJnnV0vE8c663GVXHd6t48iQlC7SDrWUDt
   ajBpxYozV0AGn4eLWxgScQLIgOokNVoEKTtzuBRQyOKWr+1tXUzT6E8IE
   5/7vXVquVYAzEEMHyRWVJ01occby7KwAMFDBp8u0CC4fteuDhc2cExebw
   Txec+K4xcxwBSHz1NwVE7Re23qI30+iLc8a+00oLtyIr0W3eo8VcaH+xW
   ucoZybKV49TZrED3uvhA/ju6pT4baqiuf++ki/nnmwGGt6PVqT2A++xED
   g==;
X-CSE-ConnectionGUID: kowdyOX1S+mZlUECucfxUQ==
X-CSE-MsgGUID: G+Y/oA7nQfaRxW0UXEQIOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70833324"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="70833324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:28:55 -0800
X-CSE-ConnectionGUID: MSaMdDg9SvuzMUEHCFbxvQ==
X-CSE-MsgGUID: 5yqjAznCQsWO0Qc8ZlwIBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="196108929"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Dec 2025 07:28:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRXjm-00000000F8T-3OYF;
	Fri, 05 Dec 2025 15:28:50 +0000
Date: Fri, 5 Dec 2025 23:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/no-macro-conv 24/25] jiffies.c:undefined
 reference to `proc_int_k2u_conv_kop'
Message-ID: <202512052351.bANmia87-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   60075afc9fabecdb5b1015df21a05df3b2d50562
commit: 71c0b361117fe4d62c3c9ebe9a0893d137af3aea [24/25] sysctl: Remove INT converter macros and add explicit functions
config: sparc64-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052351.bANmia87-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052351.bANmia87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052351.bANmia87-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/time/jiffies.o: in function `do_proc_int_conv_jiffies':
>> jiffies.c:(.text+0xe0): undefined reference to `proc_int_k2u_conv_kop'
   sparc64-linux-ld: jiffies.c:(.text+0xf8): undefined reference to `proc_int_u2k_conv_uop'
   sparc64-linux-ld: kernel/time/jiffies.o: in function `do_proc_int_conv_userhz_jiffies':
   jiffies.c:(.text+0x120): undefined reference to `proc_int_k2u_conv_kop'
   sparc64-linux-ld: jiffies.c:(.text+0x138): undefined reference to `proc_int_u2k_conv_uop'
   sparc64-linux-ld: kernel/time/jiffies.o: in function `do_proc_int_conv_ms_jiffies':
   jiffies.c:(.text+0x160): undefined reference to `proc_int_k2u_conv_kop'
   sparc64-linux-ld: jiffies.c:(.text+0x178): undefined reference to `proc_int_u2k_conv_uop'
   sparc64-linux-ld: kernel/time/jiffies.o: in function `do_proc_int_conv_ms_jiffies_minmax':
   jiffies.c:(.text+0x198): undefined reference to `proc_int_k2u_conv_kop'
   sparc64-linux-ld: jiffies.c:(.text+0x1c0): undefined reference to `proc_int_u2k_conv_uop'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
