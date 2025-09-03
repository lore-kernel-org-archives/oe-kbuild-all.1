Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8EA2FD1A0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901901; cv=none; b=XUgTA7sh5iLla3nmT3gfyuDbLw1WND3TflqsA0nuUU/85G22rnrcAAocnNaERPYIX3AEKjr+5yW2x6UgCixkzIrH1IRbeVV48ACYQpL/bHVOMhBhT5TuzO+SMe1nBsGkt6EXSXqxrHs0WdbUubuNwDNUugzczlQ0fgdCfJ55K/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901901; c=relaxed/simple;
	bh=p/GY5TwtAZWmeu2EfQbqcumEJXrq/XosHVctZYqZzbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mqx9V3T+Sl5thRJWTyJeCV+D969kcpQ3P6qx23uUS5b5Vbin9Qvgg1qsGzOLpeSO/gAUT5PwL9wUa4jQcXTe1XI+DoXKOqthHkNLTXzcwk9Cg8osqCcUq4wiYV+NeIHgUCEaduydvs3IBuqfNJcK9Smqnk+X9Mt3SF4k/c8wi1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yji9YHDU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yji9YHDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756901899; x=1788437899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p/GY5TwtAZWmeu2EfQbqcumEJXrq/XosHVctZYqZzbg=;
  b=Yji9YHDUPsrJXAnG6wmJozoT88+Q/2xe/bG4EVO2S1TRrJwXnBOOja1+
   xc51gS4WMPvgUsJsY1Qyp7Ce8rsCd6PN6cGcdfOfLRXsFI2Bx4JBvinux
   gKNX+NYlGnFbuSYghJfLd8Tabvw1mUWJ5QyFWaj2TGptyX8sD2Ym9/RvR
   RFADiERnsmR8/oqhOBslipedRx1gn9bQlGKJw/OhNRsF9Ufp9t1EmKb8s
   9ym+llsRejoTCdY7eOt/jvKqJO+yJkr8yGpbE9FGc+cci3DQUbyHdokWQ
   OYJSMa35GoPbsrrQTo/eI8pPcZm2uNwNJ61zfEmk2mdXWMwHBoRKb+NNx
   A==;
X-CSE-ConnectionGUID: oV/jA6MaSLeH0jcoQGl4DQ==
X-CSE-MsgGUID: gagb6Vw7SkClk8msy6Erzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58244465"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="58244465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 05:18:18 -0700
X-CSE-ConnectionGUID: kYcrSzD/T0u4ae3On2vo1w==
X-CSE-MsgGUID: IaB4BAq0TsmhzR9/Qzzxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="171455513"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 05:18:18 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utmRL-0003WN-0U;
	Wed, 03 Sep 2025 12:18:15 +0000
Date: Wed, 3 Sep 2025 14:17:39 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] fs/proc/meminfo.c:37:30:
 warning: variable 'sunreclaim' set but not used
Message-ID: <202509031418.AkXJu4Us-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   119e72f374248c57f950f0658c1e1099b40e2ffa
commit: eedf4ae2be04591b38a81690ef85cefd83b78cb3 [1/1] ck: meminfo: Add meminfo support for rich container
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250903/202509031418.AkXJu4Us-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031418.AkXJu4Us-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509031418.AkXJu4Us-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/meminfo.c:37:30: warning: variable 'sunreclaim' set but not used [-Wunused-but-set-variable]
      37 |         unsigned long sreclaimable, sunreclaim;
         |                                     ^
   1 warning generated.


vim +/sunreclaim +37 fs/proc/meminfo.c

e16e2d8e14a14b Joe Perches     2016-10-07  32  
e1759c215bee5a Alexey Dobriyan 2008-10-15  33  static int meminfo_proc_show(struct seq_file *m, void *v)
e1759c215bee5a Alexey Dobriyan 2008-10-15  34  {
e1759c215bee5a Alexey Dobriyan 2008-10-15  35  	struct sysinfo i;
e1759c215bee5a Alexey Dobriyan 2008-10-15  36  	unsigned long committed;
61f94e18de94f7 Vlastimil Babka 2018-10-26 @37  	unsigned long sreclaimable, sunreclaim;
e1759c215bee5a Alexey Dobriyan 2008-10-15  38  	int lru;
e1759c215bee5a Alexey Dobriyan 2008-10-15  39  
eedf4ae2be0459 Xunlei Pang     2021-06-04  40  	struct mem_cgroup *memcg = NULL;
eedf4ae2be0459 Xunlei Pang     2021-06-04  41  	struct sysinfo_ext ext;
eedf4ae2be0459 Xunlei Pang     2021-06-04  42  

:::::: The code at line 37 was first introduced by commit
:::::: 61f94e18de94f79abaad3bb83549ff78923ac785 mm, proc: add KReclaimable to /proc/meminfo

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
