Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2483C6A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695225478; x=1726761478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U06UEjfbDpwUyjwQ4zD2dI4F8pWZSId0Txotlq8VNgs=;
  b=doBY0+/nw/jh9qfEGfYEJlqxdZTB1Vy1P98mEMuspUEH/kdI46I44Sbj
   o4Y036qO/kWgDaZG8lBwzMATSjiSsgSIQKyC4ViqsvNiaITQN2zom1gxd
   zoPqE5Nocjfi+60Z6DEvfXMvjStPUA75nBWm3KzEPTBbGjMkaMMfxnS6+
   btzXEJdVRrg7XckWoiWNYSxZ749XuqvGKQPJUQ4Go8JOKe8Z3B5eUHZ5o
   EXaxV9mQc0odtvQRNMq6/vlMpfMe1pY1CX81S/KJjbN1+EDzfuf/wQx7J
   OxwshLc0PECSSjy8n+Wsw84FzZ+OB5M60HGxzXBt/Sky7HgLpsLENsPUC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466571400"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="466571400"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 08:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816960208"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816960208"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2023 08:57:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qizaK-0008uG-0v;
	Wed, 20 Sep 2023 15:57:52 +0000
Date: Wed, 20 Sep 2023 23:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] printk/nbcon: Add assert that CPU migration is disabled
 when calling nbcon_context_try_acquire()
Message-ID: <202309202313.vdq31WtT-lkp@intel.com>
References: <20230920125136.15504-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920125136.15504-1-pmladek@suse.com>

Hi Petr,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230920]
[cannot apply to linus/master v6.6-rc2 v6.6-rc1 v6.5 v6.6-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Mladek/printk-nbcon-Add-assert-that-CPU-migration-is-disabled-when-calling-nbcon_context_try_acquire/20230920-205406
base:   next-20230920
patch link:    https://lore.kernel.org/r/20230920125136.15504-1-pmladek%40suse.com
patch subject: [PATCH] printk/nbcon: Add assert that CPU migration is disabled when calling nbcon_context_try_acquire()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230920/202309202313.vdq31WtT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202313.vdq31WtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202313.vdq31WtT-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/printk/nbcon.c: In function 'nbcon_context_try_acquire':
>> kernel/printk/nbcon.c:595:9: error: implicit declaration of function 'nbcon_assert_cpu_migration_disabled'; did you mean 'nbcon_assert_cpu_migration'? [-Werror=implicit-function-declaration]
     595 |         nbcon_assert_cpu_migration_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         nbcon_assert_cpu_migration
   cc1: some warnings being treated as errors


vim +595 kernel/printk/nbcon.c

   575	
   576	/**
   577	 * nbcon_context_try_acquire - Try to acquire nbcon console
   578	 * @ctxt:	The context of the caller
   579	 *
   580	 * Return:	True if the console was acquired. False otherwise.
   581	 *
   582	 * If the caller allowed an unsafe hostile takeover, on success the
   583	 * caller should check the current console state to see if it is
   584	 * in an unsafe state. Otherwise, on success the caller may assume
   585	 * the console is not in an unsafe state.
   586	 */
   587	__maybe_unused
   588	static bool nbcon_context_try_acquire(struct nbcon_context *ctxt)
   589	{
   590		unsigned int cpu = smp_processor_id();
   591		struct console *con = ctxt->console;
   592		struct nbcon_state cur;
   593		int err;
   594	
 > 595		nbcon_assert_cpu_migration_disabled();
   596	
   597		nbcon_state_read(con, &cur);
   598	try_again:
   599		err = nbcon_context_try_acquire_direct(ctxt, &cur);
   600		if (err != -EBUSY)
   601			goto out;
   602	
   603		err = nbcon_context_try_acquire_handover(ctxt, &cur);
   604		if (err == -EAGAIN)
   605			goto try_again;
   606		if (err != -EBUSY)
   607			goto out;
   608	
   609		err = nbcon_context_try_acquire_hostile(ctxt, &cur);
   610	out:
   611		if (err)
   612			return false;
   613	
   614		/* Acquire succeeded. */
   615	
   616		/* Assign the appropriate buffer for this context. */
   617		if (atomic_read(&panic_cpu) == cpu)
   618			ctxt->pbufs = &panic_nbcon_pbufs;
   619		else
   620			ctxt->pbufs = con->pbufs;
   621	
   622		/* Set the record sequence for this context to print. */
   623		ctxt->seq = nbcon_seq_read(ctxt->console);
   624	
   625		return true;
   626	}
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
