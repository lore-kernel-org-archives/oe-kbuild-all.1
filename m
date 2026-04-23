Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51925A2BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 03:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913434; cv=none; b=t4TLFDQDSYJwJe9/82MqhEETLATE/yL0fN0rAIKjoUOmcNTuZtbH1MM4wtzpAN49fqr0Iy4Hb32FfTanYG8j3X30Wessl8xG/yDkx0OrVIQfFD/xUbseI/Tv4KObbHG8zvFzRqivjfDAPUWvwzTcdwdGYybJJ56V9D/OEJerss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913434; c=relaxed/simple;
	bh=moP3SxyON1NZINnqoH8zkuU2twpY5cIsuaVMnZ3C2pI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=io/EFRCWwXdfjhFI9pzZk5x0jmcnr+7L+NbEd6gtKuCh4YqIHTE0sl1VVovTXxInGZ2YYmoDSu9DwZRMpMVZA85WlypeYvlDWuSRTt5LhR0brhb6GvTI/mo5chbsO8sKCpXojYOosoncOZrBrmdmbjAb3poe5GRewhACYAb1uI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKR7XB4k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKR7XB4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776913433; x=1808449433;
  h=date:from:to:cc:subject:message-id;
  bh=moP3SxyON1NZINnqoH8zkuU2twpY5cIsuaVMnZ3C2pI=;
  b=iKR7XB4kxE9KQO7kiPBa9bwDzWAkPHPo0pMwKTGQMKvrDhFJMvnhbxnm
   WPQ6OJ78zocQfX/VB/wPngz+Vbrqex6+/S7Exi9gg53jUabj41kT20NMQ
   K2BPBAg42mVYQ06xKjgbIq3OULuxu5M7mLBwz+I/rvgZ3L1tcqhY+QZvo
   t/qI941k/ThR6eS9EtcTaOnLF+izjK+bGIR7mf7qESipsxuRn9P+fXW38
   YTIiStThSqB9ZDbS8rGulJojyad29SVgpPW7JGGiGEPDbXhLJMVqG5SC6
   2h8P43CjTCirnAFk9jmZDkyjQx68/00w/fiua2LAesZejBYFxsamwnl5d
   Q==;
X-CSE-ConnectionGUID: Pn+/py61T5O/VyIrsEBeXw==
X-CSE-MsgGUID: kAqjjnQLTBCW5glSt3Scuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77790821"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77790821"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 20:03:52 -0700
X-CSE-ConnectionGUID: oBGIZ8mCTgWFg50Qb76TDw==
X-CSE-MsgGUID: gzYO9YYWQFaSyi3R5KxBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231644554"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Apr 2026 20:03:51 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFkM0-000000001Ov-0jU4;
	Thu, 23 Apr 2026 03:03:48 +0000
Date: Thu, 23 Apr 2026 11:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 14382/14612]
 fs/smb/client/cifs_debug.c:395:30: warning: 'cifs_debug_dirs_proc_ops'
 defined but not used
Message-ID: <202604231025.zaEpIOHy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   70c8a7ec6715b5fb14e501731b5b9210a16684f7
commit: 63bff18d4aa02fa595f7e8582543c6f92c4f9fbc [14382/14612] smb: client: fix (remove) drop_dir_cache module parameter
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260423/202604231025.zaEpIOHy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604231025.zaEpIOHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604231025.zaEpIOHy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/cifs_debug.c:395:30: warning: 'cifs_debug_dirs_proc_ops' defined but not used [-Wunused-const-variable=]
     395 | static const struct proc_ops cifs_debug_dirs_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/cifs_debug_dirs_proc_ops +395 fs/smb/client/cifs_debug.c

   394	
 > 395	static const struct proc_ops cifs_debug_dirs_proc_ops = {
   396		.proc_open	= cifs_debug_dirs_proc_open,
   397		.proc_read	= seq_read,
   398		.proc_lseek	= seq_lseek,
   399		.proc_release	= single_release,
   400		.proc_write	= cifs_debug_dirs_proc_write,
   401	};
   402	#endif /* CONFIG_CIFS_DEBUG */
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
