Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B4B33D8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674487648; x=1706023648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WB8hjZXlQzZ5TwsrQWWdj3L9IZ9SO/zxnZNrA7nTs04=;
  b=Nipa6Y4VxYU21aheMybP6a2kMJxnjwq0XVli2jnVTqeZmjw9B+6kJCnG
   dqOXskuh9hidQt5T6gFQJRLQIV4KhFT4JOH1cT9/QhmGoF2Dw31zN0A0j
   nfS2Lg1bpwUfzr+KPYll5htFBYDHjqJ+dX8RxK3fW8UCsL4qqjBnkhm7P
   //8J0GS4GuooJdiu/tMR03ZQiMsATKbSCvqviIMEUAcqD+NSPyXfnossN
   cMbxi5+/PLEZp4pritFe72LIogPU+UI46pteb9qM6554Fp0FMGeihKaNC
   DxBfnUiucbgNbN64vMhyD/359HZ4O1/nf1fK8jIKVfo3iKmi2WiKluIPr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="313960013"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="313960013"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 07:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="907101545"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="907101545"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2023 07:27:12 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJyj1-0005iq-2J;
	Mon, 23 Jan 2023 15:27:11 +0000
Date: Mon, 23 Jan 2023 23:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: [jirislaby:devel 45/46] drivers/tty/vt/vt.c:3116:12: error:
 redefinition of 'vt_console_setup'
Message-ID: <202301232300.Cz57OAr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   4a2144bd7df27b4991fd300f31f4be95537f441b
commit: a24cce9ceefe6acf098c69635c5cf1a3063dca29 [45/46] vt: check for OOB consoles
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230123/202301232300.Cz57OAr8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=a24cce9ceefe6acf098c69635c5cf1a3063dca29
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout a24cce9ceefe6acf098c69635c5cf1a3063dca29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/tty/vt/vt.c:3116:12: error: redefinition of 'vt_console_setup'
    3116 | static int vt_console_setup(struct console *co, char *options)
         |            ^~~~~~~~~~~~~~~~
   drivers/tty/vt/vt.c:3030:12: note: previous definition of 'vt_console_setup' with type 'int(struct console *, char *)'
    3030 | static int vt_console_setup(struct console *co, char *options)
         |            ^~~~~~~~~~~~~~~~
   drivers/tty/vt/vt.c:3030:12: warning: 'vt_console_setup' defined but not used [-Wunused-function]


vim +/vt_console_setup +3116 drivers/tty/vt/vt.c

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds 2005-04-16  3115  
7370a25f9315e7 drivers/tty/vt/vt.c Sven Schnelle  2022-12-09 @3116  static int vt_console_setup(struct console *co, char *options)
7370a25f9315e7 drivers/tty/vt/vt.c Sven Schnelle  2022-12-09  3117  {
7370a25f9315e7 drivers/tty/vt/vt.c Sven Schnelle  2022-12-09  3118  	return co->index >= MAX_NR_CONSOLES ? -EINVAL : 0;
7370a25f9315e7 drivers/tty/vt/vt.c Sven Schnelle  2022-12-09  3119  }
7370a25f9315e7 drivers/tty/vt/vt.c Sven Schnelle  2022-12-09  3120  

:::::: The code at line 3116 was first introduced by commit
:::::: 7370a25f9315e732ab7538d6c7e85208176d8fa2 tty/vt: prevent registration of console with invalid number

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
