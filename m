Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF22176FCF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726004416; cv=none; b=RPirv5jlNx6wxtxm5F/3M9Iz9JjSusLuZqGEGBbDw7RmCykC2cuYcITKDElp4so9bdNfxKsW9B25NGD0L3xBi5zF3cORzBYzEQGzdYsCOqvOGt9fYVS7VkzkKlmUYiGpjnAUFQ3PY7GDA4zaEhAVn1RrWqowGqH2LcL0WDHLDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726004416; c=relaxed/simple;
	bh=Z1f4XynSC5YWGaW/O1OCe4xNqu4ScurA90PxhgemFB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqfpZdJqpV5idj6AZAExbJ3O7YDgoNfjJloOELtCOI+V45O9OBj3fYUxtvp4j+qzbMtVKu57oYamnYt/oS223w5SmjM8mtjK7n8nOvp77VzR4j1xJFoOvXzrdADd8V9OV9tNGzQJmc1MAPVLx3gstsb1DOudF8DQI994x8+WxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/uKT+Xs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/uKT+Xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726004414; x=1757540414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1f4XynSC5YWGaW/O1OCe4xNqu4ScurA90PxhgemFB0=;
  b=k/uKT+Xs28niquC1raI0p7EcoUdm5vZmAO6+Btw4MKUtH3kuCaamIKfW
   lQt/nnBCFANFR0oXiQJALweunp5K6RqtpnS+lmgxOKjR4NXNH5UI3+EdY
   K9nHuvkvvKNJkNp2HUfMp+CB85hIJckdz2JG0qb8tko3O7kRQZ/UgAqHv
   kdqoIxTXKD/8E+b1OJzTffAxY54RbQYTKXDcBGxk2Qt4CqZhz1aUCILJ8
   Bi4phoGaifXvEoJ4D+zTV4meqvy8IKTC+ckfT+/YLu1k/W0D+FmGkq5AG
   hJ8QDi8qPq+P6U1iLn9woJ2foRdJwNGQx2RR0pOuiA7EPeje/G/AOTxcs
   Q==;
X-CSE-ConnectionGUID: x2wqNyiVQISqFFmqTrfeJw==
X-CSE-MsgGUID: G6rAwXiITaySss9lwCxCxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="27698795"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="27698795"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 14:40:13 -0700
X-CSE-ConnectionGUID: wcbiGw8TSU6BPW1YAk312w==
X-CSE-MsgGUID: UyJ7/ZhWQeadWO2rsA42Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71956038"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2024 14:40:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so8ao-0002jy-02;
	Tue, 10 Sep 2024 21:40:10 +0000
Date: Wed, 11 Sep 2024 05:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3790/30000] kernel/pid.c:623:50: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202409110524.f822gNQG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cbfb00d89c3b9971c3f0732b4f34d4e674bff5d8
commit: c649babf7cf25e545a7dc3eb6d59392ac3355cb9 [3790/30000] pid_ns: Make pid_max per namespace
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240911/202409110524.f822gNQG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110524.f822gNQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110524.f822gNQG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/pid.c:385:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:385:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:385:9: sparse:    struct pid *
   kernel/pid.c:386:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:386:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:386:9: sparse:    struct pid *
   kernel/pid.c:449:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:449:23: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:449:23: sparse:    struct pid *
   kernel/pid.c:507:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:507:24: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:507:24: sparse:    struct pid *
>> kernel/pid.c:623:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/pid.c:623:50: sparse:     expected void *
   kernel/pid.c:623:50: sparse:     got void [noderef] __user *buffer
>> kernel/pid.c:632:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/pid.c:632:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/pid.c:632:35: sparse:     got int ( * )( ... )
   kernel/pid.c: note: in included file (through include/linux/pid.h, include/linux/sched.h, include/linux/mm.h):
   include/linux/rculist.h:553:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:553:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:553:9: sparse:    struct hlist_node *
   include/linux/rculist.h:554:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:554:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:554:9: sparse:    struct hlist_node *

vim +623 kernel/pid.c

   614	
   615	static int proc_dointvec_pidmax(struct ctl_table *table, int write,
   616					void __user *buffer, size_t *lenp, loff_t *ppos)
   617	{
   618		struct ctl_table tmp;
   619	
   620		tmp = *table;
   621		tmp.data = &task_active_pid_ns(current)->pid_max;
   622	
 > 623		return proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
   624	}
   625	
   626	static struct ctl_table pid_ctl_table[] = {
   627		{
   628			.procname	= "pid_max",
   629			.data		= &init_pid_ns.pid_max,
   630			.maxlen		= sizeof(int),
   631			.mode		= 0644,
 > 632			.proc_handler	= proc_dointvec_pidmax,
   633			.extra1		= &pid_max_min,
   634			.extra2		= &pid_max_max,
   635		},
   636		{}
   637	};
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
