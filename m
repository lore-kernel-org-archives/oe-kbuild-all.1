Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE0A937
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 23:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677020449; x=1708556449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9tchUmKCqrwfxq9smbWQhkojYKUlgeBExUrI3AtPhdo=;
  b=QOIliU5JhEVjaeY0PIzid75BJLlLFNWv+wu+9R0ba4Q5hEeVWyWAyHuq
   n9P35emPYeMsGehc0KHGAZ9qU+Og3Qs2LL8TaWwcXCBtMh+1yTGLvgsx+
   +Mfy4NTzcA6SdLvyvnKhS/njALthYKsL8CcnwS4fy5lO+KgaovZUzesQQ
   qE012lyYvVMyosZNP9dYsYsf02h3dwWMjezo2ks5b/C+phL4T/fCO6p84
   5vPQxfsNu5UPwWbDcDooOhqJDfAJAFi5pE5cf1yD5RbWPE7KXJ4NhyLPp
   bv3OlXDuv8ssUhOFhhANVmi7ynnKV3dCjp+lrBDUwB6TbmFNfj0IdSOxj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="320915327"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="320915327"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 15:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="673861024"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="673861024"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2023 15:00:46 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUbcr-0000K3-1I;
	Tue, 21 Feb 2023 23:00:45 +0000
Date: Wed, 22 Feb 2023 07:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	oleg@redhat.com, avagin@gmail.com, peterz@infradead.org,
	luto@kernel.org, krisman@collabora.com, tglx@linutronix.de,
	corbet@lwn.net, shuah@kernel.org,
	Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v11 2/2] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <202302220654.bRPCWovm-lkp@intel.com>
References: <20230221201740.2236-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221201740.2236-3-gregory.price@memverge.com>

Hi Gregory,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on shuah-kselftest/fixes]
[also build test WARNING on linus/master tip/core/entry v6.2 next-20230221]
[cannot apply to shuah-kselftest/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/syscall_user_dispatch-helper-function-to-operate-on-given-task/20230222-041959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git fixes
patch link:    https://lore.kernel.org/r/20230221201740.2236-3-gregory.price%40memverge.com
patch subject: [PATCH v11 2/2] ptrace,syscall_user_dispatch: checkpoint/restore support for SUD
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230222/202302220654.bRPCWovm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/966fb8d2744f50ac8174fe3c5d942112c13c0962
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gregory-Price/syscall_user_dispatch-helper-function-to-operate-on-given-task/20230222-041959
        git checkout 966fb8d2744f50ac8174fe3c5d942112c13c0962
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/entry/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220654.bRPCWovm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/entry/syscall_user_dispatch.c: In function 'syscall_user_dispatch_get_config':
>> kernel/entry/syscall_user_dispatch.c:133:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     133 |         config.selector = (__u64)sd->selector;
         |                           ^
   kernel/entry/syscall_user_dispatch.c: In function 'syscall_user_dispatch_set_config':
>> kernel/entry/syscall_user_dispatch.c:153:54: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     153 |                                             cfg.len, (void __user*)cfg.selector);
         |                                                      ^


vim +133 kernel/entry/syscall_user_dispatch.c

   117	
   118	int syscall_user_dispatch_get_config(struct task_struct *task, unsigned long size,
   119			                     void __user *data)
   120	{
   121		struct syscall_user_dispatch *sd = &task->syscall_dispatch;
   122		struct ptrace_sud_config config;
   123		if (size != sizeof(struct ptrace_sud_config))
   124			return -EINVAL;
   125	
   126		if (test_task_syscall_work(task, SYSCALL_USER_DISPATCH))
   127			config.mode = PR_SYS_DISPATCH_ON;
   128		else
   129			config.mode = PR_SYS_DISPATCH_OFF;
   130	
   131		config.offset = sd->offset;
   132		config.len = sd->len;
 > 133		config.selector = (__u64)sd->selector;
   134	
   135		if (copy_to_user(data, &config, sizeof(config))) {
   136			return -EFAULT;
   137		}
   138		return 0;
   139	}
   140	
   141	int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long size,
   142			                     void __user *data)
   143	{
   144		int rc;
   145		struct ptrace_sud_config cfg;
   146		if (size != sizeof(struct ptrace_sud_config))
   147			return -EINVAL;
   148	
   149		if (copy_from_user(&cfg, data, sizeof(cfg))) {
   150			return -EFAULT;
   151		}
   152		rc = task_set_syscall_user_dispatch(task, cfg.mode, cfg.offset,
 > 153						    cfg.len, (void __user*)cfg.selector);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
