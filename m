Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87481FA5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 05:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710048959; cv=none; b=GcXt07Ywcq3OpmpR378X/Sp52WEwYIL6ltxIKL5UhvUy/kqO4b9Cn901WjpFOZKPnJPZvVqIhaYKVaRjLDCa4YapUX954uVdmo0YL85Mx0+mYjh0U3k6c4t9HBHP8Lv7kW9bf9Yy3mmpZtXDmasiNHVGhaH3OQQDaDLkF9kUd5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710048959; c=relaxed/simple;
	bh=+UFwH0rgYKkTQGrpLkd5Ohz/k86OgB+BjvVcNnpaZFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l04B1anwdbNGcCMrBCFYViAP7Mb1qEh2BMzL6wMhY4EZxBzzQhmk3xQ5CeFohpplY+e4YdFFZP9hdngBbl+vGSP+Ct85FPSLOUFcn912Mcn+RLlViLj+RPPHxlLPZNH/Vd8zg2rrxOZhLDYKyksmxP+hW8C0mkBVlqC0cwk9s/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhoL7vZe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhoL7vZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710048957; x=1741584957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+UFwH0rgYKkTQGrpLkd5Ohz/k86OgB+BjvVcNnpaZFk=;
  b=IhoL7vZeKgEbQOfr3qoxWjsJbM37hpiULl528WrdO685a/A4w6bw3Kpn
   rH3f14eYZNwmd8/RAWg1o1mJ3lOzrkSRjrOOyAeGG2cBZ3SjV9xsWR1lw
   G/1XFJaKGyV+cGItpvj15SDSPDtBK+1rr3zqTzKiQpl6noH1Ob59H06OI
   KU/AF7eCl2bc2sANea08t+CXvKcnpEn54ZnZkWPr56WCurt7wYMQZir4l
   uMCT+NeAEkZ3Q4dZLF64LbdBWokQQ1Hj3CxQlsknzNdb5iuMESDAhajcZ
   kJ1XN2p5NsPGisalOJmxJEli6pngucNNBL95FrovkgisV8fn4YbmXD9+u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8547191"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="8547191"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 21:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="10938982"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2024 21:35:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjBqj-0007xf-2H;
	Sun, 10 Mar 2024 05:35:53 +0000
Date: Sun, 10 Mar 2024 13:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/session_data 44/48]
 kernel/trace/bpf_trace.c:3551:22: warning: "CONFIG_UPROBES" is not defined,
 evaluates to 0
Message-ID: <202403101357.7J9PQati-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/session_data
head:   2de3435b691fe601ea42cb119ba482bd6762d173
commit: 0e436b2093a4fbc9f843e2ce395344d748f5ff20 [44/48] bpf: Add bpf_wrapper_is_return kfunc for multi uprobe
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240310/202403101357.7J9PQati-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101357.7J9PQati-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101357.7J9PQati-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/bpf_trace.c:3551:5: warning: "CONFIG_FPROBE" is not defined, evaluates to 0 [-Wundef]
    3551 | #if CONFIG_FPROBE || CONFIG_UPROBES
         |     ^~~~~~~~~~~~~
>> kernel/trace/bpf_trace.c:3551:22: warning: "CONFIG_UPROBES" is not defined, evaluates to 0 [-Wundef]
    3551 | #if CONFIG_FPROBE || CONFIG_UPROBES
         |                      ^~~~~~~~~~~~~~


vim +/CONFIG_UPROBES +3551 kernel/trace/bpf_trace.c

  3550	
> 3551	#if CONFIG_FPROBE || CONFIG_UPROBES
  3552	__bpf_kfunc_start_defs();
  3553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
