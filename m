Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC67FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 01:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735607835; cv=none; b=OYYLjRJ/G5EH7Y3tMrIRYg1t5tlGuP72qENrHVKwNF8mSfZIBLlc/rkXSrtq+3xfH2Vzlm03t+K86rc2Ab3dHZllh+K/7uxsM/UsvDDUZnlWoHH4AF1SG7+zIzmgio5Z9MXpAob7Mk+5SersxHHk6rRTPtqSbQ9F/Wtd7Yn50LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735607835; c=relaxed/simple;
	bh=e3jMN6euFYM++m7Wt+n4SKoxKoYfp4KatNU9AEhsgtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOT7l/PfkMFBImYUdYYvUTKBMlD/1azRLw63LLqOWUxddyhtvcMY6vlxTTPfA9CWvS9nT0Hqa4QgIA5EecSMayxSNx0R43TC5afFLZi61IhXZ42afopVDNJ8pQzyH1jJSO8FC9yLmNaP66iVTEK8L/T+k6CCQBFnLa+FOm3Eero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNf1KeW+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNf1KeW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735607833; x=1767143833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3jMN6euFYM++m7Wt+n4SKoxKoYfp4KatNU9AEhsgtE=;
  b=ZNf1KeW+GWvHl6aDScUmpuCl0YN9o9hL/omsHOUlvwyBE+24fUjmFjax
   ovcrMqAico0P1kwLTT2MBEHnnl3O15jCD84FDwRwmAnx/mm4CyhAczyka
   hvgbwT0OH4a6lDZrZv6Ojgwp04pqTuyhmzb2jB16ap9txfitXQohRfo5N
   BTZAaubTmehNREju3uAyDhimGvsSKTioXtdjnVFNB6MlFyzeHqgNm90O+
   yo8GhumOkTqdQKJedd3sx5Gc85Ly5I+EH6SDCPg/Ve19BV7PRuohZ4mE5
   AT1aHKwfSb2T30Eh+29mcBy9A0wRvPcD7sIAvGU2ghtk5Vtd1RmAuHzP/
   g==;
X-CSE-ConnectionGUID: zr2/b7MWTRePTBcnpGyo0g==
X-CSE-MsgGUID: 7U6lfVgtSXyb2T4F8ojIkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="47254884"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="47254884"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 17:17:13 -0800
X-CSE-ConnectionGUID: EWWPByptSfaaHIfCwX/wVQ==
X-CSE-MsgGUID: X0ss24QLThGrbCTI3VMUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="100784346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Dec 2024 17:17:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSQsf-0006X5-1b;
	Tue, 31 Dec 2024 01:17:09 +0000
Date: Tue, 31 Dec 2024 09:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] mm/vmscan.c:3467: undefined reference
 to `kernel_swap_enabled'
Message-ID: <202412310947.msuqFyrV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liubo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8bba4b17284e774544bd01d9ea5190546e93a849
commit: 79c68ab3280fab8ace1b10bf8eadce508ee89c3c [2610/2610] etmem: add original kernel swap enabled options
config: x86_64-randconfig-161-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310947.msuqFyrV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310947.msuqFyrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310947.msuqFyrV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: mm/vmscan.o: in function `kernel_swap_check':
>> mm/vmscan.c:3467: undefined reference to `kernel_swap_enabled'
>> ld: mm/vmscan.c:3467: undefined reference to `kernel_swap_enabled'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +3467 mm/vmscan.c

  3459	
  3460	#ifdef CONFIG_ETMEM
  3461	/*
  3462	 * Check if original kernel swap is enabled
  3463	 * turn off kernel swap,but leave page cache reclaim on
  3464	 */
  3465	static inline void kernel_swap_check(struct scan_control *sc)
  3466	{
> 3467		if (sc != NULL && !kernel_swap_enabled())
  3468			sc->may_swap = 0;
  3469	}
  3470	#endif
  3471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
