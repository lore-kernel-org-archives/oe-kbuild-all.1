Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FA5199EAD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437164; cv=none; b=fVNTfR4BVhPImDmioOgNuvdZvIf26ipSlZvK0G6sYWtVmzWrXtz37Uzl1aeVD+t578NSD5b7drO4czDtn687XUu2V7Pdr+uwGrn9tN6PI5WPKBpBaPDdk+EQSiyRatMLZm7T4t4TmylsBuGHg67WDUUKnUa9M6f2UNMMYbizTbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437164; c=relaxed/simple;
	bh=rjASPyEXwpUuCGFKs+LnaY4ZOqCiAgQCLtg0d2l1WZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GtSEwYq3e+ld15oASX3jjuSkobi4l7eeKusJA2Qjg8Kan8rlaKsYbEVlj92TFyTWi3q2Pf4M7tLH5XbFfpBj3jViqCcQt8SRZ0Y/RzGC7e75UbgpWE49+euXL24yw36C3Ul/MHI0prxSGNM3Cy0ABzyQAOZZTckKEmDvlx5Yz2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kv1xhGm8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kv1xhGm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772437163; x=1803973163;
  h=date:from:to:cc:subject:message-id;
  bh=rjASPyEXwpUuCGFKs+LnaY4ZOqCiAgQCLtg0d2l1WZ0=;
  b=kv1xhGm8PGQ9RnQ6oVKEVf+hp+OLe9LTYTKIV99Mew2DOQ4hqF6YjbJ9
   A1akdgkymdwKZqdkVVj4SE9MxyB4/wQXs3NhEpSq2R+EntL3kLPytv2aC
   LNO/VESaTjY/nfLxeW2FkEhZa8pjYiS4Ip0D5+h6YyT1KusRvwFVPGcMd
   Y0d2fQY31gCeNTQ/a1BzXNipkZM1EWR1sFDrrITpLk0OEbaeucjJNujH+
   Ug2VmExFH6bC7WVg8EUEbixwqOeA3R4XY7dNr3z+nVuUZAK2Z4mpsgF0Y
   gVkJP/i2bCm58r3IUE33+tCf2F9pZuTloezWYMB1kX/j/a+O0DYusfE/S
   Q==;
X-CSE-ConnectionGUID: 6remKVprSC2v2EglEV/5QQ==
X-CSE-MsgGUID: lPbwIgRXTF6gKlBMkMgHSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73549521"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73549521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 23:39:19 -0800
X-CSE-ConnectionGUID: tK0RZA4STQuEgBActbOg1w==
X-CSE-MsgGUID: Ac4ZBZvgQZSFxUsAit1LUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="222068348"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2026 23:39:16 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwxs1-000000000aD-25sp;
	Mon, 02 Mar 2026 07:39:13 +0000
Date: Mon, 02 Mar 2026 15:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 7/14] undefined reference to
 `irq_proc_calc_prec'
Message-ID: <202603021544.rqXZncbO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   81f5ad552e6edb1dcf872e7c1f4ea54298056007
commit: f4153c1b78f7bcf77d6f5c45a8fdf9fe17b09f66 [7/14] genirq: Calculate precision only when required
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260302/202603021544.rqXZncbO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021544.rqXZncbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021544.rqXZncbO-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/irq/irqdesc.o: in function `irq_set_nr_irqs':
>> (.init.text+0x14): undefined reference to `irq_proc_calc_prec'
   hppa-linux-ld: kernel/irq/irqdesc.o: in function `early_irq_init':
   (.init.text+0x138): undefined reference to `irq_proc_calc_prec'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
