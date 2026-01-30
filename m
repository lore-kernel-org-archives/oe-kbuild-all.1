Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657DF38B982
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 23:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817401; cv=none; b=LAdJHEFFEwxn9qfUwTyUG3T4iDOkKXhy50N8Sy5JbG4FQ7PrPc6NkUdfFF8qnrNgVPOTi/xLuR8pViCtczasUMje2yjoXx1IY6oJAWI1Xz1/VMbGh/gVR6zdF0h/brydua5cHbcwTPY4dqmTOIaLksBls80VjZi3Xws+XFQtuLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817401; c=relaxed/simple;
	bh=UCQJHibjAavXaE6hZWli9LnLlpDl7kQQ8CZ6pXHKChY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rLkW3gUJLSsTqwxjwZ311VQ+JaHSF8Hu0XaxvYKdAkFuTFcLpTFQjQPk28sMvraMuhHmQiXSO3bgRpuys2n0fPZR070NOVcpE+u+51vDxGjUc9x/o5NdoiUNBrJeMzQtHqUt9IyC9jRGwyFNuSoiJ+UMDBBsO7CSbO2LyK04c54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdqbXUIG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdqbXUIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769817397; x=1801353397;
  h=date:from:to:cc:subject:message-id;
  bh=UCQJHibjAavXaE6hZWli9LnLlpDl7kQQ8CZ6pXHKChY=;
  b=hdqbXUIGCQDVqLh5pKl9SuVUvBzNBzFqDXzEUd/2EcLRqUNDv81nPloQ
   pkFTIs44oXuQX5xzn5Kjlel+OoXDxKb/d2bYcBxJQ2LoIW5CsoiOJQTOU
   DASvgLF3BRR9IctSyDYCQ1zpzP/anqXyzTfk95bZu5cyzRvE147ezo2VH
   6b/2uJaoQTHZAgpbNw7lL9DK1iLqKZjlVrNH4WwKA9KdFgGNr9s4qiaQ/
   29PjHTWuIOf7CwR5LoPHvu1mWwsf3tUfvRBW2jdGPPxyC2t1hL6lsOv4z
   R1wpUODqxHSoslYiUFtf4bbCVAhCJG1uo+SwhmTA5oafybKKvBEeNCXEM
   w==;
X-CSE-ConnectionGUID: xdAWh8LATcG42xiE6M3LAg==
X-CSE-MsgGUID: lCPJmAY9TaOC1q5Tw/kE2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73673935"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73673935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 15:56:37 -0800
X-CSE-ConnectionGUID: y7Sr2fWjQ0Sly+Q+X5oSkA==
X-CSE-MsgGUID: 43vUbgV+TQe9//eQNzrTSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246596106"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2026 15:56:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlyLq-00000000dUQ-496d;
	Fri, 30 Jan 2026 23:56:34 +0000
Date: Sat, 31 Jan 2026 07:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Varad Gautam <varadgautam@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: {standard input}:17432: Error: pcrel offset for branch to
 .LS0015 too far (0x3e)
Message-ID: <202601310739.vjLMR6Yb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d310797262f0ddf129e76c2aad2b950adaf1fda
commit: 8327bd4fcb6c1dab01ce5c6ff00b42496836dcd2 asm-generic/io.h: Skip trace helpers if rwmmio events are disabled
date:   4 months ago
config: csky-randconfig-r072-20260131 (https://download.01.org/0day-ci/archive/20260131/202601310739.vjLMR6Yb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310739.vjLMR6Yb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310739.vjLMR6Yb-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:17432: Error: pcrel offset for branch to .LS0015 too far (0x3e)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
