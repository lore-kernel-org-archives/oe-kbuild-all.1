Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493331C8633
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 04:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754541897; cv=none; b=ddItFx5gctWBE/+SVEucU75/4fCMYxKkoOf4aPXiaVeIuEZ/rlZeU6nhW3fE3unvAw1g2uQfQ3IRHdFuRpW5q4M1mVDSDVIQPMn8aNfPtBuOrPauCwCVxS3yxczrFD54JwtILJw4B1uh6lcFYazB8WUQHemqtljapw+1EmfncrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754541897; c=relaxed/simple;
	bh=phCHJsPWfj20WxsB2eH8pos19ZkJZUQaoP01KxukxUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJQeNJFUJzjSRGT8q0awVlu9DkuPGguGJoYxG0WYNbOK3oGxJtgnlHqTmIcdCL07JCzxpZEI+I0pFxoxKKp2WgS7uJTxCXblvaAr9DQtlbB4I0t6O4nwWE5/RVknT+h03+nW6Q8iUEwnQPA48Cx+TjHf5Q27RTP+GZCx8KGsCFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kq/YrY7N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kq/YrY7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754541896; x=1786077896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phCHJsPWfj20WxsB2eH8pos19ZkJZUQaoP01KxukxUw=;
  b=Kq/YrY7NPGNr+e38RIj08lthYb8H/UARZHX3g3x71rCX1agiUOPpHpde
   Z5raAoGlusYx94oDtrr+fS5tLwotoXgxeV61RWnEs9OtqpX1cwOEWT+O8
   g60Coasyu6eh9m92LMHdEtnsptH3yIvXEZazQGz6Qqg0FprhtseWYV91c
   nlhz56Jkk2Sc6PnQasv7OZgyKQN4kovPjPPJS0z81M+wOFtVKIg7PzVKl
   3fPg5WKhRaSqqc0Gdjy/VLCnp7sxsT4HkjXxlQZYl7ItE5gAZi+iMKw9O
   OQTob0QN4sYcYAZvZsCkHpLVIO7cfaDT1WZfMidudBB/zyOtEIHNbl6U8
   g==;
X-CSE-ConnectionGUID: hZEnSJtoTNy1SSn8kIsdCg==
X-CSE-MsgGUID: x8nZbiwOTcWutkcmqno8Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56735708"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56735708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:44:55 -0700
X-CSE-ConnectionGUID: HN/6S4F5TMWgjgBcVIZrvw==
X-CSE-MsgGUID: yJgqQi0aSjifZfTPaq2RCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169204483"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2025 21:44:53 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsUl-0002Kn-10;
	Thu, 07 Aug 2025 04:44:51 +0000
Date: Thu, 7 Aug 2025 06:44:16 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3106/3106] drivers/acpi/numa/hmat.c:726:6:
 warning: no previous prototype for 'hmat_restore_target'
Message-ID: <202508070657.JhwEfZG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a8c621aa031669a6835da1431d9765e3bbbc3621
commit: 2e1b00fcf1e3152a1e73846f5f9ec37cef088a65 [3106/3106] ACPI/HMAT: Add missing locality information for hot-added device
config: x86_64-buildonly-randconfig-2003-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070657.JhwEfZG4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070657.JhwEfZG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070657.JhwEfZG4-lkp@intel.com/

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
