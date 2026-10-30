Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793404024;
	b=jX90UOR8iMYH10OvZj7hyKYsLMqxifRUhVNkInNdi9M2H3f7tXIyVbVFUIwuMR6eK+3P
	 xFlctyrXVV0QyL6/rFF3ROt9Qs20tA9wnh6o5xayA66pQ0GVcD5CiggqpePcknQmmbH/S
	 pEQqZtnpSVn5mF2PJQ9+OYPQF1Qpt3a1XQvpioRI1ZPi8Jyhd3j5z/Gn11x2EIXNKkBrR
	 ol6CNT1j0KWCJsnGFHZvf8IC9NTRsLIM3jLQ2mvpZ8e5qptvtSxjUqosdEANsasjSjNIb
	 qpAfjrKvOfkcKuAa16orSRzwsXdkLZkdCz6LWkJdUnFEQKTG9ZAsjp0r78JluB3ScpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793404024;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tQv2O1esfl0eoVhxB6Rp382mf9pOiY3Vjd1UwkDATWo=;
	b=Jx0AiMiUetYrzoiGjqBsLxe4P1aQR3NHbS7e+LbO5f+dS7p3rhCYsoFKCgq7v6ffjis9
	 QpRMHhXpp7ldCd5zwFp/gp37uiAiKyPgNB9ag8GqywF1HyzqVo9RMYaoKXqWsOjSoRLg5
	 uxfWxg+OyO0qNKCYbHyF52sqlb6Zpg+jhGTzbANvTVw+/wbR8t3qkOtGr2FP6dpncueK3
	 n9kijWwiDxLQcsKSUgWQ/oMfxRJNhtR8K5+SgfhHuR8mH9G6fSYVYJwFd5mVZn8rJsp71
	 vGdbEljbb79wSMfowLWMRinRIxz5eeStlWCj5w09h7wAjiVZb6eHatDKSYulc9E7FvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+DlbV8I;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E080606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 23:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E080606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+DlbV8I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793404007; x=1824940007;
  h=date:from:to:cc:subject:message-id;
  bh=L3wrIXpUE24gjbb3K5Eggl9gVPhcGttRiJYaJrtkqZg=;
  b=f+DlbV8ItRQxuJFOcQg/aHwaHMx8YQs+gjw326YeG0iHjkUx2CtYX1+U
   gXpKL6l3UPVOuUHP6JKWqq/u8+OeMjsHbxPCEdhySYJ0sV/tZScVFeNBB
   gQVxnnKNeLF5gldLomM1r5B/Tpdn4WsC7h/vRwg6V5OfwJF4awhhxYwAI
   XuaBcbQOj5Cgt19L4IDsF3GLy3wEoee2I7PRyiLRPHs7GsxwXYMnr3Sen
   FcCyIiW+GjwIBFjJpVb+MaCUu5ULiOTHUH8/o66CTMak8FIiWsRkKQyY4
   0cHUfvoKJN5AylqehxZjNiSpKFJn7Q5uj7+Zrj75Fw8AuQYRwPovgMgiB
   A==;
X-CSE-ConnectionGUID: nRoQeR2RSouNwTQZS72PqQ==
X-CSE-MsgGUID: pLgAJsWrTbuXQyKJiBhoyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2064043"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2064043"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 16:46:46 -0700
X-CSE-ConnectionGUID: pWEeE2MEQ+O5lDGDO822AA==
X-CSE-MsgGUID: uMzbwh/MTsS6NKqc/iVoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5900617"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2026 16:46:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMwJ1-000000005m3-07nc;
	Fri, 30 Oct 2026 23:46:43 +0000
Date: Sat, 31 Oct 2026 00:46:18 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 fs/file.c:692:14: sparse: sparse: incorrect type in assignment (different
 address spaces)
Message-ID: <202610310003.NyICw6Wj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 8f697ee8505606b481d209e8c5bb390bcff0c1f5 [1/1] BACKPORT: file: let pick_file() tell caller it's done
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261031/202610310003.NyICw6Wj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310003.NyICw6Wj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310003.NyICw6Wj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:378:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:378:17: sparse:     expected struct file **old_fds
   fs/file.c:378:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:379:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:379:17: sparse:     expected struct file **new_fds
   fs/file.c:379:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:394:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:394:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:394:17: sparse:    struct file *
   fs/file.c:429:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/file.c:429:54: sparse:     expected struct file *file
   fs/file.c:429:54: sparse:     got struct file [noderef] __rcu *[assigned] __ret
   fs/file.c:494:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:494:28: sparse:     expected struct fdtable [noderef] __rcu *fdt
   fs/file.c:494:28: sparse:     got struct fdtable *
