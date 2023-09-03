Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16AB256A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693759443; x=1725295443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pmZUF2QTMThaXsXclVpgZx2pLeAxvD/fq6Et1uDsR7g=;
  b=S5hnPgHYn+F7CX6YKElUqKDRUVf1FIgaVX/uIJLXyv1JhpBW4RvYSNh0
   fOtOi3sGt69ooypf4YmjjD9jU4Nb6SZdz6v/GMsJvO4gLjYdtQC7CNw35
   R+IhTHKzZVLmcXOxeLfmCJNvoZzeBCsX7GPfFqRpS5R3/s+e8sPGuFhiV
   +Sv+P/TJsmtUbL3QvtEZGOq5+sE6CWJ93EfVd2oAYV85Khpbz9MUhRJuL
   rYtz+zRnYh6Z8JAvyYncxxPfB3oYelNlihwDKK0lM/HDbC0ABXca9tO19
   Vli9Si63P0yLLEyidLOTiJwwj4Jx0LplusQsRGsOyZxdIQnBHe++T46BA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="380252285"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="380252285"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 09:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="1071325093"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="1071325093"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Sep 2023 09:43:59 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcqCb-0003Hz-1S;
	Sun, 03 Sep 2023 16:43:57 +0000
Date: Mon, 4 Sep 2023 00:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v3 2/7] printk: nbcon: Add acquire/release logic
Message-ID: <202309040026.yyn4RCk1-lkp@intel.com>
References: <20230903150539.245076-3-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903150539.245076-3-john.ogness@linutronix.de>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb65d08d735e00cc55ad7700a82a453bb88c93a3]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/printk-Add-non-BKL-nbcon-console-basic-infrastructure/20230903-230708
base:   cb65d08d735e00cc55ad7700a82a453bb88c93a3
patch link:    https://lore.kernel.org/r/20230903150539.245076-3-john.ogness%40linutronix.de
patch subject: [PATCH printk v3 2/7] printk: nbcon: Add acquire/release logic
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230904/202309040026.yyn4RCk1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309040026.yyn4RCk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309040026.yyn4RCk1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/nbcon.c:392: warning: expecting prototype for nbcon_context_try_acquire_hostile(). Prototype was for nbcon_context_acquire_hostile() instead


vim +392 kernel/printk/nbcon.c

   379	
   380	/**
   381	 * nbcon_context_try_acquire_hostile - Acquire via unsafe hostile takeover
   382	 * @ctxt:	The context of the caller
   383	 * @cur:	The current console state
   384	 *
   385	 * @cur is updated to the new console state.
   386	 *
   387	 * The general procedure is to set @prio (forcing ownership). This method
   388	 * must only be used as a final attempt during panic.
   389	 */
   390	static void nbcon_context_acquire_hostile(struct nbcon_context *ctxt,
   391						  struct nbcon_state *cur)
 > 392	{
   393		unsigned int cpu = smp_processor_id();
   394		struct console *con = ctxt->console;
   395		struct nbcon_state new;
   396	
   397		do {
   398			new.atom = cur->atom;
   399			new.cpu			= cpu;
   400			new.prio		= ctxt->prio;
   401			new.unsafe		|= cur->unsafe_takeover;
   402			new.unsafe_takeover	|= cur->unsafe;
   403	
   404		} while (!nbcon_state_try_cmpxchg(con, cur, &new));
   405	
   406		cur->atom = new.atom;
   407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
