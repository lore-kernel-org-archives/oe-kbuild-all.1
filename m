Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353FA51A137
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 17:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666502; cv=none; b=j8vQAw1TrIFxuzhPUIxtrH6X9b1ApVeC8Hw2K32VSGbPBFw3onIo0UA+Bhc3vF1sbaC84ohM4ha26lrTwo40izoMHC6IcQoGytykJhJ8kGILPS4Bo9dFznbMVoZqxWDol7OqmNM4mql4MZrJrWPlcTnJfnnnAc4f9IQKR4gr7rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666502; c=relaxed/simple;
	bh=AxrnZfIDhAsyqnMUg4FEclz6szogRdtK/q83a++RstU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d85uN/pRZQEwebfjFMt4srt0xLpJMwr6t8gT9U0AoIRxGaFNrs4SKBI4uddhvuzH4k+apgbwisGRi4pG63+TaRY/TYX4xuBwq7TO9njAtnWeSf69WvYqnhSUxcVQKNLinMelkdnQ/jCmXUC0uivr8bBQ/9e5TgH/8ycpKzpRlnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAcJTTiF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAcJTTiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789666500; x=1821202500;
  h=date:from:to:cc:subject:message-id;
  bh=AxrnZfIDhAsyqnMUg4FEclz6szogRdtK/q83a++RstU=;
  b=AAcJTTiFWlmHoKqvLy19rsDKWl/7X3Rsh6IJdubi7LHvwcYNhg4oyoIE
   bEm5EyXPxPpN6Uwh2ZvF+R9E4+vsl5LY4Sq7rVzwbwQjMfLrbRxnigUvJ
   kvUP3Hjck6/gJKXkptDuU+P6BEQDNuHXptYJAwsvNb/wv1LGyiLRacK4Q
   XwhX17gYic0EdLRTEYSNa9WvfOwerpD/wsPPQpG6KVJYPF4DtEZDpzwOG
   B3Hhao8EnUc3maMfMV2eurlYDP+SlUIjRmXDdfNY+FdgW2hr0BLVhHbr+
   xaK4BF4xWcswHYIkRWPIXZi2+bU0SjNtjFEOCMyTRhltM0fuX++3DYnGM
   g==;
X-CSE-ConnectionGUID: EoHZJnLvTkyPVMzOeNadhA==
X-CSE-MsgGUID: tpbV4GxVQEOY+vLtrNwd7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115651603"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115651603"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:34:56 -0700
X-CSE-ConnectionGUID: 87yo6RzaR5enGN437wiVJQ==
X-CSE-MsgGUID: vyWg6GeNSZSME//vNiT34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270643008"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2026 10:34:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7G0Z-000000008Jf-3WMX;
	Thu, 17 Sep 2026 17:34:51 +0000
Date: Fri, 18 Sep 2026 01:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mahe Tardy <mahe.tardy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: net/core/bpf_ksock.c:221:18: sparse: sparse: symbol
 'bpf_ksock_release_dtor' was not declared. Should it be static?
Message-ID: <202609180339.0L7nLqNo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 7ae4eb14c5f9d9bf0e0feabeab206151b1280512 bpf: Add ksock kfuncs
date:   5 weeks ago
config: i386-randconfig-1302-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180339.0L7nLqNo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180339.0L7nLqNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7ae4eb14c5f9 ("bpf: Add ksock kfuncs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180339.0L7nLqNo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/bpf_ksock.c:221:18: sparse: sparse: symbol 'bpf_ksock_release_dtor' was not declared. Should it be static?

vim +/bpf_ksock_release_dtor +221 net/core/bpf_ksock.c

   220	
 > 221	__bpf_kfunc void bpf_ksock_release_dtor(void *ks)
   222	{
   223		bpf_ksock_release(ks);
   224	}
   225	CFI_NOSEAL(bpf_ksock_release_dtor);
   226	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
