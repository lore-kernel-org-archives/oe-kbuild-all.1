Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083552564
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oGB3b6iw5VeSN6Ipa4lUo2MBBLzregL3qvYM3zP+Ksk=;
  b=hgoXmYJg4iNHaJ9IgOHIdEDoEtszmqtx7r09OKRvjyhyQiI292IYI0x9
   4Alp149UZkOhFFXi/WvmY09aXC7ECk+njdZQfMRstqX8p6kW+rTorRrCA
   LuOL4OzlJzZQL1sA+fobBCJUnU6ujyFwpFc64QsbYmx5iimEAWAN5LAzX
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,235,1673910000"; 
   d="scan'208";a="95468588"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 12:52:05 +0100
Date: Sun, 5 Mar 2023 12:52:04 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:staging 8/8] kernel/rcu/update.c:248:2-8: preceding lock on
 line 244 (fwd)
Message-ID: <alpine.DEB.2.22.394.2303051251190.2862@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Is it correct ro leave the function with the lock held on line 248?

julia

---------- Forwarded message ----------
Date: Sun, 5 Mar 2023 19:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jfern:staging 8/8] kernel/rcu/update.c:248:2-8: preceding lock on line
     244

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Joel Fernandes (Google)" <joel@joelfernandes.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git staging
head:   e6d2024fa329f41ffba24f06090ea57e3b0041ed
commit: e6d2024fa329f41ffba24f06090ea57e3b0041ed [8/8] rcu: Add a minimum time for marking boot as completed
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-c034-20230305 (https://download.01.org/0day-ci/archive/20230305/202303051957.c7kQywF0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303051957.c7kQywF0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/rcu/update.c:248:2-8: preceding lock on line 244

vim +248 kernel/rcu/update.c

e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  241)
ee42571f4381f1 Paul E. McKenney        2015-02-19  242  void rcu_end_inkernel_boot(void)
ee42571f4381f1 Paul E. McKenney        2015-02-19  243  {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25 @244) 	mutex_lock(&rcu_boot_end_lock);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  245) 	rcu_boot_end_called = true;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  246)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  247) 	if (rcu_boot_ended)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25 @248) 		return;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  249)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  250) 	if (rcu_boot_end_delay) {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  251) 		u64 boot_ms = div_u64(ktime_get_boot_fast_ns(), 1000000UL);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  252)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  253) 		if (boot_ms < rcu_boot_end_delay) {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  254) 			schedule_delayed_work(&rcu_boot_end_work,
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  255) 					rcu_boot_end_delay - boot_ms);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  256) 			mutex_unlock(&rcu_boot_end_lock);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  257) 			return;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  258) 		}
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  259) 	}
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  260)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  261) 	cancel_delayed_work(&rcu_boot_end_work);
ee42571f4381f1 Paul E. McKenney        2015-02-19  262  	rcu_unexpedite_gp();
3e42ec1aa716f1 Paul E. McKenney        2015-11-25  263  	if (rcu_normal_after_boot)
3e42ec1aa716f1 Paul E. McKenney        2015-11-25  264  		WRITE_ONCE(rcu_normal, 1);
e40bb921119814 Jules Irenge            2020-06-01  265  	rcu_boot_ended = true;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  266) 	mutex_unlock(&rcu_boot_end_lock);
ee42571f4381f1 Paul E. McKenney        2015-02-19  267  }
0d39482c3db13a Paul E. McKenney        2015-02-18  268

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
