Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285462C1A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342650; cv=none; b=Kro1YSFuYVvAgI4YsbZ2PfHIlFmDqKOheOEiLZIiY5hmTnrJdw2NfYbhM+wH17zgcFmcrk8fdn9Jxa2VwkFDetT3pqIzcInp8etxZbNeg87kImjoAUrhXsb6bc06cZIJQTa7+DYUBlNekBYHZQMevuIOf1ve/5j2kdUL+mbswoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342650; c=relaxed/simple;
	bh=ZM4S4Pw5+t0i0hvcMLpWHR8CsIJzaYwoNRTk5Cb1vNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxmYxcfATfh/lZG+t971Mp7+OgfvXdNfBOsQKVh+vLcixAtifMXXuG88UPSspgKN/vPjfylBtDtWFQz703NaN0l0baSc/PF89eUrQ5OYw6ej1s2ZaROfn2hX9+KY8dDoMgy1tDolQB7RRuQmbm84WM1nVTi3biwQmLB5MWRRaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZbg2K6m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZbg2K6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708342648; x=1739878648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZM4S4Pw5+t0i0hvcMLpWHR8CsIJzaYwoNRTk5Cb1vNw=;
  b=RZbg2K6mf9v7sVFmhhOHRwAIpRUdoGL02AdBiUCJGdWjHvqW41cH4zYy
   5/4yyF2iQ1M3GA2ad3f9ufpUvWzDJGUV/9kmzGpsI/BS5tksB18uW892X
   IaKmb5/iMoQquVz/H+n1KMpWRMHs8y7tTzVlz3rauSvzlgI/dCTcpieaF
   JQ2kp+MVZO1w5grv7bQEjWBO6pfyMpc4K6uoQPBjD3kZH2VcR42NQPZMt
   x86b2zn+FUzS3J52Y7yaLG8zQOSBOwdBwrA7bv2kLJXZ/d9UfKu1+g+Nc
   gpowfBrD+S159bRxzrm9mQwDKeumedSnenZJfSwKBuE5xxYA0mO/sS6yk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19845282"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="19845282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 03:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9056931"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2024 03:37:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rc1xQ-0003kE-04;
	Mon, 19 Feb 2024 11:37:23 +0000
Date: Mon, 19 Feb 2024 19:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7560/7658] powerpc64le-linux-ld: warning: orphan
 section `.bss..Lubsan_data71' from `kernel/ptrace.o' being placed in section
 `.bss..Lubsan_data71'
Message-ID: <202402191918.e1Bz6P1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   35a4fdde2466b9d90af297f249436a270ef9d30e
commit: ce3220bfdf4c1961582456c43744cd48978e310e [7560/7658] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
config: powerpc64-randconfig-r012-20220414 (https://download.01.org/0day-ci/archive/20240219/202402191918.e1Bz6P1w-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191918.e1Bz6P1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402191918.e1Bz6P1w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data71' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data71'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data96' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data96'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data71' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data71'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data96' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data96'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data71' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data71'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data96' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data96'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