>> fs/file.c:692:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] file @@     got struct file [noderef] __rcu * @@
   fs/file.c:692:14: sparse:     expected struct file *[assigned] file
   fs/file.c:692:14: sparse:     got struct file [noderef] __rcu *
   fs/file.c:855:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:855:14: sparse:     expected struct file *file
   fs/file.c:855:14: sparse:     got struct file [noderef] __rcu *
   fs/file.c:906:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:906:30: sparse:     expected struct file *file
   fs/file.c:906:30: sparse:     got struct file [noderef] __rcu *
   fs/file.c:1154:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@
   fs/file.c:1154:16: sparse:     expected struct file *tofree
   fs/file.c:1154:16: sparse:     got struct file [noderef] __rcu *

vim +692 fs/file.c

0ee8cdfe6af052 Al Viro           2012-08-15  669  
8f697ee8505606 Christian Brauner 2021-04-02  670  /**
8f697ee8505606 Christian Brauner 2021-04-02  671   * pick_file - return file associatd with fd
8f697ee8505606 Christian Brauner 2021-04-02  672   * @files: file struct to retrieve file from
8f697ee8505606 Christian Brauner 2021-04-02  673   * @fd: file descriptor to retrieve file for
8f697ee8505606 Christian Brauner 2021-04-02  674   *
8f697ee8505606 Christian Brauner 2021-04-02  675   * If this functions returns an EINVAL error pointer the fd was beyond the
8f697ee8505606 Christian Brauner 2021-04-02  676   * current maximum number of file descriptors for that fdtable.
8f697ee8505606 Christian Brauner 2021-04-02  677   *
8f697ee8505606 Christian Brauner 2021-04-02  678   * Returns: The file associated with @fd, on error returns an error pointer.
8f697ee8505606 Christian Brauner 2021-04-02  679   */
278a5fbaed89da Christian Brauner 2019-05-24  680  static struct file *pick_file(struct files_struct *files, unsigned fd)
483ce1d4b8c3b8 Al Viro           2012-08-19  681  {
8f697ee8505606 Christian Brauner 2021-04-02  682  	struct file *file;
483ce1d4b8c3b8 Al Viro           2012-08-19  683  	struct fdtable *fdt;
483ce1d4b8c3b8 Al Viro           2012-08-19  684  
483ce1d4b8c3b8 Al Viro           2012-08-19  685  	spin_lock(&files->file_lock);
483ce1d4b8c3b8 Al Viro           2012-08-19  686  	fdt = files_fdtable(files);
8f697ee8505606 Christian Brauner 2021-04-02  687  	if (fd >= fdt->max_fds) {
8f697ee8505606 Christian Brauner 2021-04-02  688  		file = ERR_PTR(-EINVAL);
483ce1d4b8c3b8 Al Viro           2012-08-19  689  		goto out_unlock;
8f697ee8505606 Christian Brauner 2021-04-02  690  	}
a759905de9cd6e Theodore Ts'o     2023-03-06  691  	fd = array_index_nospec(fd, fdt->max_fds);
483ce1d4b8c3b8 Al Viro           2012-08-19 @692  	file = fdt->fd[fd];
8f697ee8505606 Christian Brauner 2021-04-02  693  	if (!file) {
8f697ee8505606 Christian Brauner 2021-04-02  694  		file = ERR_PTR(-EBADF);
483ce1d4b8c3b8 Al Viro           2012-08-19  695  		goto out_unlock;
8f697ee8505606 Christian Brauner 2021-04-02  696  	}
483ce1d4b8c3b8 Al Viro           2012-08-19  697  	rcu_assign_pointer(fdt->fd[fd], NULL);
483ce1d4b8c3b8 Al Viro           2012-08-19  698  	__put_unused_fd(files, fd);
483ce1d4b8c3b8 Al Viro           2012-08-19  699  
483ce1d4b8c3b8 Al Viro           2012-08-19  700  out_unlock:
483ce1d4b8c3b8 Al Viro           2012-08-19  701  	spin_unlock(&files->file_lock);
278a5fbaed89da Christian Brauner 2019-05-24  702  	return file;
278a5fbaed89da Christian Brauner 2019-05-24  703  }
278a5fbaed89da Christian Brauner 2019-05-24  704  

:::::: The code at line 692 was first introduced by commit
:::::: 483ce1d4b8c3b82bc9c9a1dd9dbc44f50b3aaf5a take descriptor-related part of close() to file.c

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
