Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3408BA54
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 03:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZYKo7ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697944363; x=1729480363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+fbbFdIClxnY6JOhKXHwLXYqaMhnA3SR7zyMOVOPyc=;
  b=TZYKo7ldJ++59/pgaDtWgbx2q5QkyRFtAq/Dm0luDVQdep35Glpzxzoa
   D+26pV3VbqLnDSZpsndWtvLZkXoseborO4LzT9AiAHiCgczl1amXPm8C0
   LZbO0SM+JEHJExsQ4VZBAhrBDKmDs3I3nALc0tReDkB5rlVm8dcjrrxTX
   GTX4wCkr6YAoFBbq0CZJDyxIf7tO/vdrqXeJbYbmxF4oJDYbl0ptkH6/b
   5YnoYtW+dosi6b7hMlYXsIU5NaZprhoNfjuK8KqhuQhkgETHs4BYziIio
   w1iLpTiB3b9T0lAw43UadsVdVo40q71h0T18jv2eBmDYLNmh6GYQc59Qh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="389529417"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="389529417"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 20:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089106533"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1089106533"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2023 20:12:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quOtJ-0005WR-0P;
	Sun, 22 Oct 2023 03:12:37 +0000
Date: Sun, 22 Oct 2023 11:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 17/17] kernel/trace/trace_events.c:1761:30:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202310221115.WTlmFNF8-lkp@intel.com>
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
config: i386-randconfig-061-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221115.WTlmFNF8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221115.WTlmFNF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221115.WTlmFNF8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_events.c:775:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events.c:775:31: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events.c:775:31: sparse:     got struct event_filter [noderef] __rcu *filter
>> kernel/trace/trace_events.c:1761:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct pid_namespace *ns @@     got struct pid_namespace [noderef] __rcu *filtered_ns @@
   kernel/trace/trace_events.c:1761:30: sparse:     expected struct pid_namespace *ns
   kernel/trace/trace_events.c:1761:30: sparse:     got struct pid_namespace [noderef] __rcu *filtered_ns
>> kernel/trace/trace_events.c:1763:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct pid_namespace [noderef] __rcu *filtered_ns @@     got struct pid_namespace *[assigned] filtered_ns @@
   kernel/trace/trace_events.c:1763:25: sparse:     expected struct pid_namespace [noderef] __rcu *filtered_ns
   kernel/trace/trace_events.c:1763:25: sparse:     got struct pid_namespace *[assigned] filtered_ns
   kernel/trace/trace_events.c:1765:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct pid_namespace *ns @@     got struct pid_namespace [noderef] __rcu *filtered_ns @@
   kernel/trace/trace_events.c:1765:30: sparse:     expected struct pid_namespace *ns
   kernel/trace/trace_events.c:1765:30: sparse:     got struct pid_namespace [noderef] __rcu *filtered_ns
>> kernel/trace/trace_events.c:1782:57: sparse: sparse: dereference of noderef expression

vim +1761 kernel/trace/trace_events.c

  1719	
  1720	static ssize_t
  1721	ftrace_set_trace_pidns_write(struct file *filp, const char __user *ubuf,
  1722			size_t cnt, loff_t *ppos)
  1723	{
  1724		struct trace_array *tr = filp->private_data;
  1725		unsigned long pid;
  1726		struct task_struct *tsk;
  1727		char buf[16];
  1728		struct pid_namespace *filtered_ns = NULL;
  1729	
  1730		if (cnt >= sizeof(buf))
  1731			return -EINVAL;
  1732	
  1733		if (copy_from_user(buf, ubuf, cnt))
  1734			return -EFAULT;
  1735		buf[cnt] = '\0';
  1736		if (cnt && buf[cnt-1] == '\n')
  1737			buf[cnt-1] = '\0';
  1738	
  1739		if (!strcmp(buf, "self")) {
  1740			filtered_ns = task_active_pid_ns(current);
  1741			if (!filtered_ns)
  1742				return -EINVAL;
  1743		} else {
  1744			if (kstrtoul(buf, 0, &pid))
  1745				return -EINVAL;
  1746	
  1747			if (pid) {
  1748				tsk = find_task_by_vpid((pid_t)pid);
  1749				if (!tsk)
  1750					return -EINVAL;
  1751	
  1752				filtered_ns = task_active_pid_ns(tsk);
  1753				if (!filtered_ns)
  1754					return -EINVAL;
  1755			}
  1756		}
  1757	
  1758		mutex_lock(&event_mutex);
  1759	
  1760		if (tr->filtered_ns)
> 1761			put_pid_ns(tr->filtered_ns);
  1762	
> 1763		tr->filtered_ns = filtered_ns;
  1764		if (tr->filtered_ns)
  1765			get_pid_ns(tr->filtered_ns);
  1766	
  1767		mutex_unlock(&event_mutex);
  1768	
  1769		*ppos += cnt;
  1770		return cnt;
  1771	}
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
