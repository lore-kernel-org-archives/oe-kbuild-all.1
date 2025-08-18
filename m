Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED43927B355
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521526; cv=none; b=Ovqdj2YEGkK0ByUjvon8r7Zy2jk7Fur0ixdao0Fd7C0io1ejEgw26rAEcX6vJuC2j9+imNiVwCt6jJAwi4GZvo7T0Ti5P4R9q8vXCcyLRXXZuEHmlST46Br3PXH1E772ck69ZqD4JvKrUuJ9Z66Yd9Mxcu104kfj2CZYE4I0koY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521526; c=relaxed/simple;
	bh=fXmmvLVM8lM0QTyf26JrDi591TTfihYQY//wym5L3Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMGFAmM8JEH+CbLp3CO5RUKJqLozWtoQR8Z1HHXwNyjVI7nLyD2WdGAGUPgiazmj45luNo4Knc2POkt4A1KdfxXVYHe+se5iUdyTLIK3+BSMZf2rv30Ycj/8V98Zm1BUBKYXSQqLjJOgkw2GS1KmKEXnm8nc9vyMKxIDBzkO2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLuy5OP6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLuy5OP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755521525; x=1787057525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXmmvLVM8lM0QTyf26JrDi591TTfihYQY//wym5L3Y4=;
  b=gLuy5OP6dAc+f6NHGdpLZiz5rebRS1mU0YwkwmFW/n/GoBO1O7eP72NY
   n6P7oWncPOan5bfvMVdKYVS+kRj4kr1J2Bo1a2ZB2ktYaNr9WFz8/ZJIG
   wHZ4aggc7YFxoeaMNXiWG/gp1OsvhiiWRQHAutCkj9foklLAEvxnSSlam
   pt1Npg2I9cPDw4g4fz2Phz8xXR9JeC0gEpH8xg7YE2BslCMWqVVNAAb0i
   eSE6IE7C6Z+ZWunr/29WYLzi7KfYU/FQ/lYnDhjh8lFwxY1YM+K3sKFzo
   HZQYDaCuLBiBsDmrN+IHnrjmv5Be7C8xtuOUzmaK06c4an1YyFomc5yJt
   w==;
X-CSE-ConnectionGUID: gIr7Odp7TKqptFThdTG09g==
X-CSE-MsgGUID: 4+UVWHOxRLO8MHWvlYjMiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57816229"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57816229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:52:04 -0700
X-CSE-ConnectionGUID: yLBmYAKISZmqOJg3sHgMHA==
X-CSE-MsgGUID: uT4/3Ie1Rmejt/X05Am6EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166799937"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Aug 2025 05:52:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unzLA-000EEj-2j;
	Mon, 18 Aug 2025 12:51:58 +0000
Date: Mon, 18 Aug 2025 20:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/wip 22/22] include/linux/rseq_entry.h:89:46: error:
 expected '(' before numeric constant
