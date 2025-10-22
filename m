Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548BD30FC25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124789; cv=none; b=sB74r51vGPlDn/Baz5QL8aPtIIKRNGk555lM8iIoffk3V9tTav11kpfqssT+OrUrwQqdoBNoZ0VDbIYspkWwOw+4KIKp271d6UX3/Y6s9CsXCdTZ90s26JJ2Bxpc7AyexrSRTvTbDxWWQ0D7MOo8UW/wd3MofWqTkS+2NNh/CUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124789; c=relaxed/simple;
	bh=GRsPTdvm7/2p/+wIHnQtvB/W0mC2JSIpvLdg/hkAUK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYoNtrl2pOZKaO+A/gweQSldoAZ5VEQT/wYhWFTznGe/am2GJ6e+skH6q1Zw7Lg+32lwlTRzfGEdQnmbSUREiDQIl7RJqNEJK9yw76h+IEO/MC1HPGn5zMRChNBYz1QJaxeRMiox7O9VjfpeEhl/gojxFr7rswxXlLaZKnfoRNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjMkYcGE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjMkYcGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761124787; x=1792660787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GRsPTdvm7/2p/+wIHnQtvB/W0mC2JSIpvLdg/hkAUK4=;
  b=WjMkYcGE+ZilPHXZtpIyzkhSi2yaLA3O0ItIiTdCNLJJbhGUiD4L24ab
   8nMImaQgHh1TfaDg8h8R48UPDyqF8xb/ou5WESQ5KYXaNcHqlWMCNw34S
   JojC7ZWyMaKk0xULQxyD3c+MAxmTKO+iSdd0p3pfvITUwedeA70vSFCau
   szHpCdGUqIC1xQCHpTbyXVLfs/Fnq5pXoMZX9zXgPcJhyhMr1iQjMY0p4
   SQ9e8uy9wiuKIdGFG0PlsnCBFLgOcuPTlXfo+mOS+YphmUSHShno1GrDX
   AH4RszLKjkOlUTtqncuj+lPgqdQjyjO0jjjzjki3fk4Wx6qaI995pHGQu
   w==;
X-CSE-ConnectionGUID: jWYzIuSdRJqOLxcigAhJXQ==
X-CSE-MsgGUID: CbUOdpARTWGW0I9vFd1sUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74705031"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="74705031"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 02:19:46 -0700
X-CSE-ConnectionGUID: t8b9FqDyRBWv5iv65/6BbA==
X-CSE-MsgGUID: kbDOcfajRPifz7UrA4sqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184226178"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Oct 2025 02:19:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBV0P-000CBd-20;
	Wed, 22 Oct 2025 09:19:41 +0000
Date: Wed, 22 Oct 2025 17:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Joel Granados <joel.granados@kernel.org>
Subject: Re: [PATCH 7/7] sysctl: Wrap do_proc_douintvec with the public
 function proc_douintvec_conv
Message-ID: <202510221719.3ggn070M-lkp@intel.com>
References: <20251017-jag-sysctl_jiffies-v1-7-175d81dfdf82@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017-jag-sysctl_jiffies-v1-7-175d81dfdf82@kernel.org>

Hi Joel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 130e5390ba572bffa687f32ed212dac1105b654a]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Granados/sysctl-Allow-custom-converters-from-outside-sysctl/20251017-163832
base:   130e5390ba572bffa687f32ed212dac1105b654a
patch link:    https://lore.kernel.org/r/20251017-jag-sysctl_jiffies-v1-7-175d81dfdf82%40kernel.org
patch subject: [PATCH 7/7] sysctl: Wrap do_proc_douintvec with the public function proc_douintvec_conv
config: i386-randconfig-063-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221719.3ggn070M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221719.3ggn070M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221719.3ggn070M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/kstack_erase.c:34:56: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/kstack_erase.c:34:56: sparse:     expected void *buffer
   kernel/kstack_erase.c:34:56: sparse:     got void [noderef] __user *buffer
   kernel/kstack_erase.c:54:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/kstack_erase.c:54:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/kstack_erase.c:54:35: sparse:     got int ( * )( ... )

vim +34 kernel/kstack_erase.c

964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  23  
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  24  #ifdef CONFIG_SYSCTL
78eb4ea25cd5fd kernel/stackleak.c Joel Granados    2024-07-24  25  static int stack_erasing_sysctl(const struct ctl_table *table, int write,
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  26  			void __user *buffer, size_t *lenp, loff_t *ppos)
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  27  {
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  28  	int ret = 0;
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  29  	int state = !static_branch_unlikely(&stack_erasing_bypass);
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  30  	int prev_state = state;
0e148d3cca0dc1 kernel/stackleak.c Thomas Weiﬂschuh 2024-05-03  31  	struct ctl_table table_copy = *table;
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  32  
0e148d3cca0dc1 kernel/stackleak.c Thomas Weiﬂschuh 2024-05-03  33  	table_copy.data = &state;
0e148d3cca0dc1 kernel/stackleak.c Thomas Weiﬂschuh 2024-05-03 @34  	ret = proc_dointvec_minmax(&table_copy, write, buffer, lenp, ppos);
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  35  	state = !!state;
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  36  	if (ret || !write || state == prev_state)
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  37  		return ret;
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  38  
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  39  	if (state)
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  40  		static_branch_disable(&stack_erasing_bypass);
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  41  	else
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  42  		static_branch_enable(&stack_erasing_bypass);
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  43  
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  44  	pr_warn("stackleak: kernel stack erasing is %s\n",
62e9c1e8ecee87 kernel/stackleak.c Thorsten Blum    2024-12-22  45  					str_enabled_disabled(state));
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  46  	return ret;
964c9dff009189 kernel/stackleak.c Alexander Popov  2018-08-17  47  }
1751f872cc97f9 kernel/stackleak.c Joel Granados    2025-01-28  48  static const struct ctl_table stackleak_sysctls[] = {
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  49  	{
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  50  		.procname	= "stack_erasing",
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  51  		.data		= NULL,
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  52  		.maxlen		= sizeof(int),
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  53  		.mode		= 0600,
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  54  		.proc_handler	= stack_erasing_sysctl,
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  55  		.extra1		= SYSCTL_ZERO,
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  56  		.extra2		= SYSCTL_ONE,
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  57  	},
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  58  };
0df8bdd5e3b3e5 kernel/stackleak.c Xiaoming Ni      2022-01-21  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
