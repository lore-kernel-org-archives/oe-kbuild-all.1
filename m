Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727481C16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Nov 2022 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669193345; x=1700729345;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=kaiKbKkkfftm9/wXFtQmFt+lENuMMMB/cRBpYNqNUso=;
  b=ija9gYP+Vuss0+6ZWGrg5JyV/mzpNFpdiInuU2UkVyP4zPY4F5PUu/X6
   poGQdXCjC1/A6exnwapLj6Kodveo76FmXcmnw6FTobMAzpYT3acAtBGNr
   ZoW3pU7baTeDWZqmojit0rWNtqPmUJKN+ffk7WwmAPB1YV5DK5J+L4jk1
   UmYTfB6yGPlf6/DPgZRP0A9qYOdzwxragKf/71laV8VMNB05hv42U6dXd
   QCQypnOCQcuq567Q6KPXwARJos5ibo5ThimAvod3CC51P342SZqXBndls
   nGt9/1CSrIlheyWCAlFYGA1n8UXVEmAyAlVP+n6fDiGLrc73bGS7jNSsq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="293724799"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="293724799"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:49:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="710510353"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="710510353"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.254.208.60]) ([10.254.208.60])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:49:03 -0800
Subject: Re: [jfern:sched/pe/balancefix.wip.11212022 3/13]
 include/linux/sched.h:2206:33: error: 'struct task_struct' has no member
 named 'blocked_lock'; did you mean 'blocked_on'?
To: Joel Fernandes <joel@joelfernandes.org>, kernel test robot <lkp@intel.com>
Cc: Connor O'Brien <connoro@google.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 oe-kbuild-all@lists.linux.dev
References: <202211221459.3kWqiEDS-lkp@intel.com>
 <CAEXW_YS+GJ74mWxW_9FExfThqZhJPBcNS_yu2-wVThiRZo31Pw@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <5e5ac038-7903-2181-f531-d0f98ff7f818@intel.com>
Date: Wed, 23 Nov 2022 16:49:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAEXW_YS+GJ74mWxW_9FExfThqZhJPBcNS_yu2-wVThiRZo31Pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 11/22/2022 8:42 PM, Joel Fernandes wrote:
> Hi Rong,
> Do you mind adding a rule to not test wip branches please? I thought 
> this was already a default rule.

Done, thanks for your feedback.

Best Regards,
Rong Chen

> 
> Thanks!
> 
> Joel
> 
> On Tue, Nov 22, 2022 at 1:47 AM kernel test robot <lkp@intel.com 
> <mailto:lkp@intel.com>> wrote:
> 
>     tree:
>     https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
>     <https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git>
>     sched/pe/balancefix.wip.11212022
>     head:   864f30d37472768b17b826bb14f0a2afa55e5042
>     commit: 28ee1d333150affe3df1ee1e08e6236cf5d30166 [3/13]
>     kernel/locking: Add p->blocked_on wrapper
>     config: m68k-allyesconfig
>     compiler: m68k-linux-gcc (GCC) 12.1.0
>     reproduce (this is a W=1 build):
>              wget
>     https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>     <https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross>
>     -O ~/bin/make.cross
>              chmod +x ~/bin/make.cross
>              #
>     https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=28ee1d333150affe3df1ee1e08e6236cf5d30166
>     <https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=28ee1d333150affe3df1ee1e08e6236cf5d30166>
>              git remote add jfern
>     https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
>     <https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git>
>              git fetch --no-tags jfern sched/pe/balancefix.wip.11212022
>              git checkout 28ee1d333150affe3df1ee1e08e6236cf5d30166
>              # save the config file
>              mkdir build_dir && cp config build_dir/.config
>              COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0
>     make.cross W=1 O=build_dir ARCH=m68k prepare
> 
>     If you fix the issue, kindly add following tag where applicable
>     | Reported-by: kernel test robot <lkp@intel.com <mailto:lkp@intel.com>>
> 
>     Note: the jfern/sched/pe/balancefix.wip.11212022 HEAD
>     864f30d37472768b17b826bb14f0a2afa55e5042 builds fine.
>            It only hurts bisectability.
> 
>     All errors (new ones prefixed by >>):
> 
>         In file included from include/linux/rcupdate.h:29,
>                          from include/linux/rculist.h:11,
>                          from include/linux/pid.h:5,
>                          from include/linux/sched.h:14,
>                          from arch/m68k/kernel/asm-offsets.c:15:
>         include/linux/sched.h: In function 'set_task_blocked_on':
>      >> include/linux/sched.h:2206:33: error: 'struct task_struct' has
>     no member named 'blocked_lock'; did you mean 'blocked_on'?
>          2206 |         lockdep_assert_held(&p->blocked_lock);
>               |                                 ^~~~~~~~~~~~
>         include/linux/lockdep.h:415:61: note: in definition of macro
>     'lockdep_assert_held'
>           415 | #define lockdep_assert_held(l)                  do {
>     (void)(l); } while (0)
>               |                                                         
>         ^
>         make[2]: *** [scripts/Makefile.build:117:
>     arch/m68k/kernel/asm-offsets.s] Error 1
>         make[2]: Target '__build' not remade because of errors.
>         make[1]: *** [Makefile:1205: prepare0] Error 2
>         make[1]: Target 'prepare' not remade because of errors.
>         make: *** [Makefile:222: __sub-make] Error 2
>         make: Target 'prepare' not remade because of errors.
> 
> 
>     vim +2206 include/linux/sched.h
> 
>        2203
>        2204  static inline void set_task_blocked_on(struct task_struct
>     *p, struct mutex *m)
>        2205  {
>      > 2206          lockdep_assert_held(&p->blocked_lock);
>        2207
>        2208          p->blocked_on = m;
>        2209  }
>        2210
> 
>     -- 
>     0-DAY CI Kernel Test Service
>     https://01.org/lkp <https://01.org/lkp>
> 
