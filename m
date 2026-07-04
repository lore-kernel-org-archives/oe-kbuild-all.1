Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C1433E86
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 16:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783181820; cv=none; b=WJxIkWs+/CiRd4NWthWj3+pea3dJmUrcGIgudLzZZrk7upN7/jXScT/swoo1FmVQnO4rDCzazzeQJ1eI/69LuN/gqs3nZWNVZibc/Fy2GEFQJ27eCRn3o9/RLYy5xz9W8aolzH6xExo4L+sKNcbKN0aa7stZ8DJMY/DPakiT3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783181820; c=relaxed/simple;
	bh=hD1GfPYgsFIkfPfZVHpKcb/TLswNReakutuqk69YlWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dVj79gYf+c37NP2iWjRwkUVlbcXyZLMcSkPtSN3FJHNZn8yAzUPPkrOFeg89gZMvSdLPH9RYOgtAbIBzNP76mlsEltSOJP5SahkYgs4Ok0fJcbDEFuR00Fs2RzQrAvJ3at4sb/J1bb8vMx7TThk1xNlLfTT+yQuQY5W4g8ocvFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULin+An8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULin+An8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783181817; x=1814717817;
  h=date:from:to:cc:subject:message-id;
  bh=hD1GfPYgsFIkfPfZVHpKcb/TLswNReakutuqk69YlWw=;
  b=ULin+An8Nb8QJgLQ8hnUHorwelChNPd2nRkwtvkzNhQNraXhaz1cGx08
   /M0eQyRgMxEw9rsqOARhv6n90c/hWX2xGRRQG6kTmOAeYkoyhIySRhXo0
   wrjHEVFxqaLOd0XmUfnzOklWnljx/qPBWUrcBXVp5NlKRDOGyIERzDzgl
   QFHURYFaK53TTsQFVb1yz0r1KcYQxv4fBuwZyspUXCh0InHBPZoXjvqa9
   CAWLc0Bg4T0krEDexrMFHGIbWy6aeP8OjrWRs1SDLrk/16J6Eq1+wSZ3+
   uXMI8kkOZgwCleIndl7x5qMtMYkqQOqF3ZWzSO0k44ImgMLTa+HJMhbtX
   A==;
X-CSE-ConnectionGUID: HDfUK+bcSa6JR6bN6eHcIA==
X-CSE-MsgGUID: ldYexeT6TZegmuV1VqJLIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="101430880"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="101430880"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 09:16:57 -0700
X-CSE-ConnectionGUID: rJpC/LS1SQi3Ci4DlAyi0Q==
X-CSE-MsgGUID: pDo/XJoLRRiKvBy2Ee2PEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="291474839"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Jul 2026 09:16:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg32y-00000000D9X-3wiZ;
	Sat, 04 Jul 2026 16:16:52 +0000
Date: Sun, 05 Jul 2026 00:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1] kernel/fork.c:1852:
 warning: Function parameter or member 'ret' not described in
 '__pidfd_prepare'
