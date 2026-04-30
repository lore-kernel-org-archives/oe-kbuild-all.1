Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315B428838
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558540; cv=none; b=On3rcnBHLWT2wxQ5+1WFcGSHG6aigwzaHygJjaWXTxCDMaIdkd/EtKCHcJ1ugovkuQ3T29+ytJnW1on3Cd1q726y+jsOTZK8CISKrE9am6j6E30mxvoA7UzGQCLsjpMX7rf5AUzYUhGs4GKIgZLzfoVARNfuHyIhcMQl2f29+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558540; c=relaxed/simple;
	bh=hP+dq3hgk34STSh4F7vxQZ/uM76BoFA7VlmsF7hrYho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZDjd27DHkZzfjLzRyHeHMoPVYAIdji94Qizqt1SNEDnK1uoQocbZ3J+sVkpM7U9JEgHjMQUVL7N4wEHLKcn49edhTcjw0/Hy9Dd1UxX7BbUnqp0dHhg1WUBBfMwMZzjAqyTIs/UB/VF0Z1uQCpj2lx8YkkMwC81tn80SWg3Q/c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1If4qj3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1If4qj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777558535; x=1809094535;
  h=date:from:to:cc:subject:message-id;
  bh=hP+dq3hgk34STSh4F7vxQZ/uM76BoFA7VlmsF7hrYho=;
  b=Y1If4qj34pz1hD8KWPfBDD3qMA748OMTi21akq2gZNrmYyRvOk0Ng/yH
   lsko0/4WQX+EHgkjyxIGJEUAYzE/MIbrVMCNwxAuJXhBn4UgycROFpMYk
   rWMVthgZl5hyHlxVG2TWi5ulS/v/d66CcBNZfJjhVayxCX9IgUnBNJ9dP
   SpRmsgVRM9a7CD25nyBgqkPc9ImMHo9yotNKLAegau7npsqer7FqmU4Xa
   TIYI7Hpmku8ZVUq1Pe07U4rY4jj5KK9BJBWBxx/bIasqg5T5kwddlG0J2
   FaRBbYJ8F8t+gcb19sSoPi+/3mTShv6VkeJ6pV6det0MCx2rV1XP9lndH
   Q==;
X-CSE-ConnectionGUID: gYFs1uS0TKusSnZuNG3BIg==
X-CSE-MsgGUID: +/pM9sr2SWuv+22Kn9uqYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="77673359"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="77673359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:15:32 -0700
X-CSE-ConnectionGUID: Ta1BBkh1QDe8xXNB7HWtpw==
X-CSE-MsgGUID: Dwf58/s1TIKoJVERIkNUvA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2026 07:15:30 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wISAq-00000000CS8-20N5;
	Thu, 30 Apr 2026 14:15:28 +0000
Date: Thu, 30 Apr 2026 22:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk
Message-ID: <202604302258.QrGvQTRs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   9a6d85275cb1def4a196bd5c757f22c4e21f1d0a
commit: 07c6fcc0ac3d793fe9ee0b7a8a1b8b636e8881ba [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260430/202604302258.QrGvQTRs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302258.QrGvQTRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302258.QrGvQTRs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
