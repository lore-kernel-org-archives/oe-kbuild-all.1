Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4CE432307
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781903; cv=none; b=EBGudM++/JJVjqpifMiwxBw+qdL2uKOezmrr5c3eZtoiuDEe3BntyTqovqNR+SioPCdO0iMyOP5wK1cyjDu8eolcg1gSkbACe9syo3wUKMFciDeg8sucq3grlcCOqec+5xPfaQ56na5+1wiM7Yu98MhvrmlH7LrNzzvu2ic4U4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781903; c=relaxed/simple;
	bh=+qeKCae44/08/mK/EwODsIk968WnwW6/cep3k/AwoOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sKkBJwzPjXPMon8wulN8UzydBfi24cJE1g/gOvyAkCmJnpYYAwKDRbMMLyDYBf+xiwe2UtNMcxPilvTLAVEgE0IQN0+x8yMYjOlL168KyDDmOuRvj1iaDiEHF/co6yZn3UUDC7gKOeCaHU7LJKsfYpS0v4fOnLo18b8j8A8QXpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEkysfUv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEkysfUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785781902; x=1817317902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+qeKCae44/08/mK/EwODsIk968WnwW6/cep3k/AwoOo=;
  b=PEkysfUvHtNT0Z05fBh52GWxVSnFIp7GIpnDTKtBAOSbXcOWliiK9MV9
   neyphwbr7YeeF2a/pSUttn0b1F7Ju9NkQvFZST04Vg9P8TGYNp6ikdkNl
   Fg0nE6FI/rpoFIKybHs6yo75+rAE/a2QwkEHy8BOgsJ4m+9ib3ylWRPzL
   7MrPk3uSmTWEsjc/94hDLKWR9GwaSYeGSSgruxflIbr53PzFTy6wvM/R0
   hheZzYgMPfALrG2EFhIIyHEkhmOpc5IFpaeblUReyAPNAK8VdaHGnWF8r
   JMOtpDQwsXwAZDiHOUFziLaLaA2a1A7qbGeQy5V5qxLN/MCB4/IbbPEKv
   A==;
X-CSE-ConnectionGUID: IuUmqYSQQ5CCzG7uTJIAGQ==
X-CSE-MsgGUID: rsz3h4UrQUmMBA60XLKnfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86524538"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86524538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 11:31:41 -0700
X-CSE-ConnectionGUID: w7hRFGwkTGixXGSyi1JivA==
X-CSE-MsgGUID: DQyFVPmTTrqQYNQDuQKesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="261880403"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Aug 2026 11:31:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqxRp-000000007dZ-2PdE;
	Mon, 03 Aug 2026 18:31:37 +0000
Date: Tue, 04 Aug 2026 02:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 53/55] ERROR:
 modpost: "tk_aux_reciprocal_mult" [kernel/time/time_test.ko] undefined!
Message-ID: <202608040222.mGHOwbs2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   60f852175b99dee11b414f69b62ce55ccc72fa20
commit: 115063bee63da6bb88efb4507842c0c64ca1c1c8 [53/55] lazy update
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040222.mGHOwbs2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040222.mGHOwbs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040222.mGHOwbs2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tk_aux_reciprocal_mult" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "ktime_mono_to_aux" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "ktime_aux_to_mono" [kernel/time/time_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
