Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCED1CB534
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902538; cv=none; b=Hafe4pl3AKVieKK3oGH/5+qT6bGlPJo/Ub4LrSXOzphBvpJ0G8y7xrMW4ZLLAX3AZggdAngqeC320CYKOFTZ+8/Bc9w5AgWv0lj0A1P5czbkFMbRNJ5PywGWeie9Nndpy+BcmMaqverMcU8yvM+aZptszIm3DF+6dE4D9i3L//M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902538; c=relaxed/simple;
	bh=pbmReGJqiTdjFhhF4yVzKQboycdwej4stZUTM+SvB3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DRlKyf9NWQE6e0JxVyEzJH4fw5IeZCz0LZpwVMKHVMy4CGP1mXBl3/kP1PaRMtFUzut35j+bJEw9qvHY1sWhymVUPXENvUDKGAm4fUGhU353i0kN3UlDmR7uMLWCmquOzMEsf50nOiqNTf75NrWt0y/GoacWewcuuyuJSdXtqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAHJzsj0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAHJzsj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735902536; x=1767438536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pbmReGJqiTdjFhhF4yVzKQboycdwej4stZUTM+SvB3o=;
  b=OAHJzsj0Z/tgUfH2MVL15ql4aazfw/jI56lwEawVVfsL50oU3Ly2r3oI
   2XM5OUiFvOZbUDhuHl1vPqtD07bmhZOaqLofJu9jPwQ5T63gI2qaYTjc1
   n8J7XJp/Gxmks8KbIzAHXK2pCjlpgSFcSECfqfnr7TDnJCJg7LKWqWlWa
   qnLcCssye6Pvoh62r/qHUIeeO79FvLcEdgoG1uAmtcN8c/Rz3WnSZ6GUx
   E/5J5kuJrBpDUQ2EhtDQE5Qf96lk+/yUVY4/E/3ozk5UFXMQ0Kjgn+kyC
   o4qWt625x7kBHttK3qTw3XEGHHuGKHxYFkofaa9dQvpsMKRILVWPF7AuR
   A==;
X-CSE-ConnectionGUID: KW7gu1hGRwmtaeAHUgV/kQ==
X-CSE-MsgGUID: Y7RFm1KOS+6nbtGUWmpR+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="39831795"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="39831795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 03:08:54 -0800
X-CSE-ConnectionGUID: ygmoX8l/RnuUMS/EqnXe6g==
X-CSE-MsgGUID: Ovn89IT5Qa+ImmaBceHDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105827674"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jan 2025 03:08:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTfXu-0009dH-2O;
	Fri, 03 Jan 2025 11:08:50 +0000
Date: Fri, 3 Jan 2025 19:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2601/2601] kernel/stackleak.c:42:5-10:
 opportunity for str_enabled_disabled(state)
Message-ID: <202501031923.x0AUCg7R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: 9d423ac5414e69a36e95dc0b77392429c507cbe1 [2601/2601] gcc-plugins: simplify GCC plugin-dev capability test
config: x86_64-randconfig-101-20241228 (https://download.01.org/0day-ci/archive/20250103/202501031923.x0AUCg7R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031923.x0AUCg7R-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/stackleak.c:42:5-10: opportunity for str_enabled_disabled(state)

vim +42 kernel/stackleak.c

964c9dff009189 Alexander Popov 2018-08-17  21  
964c9dff009189 Alexander Popov 2018-08-17  22  int stack_erasing_sysctl(struct ctl_table *table, int write,
4773ef33fc6e59 Tobias Klauser  2020-09-18  23  			void *buffer, size_t *lenp, loff_t *ppos)
964c9dff009189 Alexander Popov 2018-08-17  24  {
964c9dff009189 Alexander Popov 2018-08-17  25  	int ret = 0;
964c9dff009189 Alexander Popov 2018-08-17  26  	int state = !static_branch_unlikely(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  27  	int prev_state = state;
964c9dff009189 Alexander Popov 2018-08-17  28  
964c9dff009189 Alexander Popov 2018-08-17  29  	table->data = &state;
964c9dff009189 Alexander Popov 2018-08-17  30  	table->maxlen = sizeof(int);
964c9dff009189 Alexander Popov 2018-08-17  31  	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
964c9dff009189 Alexander Popov 2018-08-17  32  	state = !!state;
964c9dff009189 Alexander Popov 2018-08-17  33  	if (ret || !write || state == prev_state)
964c9dff009189 Alexander Popov 2018-08-17  34  		return ret;
964c9dff009189 Alexander Popov 2018-08-17  35  
964c9dff009189 Alexander Popov 2018-08-17  36  	if (state)
964c9dff009189 Alexander Popov 2018-08-17  37  		static_branch_disable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  38  	else
964c9dff009189 Alexander Popov 2018-08-17  39  		static_branch_enable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  40  
964c9dff009189 Alexander Popov 2018-08-17  41  	pr_warn("stackleak: kernel stack erasing is %s\n",
964c9dff009189 Alexander Popov 2018-08-17 @42  					state ? "enabled" : "disabled");
964c9dff009189 Alexander Popov 2018-08-17  43  	return ret;
964c9dff009189 Alexander Popov 2018-08-17  44  }
964c9dff009189 Alexander Popov 2018-08-17  45  

:::::: The code at line 42 was first introduced by commit
:::::: 964c9dff0091893a9a74a88edf984c6da0b779f7 stackleak: Allow runtime disabling of kernel stack erasing

:::::: TO: Alexander Popov <alex.popov@linux.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
