Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311B1C726D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735890032; cv=none; b=YGl84Km4ddQg8+bqxl4mXI2ASH3KvROmugxe1Mm9GYMqpSw3FEEjooF4Fm8iZAaz32oKJb/FfZvKesMG1Lp8lwDRknbsyO72PkPEPJx1yYP4XReIVhZWuyi7hI5bGsulLUA8L+vd5GCK+88iOo+x12umlS3njTXM5ovzvEghVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735890032; c=relaxed/simple;
	bh=MUMRZcVKfJkMBcy3JOYJjVp0I3Y8nhtmukfkFK1Jbsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ixTgINEltkSF3G5axnPUsSQSabc0jmyQFWWd9KZPBDSFRDXqNmtOQ5LDQAkywIl30WGxf0uptDyP/Rs2jFZW+si+UWLpk5FwnV0PJH3Ou7LBwwk5ggpZY5wY6j2gwSJVn4GumEQwxy4nyM2NXdT1I477iYG+DRtl6RaLGyW2/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mW1t9PUM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mW1t9PUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735890031; x=1767426031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MUMRZcVKfJkMBcy3JOYJjVp0I3Y8nhtmukfkFK1Jbsw=;
  b=mW1t9PUMHOwBqTMnC8l9IbcralSvKPOzEMHX3OQg4w3xUMhYKcvUzlhi
   zGzkMf2u0eZuEBnpIDcwPQK/LLW9P+hZ0sFgB/RsPOUyVvz9/hWMM37XU
   FV80pLPtuq1KKJGg4+fEdrS4nz9Plcd8iur3HFl2Dv0btHiO/Cn0lMrXE
   MQRuLDAx3cbyyXyrlbOAFVDzEou1ESZB7JZChK2vMGdpNc62rkbyHV6NQ
   VO1uA640rprsDraQdabeheZwYOKSjGIHBB3b3laSMvEEyefrQZKHQT+4w
   Qmy7hqRUznC32cFQB7f+2QC90Ev8MCgf4p6hPnCavIT9dwma5sDxQrvSH
   Q==;
X-CSE-ConnectionGUID: ZJunneshREafqfB3ylaLfQ==
X-CSE-MsgGUID: 9DmfSrhdTfqAqmaMNX1SEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36156175"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36156175"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 23:40:28 -0800
X-CSE-ConnectionGUID: EyjWNt1pTuKMy7pGXDG3FA==
X-CSE-MsgGUID: p0Klw/NdTaeENLkS4W9+oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102242757"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jan 2025 23:40:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTcIC-0009Oq-0W;
	Fri, 03 Jan 2025 07:40:24 +0000
Date: Fri, 3 Jan 2025 15:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Uladzislau Rezki <uladzislau.rezki@sony.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: drivers/android/binder.c:1819: warning: Function parameter or struct
 member 'file' not described in 'binder_task_work_cb'
Message-ID: <202501031535.erbln3A2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 28b3ae426598e722cf5d5ab9cc7038791b955a56 rcu: Introduce CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
date:   2 years, 8 months ago
config: csky-randconfig-r022-20230522 (https://download.01.org/0day-ci/archive/20250103/202501031535.erbln3A2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031535.erbln3A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031535.erbln3A2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder.c:233: warning: Function parameter or struct member '_proc' not described in 'binder_proc_unlock'
   drivers/android/binder.c:233: warning: Excess function parameter 'proc' description in 'binder_proc_unlock'
   drivers/android/binder.c:335: warning: expecting prototype for binder_node_unlock(). Prototype was for binder_node_inner_unlock() instead
   drivers/android/binder.c:1155: warning: expecting prototype for binder_dec_ref(). Prototype was for binder_dec_ref_olocked() instead
>> drivers/android/binder.c:1819: warning: Function parameter or struct member 'file' not described in 'binder_task_work_cb'
>> drivers/android/binder.c:1819: warning: Excess struct member 'fd' description in 'binder_task_work_cb'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'offset' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'skip_size' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'fixup_data' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2254: warning: Function parameter or struct member 'node' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'offset' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'sender_uaddr' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'length' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2274: warning: Function parameter or struct member 'node' not described in 'binder_sg_copy'
   drivers/android/binder.c:2683: warning: Function parameter or struct member 'procp' not described in 'binder_get_node_refs_for_txn'
   drivers/android/binder.c:2683: warning: Excess function parameter 'proc' description in 'binder_get_node_refs_for_txn'
>> drivers/android/binder.c:3510: warning: Function parameter or struct member 'thread' not described in 'binder_free_buf'


vim +1819 drivers/android/binder.c

7980240b6d63e0 Martijn Coenen 2017-02-03  1806  
80cd795630d652 Todd Kjos      2018-12-14  1807  /**
80cd795630d652 Todd Kjos      2018-12-14  1808   * struct binder_task_work_cb - for deferred close
80cd795630d652 Todd Kjos      2018-12-14  1809   *
80cd795630d652 Todd Kjos      2018-12-14  1810   * @twork:                callback_head for task work
80cd795630d652 Todd Kjos      2018-12-14  1811   * @fd:                   fd to close
80cd795630d652 Todd Kjos      2018-12-14  1812   *
80cd795630d652 Todd Kjos      2018-12-14  1813   * Structure to pass task work to be handled after
80cd795630d652 Todd Kjos      2018-12-14  1814   * returning from binder_ioctl() via task_work_add().
80cd795630d652 Todd Kjos      2018-12-14  1815   */
80cd795630d652 Todd Kjos      2018-12-14  1816  struct binder_task_work_cb {
80cd795630d652 Todd Kjos      2018-12-14  1817  	struct callback_head twork;
80cd795630d652 Todd Kjos      2018-12-14  1818  	struct file *file;
80cd795630d652 Todd Kjos      2018-12-14 @1819  };
80cd795630d652 Todd Kjos      2018-12-14  1820  

:::::: The code at line 1819 was first introduced by commit
:::::: 80cd795630d6526ba729a089a435bf74a57af927 binder: fix use-after-free due to ksys_close() during fdget()

:::::: TO: Todd Kjos <tkjos@android.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
