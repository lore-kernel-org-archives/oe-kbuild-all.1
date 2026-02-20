Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5D21F5847
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 00:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771548056; cv=none; b=RNmPOrKrR83QBy6z3j1KmIcAVwnKdWB5a4VtNJ+Z46iFEseqhFpeSSZkBG4c21SDdtYG77vDGWaYtT2euIWX0EpTXDNn4K/lTbAE/NHgcLfeiyG2f8MEcpG+/gw9LrfeOd+ujpvCzpDiHW2xYCOxK1y4n9MxjPwDSdq/MKYCU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771548056; c=relaxed/simple;
	bh=jflXtUinxejhcFPokKLFTXJ780oj3/6UUfDGtMZle8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bo2BBH5Rb8m3V9gplZRN59umdvC06d9Rr+LkY7sbO9jBnD/DipD1clG6MKSk04XiJ/DWbEecUM0v3TPUfKPIdF+8C0AXyMF485qk5iyX4MXkTmVsbq5Wrtm9rt6ZF8d2NJImKf88D3LD/rIWUPa974EfQ09u+CMxFLkBsBH3yJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezovyv9c; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezovyv9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771548055; x=1803084055;
  h=date:from:to:cc:subject:message-id;
  bh=jflXtUinxejhcFPokKLFTXJ780oj3/6UUfDGtMZle8Q=;
  b=ezovyv9c1xsQghWIK5Lcw0V7/b1esGCxnsWBgu/gptd7CKdNm2/VdgPF
   cSco9dwpufnGL8npgIPYYDpsX05vftr1ut1c9BDSGlbGeaCFhiiMO2vL7
   WgqFENwVVKloQkKSE0EaK49Za5oMkVb6a7vlttdev/SY9UKBCQrGVZV9O
   UNzq8omndoz1o3BrfKI126S6xQfJ0EDmWRghr6BIWqEd4rQ0kpnIzVzEd
   v5vG3YibvnRxyXm8SXqerQsmEAxHdl/w3nbmeGzRpLpTzH3NSo5alpfFq
   Ylh7OdVjvxfEDu8mqMtBMtBcjZLzChQ+dfDrlz2v0jbTspcUS3OorA5cw
   g==;
X-CSE-ConnectionGUID: zTk6ts+XQxKqSasn4hHLsw==
X-CSE-MsgGUID: /w7/RJP0QFClQ7t8QmvDxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71853587"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="71853587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 16:40:54 -0800
X-CSE-ConnectionGUID: ayaSrMRWRTqqw52/Hyz+cQ==
X-CSE-MsgGUID: lkNWfXNiThyCAUIG3DfbLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="237682502"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2026 16:40:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtEZf-000000013fg-08Yn;
	Fri, 20 Feb 2026 00:40:51 +0000
Date: Fri, 20 Feb 2026 08:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 7/18] <stdin>:1627:2: warning: #warning
 syscall rootns_create not implemented
Message-ID: <202602200829.dSaGk1DJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 0944dc7efffffb5c4acb8ab671e5a42109ea5c2b [7/18] rootns: Implement rootns_create()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200829.dSaGk1DJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200829.dSaGk1DJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200829.dSaGk1DJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
--
>> <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
