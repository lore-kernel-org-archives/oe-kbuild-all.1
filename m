Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8790AB664
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740865590; cv=none; b=Jq+mNSXW9cYLXIxnJl5H1WMpd+JJ54JSxNMo7vHeAusEqOJcQS6dwyzdHvGMTUrAkZvbyuvc4eQDSfjKTLNi7QIgPGQYvm440jwNFntq4Jt7Nx+JwXzBdPVlwUG7T9Hr+eBtdKTyPF/H+g5e0svtS8CTTlI/1KjA5owY1F9FBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740865590; c=relaxed/simple;
	bh=ZHRzPYbNyOaEwvK4L61V0ecYgUrBdK26kUlSSt7ERpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VxfmriQgVUyIzIGopOEiNsUam77em1/tCpIjMvyq+XUX0ZlYS5+AFnyFlxOclaJ+1OfkoG8Zv3BdduCL4Xw0qq8hL+OLHY1nvlYb8dDgY5KnBieSle2HfS1SH4HL5ugh1wiMkiOtiNXtu8kXKJVwjXZDLZACp7EQp/oePvfE6J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8QreZQp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8QreZQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740865589; x=1772401589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHRzPYbNyOaEwvK4L61V0ecYgUrBdK26kUlSSt7ERpw=;
  b=O8QreZQp3lsh3qAQtJBwdJbopU39+K6TulOFFOiDf73C+wlPb1HBAXJl
   heCApItRoNtLJNE7dbx7JLRi74zDhaFyEsqQ2p0f06WHXtc8eDSndy1xb
   XPItelS06rvAK2feRoNTucBmx3zbwR6sIf6sUsR1Qxx9Kqmfxjhb1LqmL
   pnEh4cEZ3cKMKBwwSnVBfaiuHH2SY/ke1VH/bZAZpQFtuBvCu4mF7P1G5
   XzM4m+gPEgW4kzLoN+1J+5fs2uOTiSg89K2fT0vSlJIrlG+9uSq1pQTHp
   P61smpLn1mANPpF/0eUDvHQm4nsmDTpqI+6O6CFr7+OSlfdCPee70kVwO
   A==;
X-CSE-ConnectionGUID: 7XmlLCvER/qcAJw040z5jA==
X-CSE-MsgGUID: Z8UU0zABTuesVVDUkeHb+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59316330"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59316330"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:46:28 -0800
X-CSE-ConnectionGUID: CigTiMXRTSq7A30JpOJ2Xg==
X-CSE-MsgGUID: tkGgxKVyQ0eBUJTxHaY7aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148453164"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 13:46:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUfA-000Gje-0K;
	Sat, 01 Mar 2025 21:46:24 +0000
Date: Sun, 2 Mar 2025 05:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:next-test 54/55] kismet: WARNING: unmet direct
 dependencies detected for PPC_RADIX_BROADCAST_TLBIE when selected by
 PPC_POWERNV
Message-ID: <202503020537.XJHtwWK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next-test
head:   aca95fb6bb572a77f39d42d83ab72a965026577d
commit: 3d45a3d0d2e6b5cf47c6f0ab890f6ce762d9fd23 [54/55] powerpc: Define config option for processors with broadcast TLBIE
config: powerpc-kismet-CONFIG_PPC_RADIX_BROADCAST_TLBIE-CONFIG_PPC_POWERNV-0-0 (https://download.01.org/0day-ci/archive/20250302/202503020537.XJHtwWK6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020537.XJHtwWK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020537.XJHtwWK6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE when selected by PPC_POWERNV
   WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
     Depends on [n]: PPC_RADIX_MMU [=n]
     Selected by [y]:
     - PPC_POWERNV [=y] && PPC64 [=y] && PPC_BOOK3S [=y]
     - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
