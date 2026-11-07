Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045087;
	b=GNJ09tPOkJw/gl9M2+7My7UwRfJOtjFDZO7Gst9UqPOLXmy2S2DfOSx63djO4A9BMrbI
	 6Hvdx81pzaUBDN6Q/jHYiIGaQAhqDJ02HE3vKy/8KWov5tfABZl6JrH1f+H47g4Wn8TQ3
	 mEWzPD0dAkUG7X/mWKEiSmrDukcxI1H2Uaam2QIJh9s4e42fM4pHSIhiUa/UXvISBaDza
	 fx33aDdjbfjdRBDkulP6AGKKnetXNeURdfZBFXKjiNu9Bu1BFOAml9fi0CTJl6blgy5SV
	 h4FJPJtX1RiCYWwwbgphJqJuRC2uLtYuVJOrpGBI+k+3op5HWZ537tA8l5Rev8MuNMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OEJM2JpjtJJlM+yCiy5D8JtV6jg9KqwnUnVRx+iuXsw=;
	b=zplJWCe+BTn6lPkRXCQoZvBXYLg7x7ImcE8bOzTZ9lLlZpOrHB/dcmvW5yPwMaFXA7O5
	 dzvSBGHalFbwsbwqwDSTXL/Hyo8Z/R86InaiG4eQE/bYAPjUYxEZVIrNLfC4sEyBFiKEt
	 lZveOkVmqOINNitgpM6LL6UEQ6ELFWYPhlXJzrrIDZI9XO5mmuncqTBh4NYO78FXPL818
	 X3G17JtahhgYlIteoubNloTS0lAzXiHL5te7T4hG2co+MXEQVKOU4qjybtpCPDRo3qqa7
	 nBbavzIkaIg3v0vRIhrjKM9dfkKcLuAKuPR5QINvuLbClE/lqkgavhwt0rkKrHH1DVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F3OH8V2L;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B0E606A331
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 09:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B0E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F3OH8V2L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794045086; x=1825581086;
  h=date:from:to:cc:subject:message-id;
  bh=mnWOcg4wB7VBO70eulu73XyKZtGZ3agakTwltjHsQHU=;
  b=F3OH8V2L9pSmTRJHpVwT161wVQ/QcpUufBeRFmXkCou36BTt7TtIipzc
   HCkoNExUk/+Yp8/fX7vH2pp4K1/qtcMcEVfQMoEYqoW3F1OpY9CpIE4tL
   fPo32Fbi+ErntGaD8T5qgXjSQF/EaM0d9VNVerMJVRpu1piFCOiVrVsHk
   PxJetV7s36T2PwLG/ES+uC8D7bI02F3Xi4QtlyiYV8sICU3eqP09UXoVc
   Q+vBzoWqzVY04XV7uX8s4p02JPQvjXBEoUecGkc0Pd3KeA+V91rcXrRoh
   3ojSNd+G4lXQ4HlcueAcle9/0vdGyh4OjATohSxjKh6orHtIRw6c80Kjf
   g==;
X-CSE-ConnectionGUID: HmDsFt4DSVWyy1YCpTyj8g==
X-CSE-MsgGUID: canTPxahQReqWY/IPXSjOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2884411"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2884411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 01:51:25 -0800
X-CSE-ConnectionGUID: TLWf1AIfTdqXHgO29EXchw==
X-CSE-MsgGUID: sHTbkk4HTOKjvPRrIS08hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7337392"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Nov 2026 01:51:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPd4y-00000000qfX-3rkc;
	Sat, 07 Nov 2026 09:51:20 +0000
Date: Sat, 07 Nov 2026 17:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.procfs.cleanup 106/174]
 include/linux/rcupdate.h:511:9: error: dereferencing pointer to incomplete
 type 'struct proc_dir_entry'
Message-ID: <202611071751.JBMQ8Xbu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/brauner/linux.git work.procfs.cleanup
head:   a6e013c7b3fceb9c5df32518edb227f6d2ac893b
commit: f7de705dd5dc819a9b724adb5b13a92a15ef8235 [106/174] md: let procfs own the wait queue of /proc/mdstat
config: nios2-randconfig-1000-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071751.JBMQ8Xbu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071751.JBMQ8Xbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071751.JBMQ8Xbu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/sched/mm.h:8,
                    from drivers/md/md.c:40:
   drivers/md/md.c: In function 'md_new_event':
>> include/linux/rcupdate.h:511:9: error: dereferencing pointer to incomplete type 'struct proc_dir_entry'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:661:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:751:28: note: in expansion of macro 'rcu_dereference_check'
    #define rcu_dereference(p) rcu_dereference_check(p, 0)
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/md.c:363:8: note: in expansion of macro 'rcu_dereference'
     pde = rcu_dereference(mdstat_entry);
           ^~~~~~~~~~~~~~~
--
   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/sched/mm.h:8,
                    from md.c:40:
   md.c: In function 'md_new_event':
>> include/linux/rcupdate.h:511:9: error: dereferencing pointer to incomplete type 'struct proc_dir_entry'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:661:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:751:28: note: in expansion of macro 'rcu_dereference_check'
    #define rcu_dereference(p) rcu_dereference_check(p, 0)
                               ^~~~~~~~~~~~~~~~~~~~~
   md.c:363:8: note: in expansion of macro 'rcu_dereference'
     pde = rcu_dereference(mdstat_entry);
           ^~~~~~~~~~~~~~~


vim +511 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  501  
573d76f7db5ba0 Paul E. McKenney        2026-06-28  502  #define __rcu_access_pointer(p, local, space) context_unsafe( \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  503  ({ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  504  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  505) 	rcu_check_sparse(p, space); \
0381ade2ea82b4 Ricardo Ribalda         2026-09-14  506  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(local)); \
573d76f7db5ba0 Paul E. McKenney        2026-06-28  507  }) )
24ba53017e188e Chun-Hung Tseng         2021-09-15  508  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  509  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  510  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15 @511  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  512  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  513) 	rcu_check_sparse(p, space); \
0381ade2ea82b4 Ricardo Ribalda         2026-09-14  514  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  515  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  516  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  517  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  518  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  519) 	rcu_check_sparse(p, space); \
0381ade2ea82b4 Ricardo Ribalda         2026-09-14  520  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  521  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  522  #define __rcu_dereference_raw(p, local) \
995f1405610bd8 Paul E. McKenney        2016-07-01  523  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  524  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  525  	typeof(p) local = READ_ONCE(p); \
0381ade2ea82b4 Ricardo Ribalda         2026-09-14  526  	((TYPEOF_NO_ADDRESS_SPACE(*p) __force __kernel *)(local)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  527  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  528  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  529  

:::::: The code at line 511 was first introduced by commit
:::::: 24ba53017e188e031f9cb8b290286fad52d2af00 rcu: Replace ________p1 and _________p1 with __UNIQUE_ID(rcu)

:::::: TO: Chun-Hung Tseng <henrybear327@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
