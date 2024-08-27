Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C34177113
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724739782; cv=none; b=PvmXcY6NRpAsRTgXFZVCcax6coM+fdLOakRsJyqtjdXbhTnMcAi2EDLa+tNvm2QLjM/L1IFF7oMB4zxIzQwOr/NfdtU1nDaXGBDvSe3vHt6hNTMRFoLQkaZka+b+vQ2NcddQWRqH28Q06uRDUNGT9AIW/nd6PXfqZf5ANv59Uac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724739782; c=relaxed/simple;
	bh=crLZWaA9tZqOl38BcFty53sZrr+x1AvDPHZt3AoUpsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqpzUQZdcrjicY/qT7DfP0WuA62occS891C9CO2SnMQF+1fM0kREnkbCNINS9bCblOs6xzfZiSxctl4u7/acTS5TLVnG30tpqtk1ZAGJD3viEDgc4ozzeZpNzsMRFCIraM1rNtXl85xODPicOsnPTgL3hj3nLuF8XTUBwBF5V80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWY2ZMWE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWY2ZMWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724739780; x=1756275780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=crLZWaA9tZqOl38BcFty53sZrr+x1AvDPHZt3AoUpsQ=;
  b=IWY2ZMWE7cfzW+GSPsWpbHf+0ASM1jQWVtbiP7ztWPOQWt1mGBfoFBAU
   heS5pnBfvkUVZIJkdNc8NlpIpSyuNsFJv6AFUI5M0b6s3Bj/OGwegrlAI
   J5i93fL4rLO6hjKkPLgYPA9i7b8c0sZDbTRNL4bzIHcWj/t+jO/LRpxru
   xO3nrXBPdjTXzQKCEpIl0RpSCUU+fTLTINCKhau/z7MB8C5g7f9tqL/PW
   JOCRZp+Pmb8ptt/Capw0IZthxIPfzhuqb2eLVzdNfBIEvGzu6QA/p3l+r
   mDjhH68oUPzrLtrDIfO/t+ETLkKvUdzJi3uY0ZdqbZOlmNeFAejqDZRzp
   A==;
X-CSE-ConnectionGUID: deLaSicDQr27xRHPRQ6YCA==
X-CSE-MsgGUID: 5ZmGxdsWTtenSz0//NRZxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33821568"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="33821568"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 23:22:59 -0700
X-CSE-ConnectionGUID: a/B4SlHAT02wldopP2ouyg==
X-CSE-MsgGUID: dLnN+ZzRR1OiuSHPdBSuFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62589118"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Aug 2024 23:22:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sipbT-000I8E-2K;
	Tue, 27 Aug 2024 06:22:55 +0000
Date: Tue, 27 Aug 2024 14:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Xie <jeff.xie@linux.dev>, tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	xiehuan09@gmail.com, Jeff Xie <jeff.xie@linux.dev>
Subject: Re: [PATCH v2] genirq: procfs: Make smp_affinity read-only for
 interrupts that userspace can't set
Message-ID: <202408271311.szIyk0et-lkp@intel.com>
References: <20240825131911.107119-1-jeff.xie@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825131911.107119-1-jeff.xie@linux.dev>

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Xie/genirq-procfs-Make-smp_affinity-read-only-for-interrupts-that-userspace-can-t-set/20240826-153926
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20240825131911.107119-1-jeff.xie%40linux.dev
patch subject: [PATCH v2] genirq: procfs: Make smp_affinity read-only for interrupts that userspace can't set
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240827/202408271311.szIyk0et-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271311.szIyk0et-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271311.szIyk0et-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/proc.c: In function 'register_irq_proc':
>> kernel/irq/proc.c:343:17: warning: unused variable 'umode' [-Wunused-variable]
     343 |         umode_t umode = S_IRUGO;
         |                 ^~~~~


vim +/umode +343 kernel/irq/proc.c

   337	
   338	void register_irq_proc(unsigned int irq, struct irq_desc *desc)
   339	{
   340		static DEFINE_MUTEX(register_lock);
   341		void __maybe_unused *irqp = (void *)(unsigned long) irq;
   342		char name [MAX_NAMELEN];
 > 343		umode_t umode = S_IRUGO;
   344	
   345		if (!root_irq_dir || (desc->irq_data.chip == &no_irq_chip))
   346			return;
   347	
   348		/*
   349		 * irq directories are registered only when a handler is
   350		 * added, not when the descriptor is created, so multiple
   351		 * tasks might try to register at the same time.
   352		 */
   353		mutex_lock(&register_lock);
   354	
   355		if (desc->dir)
   356			goto out_unlock;
   357	
   358		sprintf(name, "%d", irq);
   359	
   360		/* create /proc/irq/1234 */
   361		desc->dir = proc_mkdir(name, root_irq_dir);
   362		if (!desc->dir)
   363			goto out_unlock;
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
