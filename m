Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA328C0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739164589; cv=none; b=VX4tma+H0yK2RK3MQHA5slfT1Xem6U8xeYi1Hgd9JGk1JqSBsllHNGXhhXfJ1K7ARiqhDgQWxGvhy1EyAYb0o9vYdpgylvMM5BEEroANuOZdT/7I6y9S3Dc33UhcO3eGYQTs+YTsqb6i+lD4c0rQQWsburU548gZiMf8XvYBF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739164589; c=relaxed/simple;
	bh=mWwIqYT954MhiIb5N8tMr9F6vj7a/fUe1iNOQIH1OH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzgP6Ah5v7KBv8lr7JLadFhlizqmwU2BgGQ0R3Cttirt71JwBWMOEBW6AcIKa1q/cNjrhFg0Tnxb7yPDmZITRyVRqskUoPE2ytyMvyRlecnZJ5N2vWZ3iWKSFLn3C1W517SyPD3YBoqbaSug5TLcREIOWGK+1hfnvaXbSa3OmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4OUzyaT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4OUzyaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739164589; x=1770700589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWwIqYT954MhiIb5N8tMr9F6vj7a/fUe1iNOQIH1OH4=;
  b=h4OUzyaTqatZylIM6zr2rRVASlTbm1iGCKs0JNEb04RScPH8Wy611oSH
   WveJPc62DHplYeKmW0aM138GgRPSVM3k/dmMfxa3yXoHibki7Zan/g+5v
   yy1T9JqTvRXQM5b7KvqxL/Ofpig1lJAeGPZ3Oi6GGIONJQgh2qpS6MBAY
   euJ9etqTrkbEDdBIbgjMlCOH2KCApGzES+wfQZkWzp+zN3nohOvsu79+O
   xN5jFfNPurfVTpTzt/vveKAcxMGP4dF30FI2MzDNUn+uiE5WKyfOkJ+KD
   beYd+NFNSu99cnxNPOCes3b2LLqRWxvepHLRn4qjSnPPygzLJRP8iUqU6
   g==;
X-CSE-ConnectionGUID: SgZuawYcRf2LZn7h+26knA==
X-CSE-MsgGUID: SY7DNdhuQxuFulEkpH+a8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39996293"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="39996293"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:16:28 -0800
X-CSE-ConnectionGUID: WlR/AxjCREem9QfthIN0sw==
X-CSE-MsgGUID: TaO5x8SqR1Ceo9G0wm9t6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112597303"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2025 21:16:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thM9h-0012Jf-06;
	Mon, 10 Feb 2025 05:16:25 +0000
Date: Mon, 10 Feb 2025 13:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 35/35] rxperf.c:undefined reference to
 `crypto_krb5_find_enctype'
Message-ID: <202502101319.UxHkT1LM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   6385ba8f265471ebf57f38e2bd2e6a4fabac7424
commit: 6385ba8f265471ebf57f38e2bd2e6a4fabac7424 [35/35] rxrpc: rxperf: Add test RxGK server keys
config: arm64-randconfig-001-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101319.UxHkT1LM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101319.UxHkT1LM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101319.UxHkT1LM-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: net/rxrpc/rxperf.o: in function `rxperf_add_yfs_rxgk_key':
>> rxperf.c:(.text.unlikely+0x38): undefined reference to `crypto_krb5_find_enctype'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
