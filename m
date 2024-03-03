Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BB679DCA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 22:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709504662; cv=none; b=aDifYJwBPTrZJZVT7tYj0NQQXXL9D+2bgDVE9OIaqVibWBjDorWr+zEbNC8QYFMuJKIG8TAPs/FxXvh3Jg5U/Y3m3jRrQgNds9wBhdzw43c4sdtKb2YYUdgL/UlUHoR11H3Aey0JyHr718n0azCOr5untdYbNXqcPLc6x5/1It8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709504662; c=relaxed/simple;
	bh=L6blNTNeg9rx+DKwogoaBx8GckMe2II/M0J/XrT+O0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MxiQLP8GH2eFDc8jO1H95+6ENl370FUETmIZy3y3kuWDXaPFlLpJFuIdz0BtYmBQQHicmR/EsaYezOylgIQ+cWYbssm1k7AVIbdimWeu3Wdvm/RwOMpblNuOj+2VMwVFEKiEpTgmcWprez4OS8ak49f8Pez8T/2GavErSAP8b5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZI3KIMR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZI3KIMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709504661; x=1741040661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6blNTNeg9rx+DKwogoaBx8GckMe2II/M0J/XrT+O0A=;
  b=AZI3KIMRzgkK99vcm37PZpdvfCjzFG6Z/jJxCASrT8pWE6vZu695DKfn
   XeSzXEXLwYuFuZUjC7SYVVQ7uzHlMMinZkUvgswwgHjdFqIbE9+VKC+F5
   MJJMofT1p6xx/bzESuBeDjYNuqVI3xTl43LGgRn2rvmQQ7zaaoOquSoC3
   y/AgPvGNGYCf0aDiNGsUqus03Njlg+sk1lFFfJ36x6CkmE0OL4emU7cJR
   5ugpyE9R8bllX4DY0IdPyevo26XOgbXxFvNTw0IAvYgZAru57R9ktuA/C
   xZCr1vJk+zTedTdazdBXxOUsEjaqop+SU4QCK4R7K4vs5OLXlg9hZHqMt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="29407116"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="29407116"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 14:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9362646"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2024 14:24:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rguFj-00029I-2j;
	Sun, 03 Mar 2024 22:24:15 +0000
Date: Mon, 4 Mar 2024 06:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_syscall_bench 2/3] kernel/bpf/syscall.c:5538:16:
 error: implicit declaration of function 'uprobe_run'; did you mean
 'uprobe_munmap'?
Message-ID: <202403040650.aufSkIeL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_syscall_bench
head:   7608d326bfcd1cfbaaced7e7dc887182474f0419
commit: 5f7deccde51fc7d1582883a6019d75b28ae4d09f [2/3] bpf: Add BPF_UPROBE syscall cmd
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040650.aufSkIeL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040650.aufSkIeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040650.aufSkIeL-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_run_uprobe':
>> kernel/bpf/syscall.c:5538:16: error: implicit declaration of function 'uprobe_run'; did you mean 'uprobe_munmap'? [-Werror=implicit-function-declaration]
    5538 |         return uprobe_run(attr->uprobe.vaddr, regs);
         |                ^~~~~~~~~~
         |                uprobe_munmap
   cc1: some warnings being treated as errors


vim +5538 kernel/bpf/syscall.c

  5533	
  5534	static int bpf_run_uprobe(union bpf_attr *attr)
  5535	{
  5536		struct pt_regs *regs = task_pt_regs(current);
  5537	
> 5538		return uprobe_run(attr->uprobe.vaddr, regs);
  5539	}
  5540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
