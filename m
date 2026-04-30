Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B82C3255
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777575402; cv=none; b=k43yhGiMbNhyY8lCC7T0aHSbg1Dvkl1jbiBclAztQ1h/jPYpC8RPMrEziv4p5ep2uS6CtRn5BXbQaH2Jsqm1s+mc8DggDqYveXvQ+ln2UrRqLgA9LxeSVJbwFCGK2ItOs+Gm1HwW9k3Z+42CO2qm6dEDcuZEvH9pvTwoVBIEjXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777575402; c=relaxed/simple;
	bh=KwOH2u/MNjcIA0mIpaWeLZomcg08HTEYUymnkcED1IY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=thJLtMRe6D5b74kBWCQ/zBcWyN7n96mNlHyggYnOTgM5PYnJV9FtTTp8VAn3PAZEB9rySD3EtKQ8z4eMTJs1RVC1b28hpAlf//ehbmQHANqZBmxRT9Dn5o7k3pH0HVHQM0cHVl/MBZKwtPxl69kY1yupUUodPq2jycPwOGafUzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3HIAUfA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3HIAUfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777575401; x=1809111401;
  h=date:from:to:cc:subject:message-id;
  bh=KwOH2u/MNjcIA0mIpaWeLZomcg08HTEYUymnkcED1IY=;
  b=R3HIAUfAEQWLeSs1JefSjfl5mQIVpSeiMLH5+wUiewnCmN8iQl4QHhjm
   sHUJf1FXXJ3QrPJikcX0zmI+MUVJ8mkODczwPU9NnoUoBbAOuCDzhspJj
   CMxmqwzRVX4693J3qYQkFS64sE4eIZ3HN0MUvf17fq0Gw0fTEBePhtSAP
   Ct0nzN0PH49gosuG+5YrIQZFGHSA8pUu4tQrMVShv+6MNRkdfCBO2eVeH
   AdTHzcfrXm9cGiysJcqtssi6FQ7GUokFE4bKl5CYiPH8BpFMcyR7wU+Aa
   fsYRMw2yMwb2i4FuYnOQD+Rz95cJcVSNPgSrsybZ/i50yNz33NVpINoZ6
   w==;
X-CSE-ConnectionGUID: 0Jm/3KfrRe6qTyzw1vR35Q==
X-CSE-MsgGUID: SHP7okZZQFGdWNSD4PppXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="103993890"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="103993890"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 11:56:40 -0700
X-CSE-ConnectionGUID: gAjt7NhPRuupKSye4xT25g==
X-CSE-MsgGUID: P6eAk/coQEe6RUz8RPIh6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231540049"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2026 11:56:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIWYv-000000004sP-0ytk;
	Thu, 30 Apr 2026 18:56:37 +0000
Date: Thu, 30 Apr 2026 20:55:40 +0200
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.2.procfs 1/12]
 fs/proc/generic.c:849:6: warning: no previous prototype for
 'impl_proc_make_permanent'
Message-ID: <202604302058.BH4vuWQP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.2.procfs
head:   16b3565414446449677ec503a8a25d802c7512a7
commit: b26811a2ab5878e84275d8ad8e709bba9147c62c [1/12] proc: allow to mark /proc files permanent outside of fs/proc/
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604302058.BH4vuWQP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302058.BH4vuWQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302058.BH4vuWQP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/generic.c:849:6: warning: no previous prototype for 'impl_proc_make_permanent' [-Wmissing-prototypes]
     849 | void impl_proc_make_permanent(struct proc_dir_entry *pde)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/impl_proc_make_permanent +849 fs/proc/generic.c

   844	
   845	/*
   846	 * Not exported to modules:
   847	 * modules' /proc files aren't permanent because modules aren't permanent.
   848	 */
 > 849	void impl_proc_make_permanent(struct proc_dir_entry *pde)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
