Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1F140DFB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777530232; cv=none; b=lsCWPdeX44vQIp0/CBNFGZT+0AfeVb0z0Vd7hVMXmN+O8rlW4+5lOT62qLBU/2qUxho9GRAcNMpdFe8ixzWqCnYISTIqa/dFRqhSJgCTrAjhXp9TW8XSEGQNccDpm6OjluphWUBjK6AQOa4I679m36q6iiYCUcU8ACI9xSMgL4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777530232; c=relaxed/simple;
	bh=6hOEY4oYtZYHVALxANHTq1AF/pLIoQGkVMPsSN6xNZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A3W8gk8V/tLApIAEV06OFiposLHwt9q7lhA9y4IICfXyHatsWi6zyVhGQxx2qLmxDGmSkUGd4oQxMate6QT4PtlrhCshmVGMPNLzaprtGdBI3+b4dztogNb19GPJtJnbICbSLPp4X+7humOoWAxByWoSEH42cxLHCENq2Z709bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKbKesAU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKbKesAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777530231; x=1809066231;
  h=date:from:to:cc:subject:message-id;
  bh=6hOEY4oYtZYHVALxANHTq1AF/pLIoQGkVMPsSN6xNZI=;
  b=UKbKesAUjq/aU+YMuFFj9fK/2q+W1dFIbikttRWtLjc4dM9u7ibWgrpb
   v/lNYSH23gqNazutir2WLPl0Ojaflbn67pTfQdaiFHoUg8YKlqUM7Gss9
   QH3SwhdDI969VYkiLP8RXd+zDftis/6aUw0xNX2ae6TzqvUqvNe9BDQh2
   55tn6hGchIt4LFtgA8a5C6bbHC8XUjbupsfl/Jdlhe9emKh3hvIQWyB9J
   hvTX/4xn+Q3X1bBvYVpsahaYMPpSBDKs+MSiM9nCXCXZo08uA6gtCROOB
   nE8vRaNdjc2p4h4EbYUfeO9VD2HhRVtJX8G+gxDX+7i5fMUJUWb+0mceU
   A==;
X-CSE-ConnectionGUID: xbAVb9SYSPS6vMZCIsbv8Q==
X-CSE-MsgGUID: b1h3gKpiTZayL2M3ZStleQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78497074"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78497074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:23:50 -0700
X-CSE-ConnectionGUID: /Q8IzkCyTNur9hQUzd04Zw==
X-CSE-MsgGUID: rYWXAj8FSPy0nagqZaKy3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="230133566"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2026 23:23:49 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIKoM-00000000C20-3GSN;
	Thu, 30 Apr 2026 06:23:46 +0000
Date: Thu, 30 Apr 2026 14:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:rust-bpf 1/14] samples/rust/multi3.ll: warning:
 ignored by one of the .gitignore files
Message-ID: <202604301445.gQqUWtaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git rust-bpf
head:   1623628cc9588b205a0e913c5e62d267ef0f6d70
commit: ecd06fc73cda8ed2ac79eed64aa406b167e52be3 [1/14] compile rust samples to bpf
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604301445.gQqUWtaj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301445.gQqUWtaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301445.gQqUWtaj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> samples/rust/multi3.ll: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
