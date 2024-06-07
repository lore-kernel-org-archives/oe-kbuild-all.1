Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3232157A76
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717754796; cv=none; b=Bt7+j7Nosh5hHQluKuJIzq6jnSW99/F+VR+MJWTOsTisIF7ITkanQsf2jOiBql9W1RL5nHeoleUklS+jbuTfbvhuu9boeRiCDW1PqlME7CfzJ9CCmLloopp/hWWwgui9z/iibt2S1RbYzQJ2TLNrLTyaOq4gqEJvhVXnxevfoHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717754796; c=relaxed/simple;
	bh=huM0fg339y7PhbTyEAxRs0mHxtY8yfLJ8wKsnGVxFI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/o/XwlgKyi2yfmZuD5UN1x0Crdb3ggKbQsKyR2ShT/cwPKxdeJkSFXIFdgooMaUD8mxstmcprWBBnUPriivS0zddiUz2NYFNIiWTHKsZU+avQqsXcL5BXCUiXUYf4NHrjnnztVHj/WSrkOuqyrB7pUFMB4aT9B26qzcB664s+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIenx0vY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIenx0vY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717754794; x=1749290794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=huM0fg339y7PhbTyEAxRs0mHxtY8yfLJ8wKsnGVxFI8=;
  b=iIenx0vYoI7CxhTxTwKK/kbEOcEbFulnqeCf5t45ejbM6Brb/mSjp7Uq
   Rg4QGJ+tRWQ8kebYsYPsGKxHkBgGetbeF0TyePtyuiDk7k962xHtdbhvr
   ZoD+aH8ni+ewhwBNjvQduasxN8sxGM3QQH5hX2XfCgjEsBiFbPkpqxdlm
   X2dhYnyZ3S0x35X8kUb+gYU0MhDsPJ/UXLf8oWKCQisLgZBHuVchWzPwK
   db9ZoDCljJ0/J60j4/zpvgbF9QZQXF9Rukga1MOEv93wj3XW43wbNSNmA
   dIQqBn/n75p5XkekiN0Mc5p7OniBVTfqvvViH9DSUf5KJct2posadzQke
   w==;
X-CSE-ConnectionGUID: 75vqEUSJTsGuVVswSXb4qw==
X-CSE-MsgGUID: h6AQG0YlQeio2x86F/Wn1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39868587"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="39868587"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 03:06:33 -0700
X-CSE-ConnectionGUID: 08YdfMu5QWyb21OafJ3BqA==
X-CSE-MsgGUID: W4bLFdFNQCS5v5IzDKtqNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38402489"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jun 2024 03:06:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFWUF-0004bh-0R;
	Fri, 07 Jun 2024 10:06:22 +0000
Date: Fri, 7 Jun 2024 18:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [rostedt-trace:trace/persistent-ring-buf-reserve-mem-v5.15 3/30]
 kernel/trace/trace_events_trigger.c:728:6: warning: no previous prototype
 for 'event_trigger_check_remove'
