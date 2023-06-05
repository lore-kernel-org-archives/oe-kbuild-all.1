Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3B5256
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 23:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686007833; x=1717543833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/A5yXuFzMFam5h/BU2MQqObVs1D69ofcpsdgWOzPRf8=;
  b=mq92b4CKVtcMTes/fc2l/iiJnW4M06sON9iR6MmKOO9C0euXLB+hqXY2
   xWbk7expoW6klmkxwlTepokpgCxjhT9eb12qWOgoBengeT85rwkGGROxF
   8ZJSgxZHB3duyhQ7JrK6Y/S4Dbd41ZChql8DM9lzuzEdpdfw+KSoFBFYU
   IE+y3fTXmoQn0AOKSW4WIDtcJ6MecB4mUH0qGz2DHeTEZKuZMWVMk7Oxl
   UYwVaDVlQTtsaE5saDXjMGmz9DRtHohJn57Z4n9cwd40nbStCKKfOlWvb
   ULBU+ZrDCker1WPG4t1jP5xe5hAKkhtOnZl2kaFwYeITkSrcbiHypTQl8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359826341"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="359826341"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738531796"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="738531796"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 16:30:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Jeg-0004Xv-1R;
	Mon, 05 Jun 2023 23:30:30 +0000
Date: Tue, 6 Jun 2023 07:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: [mic:next 8/12] security/landlock/net.c:165:51: error: expected '=',
 ',', ';', 'asm' or '__attribute__' before '__lsm_ro_after_init'
Message-ID: <202306060725.jZiclXgh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   33ccf2aa61758ef2887862301b574f5d9a77553c
commit: 6d0bfdb25ce6a9652a68ea095d9a9fdacc25aa27 [8/12] landlock: Add network rules and TCP hooks support
config: parisc-randconfig-r031-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060725.jZiclXgh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git/commit/?id=6d0bfdb25ce6a9652a68ea095d9a9fdacc25aa27
        git remote add mic git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
        git fetch --no-tags mic next
        git checkout 6d0bfdb25ce6a9652a68ea095d9a9fdacc25aa27
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash security/landlock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060725.jZiclXgh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/landlock/net.c:165:51: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__lsm_ro_after_init'
     165 | static struct security_hook_list landlock_hooks[] __lsm_ro_after_init = {
         |                                                   ^~~~~~~~~~~~~~~~~~~
   security/landlock/net.c: In function 'landlock_add_net_hooks':
>> security/landlock/net.c:172:28: error: 'landlock_hooks' undeclared (first use in this function)
     172 |         security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),
         |                            ^~~~~~~~~~~~~~
   security/landlock/net.c:172:28: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from security/landlock/net.c:9:
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   security/landlock/net.c:172:44: note: in expansion of macro 'ARRAY_SIZE'
     172 |         security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),
         |                                            ^~~~~~~~~~
   security/landlock/net.c: At top level:
   security/landlock/net.c:157:12: warning: 'hook_socket_connect' defined but not used [-Wunused-function]
     157 | static int hook_socket_connect(struct socket *const sock,
         |            ^~~~~~~~~~~~~~~~~~~
   security/landlock/net.c:150:12: warning: 'hook_socket_bind' defined but not used [-Wunused-function]
     150 | static int hook_socket_bind(struct socket *const sock,
         |            ^~~~~~~~~~~~~~~~


vim +165 security/landlock/net.c

   164	
 > 165	static struct security_hook_list landlock_hooks[] __lsm_ro_after_init = {
   166		LSM_HOOK_INIT(socket_bind, hook_socket_bind),
   167		LSM_HOOK_INIT(socket_connect, hook_socket_connect),
   168	};
   169	
   170	__init void landlock_add_net_hooks(void)
   171	{
 > 172		security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
