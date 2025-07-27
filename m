Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45778266A7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753627848; cv=none; b=qKcVZgnpYYIj83V/71AvJqmeD1MUmh72oC0TPpG/Qq6etloKi9Q/FruN/BilikC1YIz7o448RlDNgn58zFFOmnu0U+gPY5lx3elpCAonDJMiYAnt6H4ALEP7yur3Q+AI4YE6HUMMwkDL3UTdOM5DLERtULcox7DYglErcFFc1YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753627848; c=relaxed/simple;
	bh=SCjEWOeXe2s+hnIc0+B6jLUsvnC5lnlOnXi4NFXxWsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZGvFzdEEeIsMXUrG7BZuiLdtZBCl6k8AwFwiLpQryNcIXeu0wytyzsOeorp1sJQZA9yi3jGTfdULFr8PsyB0mGerZIHh7+KumQtR26jTmNZGNAfAe/DRXu+f/ddyRBqGCYShdYeUFM2z/cdUfC0xJxEpcWn3sC2z/H2s0C6KN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxZNehMM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxZNehMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753627845; x=1785163845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SCjEWOeXe2s+hnIc0+B6jLUsvnC5lnlOnXi4NFXxWsI=;
  b=bxZNehMMV6cu0XO53aalghdckkK3yN+TQpCySUxyQHa9Z/2LfivNkdOL
   0EJ4S5LKxlnW6GP9qHkSVhcOceVmDA6Dro0DuIpSjbnL1h142jdvhHxd9
   i3KP+biXsNAakuyDPakVZBnjB51sIuZUYLy1NFASS9aNamjwJoD9RWthm
   SDZ0Z0P9gHH9+D7Rw/A2PKtWL1YdsiztsZOISOA4UQQJ/Y8yx23dTSx6L
   IJh1cRI5a3/d+t1in0oJvrec/NSGZdiUQy1bXMb10LeEHB+IxBNB8n8PR
   YT3Ey1Z0EyXoDCKHLeaqBFdLnYzASmiCbimPAf0LB1OVVTIFjCeZ3dh/l
   g==;
X-CSE-ConnectionGUID: u3r/nBOgS7GsFletBJp+Cw==
X-CSE-MsgGUID: jJF+MpMDTBSoL3VQ0dTaDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66458659"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66458659"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 07:50:45 -0700
X-CSE-ConnectionGUID: m7WspfD2QX+6x2LKKByVDg==
X-CSE-MsgGUID: dgOI2otlR+iCPx3ri1pgIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167520804"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2025 07:50:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug2i1-000MfD-1l;
	Sun, 27 Jul 2025 14:50:41 +0000
Date: Sun, 27 Jul 2025 22:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: {standard input}:1440: Error: register save offset not a multiple of
 4
Message-ID: <202507272217.pUPI2CXs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec2df4364666a96e7868b7257bc7235bae263dcb
commit: 60558d55f7e26c8aa2242718461642792fa200a4 bcachefs: Plumb bkey_validate_context to journal_entry_validate
date:   7 months ago
config: m68k-randconfig-r132-20250727 (https://download.01.org/0day-ci/archive/20250727/202507272217.pUPI2CXs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250727/202507272217.pUPI2CXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507272217.pUPI2CXs-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1440: Error: register save offset not a multiple of 4
   {standard input}:1441: Error: register save offset not a multiple of 4
   {standard input}:1442: Error: register save offset not a multiple of 4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
