Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E46E57898
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344946; cv=none; b=sDAWdL7dPw1NTIPSQwXqowJnfr7Hk57FeJ1jMjFhBcVi93d+2mu9YDM2cy7ZY/ooINxqPjHzEmp74hv21DzCRT+/lIDthpo6LVg6xqqZGx0OA6iQPbvPtfiW5mdrJ8OHzmAZys+itBcfpivzBvJyBJdHn+fBHEj9ZPrKKOYOlnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344946; c=relaxed/simple;
	bh=CTTUXRmxeqSgfTryIjEvhwn3CKw6JQSOoYn+4nDIR2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WoeMdbPyB5x6EBIgLD63DNpYL7i+lzKF4uVf7c9WoImMzQxqU84aBpAHC1s4HHMtpdoYsmkdINZWr8pm5tT7fxFi3XaUk+4AK61x5GcFvdXaBhLwVeJKPpBJ9APeYsKFiDo4fvXRaxhv2bItT0icP6pUcSwmj1838UCqxfPUAas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ng/00yFe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ng/00yFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713344945; x=1744880945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTTUXRmxeqSgfTryIjEvhwn3CKw6JQSOoYn+4nDIR2g=;
  b=Ng/00yFennPAH972566whFauj3iNNrDHUae/H9dxePshO2xJw65QqFvc
   aQvkAHnz7t0xbPUdG4GsdW1RNhKQNVBfy8LCS+iTzHbpGSvDn+OU/b7Ss
   FV17AJd1f+kYdXQH/HDAmblE74K2pq5WtsWFVKGshp8cRoTAxoQCBwzRk
   RC8MrhOrLo6TYmVeOp2vO6LfZ4RRMtKzgCnur7/IUnfK45+UoIZsv+5s6
   4QmHvsHMkBjdNK0uXVsRu844EtrpXnIonxStBTD/9WXtZK5JN+Zt7nwc7
   r+DhAO1qWdBdoFVF5UV3M11L1TuZQ0KG7HfdTNc3AePh4nsiMVEbMjpNk
   w==;
X-CSE-ConnectionGUID: MGxSVIklT8SbZGMQMv3Ohg==
X-CSE-MsgGUID: XKsEADfVSK+yKYKmObbCWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8686797"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8686797"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 02:09:04 -0700
X-CSE-ConnectionGUID: otLmmqjEQmWiD3SpAFwc5g==
X-CSE-MsgGUID: yOLkmcYATVOMOTnpC1AmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="27358011"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Apr 2024 02:09:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx1Hp-0006Lx-0O;
	Wed, 17 Apr 2024 09:09:01 +0000
Date: Wed, 17 Apr 2024 17:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Heinz Mauelshagen <heinzm@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:dm-buffered 7/17] dm-buffered-target.c:undefined reference
 to `async_memcpy'
Message-ID: <202404171656.an03Qm1r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git dm-buffered
head:   61809d6beedae322267e76fa83208920524ae660
commit: 5a10ed77f911ce885efce267e587ffebd49c8f10 [7/17] dm buffered: test target buffering all I/O through dm-bufio
config: mips-randconfig-r111-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171656.an03Qm1r-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404171656.an03Qm1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171656.an03Qm1r-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/md/dm-buffered-target.o: in function `_memcpy.isra.0':
>> dm-buffered-target.c:(.text+0x1368): undefined reference to `async_memcpy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