Message-ID: <202406071831.TfCSQwNm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/persistent-ring-buf-reserve-mem-v5.15
head:   06c8dd8d86240bdfbab979b2a24e357380c2d742
commit: 2bb09cf6b93ab46a61eef92eef4d6b68e4bbabe1 [3/30] tracing: Add snapshot refcount
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240607/202406071831.TfCSQwNm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071831.TfCSQwNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071831.TfCSQwNm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events_trigger.c:728:6: warning: no previous prototype for 'event_trigger_check_remove' [-Wmissing-prototypes]
     728 | bool event_trigger_check_remove(const char *glob)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/event_trigger_check_remove +728 kernel/trace/trace_events_trigger.c

   640	
   641	/*
   642	 * Event trigger parsing helper functions.
   643	 *
   644	 * These functions help make it easier to write an event trigger
   645	 * parsing function i.e. the struct event_command.parse() callback
   646	 * function responsible for parsing and registering a trigger command
   647	 * written to the 'trigger' file.
   648	 *
   649	 * A trigger command (or just 'trigger' for short) takes the form:
   650	 *   [trigger] [if filter]
   651	 *
   652	 * The struct event_command.parse() callback (and other struct
   653	 * event_command functions) refer to several components of a trigger
   654	 * command.  Those same components are referenced by the event trigger
   655	 * parsing helper functions defined below.  These components are:
   656	 *
   657	 *   cmd               - the trigger command name
   658	 *   glob              - the trigger command name optionally prefaced with '!'
   659	 *   param_and_filter  - text following cmd and ':'
   660	 *   param             - text following cmd and ':' and stripped of filter
   661	 *   filter            - the optional filter text following (and including) 'if'
   662	 *
   663	 * To illustrate the use of these componenents, here are some concrete
   664	 * examples. For the following triggers:
   665	 *
   666	 *   echo 'traceon:5 if pid == 0' > trigger
   667	 *     - 'traceon' is both cmd and glob
   668	 *     - '5 if pid == 0' is the param_and_filter
   669	 *     - '5' is the param
   670	 *     - 'if pid == 0' is the filter
   671	 *
   672	 *   echo 'enable_event:sys:event:n' > trigger
   673	 *     - 'enable_event' is both cmd and glob
   674	 *     - 'sys:event:n' is the param_and_filter
   675	 *     - 'sys:event:n' is the param
   676	 *     - there is no filter
   677	 *
   678	 *   echo 'hist:keys=pid if prio > 50' > trigger
   679	 *     - 'hist' is both cmd and glob
   680	 *     - 'keys=pid if prio > 50' is the param_and_filter
   681	 *     - 'keys=pid' is the param
   682	 *     - 'if prio > 50' is the filter
   683	 *
   684	 *   echo '!enable_event:sys:event:n' > trigger
   685	 *     - 'enable_event' the cmd
   686	 *     - '!enable_event' is the glob
   687	 *     - 'sys:event:n' is the param_and_filter
   688	 *     - 'sys:event:n' is the param
   689	 *     - there is no filter
   690	 *
   691	 *   echo 'traceoff' > trigger
   692	 *     - 'traceoff' is both cmd and glob
   693	 *     - there is no param_and_filter
   694	 *     - there is no param
   695	 *     - there is no filter
   696	 *
   697	 * There are a few different categories of event trigger covered by
   698	 * these helpers:
   699	 *
   700	 *  - triggers that don't require a parameter e.g. traceon
   701	 *  - triggers that do require a parameter e.g. enable_event and hist
   702	 *  - triggers that though they may not require a param may support an
   703	 *    optional 'n' param (n = number of times the trigger should fire)
   704	 *    e.g.: traceon:5 or enable_event:sys:event:n
   705	 *  - triggers that do not support an 'n' param e.g. hist
   706	 *
   707	 * These functions can be used or ignored as necessary - it all
   708	 * depends on the complexity of the trigger, and the granularity of
   709	 * the functions supported reflects the fact that some implementations
   710	 * may need to customize certain aspects of their implementations and
   711	 * won't need certain functions.  For instance, the hist trigger
   712	 * implementation doesn't use event_trigger_separate_filter() because
   713	 * it has special requirements for handling the filter.
   714	 */
   715	
   716	/**
   717	 * event_trigger_check_remove - check whether an event trigger specifies remove
   718	 * @glob: The trigger command string, with optional remove(!) operator
   719	 *
   720	 * The event trigger callback implementations pass in 'glob' as a
   721	 * parameter.  This is the command name either with or without a
   722	 * remove(!)  operator.  This function simply parses the glob and
   723	 * determines whether the command corresponds to a trigger removal or
   724	 * a trigger addition.
   725	 *
   726	 * Return: true if this is a remove command, false otherwise
   727	 */
 > 728	bool event_trigger_check_remove(const char *glob)
   729	{
   730		return (glob && glob[0] == '!') ? true : false;
   731	}
   732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