Message-ID: <202508182053.onBmJkT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/wip
head:   2ed24d7e3d47635bfe7f937dc664400822e56daa
commit: 2ed24d7e3d47635bfe7f937dc664400822e56daa [22/22] rewrite
config: x86_64-buildonly-randconfig-003-20250818 (https://download.01.org/0day-ci/archive/20250818/202508182053.onBmJkT3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508182053.onBmJkT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508182053.onBmJkT3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rseq.c:17:
   include/linux/rseq_entry.h: In function 'rseq_update_user_cs':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:108:9: note: in expansion of macro 'rseq_stat_inc'
     108 |         rseq_stat_inc(rseq_stats.cs);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:176:9: note: in expansion of macro 'rseq_stat_inc'
     176 |         rseq_stat_inc(rseq_stats.fixup);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:183:9: note: in expansion of macro 'rseq_stat_inc'
     183 |         rseq_stat_inc(rseq_stats.clear);
         |         ^~~~~~~~~~~~~
   include/linux/rseq_entry.h: In function 'rseq_set_uids':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:225:9: note: in expansion of macro 'rseq_stat_inc'
     225 |         rseq_stat_inc(rseq_stats.ids);
         |         ^~~~~~~~~~~~~
   include/linux/rseq_entry.h: In function 'rseq_exit_to_user_mode_restart':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:307:9: note: in expansion of macro 'rseq_stat_inc'
     307 |         rseq_stat_inc(rseq_stats.exit);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:340:9: error: too many arguments to function 'rseq_trace_update'
     340 |         rseq_trace_update(t, idptr);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/rseq_entry.h:56:20: note: declared here
      56 | static inline void rseq_trace_update(struct task_struct *t) { }
         |                    ^~~~~~~~~~~~~~~~~
   kernel/rseq.c: In function 'rseq_slowpath_update_usr':
>> kernel/rseq.c:190:9: error: too many arguments to function 'rseq_trace_update'
     190 |         rseq_trace_update(t, &ids);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/rseq_entry.h:56:20: note: declared here
      56 | static inline void rseq_trace_update(struct task_struct *t) { }
         |                    ^~~~~~~~~~~~~~~~~
   kernel/rseq.c: In function '__rseq_handle_slowpath':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   kernel/rseq.c:206:9: note: in expansion of macro 'rseq_stat_inc'
     206 |         rseq_stat_inc(rseq_stats.slowp);
         |         ^~~~~~~~~~~~~
   kernel/rseq.c: In function '__rseq_signal_deliver':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   kernel/rseq.c:222:9: note: in expansion of macro 'rseq_stat_inc'
     222 |         rseq_stat_inc(rseq_stats.signal);
         |         ^~~~~~~~~~~~~
--
   In file included from include/linux/irq-entry-common.h:7,
                    from include/linux/entry-common.h:5,
                    from arch/x86/kernel/signal.c:28:
   include/linux/rseq_entry.h: In function 'rseq_update_user_cs':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:108:9: note: in expansion of macro 'rseq_stat_inc'
     108 |         rseq_stat_inc(rseq_stats.cs);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:176:9: note: in expansion of macro 'rseq_stat_inc'
     176 |         rseq_stat_inc(rseq_stats.fixup);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:183:9: note: in expansion of macro 'rseq_stat_inc'
     183 |         rseq_stat_inc(rseq_stats.clear);
         |         ^~~~~~~~~~~~~
   include/linux/rseq_entry.h: In function 'rseq_set_uids':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:225:9: note: in expansion of macro 'rseq_stat_inc'
     225 |         rseq_stat_inc(rseq_stats.ids);
         |         ^~~~~~~~~~~~~
   include/linux/rseq_entry.h: In function 'rseq_exit_to_user_mode_restart':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:307:9: note: in expansion of macro 'rseq_stat_inc'
     307 |         rseq_stat_inc(rseq_stats.exit);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:340:9: error: too many arguments to function 'rseq_trace_update'
     340 |         rseq_trace_update(t, idptr);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/rseq_entry.h:56:20: note: declared here
      56 | static inline void rseq_trace_update(struct task_struct *t) { }
         |                    ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/irq-entry-common.h:7,
                    from include/linux/entry-common.h:5,
                    from arch/x86/kernel/process.c:31:
   include/linux/rseq_entry.h: In function 'rseq_update_user_cs':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:108:9: note: in expansion of macro 'rseq_stat_inc'
     108 |         rseq_stat_inc(rseq_stats.cs);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:176:9: note: in expansion of macro 'rseq_stat_inc'
     176 |         rseq_stat_inc(rseq_stats.fixup);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:183:9: note: in expansion of macro 'rseq_stat_inc'
     183 |         rseq_stat_inc(rseq_stats.clear);
         |         ^~~~~~~~~~~~~
   include/linux/rseq_entry.h: In function 'rseq_set_uids':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:225:9: note: in expansion of macro 'rseq_stat_inc'
     225 |         rseq_stat_inc(rseq_stats.ids);
         |         ^~~~~~~~~~~~~
   include/linux/rseq_entry.h: In function 'rseq_exit_to_user_mode_restart':
>> include/linux/rseq_entry.h:89:46: error: expected '(' before numeric constant
      89 | #define rseq_stat_inc(x)        do { } while 0
         |                                              ^
   include/linux/rseq_entry.h:307:9: note: in expansion of macro 'rseq_stat_inc'
     307 |         rseq_stat_inc(rseq_stats.exit);
         |         ^~~~~~~~~~~~~
>> include/linux/rseq_entry.h:340:9: error: too many arguments to function 'rseq_trace_update'
     340 |         rseq_trace_update(t, idptr);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/rseq_entry.h:56:20: note: declared here
      56 | static inline void rseq_trace_update(struct task_struct *t) { }
         |                    ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/process.c: In function 'arch_post_acpi_subsys_init':
   arch/x86/kernel/process.c:974:17: warning: variable 'hi' set but not used [-Wunused-but-set-variable]
     974 |         u32 lo, hi;
         |                 ^~


vim +89 include/linux/rseq_entry.h

    87	
    88	#else /* CONFIG_RSEQ_STATS */
  > 89	#define rseq_stat_inc(x)	do { } while 0
    90	#endif /* !CONFIG_RSEQ_STATS */
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
