Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD541A9FB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765335261; cv=none; b=t44/avfghWeEN5ilu7h5ITvoIbvcuw/oAhPG8K0/lGqVwhp6UyC1jZmij2qWkFbTIYGwZAbJtlBKrpd8xNXOw0Ztj9NDjz8ggzBeoJPfwDRL1d8wJwCvNh2I07U3tOdbPrUgad7XfZsWPNYFQYWDhfrbzO/TdCi2shi+UAUY7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765335261; c=relaxed/simple;
	bh=v7wdI37CSHcEOtGUWfRjrUpcmtQdlGLYzD/NkV65Ijg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3CNqqrGwkBIjbXm2lmQF6BudddamhPLPzOI099+i2mnyL47vxeExHpPIq7cMfrd2Uew1jz5lLbt8I2narNqCBw1bfULeOrxK8nX9wNLxJIFbs8aPlAVjZpNHPBmM/7x9FXSxAPxy/r2hl4rufQvOGIFiD5ag3/zPA3sLgdOa+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etgtO20y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etgtO20y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765335259; x=1796871259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v7wdI37CSHcEOtGUWfRjrUpcmtQdlGLYzD/NkV65Ijg=;
  b=etgtO20y8xlgpAPW048+GBNOsYiNMoGxSfApbAf3tgoRX0KUGRuYkJiS
   lwXRu7jgGm/35zk44KZzYQxL9KLkBzIsljBtUZx6KpV7TT33nLAkNJ6Mr
   yiSwNG8s0Cn7/5O4JmVII2m/YkjjLNh3Tj2J4zbx0PVMW0IvB9Sa5LpzI
   cFlXmrxKxshdPwMLdzEVcz2oyKB5Har6TpCWVi/G9ZZe1iKtwd7CfffJc
   kiuG96RZxnDfRSuWJZQn8q0NskKD9ArFZkUsDYuCX5jtQq+3XFPN+4gok
   b5oPsbtfzGa34hJJUVvHwZSQLN9Spt+gEsfGHFwrSmz9/7wl/32E0FVds
   Q==;
X-CSE-ConnectionGUID: ++ySzKqhRTWsjEM4FphIYQ==
X-CSE-MsgGUID: nOes/umSRCyUASyJj0QCrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78413985"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="78413985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:54:18 -0800
X-CSE-ConnectionGUID: n6EQIln/SZCN7kJnmsswWw==
X-CSE-MsgGUID: Um9oYPshT162ZlLdFCsSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="195466526"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Dec 2025 18:54:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTALH-000000000Tg-1iuF;
	Wed, 10 Dec 2025 02:54:15 +0000
Date: Wed, 10 Dec 2025 03:54:01 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3399/3399] drivers/acpi/numa/hmat.c:726:6:
 warning: no previous prototype for 'hmat_restore_target'
Message-ID: <202512100332.Dzr4IpBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7579fd89cb4a201d22bd5b78f48df5ce339c0b2d
commit: 2e1b00fcf1e3152a1e73846f5f9ec37cef088a65 [3399/3399] ACPI/HMAT: Add missing locality information for hot-added device
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512100332.Dzr4IpBp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100332.Dzr4IpBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100332.Dzr4IpBp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/numa/hmat.c:726:6: warning: no previous prototype for 'hmat_restore_target' [-Wmissing-prototypes]
     726 | void hmat_restore_target(int nid)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/hmat_restore_target +726 drivers/acpi/numa/hmat.c

   725	
 > 726	void hmat_restore_target(int nid)
   727	{
   728		struct memory_target *target;
   729		int pxm;
   730	
   731		pxm = node_to_pxm(nid);
   732		target = find_mem_target(pxm);
   733		if (!target)
   734			return;
   735	
   736		mutex_lock(&target_lock);
   737		hmat_register_target_cache(target);
   738		hmat_register_target_perf(target, 0);
   739		hmat_register_target_perf(target, 1);
   740		mutex_unlock(&target_lock);
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