Message-ID: <202607050010.3UDGRYy5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a00af2707c1d0a67daa8f91db74300f65d84db3b
commit: e5d92fd33ffa728f25f7325ebd4adaf14061aa56 [0/1] pid: add pidfd_prepare()
config: i386-randconfig-012-20260702 (https://download.01.org/0day-ci/archive/20260705/202607050010.3UDGRYy5-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050010.3UDGRYy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050010.3UDGRYy5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/fork.c:1157: warning: Function parameter or member 'mm' not described in 'set_mm_exe_file'
   kernel/fork.c:1157: warning: Function parameter or member 'new_exe_file' not described in 'set_mm_exe_file'
   kernel/fork.c:1181: warning: Function parameter or member 'mm' not described in 'get_mm_exe_file'
   kernel/fork.c:1201: warning: Function parameter or member 'task' not described in 'get_task_exe_file'
   kernel/fork.c:1226: warning: Function parameter or member 'task' not described in 'get_task_mm'
   kernel/fork.c:1831: warning: bad line: 
>> kernel/fork.c:1852: warning: Function parameter or member 'ret' not described in '__pidfd_prepare'
>> kernel/fork.c:1852: warning: Excess function parameter 'pidfd' description in '__pidfd_prepare'
>> kernel/fork.c:1901: warning: Function parameter or member 'ret' not described in 'pidfd_prepare'
>> kernel/fork.c:1901: warning: Excess function parameter 'pidfd' description in 'pidfd_prepare'


vim +1852 kernel/fork.c

  1822	
  1823	/**
  1824	 * __pidfd_prepare - allocate a new pidfd_file and reserve a pidfd
  1825	 * @pid:   the struct pid for which to create a pidfd
  1826	 * @flags: flags of the new @pidfd
  1827	 * @pidfd: the pidfd to return
  1828	 *
  1829	 * Allocate a new file that stashes @pid and reserve a new pidfd number in the
  1830	 * caller's file descriptor table. The pidfd is reserved but not installed yet.
  1831	
  1832	 * The helper doesn't perform checks on @pid which makes it useful for pidfds
  1833	 * created via CLONE_PIDFD where @pid has no task attached when the pidfd and
  1834	 * pidfd file are prepared.
  1835	 *
  1836	 * If this function returns successfully the caller is responsible to either
  1837	 * call fd_install() passing the returned pidfd and pidfd file as arguments in
  1838	 * order to install the pidfd into its file descriptor table or they must use
  1839	 * put_unused_fd() and fput() on the returned pidfd and pidfd file
  1840	 * respectively.
  1841	 *
  1842	 * This function is useful when a pidfd must already be reserved but there
  1843	 * might still be points of failure afterwards and the caller wants to ensure
  1844	 * that no pidfd is leaked into its file descriptor table.
  1845	 *
  1846	 * Return: On success, a reserved pidfd is returned from the function and a new
  1847	 *         pidfd file is returned in the last argument to the function. On
  1848	 *         error, a negative error code is returned from the function and the
  1849	 *         last argument remains unchanged.
  1850	 */
  1851	static int __pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
> 1852	{
  1853		int pidfd;
  1854		struct file *pidfd_file;
  1855	
  1856		if (flags & ~(O_NONBLOCK | O_RDWR | O_CLOEXEC))
  1857			return -EINVAL;
  1858	
  1859		pidfd = get_unused_fd_flags(O_RDWR | O_CLOEXEC);
  1860		if (pidfd < 0)
  1861			return pidfd;
  1862	
  1863		pidfd_file = anon_inode_getfile("[pidfd]", &pidfd_fops, pid,
  1864						flags | O_RDWR | O_CLOEXEC);
  1865		if (IS_ERR(pidfd_file)) {
  1866			put_unused_fd(pidfd);
  1867			return PTR_ERR(pidfd_file);
  1868		}
  1869		get_pid(pid); /* held by pidfd_file now */
  1870		*ret = pidfd_file;
  1871		return pidfd;
  1872	}
  1873	
  1874	/**
  1875	 * pidfd_prepare - allocate a new pidfd_file and reserve a pidfd
  1876	 * @pid:   the struct pid for which to create a pidfd
  1877	 * @flags: flags of the new @pidfd
  1878	 * @pidfd: the pidfd to return
  1879	 *
  1880	 * Allocate a new file that stashes @pid and reserve a new pidfd number in the
  1881	 * caller's file descriptor table. The pidfd is reserved but not installed yet.
  1882	 *
  1883	 * The helper verifies that @pid is used as a thread group leader.
  1884	 *
  1885	 * If this function returns successfully the caller is responsible to either
  1886	 * call fd_install() passing the returned pidfd and pidfd file as arguments in
  1887	 * order to install the pidfd into its file descriptor table or they must use
  1888	 * put_unused_fd() and fput() on the returned pidfd and pidfd file
  1889	 * respectively.
  1890	 *
  1891	 * This function is useful when a pidfd must already be reserved but there
  1892	 * might still be points of failure afterwards and the caller wants to ensure
  1893	 * that no pidfd is leaked into its file descriptor table.
  1894	 *
  1895	 * Return: On success, a reserved pidfd is returned from the function and a new
  1896	 *         pidfd file is returned in the last argument to the function. On
  1897	 *         error, a negative error code is returned from the function and the
  1898	 *         last argument remains unchanged.
  1899	 */
  1900	int pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
> 1901	{
  1902		if (!pid || !pid_has_task(pid, PIDTYPE_TGID))
  1903			return -EINVAL;
  1904	
  1905		return __pidfd_prepare(pid, flags, ret);
  1906	}
  1907	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
