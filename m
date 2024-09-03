Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFC818DF78
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387150; cv=none; b=PtLGm0S2mboMrMp4uxWrqhXnYTgMWvF++bqKKb7875g1hrPKEg+d53JQVehUP0WwX98zBnduvNRyc4/AVP+wA5ybn6NPnnztIYrheruZlB15QAG/LcgmPTi1vTWfIqrTUUd+cQE+cKALhhsRaKWTopcSO/WZgu42TsWUGSvdMx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387150; c=relaxed/simple;
	bh=pzCgbYp+uZiPVye8BBNyhOit5czUSbS56GIlK+PdvrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWHfG4F6TJ3FidDYHvmVYiJpAMknnmVzIbLOFfOgf/LnkNZ8aDSvAMwkGjDdHCf2JLclzqdUFSr72B+Q6h52X82wgi2b9Xkp6eK4dzOMpCM0Gry327uN0vsQwDfAdnx45Av2Nx9G6innF2ribPFg62gE3Jdp2pZJ2ltw9k+VyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy/RQzd9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy/RQzd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725387149; x=1756923149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pzCgbYp+uZiPVye8BBNyhOit5czUSbS56GIlK+PdvrU=;
  b=Jy/RQzd9SECmpgrjY79QGBy3bwmjeACQHeyBMXLEoESPrS9/Ztiz0ijL
   oNc+oQxKTUoZ7e4o1RfFrELu/XChfVbO1wqXaLmjhipx3LMOkcSP2QTyo
   DYXfw5CDfygIHjGl3XYr/1ecKlPokOD2y15YUEY0Ir2v2C3AFeps2K2p5
   YtWPE5laBSPCsm+BGf4CuEaDoJ+BduGQdJ6sCh+UnSTsZo0vjPYKOAAN/
   wHQI7VII5vlk/AoluIY0axyNnt24wG/HHbhLUZKDC7mF7hby/DbvIxmE3
   xJh8taeatdR10lI6mhOQpnhxUva1BBUuF96q07B+aSMWcfmo5I2uXNcrT
   Q==;
X-CSE-ConnectionGUID: 4McbCG4uQfGUpFy6xlH9MA==
X-CSE-MsgGUID: er0CAqMSRZmmOJQpik32nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24168962"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="24168962"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 11:12:28 -0700
X-CSE-ConnectionGUID: Bww0iBw6S1SqK7h9ZA/7yA==
X-CSE-MsgGUID: 0vRmUWqVSnSod1/3SVXfgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69617272"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Sep 2024 11:12:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slY0s-00071I-36;
	Tue, 03 Sep 2024 18:12:22 +0000
Date: Wed, 4 Sep 2024 02:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>, christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, lihongbo22@huawei.com,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] soc/fsl/qbman: make use of the helper function
 kthread_run_on_cpu()
Message-ID: <202409040110.A8frNNIF-lkp@intel.com>
References: <20240902133125.3089560-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902133125.3089560-1-lihongbo22@huawei.com>

