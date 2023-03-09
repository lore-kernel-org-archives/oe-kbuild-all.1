Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5964C26E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678386338; x=1709922338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t31bAmvs8PIE1T3a1NHnS6aVNlINx7CCUTNUKzpvmsI=;
  b=TZijEJlRD/unQ70P0g+tJ4hCo1YEJThrQH29hu3Ql6QKxL8Hddu1aaQy
   G64pTOxyFK6Adxkgbob45DIIvTQjvsC9Fbz+WpVAHbaIEG9hUydUgYl+Q
   X6siYZtKo8gROfCXMbhXssWnah6zDnJMKcZON7Q96SBsxkxMIoH2fsRvx
   3WzAwEUjNSlkAtqC95S27CC5LbR+6qt/c/+9flctf7NxbnEyBkyuvJ92K
   PdYXN/zyQwhVK7rFODewEv9qQXMi56mDo7gG11jcNsS3C8BC2WrW/uBCa
   L3msYd7o4D5Yz66HH/gUf6eyhAt/g7SQ4FH+vgduyT9mhx9o6Hy0HPPlp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316925218"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="316925218"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 10:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="766534949"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="766534949"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2023 10:25:36 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paKxM-000394-1D;
	Thu, 09 Mar 2023 18:25:36 +0000
Date: Fri, 10 Mar 2023 02:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.3.y-rt-rebase 14/47]
 kernel/printk/printk.c:3190:56: warning: suggest braces around empty body in
 an 'if' statement
Message-ID: <202303100222.bWfuM8ki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase
head:   c0ca8b79d21d0c9a1ac7ed0ebebb5588804ba825
commit: f7ffa0536cb17da9589ecda6513bfa0bd1fd1745 [14/47] printk: add infrastucture for atomic consoles
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230310/202303100222.bWfuM8ki-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=f7ffa0536cb17da9589ecda6513bfa0bd1fd1745
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout f7ffa0536cb17da9589ecda6513bfa0bd1fd1745
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100222.bWfuM8ki-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/printk/printk.c: In function '__console_emit_next_record':
>> kernel/printk/printk.c:3190:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    3190 |                 console_prepend_dropped(&pmsg, dropped);
         |                                                        ^
   At top level:
   kernel/printk/printk.c:2924:13: warning: 'console_is_usable_unlocked' defined but not used [-Wunused-function]
    2924 | static bool console_is_usable_unlocked(struct console *con)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/if +3190 kernel/printk/printk.c

  3143	
  3144	/*
  3145	 * Print one record for the given console. The record printed is whatever
  3146	 * record is the next available record for the given console.
  3147	 *
  3148	 * @handover will be set to true if a printk waiter has taken over the
  3149	 * console_lock, in which case the caller is no longer holding both the
  3150	 * console_lock and the SRCU read lock. Otherwise it is set to false.
  3151	 *
  3152	 * @cookie is the cookie from the SRCU read lock.
  3153	 *
  3154	 * Returns false if the given console has no next record to print, otherwise
  3155	 * true.
  3156	 *
  3157	 * Requires the console_lock and the SRCU read lock.
  3158	 */
  3159	static bool __console_emit_next_record(struct console *con, bool *handover,
  3160					       int cookie, bool atomic_printing)
  3161	{
  3162		static struct printk_buffers pbufs;
  3163	
  3164		bool is_extended = con->flags & CON_EXTENDED;
  3165		char *outbuf = &pbufs.outbuf[0];
  3166		struct printk_message pmsg = {
  3167			.pbufs = &pbufs,
  3168		};
  3169		unsigned long flags;
  3170		unsigned long dropped = 0;
  3171		u64 seq;
  3172	
  3173		if (handover)
  3174			*handover = false;
  3175	
  3176		seq = read_console_seq(con);
  3177		if (!printk_get_next_message(&pmsg, seq, is_extended, true))
  3178			return false;
  3179	
  3180		atomic_long_add((unsigned long)(pmsg.dropped), &con->dropped);
  3181	
  3182		/* Skip messages of formatted length 0. */
  3183		if (pmsg.outbuf_len == 0) {
  3184			write_console_seq(con, pmsg.seq + 1, atomic_printing);
  3185			goto skip;
  3186		}
  3187	
  3188		dropped = atomic_long_xchg_relaxed(&con->dropped, 0);
  3189		if (dropped && !is_extended)
> 3190			console_prepend_dropped(&pmsg, dropped);
  3191	
  3192		if (handover) {
  3193			/*
  3194			 * While actively printing out messages, if another printk()
  3195			 * were to occur on another CPU, it may wait for this one to
  3196			 * finish. This task can not be preempted if there is a
  3197			 * waiter waiting to take over.
  3198			 *
  3199			 * Interrupts are disabled because the hand over to a waiter
  3200			 * must not be interrupted until the hand over is completed
  3201			 * (@console_waiter is cleared).
  3202			 */
  3203			printk_safe_enter_irqsave(flags);
  3204			console_lock_spinning_enable();
  3205	
  3206			/* Do not trace print latency. */
  3207			stop_critical_timings();
  3208		}
  3209	
  3210		/* Write everything out to the hardware. */
  3211		if (atomic_printing)
  3212			con->write_atomic(con, outbuf, pmsg.outbuf_len);
  3213		else
  3214			con->write(con, outbuf, pmsg.outbuf_len);
  3215	
  3216		write_console_seq(con, pmsg.seq + 1, atomic_printing);
  3217		if (handover) {
  3218			start_critical_timings();
  3219	
  3220			*handover = console_lock_spinning_disable_and_check(cookie);
  3221			printk_safe_exit_irqrestore(flags);
  3222		}
  3223	skip:
  3224		return true;
  3225	}
  3226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
