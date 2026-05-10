Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A956122B8AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 03:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778382265; cv=none; b=JWLifgvecdlR5TM5s5+Pfm33CL4OdlHNOnuHEJ6lQ7SAG58P8z/tbBe3zzj6M6rXzfVrwDmuhs3uiRrbOddJMCUWagg527S0NxR5ny52+sG7I5yU+fWHpWfneNIorkwkvV7Q74EvJ8EHUrSKVG50dDn73nozXwCHe92uN06By/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778382265; c=relaxed/simple;
	bh=gP2ReFotz0bvoYxNyAC9vLzBHBTPlQZ/my1ahqKGcwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1tYwFaethYFb9CKverHKRh9DnWEAnxnz45VPXh4wBMWUKDatTLWEB2DYYrP7nglxJqIt2N7EsyvMstbpY+OArnq7XNPuW1SZWoWl+szWfDfyNX5ayOC7EQJfrkP1bdphr1p2l7eV1oVh26spcpSrv/dJntbTDrd20dgzfsaq/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bA4L0XuW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bA4L0XuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778382263; x=1809918263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gP2ReFotz0bvoYxNyAC9vLzBHBTPlQZ/my1ahqKGcwc=;
  b=bA4L0XuW7GCM3HnlyXAbRKTTT3WdgE3IMCWHdXn4294swMTEedvyMFpv
   wME7cg05Emf0Z97cxVfihrtUrZ4AiMaYNHLfXddQ7jmuVYBad2tdFpiWI
   prJn9/R6EoZWoPvOkLltg/GPkDlVoqbNX7OU8UwdtAvy9qwpuIhK2dvmQ
   0SZ84goX+jDycFlaeX0300XLnF0wvKgqgLlpulfg7N24LcbQTKxRYOM7f
   +SyWr3ojJeQfNtvrmVOuc0/5ljNbnbo0famOu2tvtBaZlHLaLI+38Bcwa
   nk929xDng1og/sKa3WrMqBblF1VMcjlzKhJw99L1OwohjzCR0fDi+oyGC
   A==;
X-CSE-ConnectionGUID: 3fft//jBQWCKs9uHU0WIoA==
X-CSE-MsgGUID: klMr3ct4R3u6HI70CPUvCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79033277"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79033277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 20:04:23 -0700
X-CSE-ConnectionGUID: GxZ2mTjzS+qtvsEyDigPKw==
X-CSE-MsgGUID: hJB+5A8cQaG87/TZL0Ncow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234470892"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 20:04:21 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLuSo-000000001hB-16tL;
	Sun, 10 May 2026 03:04:18 +0000
Date: Sun, 10 May 2026 11:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Subject: Re: [PATCH] netdevsim: Fix task hung by releasing bus lock before
 device ops
Message-ID: <202605101038.mxF4QH95-lkp@intel.com>
References: <20260509092837.3432281-1-xujiakai24@mails.ucas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509092837.3432281-1-xujiakai24@mails.ucas.ac.cn>

Hi Jiakai,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc2 next-20260508]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiakai-Xu/netdevsim-Fix-task-hung-by-releasing-bus-lock-before-device-ops/20260510-070550
base:   linus/master
patch link:    https://lore.kernel.org/r/20260509092837.3432281-1-xujiakai24%40mails.ucas.ac.cn
patch subject: [PATCH] netdevsim: Fix task hung by releasing bus lock before device ops
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605101038.mxF4QH95-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101038.mxF4QH95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101038.mxF4QH95-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/netdevsim/bus.c: In function 'new_device_store':
>> drivers/net/netdevsim/bus.c:192:17: error: implicit declaration of function 'nsim_bus_dev_del'; did you mean 'nsim_bus_dev_new'? [-Wimplicit-function-declaration]
     192 |                 nsim_bus_dev_del(nsim_bus_dev);
         |                 ^~~~~~~~~~~~~~~~
         |                 nsim_bus_dev_new
   drivers/net/netdevsim/bus.c: At top level:
>> drivers/net/netdevsim/bus.c:206:13: warning: conflicting types for 'nsim_bus_dev_del'; have 'void(struct nsim_bus_dev *)'
     206 | static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
         |             ^~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/bus.c:206:13: error: static declaration of 'nsim_bus_dev_del' follows non-static declaration
   drivers/net/netdevsim/bus.c:192:17: note: previous implicit declaration of 'nsim_bus_dev_del' with type 'void(struct nsim_bus_dev *)'
     192 |                 nsim_bus_dev_del(nsim_bus_dev);
         |                 ^~~~~~~~~~~~~~~~


vim +192 drivers/net/netdevsim/bus.c

   157	
   158	static ssize_t
   159	new_device_store(const struct bus_type *bus, const char *buf, size_t count)
   160	{
   161		unsigned int id, port_count, num_queues;
   162		struct nsim_bus_dev *nsim_bus_dev;
   163		int err;
   164	
   165		err = sscanf(buf, "%u %u %u", &id, &port_count, &num_queues);
   166		switch (err) {
   167		case 1:
   168			port_count = 1;
   169			fallthrough;
   170		case 2:
   171			num_queues = 1;
   172			fallthrough;
   173		case 3:
   174			if (id > INT_MAX) {
   175				pr_err("Value of \"id\" is too big.\n");
   176				return -EINVAL;
   177			}
   178			break;
   179		default:
   180			pr_err("Format for adding new device is \"id port_count num_queues\" (uint uint uint).\n");
   181			return -EINVAL;
   182		}
   183	
   184		nsim_bus_dev = nsim_bus_dev_new(id, port_count, num_queues);
   185		if (IS_ERR(nsim_bus_dev))
   186			return PTR_ERR(nsim_bus_dev);
   187	
   188		mutex_lock(&nsim_bus_dev_list_lock);
   189		/* Prevent to use resource before initialization. */
   190		if (!smp_load_acquire(&nsim_bus_enable)) {
   191			mutex_unlock(&nsim_bus_dev_list_lock);
 > 192			nsim_bus_dev_del(nsim_bus_dev);
   193			return -EBUSY;
   194		}
   195	
   196		/* Allow using nsim_bus_dev */
   197		smp_store_release(&nsim_bus_dev->init, true);
   198	
   199		list_add_tail(&nsim_bus_dev->list, &nsim_bus_dev_list);
   200		mutex_unlock(&nsim_bus_dev_list_lock);
   201	
   202		return count;
   203	}
   204	static BUS_ATTR_WO(new_device);
   205	
 > 206	static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
