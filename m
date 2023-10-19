Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2391DFF8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c06OAsZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697717231; x=1729253231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlfnQM+9xvFRgtwUxX49bA+Jz/LAry6/RVpi1eNm1dU=;
  b=c06OAsZOpV8OPCCjB+fgsR5DfZBLrKOb7akpLvQM+MySWs675dWQ3CIG
   2luxHNntFNi5q2esYJlZO8spg+tkWC1RBzp522dd5ikgPU/zjsen9D1dM
   0CGjWAux0bSFI3Zh5NNnLTO77lLCbKcY9/tFUKvIXAfnR7jClAva5m/FA
   5fm0hi2DXLUQtjczUGCBQpR1xkstQKsXLruJw3OVkl0ScX7wTEA8drdI+
   txkaKsTVgx6sCn/81zKrXVtnbF1YEGapLH//hktvKuQsLo3yKmlD3+Erh
   F4FCVxqbCK51w417qCInDqx8bDJUSI9wh84LKu/zOHd12Umrcnheo2Vdf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="366473286"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="366473286"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 05:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1088342760"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="1088342760"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2023 05:07:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtRnv-00025a-0S;
	Thu, 19 Oct 2023 12:07:07 +0000
Date: Thu, 19 Oct 2023 20:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 17/17] kernel/trace/trace_events.c:1782:51:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 4 has type 'unsigned int'
Message-ID: <202310192055.dyZcMY7V-lkp@intel.com>
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
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310192055.dyZcMY7V-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192055.dyZcMY7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192055.dyZcMY7V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_events.c: In function 'ftrace_set_trace_pidns_read':
>> kernel/trace/trace_events.c:1782:51: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
    1782 |                 snprintf(buf, sizeof(buf), "pid:%lu", tr->filtered_ns->ns.inum);
         |                                                 ~~^   ~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                   |                      |
         |                                                   long unsigned int      unsigned int
         |                                                 %u
--
   kernel/trace/trace.c:478: warning: Function parameter or member 'this_tr' not described in 'trace_array_put'
   kernel/trace/trace.c:558: warning: Function parameter or member 'filtered_no_pids' not described in 'trace_ignore_this_task'
>> kernel/trace/trace.c:558: warning: Function parameter or member 'filtered_ns' not described in 'trace_ignore_this_task'


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
