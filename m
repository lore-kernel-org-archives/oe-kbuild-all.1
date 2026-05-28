Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5D33987F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 20:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000808; cv=none; b=Ztl6o1boLHYQycf4H8n1OeeRsHOsS6VWXiiMblJnJ3EKqhepbwSDwwJLnEk00nIJjJiG2fztyfrRXkKucaHh0MDELBKzbwaHpPtq3U+aF7J+XJzDlvzXY4CzO6pKltdC7ULViWqeU3Irw82vlSPngJT+Y2AyZ1sSFXF7iH7tiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000808; c=relaxed/simple;
	bh=YXzjn+CYBlBk28dJARC3ueeQJ4nYdX7+DJFfkJ5nOhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SS3jZI1U5voQqiEyB0cjyf9vuXcZ395YyrWEXyLRvLEFreKHy8w0BKYlsxjQuTOFMoTs1N62cjXXUs8KeFlXsnR/HnriW/ohWIHyVfvOwU5vgHGYQ6gJrEouIMiVn+6v3aM4Pa2a23d8HBJK+36qWVT3GiOsZClJwLfoXBHRxPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKkM4JMs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKkM4JMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780000807; x=1811536807;
  h=date:from:to:cc:subject:message-id;
  bh=YXzjn+CYBlBk28dJARC3ueeQJ4nYdX7+DJFfkJ5nOhA=;
  b=gKkM4JMshB2BZyji2Qx9AwbcN0hLcteT4J3wLpC1YjgWrUt/gLL/liWP
   QPbbdxrVumiW/FXOScO3+vrOAMymAZtFlDucDKZFcB1AXX7SX1GxL0mlH
   hPdzuBqmfSc7nYjkxzD7gzFrcv4IypzC5ErHm0Spcj7q7ikf+3pkaUfNl
   XWHEegW/Enn5SdbwWKyO0V7tPshVaEKH9On6YymFgdFD/Lgr1aIgZctZT
   5l0CwxzifCYKPujWpQi4hhnbEUplSflZ/h4fCu0jOcZyupuVYpws1fIo0
   HnkSIuMEBRzTMbeIRhH7oKmkMYss++bDGRKpFsc/e4gHATShGmvsNO3Mp
   g==;
X-CSE-ConnectionGUID: W/GObMLGQiuPQ5JhsEcx+A==
X-CSE-MsgGUID: TBsoSlCLSnOGSySYgtRZHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91161417"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="91161417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 13:40:06 -0700
X-CSE-ConnectionGUID: JyuWloIZReCrINhdXjuBkg==
X-CSE-MsgGUID: AA2+iPa8Tj6JnrK7qHCjmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247600052"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 13:40:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wShWM-000000006Qg-1H1m;
	Thu, 28 May 2026 20:40:02 +0000
Date: Fri, 29 May 2026 04:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 16/23] <stdin>:1636:2: warning:
 #warning syscall rootns_kill not implemented
Message-ID: <202605290458.WY4rV87X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   a7fde1280c1b227b71c5104a5d1fd909e0cb77cf
commit: da83f86c3cc6d1e45d3612acc20e200409a7f196 [16/23] rootns: Implement rootns_kill()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260529/202605290458.WY4rV87X-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290458.WY4rV87X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290458.WY4rV87X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
>> <stdin>:1636:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