Hi Hongbo,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240902]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/soc-fsl-qbman-make-use-of-the-helper-function-kthread_run_on_cpu/20240903-060257
base:   next-20240902
patch link:    https://lore.kernel.org/r/20240902133125.3089560-1-lihongbo22%40huawei.com
patch subject: [PATCH -next] soc/fsl/qbman: make use of the helper function kthread_run_on_cpu()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240904/202409040110.A8frNNIF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040110.A8frNNIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040110.A8frNNIF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/qbman/qman_test_stash.c: In function 'on_all_cpus':
>> drivers/soc/fsl/qbman/qman_test_stash.c:111:41: error: too many arguments to function 'kthread_run_on_cpu'
     111 |                 struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
         |                                         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/soc/fsl/qbman/dpaa_sys.h:38,
                    from drivers/soc/fsl/qbman/qman_priv.h:31,
                    from drivers/soc/fsl/qbman/qman_test.h:31,
                    from drivers/soc/fsl/qbman/qman_test_stash.c:31:
   include/linux/kthread.h:73:1: note: declared here
      73 | kthread_run_on_cpu(int (*threadfn)(void *data), void *data,
         | ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/kthread_run_on_cpu +111 drivers/soc/fsl/qbman/qman_test_stash.c

    35	
    36	/*
    37	 * Algorithm:
    38	 *
    39	 * Each cpu will have HP_PER_CPU "handlers" set up, each of which incorporates
    40	 * an rx/tx pair of FQ objects (both of which are stashed on dequeue). The
    41	 * organisation of FQIDs is such that the HP_PER_CPU*NUM_CPUS handlers will
    42	 * shuttle a "hot potato" frame around them such that every forwarding action
    43	 * moves it from one cpu to another. (The use of more than one handler per cpu
    44	 * is to allow enough handlers/FQs to truly test the significance of caching -
    45	 * ie. when cache-expiries are occurring.)
    46	 *
    47	 * The "hot potato" frame content will be HP_NUM_WORDS*4 bytes in size, and the
    48	 * first and last words of the frame data will undergo a transformation step on
    49	 * each forwarding action. To achieve this, each handler will be assigned a
    50	 * 32-bit "mixer", that is produced using a 32-bit LFSR. When a frame is
    51	 * received by a handler, the mixer of the expected sender is XOR'd into all
    52	 * words of the entire frame, which is then validated against the original
    53	 * values. Then, before forwarding, the entire frame is XOR'd with the mixer of
    54	 * the current handler. Apart from validating that the frame is taking the
    55	 * expected path, this also provides some quasi-realistic overheads to each
    56	 * forwarding action - dereferencing *all* the frame data, computation, and
    57	 * conditional branching. There is a "special" handler designated to act as the
    58	 * instigator of the test by creating an enqueuing the "hot potato" frame, and
    59	 * to determine when the test has completed by counting HP_LOOPS iterations.
    60	 *
    61	 * Init phases:
    62	 *
    63	 * 1. prepare each cpu's 'hp_cpu' struct using on_each_cpu(,,1) and link them
    64	 *    into 'hp_cpu_list'. Specifically, set processor_id, allocate HP_PER_CPU
    65	 *    handlers and link-list them (but do no other handler setup).
    66	 *
    67	 * 2. scan over 'hp_cpu_list' HP_PER_CPU times, the first time sets each
    68	 *    hp_cpu's 'iterator' to point to its first handler. With each loop,
    69	 *    allocate rx/tx FQIDs and mixer values to the hp_cpu's iterator handler
    70	 *    and advance the iterator for the next loop. This includes a final fixup,
    71	 *    which connects the last handler to the first (and which is why phase 2
    72	 *    and 3 are separate).
    73	 *
    74	 * 3. scan over 'hp_cpu_list' HP_PER_CPU times, the first time sets each
    75	 *    hp_cpu's 'iterator' to point to its first handler. With each loop,
    76	 *    initialise FQ objects and advance the iterator for the next loop.
    77	 *    Moreover, do this initialisation on the cpu it applies to so that Rx FQ
    78	 *    initialisation targets the correct cpu.
    79	 */
    80	
    81	/*
    82	 * helper to run something on all cpus (can't use on_each_cpu(), as that invokes
    83	 * the fn from irq context, which is too restrictive).
    84	 */
    85	struct bstrap {
    86		int (*fn)(void);
    87		atomic_t started;
    88	};
    89	static int bstrap_fn(void *bs)
    90	{
    91		struct bstrap *bstrap = bs;
    92		int err;
    93	
    94		atomic_inc(&bstrap->started);
    95		err = bstrap->fn();
    96		if (err)
    97			return err;
    98		while (!kthread_should_stop())
    99			msleep(20);
   100		return 0;
   101	}
   102	static int on_all_cpus(int (*fn)(void))
   103	{
   104		int cpu;
   105	
   106		for_each_cpu(cpu, cpu_online_mask) {
   107			struct bstrap bstrap = {
   108				.fn = fn,
   109				.started = ATOMIC_INIT(0)
   110			};
 > 111			struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
   112							cpu, "hotpotato%d", cpu);
   113			int ret;
   114	
   115			if (IS_ERR(k))
   116				return -ENOMEM;
   117			/*
   118			 * If we call kthread_stop() before the "wake up" has had an
   119			 * effect, then the thread may exit with -EINTR without ever
   120			 * running the function. So poll until it's started before
   121			 * requesting it to stop.
   122			 */
   123			while (!atomic_read(&bstrap.started))
   124				msleep(20);
   125			ret = kthread_stop(k);
   126			if (ret)
   127				return ret;
   128		}
   129		return 0;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
