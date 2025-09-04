Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55723D7C7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004773; cv=none; b=q41t3XC9/TQd7OB213kKmiPS4f/RqANUV9wtfGtAKLrOhDaajgs6ppSEAWMrqcyuCXdDPGF/DtxfaCFQeCO4F9SWrtfkWrBB7RH1kT44YDcMaLCZheEwlI3H3XWxdsKz2qcIYSE9s5EJXIEiKJK7hZ28nC2EPcICcFPzQ8gadNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004773; c=relaxed/simple;
	bh=19TYjnY2OcYhkXyxuSM1TRY31pdrEDoN9ZOH23PUDXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M69fCWrV7q5lv2ts+ubqKfsK57W35c/RfiRrhLz0s50NdAHQPJyiBEwRcaM2gteBmaXst0DC4nKOUxjhmoQAkW/g9g4cUFpgvopGu3corr4Y2r+feoxxiXQDI9kGQ+ob+1dQMNik6gMM9K8oDXKNdMJQbeI+QSr4v3Zp+HMkdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyZTQlhm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyZTQlhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757004773; x=1788540773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19TYjnY2OcYhkXyxuSM1TRY31pdrEDoN9ZOH23PUDXo=;
  b=XyZTQlhmKM6r2U2Ms2kyedA7MrspAPtAzJ9dDfDZJCuNOLt5Ky7KLYhH
   umfbTJTMmv3nWpKMWyeO/dOnhhQWdknDmhoT6ZN4PGe3Oj2saraS1sM/C
   vyvlxzY80ypteujlb+YpvuAFW00wrt6bIAMPUtrkcGRmt67vm8tn6x3h1
   BEqiX/6+ajnd/zc2Mi8rp3awf7obWH7mZk5lVkmIIEPESvjiolGWNXVF1
   QFsCvaYslQvTOmhpFJLwG2HcUSwqXt556IvYgcnlbR35E2xbAJx56kQKn
   uTOS3tkVnPBTDhhJzcdMoCmRyWaQdRjw258snTFAN9FhXo6M51SUbp3cl
   A==;
X-CSE-ConnectionGUID: vBtTJ6+UTNOQ6LxK4ALQbw==
X-CSE-MsgGUID: Ebi183WqRUa3fWtJ/HAwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81940984"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81940984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 09:52:52 -0700
X-CSE-ConnectionGUID: 4hwcH9irS4q38umVVnR6Fg==
X-CSE-MsgGUID: /IQP44JkSEi4M3Hl5atsgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="172382929"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2025 09:52:50 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuDCB-0005WQ-02;
	Thu, 04 Sep 2025 16:52:30 +0000
Date: Fri, 5 Sep 2025 00:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>
Subject: [linux-next:master 6141/6355] kernel/panic.c:70:6: sparse: sparse:
 symbol 'panic_this_cpu_backtrace_printed' was not declared. Should it be
 static?
Message-ID: <202509050048.FMpVvh1u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ac65880ebca1b68495bd8704263b26c050ac010
commit: 28ec7e0d834d81ef8abeb6a6c1376f1fb26f1510 [6141/6355] panic: remove redundant panic-cpu backtrace
config: i386-randconfig-r132-20250904 (https://download.01.org/0day-ci/archive/20250905/202509050048.FMpVvh1u-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050048.FMpVvh1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050048.FMpVvh1u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/panic.c:70:6: sparse: sparse: symbol 'panic_this_cpu_backtrace_printed' was not declared. Should it be static?

vim +/panic_this_cpu_backtrace_printed +70 kernel/panic.c

    68	
    69	bool panic_triggering_all_cpu_backtrace;
  > 70	bool panic_this_cpu_backtrace_printed;
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
