Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E9230FF34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765456744; cv=none; b=Zxkk9G/6yTO12BD2fGo+K0q8YgmiMiCzGwQ7tSzLpFrXvEJLZFPiVqp9j2l/Mfj/KAoLLfNENSR4O+hFslreTkSIeZHOrV68y4XrbBrlrWQP9w2xVaKSpLF75wEynd1dYWjnTEl1/60Vopd745afPESnNvb7d2VIFb47OrceK34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765456744; c=relaxed/simple;
	bh=2hmctSsZRV30VqE2MJP8Heq2aL3yzpHPtty91uNfaC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ewUek17lCaJj43qC3G6iPf/VQQwRcFXy7TFbnIVkddqpMHSNNsei2rT3w/7BzjeJfa3RjOtFLjCb/WqPzjhqIeXI9/xCHrECUWWdXOSuaL6gVsDVhNt1Htm3Qxh6HsUC1qEb0CzqLgHe7PmHvRqyxA6X0b/MegoKozuyOKQDU1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEogmsy4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEogmsy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765456742; x=1796992742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2hmctSsZRV30VqE2MJP8Heq2aL3yzpHPtty91uNfaC0=;
  b=QEogmsy4IC55EPaii4xIkuCNo+lmD1JvRYWoVL48lsDYbIzN+IJYXeUP
   Xd8e9H5UeriY7KmsRXhISML2WYjrUVSvnbURUADJR/V3JCaXyR3Y5HlDA
   aR3HgeEOnfpYra6u6fO+aphloEeE80ppDC0v0k665ZJ4OXrMZGEEdzM8Z
   41DeCacSwKSSk5U1mT6hKbP/IPdUvT0o4g6Fq78MKmfS/NseWxsa1iyKU
   GeIAV01dytAapvYuGDSubbqC3hXHabT5Us8QlK5CmF5rxrcibuBoh7mAU
   5O9/FWMDVJcuP1t8uDc0M1ExRzT5ATeNTjHRdTcopQpqSP2UJOj5IwC6y
   Q==;
X-CSE-ConnectionGUID: lZbvOdbzRMS/sUG5rw38/g==
X-CSE-MsgGUID: jZuvX7heRKaCSiOZfMlC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67322283"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="67322283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:39:02 -0800
X-CSE-ConnectionGUID: NMqB5oHgQBmCJ6pJ3w8qGw==
X-CSE-MsgGUID: 9RnbGBJ6Qhil2x0ddDb5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="201259954"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 04:39:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTfwg-000000004eD-0BCD;
	Thu, 11 Dec 2025 12:38:58 +0000
Date: Thu, 11 Dec 2025 20:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 39/39] kernel/fork.c:1954:
 warning: bad line:
Message-ID: <202512112019.wW9KfVX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   dd79c421671d7417fa9ad8465ca823298cd5fa14
commit: 1ced79b25fa29a1b38ef12d5acd85b54e1c8593c [39/39] pid: add pidfd_prepare()
config: i386-randconfig-052-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112019.wW9KfVX8-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112019.wW9KfVX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112019.wW9KfVX8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/fork.c:1257: warning: Function parameter or member 'mm' not described in 'set_mm_exe_file'
   kernel/fork.c:1257: warning: Function parameter or member 'new_exe_file' not described in 'set_mm_exe_file'
   kernel/fork.c:1294: warning: Function parameter or member 'mm' not described in 'replace_mm_exe_file'
   kernel/fork.c:1294: warning: Function parameter or member 'new_exe_file' not described in 'replace_mm_exe_file'
   kernel/fork.c:1346: warning: Function parameter or member 'mm' not described in 'get_mm_exe_file'
   kernel/fork.c:1365: warning: Function parameter or member 'task' not described in 'get_task_exe_file'
   kernel/fork.c:1389: warning: Function parameter or member 'task' not described in 'get_task_mm'
>> kernel/fork.c:1954: warning: bad line: 
   kernel/fork.c:1975: warning: Function parameter or member 'ret' not described in '__pidfd_prepare'
   kernel/fork.c:1975: warning: Excess function parameter 'pidfd' description in '__pidfd_prepare'
   kernel/fork.c:2024: warning: Function parameter or member 'ret' not described in 'pidfd_prepare'
   kernel/fork.c:2024: warning: Excess function parameter 'pidfd' description in 'pidfd_prepare'
   kernel/fork.c:3050: warning: expecting prototype for clone3(). Prototype was for sys_clone3() instead


vim +1954 kernel/fork.c

  1945	
  1946	/**
  1947	 * __pidfd_prepare - allocate a new pidfd_file and reserve a pidfd
  1948	 * @pid:   the struct pid for which to create a pidfd
  1949	 * @flags: flags of the new @pidfd
  1950	 * @pidfd: the pidfd to return
  1951	 *
  1952	 * Allocate a new file that stashes @pid and reserve a new pidfd number in the
  1953	 * caller's file descriptor table. The pidfd is reserved but not installed yet.
> 1954	
  1955	 * The helper doesn't perform checks on @pid which makes it useful for pidfds
  1956	 * created via CLONE_PIDFD where @pid has no task attached when the pidfd and
  1957	 * pidfd file are prepared.
  1958	 *
  1959	 * If this function returns successfully the caller is responsible to either
  1960	 * call fd_install() passing the returned pidfd and pidfd file as arguments in
  1961	 * order to install the pidfd into its file descriptor table or they must use
  1962	 * put_unused_fd() and fput() on the returned pidfd and pidfd file
  1963	 * respectively.
  1964	 *
  1965	 * This function is useful when a pidfd must already be reserved but there
  1966	 * might still be points of failure afterwards and the caller wants to ensure
  1967	 * that no pidfd is leaked into its file descriptor table.
  1968	 *
  1969	 * Return: On success, a reserved pidfd is returned from the function and a new
  1970	 *         pidfd file is returned in the last argument to the function. On
  1971	 *         error, a negative error code is returned from the function and the
  1972	 *         last argument remains unchanged.
  1973	 */
  1974	static int __pidfd_prepare(struct pid *pid, unsigned int flags, struct file **ret)
  1975	{
  1976		int pidfd;
  1977		struct file *pidfd_file;
  1978	
  1979		if (flags & ~(O_NONBLOCK | O_RDWR | O_CLOEXEC))
  1980			return -EINVAL;
  1981	
  1982		pidfd = get_unused_fd_flags(O_RDWR | O_CLOEXEC);
  1983		if (pidfd < 0)
  1984			return pidfd;
  1985	
  1986		pidfd_file = anon_inode_getfile("[pidfd]", &pidfd_fops, pid,
  1987						flags | O_RDWR | O_CLOEXEC);
  1988		if (IS_ERR(pidfd_file)) {
  1989			put_unused_fd(pidfd);
  1990			return PTR_ERR(pidfd_file);
  1991		}
  1992		get_pid(pid); /* held by pidfd_file now */
  1993		*ret = pidfd_file;
  1994		return pidfd;
  1995	}
  1996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
