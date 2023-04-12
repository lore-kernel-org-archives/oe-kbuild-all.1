Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C312CA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681341988; x=1712877988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/6MkR1erCX2hwd55lfCdkdYXD42s+7eFWVoKltFV/0=;
  b=RDkT8fW8Hthbupa3VAHIWdCg0hrHsFMnc948Z2sN6SAZMP/IaqVVBzVT
   G/ex/8hDatMNTSuL6rEB6dNfuzsf7Ae7QbfKPraj185LAq0Moc2gmk70Y
   zZ6IP39oRegZ5cCm2oy0Vq+iOe3arwUWmSHadQJ5EAc4AYpz9w/frUgR9
   EAwS0s8nNyqpMRiUQ/LzSywCj7tkvGHNymgc69Qyc20S8ZhDTh4nJKu62
   cvxVyntZ29Qu+WYjT96EIYfGZDlbcb6lxW0Bm3kAfDBFeCtEMMBqOFgnn
   ykR4LkzzuCWMotY0y3mR6/ZTEq/8m69tmV0Xdkr4zidTdVdMtVktMUlql
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344045587"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="344045587"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 16:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1018918822"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="1018918822"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2023 16:26:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmjr8-000Y8V-0f;
	Wed, 12 Apr 2023 23:26:26 +0000
Date: Thu, 13 Apr 2023 07:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>
Subject: include/linux/seq_file.h:247:9: warning: 'strncpy' output may be
 truncated copying 4 bytes from a string of length 4
Message-ID: <202304130756.tTyJM1hb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ilya,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bcc4025550403ae28d2984bddacafbca0a2f112
commit: e37b3dd063a1a68e28a7cfaf77c84c472112e330 s390: enable KCSAN
date:   1 year, 8 months ago
config: s390-randconfig-r036-20230413 (https://download.01.org/0day-ci/archive/20230413/202304130756.tTyJM1hb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e37b3dd063a1a68e28a7cfaf77c84c472112e330
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e37b3dd063a1a68e28a7cfaf77c84c472112e330
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/ocfs2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130756.tTyJM1hb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seq_file_net.h:5,
                    from include/net/net_namespace.h:179,
                    from include/linux/inet.h:42,
                    from fs/ocfs2/super.c:21:
   fs/ocfs2/super.c: In function 'ocfs2_show_options':
>> include/linux/seq_file.h:247:9: warning: 'strncpy' output may be truncated copying 4 bytes from a string of length 4 [-Wstringop-truncation]
     247 |         strncpy(val_buf, value, length);                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/super.c:1539:17: note: in expansion of macro 'seq_show_option_n'
    1539 |                 seq_show_option_n(s, "cluster_stack", osb->osb_cluster_stack,
         |                 ^~~~~~~~~~~~~~~~~


vim +/strncpy +247 include/linux/seq_file.h

a068acf2ee7769 Kees Cook 2015-09-04  233  
a068acf2ee7769 Kees Cook 2015-09-04  234  /**
a068acf2ee7769 Kees Cook 2015-09-04  235   * seq_show_option_n - display mount options with appropriate escapes
a068acf2ee7769 Kees Cook 2015-09-04  236   *		       where @value must be a specific length.
a068acf2ee7769 Kees Cook 2015-09-04  237   * @m: the seq_file handle
a068acf2ee7769 Kees Cook 2015-09-04  238   * @name: the mount option name
a068acf2ee7769 Kees Cook 2015-09-04  239   * @value: the mount option name's value, cannot be NULL
a068acf2ee7769 Kees Cook 2015-09-04  240   * @length: the length of @value to display
a068acf2ee7769 Kees Cook 2015-09-04  241   *
a068acf2ee7769 Kees Cook 2015-09-04  242   * This is a macro since this uses "length" to define the size of the
a068acf2ee7769 Kees Cook 2015-09-04  243   * stack buffer.
a068acf2ee7769 Kees Cook 2015-09-04  244   */
a068acf2ee7769 Kees Cook 2015-09-04  245  #define seq_show_option_n(m, name, value, length) {	\
a068acf2ee7769 Kees Cook 2015-09-04  246  	char val_buf[length + 1];			\
a068acf2ee7769 Kees Cook 2015-09-04 @247  	strncpy(val_buf, value, length);		\
a068acf2ee7769 Kees Cook 2015-09-04  248  	val_buf[length] = '\0';				\
a068acf2ee7769 Kees Cook 2015-09-04  249  	seq_show_option(m, name, val_buf);		\
a068acf2ee7769 Kees Cook 2015-09-04  250  }
a068acf2ee7769 Kees Cook 2015-09-04  251  

:::::: The code at line 247 was first introduced by commit
:::::: a068acf2ee77693e0bf39d6e07139ba704f461c3 fs: create and use seq_show_option for escaping

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
