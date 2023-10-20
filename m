Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEDE20E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlpmqosU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697764781; x=1729300781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmFVwUTvBnYaiZx2ABGaVnH9SFpqUC8skty/RBgHOOE=;
  b=hlpmqosU3ysJJGFbZs30WEGGeALLAsHTgQWMa6klFDxpbzosoDkHs5Yl
   ljuNyVchzXrHc7Pe9x4h0O6VZHhCphYXGBNVYY6hlskJDw1yuBMmsWFSe
   EFiWML3ZN87t872rYMeL0qWykN5o9Ro6MTeya5bZvQKXB1AnmEGSmr8ko
   YgkeKflbeAMFYj6pPGAi8kEr3WSH60dHF1gYmkqzUOGZKY0j5ienwn7+8
   khUXNBlq+aLFaLxyOmmdmyg5cqMq+pnbi9CqgiVIonDIsShvMgSLnZSYT
   2rrgqzMUEIO4arHQ+tCVEa7GNHYseoIZNn/Hqw7u2WWMqPq8rwJfcpFov
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385284700"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="385284700"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 18:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004439269"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="1004439269"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2023 18:19:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qteAr-0002p0-2X;
	Fri, 20 Oct 2023 01:19:37 +0000
Date: Fri, 20 Oct 2023 09:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 17/17] kernel/trace/trace_events.c:1782:41:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned int'
Message-ID: <202310200943.8NQOb2yZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   a4cbe70420c545a192b2c214efe1ba0f174d84f4
commit: a4cbe70420c545a192b2c214efe1ba0f174d84f4 [17/17] CHROMIUM: Support ARC atrace from container
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231020/202310200943.8NQOb2yZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200943.8NQOb2yZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200943.8NQOb2yZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang-16: warning: argument unused during compilation: '-mno-global-merge' [-Wunused-command-line-argument]
   In file included from kernel/trace/trace_events.c:27:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:49:
   In file included from include/linux/ftrace.h:21:
   arch/x86/include/asm/ftrace.h:7:3: error: Compiler does not support fentry?
   # error Compiler does not support fentry?
     ^
>> kernel/trace/trace_events.c:1782:41: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                   snprintf(buf, sizeof(buf), "pid:%lu", tr->filtered_ns->ns.inum);
                                                   ~~~   ^~~~~~~~~~~~~~~~~~~~~~~~
                                                   %u
   1 warning and 1 error generated.


vim +1782 kernel/trace/trace_events.c

  1772	
  1773	static ssize_t
  1774	ftrace_set_trace_pidns_read(struct file *filp, char __user *ubuf, size_t cnt,
  1775			  loff_t *ppos)
  1776	{
  1777		struct trace_array *tr = filp->private_data;
  1778		char buf[32];
  1779	
  1780		mutex_lock(&event_mutex);
  1781		if (tr->filtered_ns)
> 1782			snprintf(buf, sizeof(buf), "pid:%lu", tr->filtered_ns->ns.inum);
  1783		else
  1784			strcpy(buf, "not set");
  1785		mutex_unlock(&event_mutex);
  1786	
  1787		return simple_read_from_buffer(ubuf, cnt, ppos, buf, strlen(buf));
  1788	}
  1789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
