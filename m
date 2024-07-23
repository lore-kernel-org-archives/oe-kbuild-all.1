Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7121E4AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 03:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721704697; cv=none; b=MjnMJBKX62K0+iu6oIvj74W7B1/5Q7an46QyUN8QZSPBh8J5rKX4h2HoffX/GQszhyHE/+gh8hF2J/jkpDKyBNEoEEPaaOpNPUGT9FkpcpqRxNvZrBYtT/uZuh9YNX+m2z6NoQngpfvPAPe8hIbjnW65tTOnplqIgiZyDICPDyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721704697; c=relaxed/simple;
	bh=UZvKV/N2MmpA7QaJlPL9o52SDXf1Cg5eic8FeDJGkSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pt+e+xWVQvlMiThla+OFiyYT5DP21L/mROZtpcVB3TjbeWsc3SOVMs/rOj0qtTxaFFlEj79agqA7FLsVt+bI9iVDJnjTK+dNWqnc1O6S5g5ESw5MJf50ZsRaftIh3OnAM/GiS1xBOf4SXm9eUcuvUQsC6xWyBrkSmKZLzzfj0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDVOko3j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDVOko3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721704695; x=1753240695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UZvKV/N2MmpA7QaJlPL9o52SDXf1Cg5eic8FeDJGkSE=;
  b=DDVOko3j+3O6/YhPIwlA2291qbF+ux/oEE8ZiE3n8kduMlL/xCmze+Qc
   kCc5mA4acuGvoMsw00XspsUT7GB/3wa3sVdBbAjNuN5qcKizHNYv6QMWm
   J9EnGYksZnZtm/ys8tv4ONE7r+cPuyXbdZHmsxGgjvAJ95r6gLXwMvzlB
   Ms3TBZUtKf2q8FKp5g8nwe9HRkybUlF9j6u9HYN6VaL31cnXfLYGuRRp6
   uyjJTabC4gcvxNMDwWDRWyGD6XNZ7dtf0KOfga6X6Am9jjEkYbrP/P8Vv
   vYFvSPMC+zNRfAusmF42P1vzOikI3OJ3md2qJfkamCaiSYOIOV6DdAo9B
   g==;
X-CSE-ConnectionGUID: O8oiUwzDS32hlpL/4cUQJA==
X-CSE-MsgGUID: qupI7i34Q+qvoDZiQ64WFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30693862"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="30693862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 20:18:14 -0700
X-CSE-ConnectionGUID: 7O0cQ0plTaG+4IIdNJDn0A==
X-CSE-MsgGUID: Ogpr5fJoQ42xIxKBxBm2vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="82714322"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jul 2024 20:18:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW62T-000lbA-0A;
	Tue, 23 Jul 2024 03:18:09 +0000
Date: Tue, 23 Jul 2024 11:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v3 11/19] printk: nbcon: Rely on kthreads for
 normal operation
Message-ID: <202407231117.SngBfEcI-lkp@intel.com>
References: <20240722171939.3349410-12-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722171939.3349410-12-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on b18703ea7157f62f02eb0ceb11f6fa0138e90adc]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/printk-nbcon-Clarify-nbcon_get_default_prio-context/20240723-015154
base:   b18703ea7157f62f02eb0ceb11f6fa0138e90adc
patch link:    https://lore.kernel.org/r/20240722171939.3349410-12-john.ogness%40linutronix.de
patch subject: [PATCH printk v3 11/19] printk: nbcon: Rely on kthreads for normal operation
config: x86_64-buildonly-randconfig-002-20240723 (https://download.01.org/0day-ci/archive/20240723/202407231117.SngBfEcI-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231117.SngBfEcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231117.SngBfEcI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:62:
   kernel/printk/internal.h: In function 'printk_get_console_flush_type':
   kernel/printk/internal.h:219:26: error: implicit declaration of function 'is_printk_deferred'; did you mean '_printk_deferred'? [-Werror=implicit-function-declaration]
     219 |    if (prefer_offload || is_printk_deferred())
         |                          ^~~~~~~~~~~~~~~~~~
         |                          _printk_deferred
   kernel/printk/printk.c: In function 'resume_console':
>> kernel/printk/printk.c:2706:3: error: implicit declaration of function 'nbcon_wake_kthreads'; did you mean 'irq_wake_thread'? [-Werror=implicit-function-declaration]
    2706 |   nbcon_wake_kthreads();
         |   ^~~~~~~~~~~~~~~~~~~
         |   irq_wake_thread
   cc1: some warnings being treated as errors


vim +2706 kernel/printk/printk.c

  2683	
  2684	void resume_console(void)
  2685	{
  2686		struct console_flush_type ft;
  2687		struct console *con;
  2688	
  2689		if (!console_suspend_enabled)
  2690			return;
  2691	
  2692		console_list_lock();
  2693		for_each_console(con)
  2694			console_srcu_write_flags(con, con->flags & ~CON_SUSPENDED);
  2695		console_list_unlock();
  2696	
  2697		/*
  2698		 * Ensure that all SRCU list walks have completed. All printing
  2699		 * contexts must be able to see they are no longer suspended so
  2700		 * that they are guaranteed to wake up and resume printing.
  2701		 */
  2702		synchronize_srcu(&console_srcu);
  2703	
  2704		printk_get_console_flush_type(&ft, true);
  2705		if (ft.nbcon_offload)
> 2706			nbcon_wake_kthreads();
  2707	
  2708		pr_flush(1000, true);
  2709	}
  2710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
