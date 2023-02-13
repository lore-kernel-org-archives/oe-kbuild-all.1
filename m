Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8AAD20
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676312673; x=1707848673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDe/7u4DMC69JsVO/C9or9jujzvDAFnrlpDEq1iyBw0=;
  b=lp6nG0jz5oUyklPV5kgjy0jvF/p3trRKVfA0SZul6K1jI641p4PM0SBR
   IuJzKRgbWqI2lpG2zkYO1EoiJRT1dHmULCMxL14AEuGhb7HO7PV+fWr4h
   SNTPMsKvH1baTDWLfgsHGbB1sFpNAd2W21+uX2AIUwQKg3pp1SReTKOUu
   TbP8kPhMMc4JXW3nMBnNNiTN1ty/fLyg/mubLzW/pJNfmcISqlG1FBcQH
   YYCJAGYhksRUsDZpN2iTJFD08/MmkcjeNafBFTibLfJtAKc9VXn0hcCjW
   /Z5tn4JzDeIDgKfUWBA7ZKBWY25qFtEd1Eix/jJneNvsRNW0DDPc0eVMn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358365864"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358365864"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 10:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="668895455"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="668895455"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Feb 2023 10:24:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRdV8-0007wP-2R;
	Mon, 13 Feb 2023 18:24:30 +0000
Date: Tue, 14 Feb 2023 02:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-testing 1/1] net/rxrpc/ar-internal.h:1302:16:
 warning: format '%c' expects argument of type 'int', but argument 4 has type
 'struct rxrpc_call *'
Message-ID: <202302140227.LQycq9mH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-testing
head:   fa7f69da4a2210209299c01a778b068dc638a0b0
commit: fa7f69da4a2210209299c01a778b068dc638a0b0 [1/1] rxrpc: Don't print kernel pointers in warning messages
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230214/202302140227.LQycq9mH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=fa7f69da4a2210209299c01a778b068dc638a0b0
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs afs-testing
        git checkout fa7f69da4a2210209299c01a778b068dc638a0b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140227.LQycq9mH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/net.h:18,
                    from net/rxrpc/sendmsg.c:10:
   net/rxrpc/sendmsg.c: In function 'rxrpc_new_client_call_for_sendmsg':
>> net/rxrpc/ar-internal.h:1302:16: warning: format '%c' expects argument of type 'int', but argument 4 has type 'struct rxrpc_call *' [-Wformat=]
    1302 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   net/rxrpc/ar-internal.h:1302:9: note: in expansion of macro 'printk'
    1302 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |         ^~~~~~
   net/rxrpc/ar-internal.h:1305:25: note: in expansion of macro 'dbgprintk'
    1305 | #define kleave(FMT,...) dbgprintk("<== %s()"FMT"",__func__ ,##__VA_ARGS__)
         |                         ^~~~~~~~~
   net/rxrpc/ar-internal.h:1328:17: note: in expansion of macro 'kleave'
    1328 |                 kleave(FMT,##__VA_ARGS__);              \
         |                 ^~~~~~
   net/rxrpc/sendmsg.c:606:9: note: in expansion of macro '_leave'
     606 |         _leave(" = %c=%x\n", call);
         |         ^~~~~~
>> net/rxrpc/ar-internal.h:1302:16: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
    1302 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   net/rxrpc/ar-internal.h:1302:9: note: in expansion of macro 'printk'
    1302 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |         ^~~~~~
   net/rxrpc/ar-internal.h:1305:25: note: in expansion of macro 'dbgprintk'
    1305 | #define kleave(FMT,...) dbgprintk("<== %s()"FMT"",__func__ ,##__VA_ARGS__)
         |                         ^~~~~~~~~
   net/rxrpc/ar-internal.h:1328:17: note: in expansion of macro 'kleave'
    1328 |                 kleave(FMT,##__VA_ARGS__);              \
         |                 ^~~~~~
   net/rxrpc/sendmsg.c:606:9: note: in expansion of macro '_leave'
     606 |         _leave(" = %c=%x\n", call);
         |         ^~~~~~


vim +1302 net/rxrpc/ar-internal.h

17926a79320afa David Howells 2007-04-26  1300  
17926a79320afa David Howells 2007-04-26  1301  #define dbgprintk(FMT,...) \
9f389f4b2016e0 Sven Schnelle 2008-04-03 @1302  	printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
17926a79320afa David Howells 2007-04-26  1303  

:::::: The code at line 1302 was first introduced by commit
:::::: 9f389f4b2016e0aa35cd9cbb5afcd55d58e0c56a rxrpc: remove smp_processor_id() from debug macro

:::::: TO: Sven Schnelle <svens@stackframe.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
