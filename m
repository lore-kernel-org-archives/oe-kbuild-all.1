Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2DE205129
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730912490; cv=none; b=iJz61Wt7o6QD+LkO3feSOk6ncRto6WM6RYil9FamZNHsuENqgg7g+tJyASVUzUpUd2d8XELEAXam6xRE2c45IR4mJ5q60lrym38fTg0a2ffelBYNtjPOXJboG2P4j/gvPzA/D41VwcBuTbVbvxglJZwMJIeIh+6Bn5dkmB5uXJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730912490; c=relaxed/simple;
	bh=1DTpHpEZwVEx/TeccBIzAclUP8ZKDXLKM1pgtdDpG2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCRu4XG4p15a4JnoPY/SApFn3YaMZKdchnwTE0xv7d73D3xHsf1MH0KRR9/9QbLuCNXBiZsOEH2JBDFvBpo85fNAb1k2k425D2AVvCrjF+JBbxhiZ+4P8r6KxnbJNkz/uGjdPFjwiZYCYg+U24ID+QT5DKK9HhQFjjFj9rPab4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZCq3pPw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZCq3pPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730912489; x=1762448489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1DTpHpEZwVEx/TeccBIzAclUP8ZKDXLKM1pgtdDpG2E=;
  b=mZCq3pPwJsP1ul+35z4bk3w0H0tg0YKPzdyaazJof3uyoYWpB+JBomMp
   oVO656pnL3BdMgZ/yYaMrXrLr2+r4rJ3dfgAwxVMDddgME/1xBHR5/rJP
   JAK9aBqMGOcHd3HWwI06PzJ+yAstISPHPOx/YopX93yP6CCe+Z7uebmda
   wNnfGndYrHYwVls7PyJuKYd5ScYpf0pH68KeRODIsTdBemblGygP0jpQ0
   3/V0oaouPEyquetl5V2ApfGbJbqpiLwcCeX0TYmqBu0pjcTB3COReYRAh
   13BAgA0kepjg2FvcBeDJvfRiGve6LQs8REsniPeGHTL7dsfJON3XIzlNO
   g==;
X-CSE-ConnectionGUID: tjBVggkwRBi823mP8LdXSQ==
X-CSE-MsgGUID: FUe1yonsRzStViRsVSjwwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41315927"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="41315927"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 09:01:28 -0800
X-CSE-ConnectionGUID: sMGr2z5eTUmdhX685kOP0Q==
X-CSE-MsgGUID: Ehy7pECdT6CJIEtg0huHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="85054741"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2024 09:01:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8jPI-000pAY-2B;
	Wed, 06 Nov 2024 17:01:24 +0000
Date: Thu, 7 Nov 2024 01:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 414/415] ld.lld: error: undefined symbol:
 __tracepoint_cros_security_socket_post_create_enter
Message-ID: <202411070037.ORrRnvrf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   eebfbf01bf6938dd13cb315873c55c135325ffe2
commit: 0c222baf9d509fdea61d5e821a175093d62f2f3b [414/415] CHROMIUM: add cros_security_post_create_exit tp
config: arm64-randconfig-003-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070037.ORrRnvrf-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070037.ORrRnvrf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070037.ORrRnvrf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __traceiter_cros_security_socket_post_create_enter
   >>> referenced by security.c
   >>>               security/security.o:(security_socket_post_create) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_security_socket_post_create_enter
   >>> referenced by security.c
   >>>               security/security.o:(__jump_table+0x78) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
