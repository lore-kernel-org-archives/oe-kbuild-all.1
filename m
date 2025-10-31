Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242E82F362D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926470; cv=none; b=AmV7x4NR633VCIdjMx3JI55grXwCfGafTOwU18NKcdQ1Pb+ZO/LHVk18S0xcyzZ4MED32uv1yEgcWCKrCroL98h+s4WtK08MQVm4b5o6+c20/9vP7JX+qePs6PIPHWDOcrr46TbV86I6PqRPpVnRYpgyiYa7hprYZ7zkE8wub4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926470; c=relaxed/simple;
	bh=WCZyNG6Ni/+PcKbpp14pznuVNr24XT9O/GiP26WCMAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAoyRtyB5Se+VXR59bcZYlTBfY3crYF/mFleXP/rcshJdt7KAOcKRyA19g57UUGDb4hGf5Kj3t5aOSDGhMll5AM9WB9d09TYsIk5WNhPFixKO7zEE6nvh5nna9oh4XAqDMZsGGqK5Ey+0dhOcoR3bljYDx9weM0HXTOQopUYHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MI07zy7S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MI07zy7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761926466; x=1793462466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCZyNG6Ni/+PcKbpp14pznuVNr24XT9O/GiP26WCMAw=;
  b=MI07zy7S/WfwxpYxHjPk9jcQ64agIKbE0cwDpPbqc7ERstZdGQnx6V8W
   VSsVLSZ5l9qgZmC3VOtH86GuVlTF0rEtQyZ5BwluTcn9Eqm8/Y+nfq5Rq
   IWlCAbY/XssnGWoEKELmV7CTv+bKmI4E77/7/2Ne7Ta84OXwjFtlZyr6o
   fvyrf9foucdp9lE4PClH4Bt5eRwy6gfTqrw73huSrLOGxYSaBjxq3q5pm
   H3M4b/CY4GyZtogX8nRRVQvf089oOpJkDiGAxtd9KnqA0Yf5tNN5QUkof
   C0ChgYIxQFsTTIKmKfKnNyXRO3qNKBu4+MC1ExW6vHqhOmNVgsLgTBBAR
   A==;
X-CSE-ConnectionGUID: b6JSa0ymQO60/OW3w2hG7g==
X-CSE-MsgGUID: kg1pEaYMRwSzvJqdM/fVuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="51661792"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="51661792"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 09:01:04 -0700
X-CSE-ConnectionGUID: NZOdpK9lSZSn0ezkk3prJg==
X-CSE-MsgGUID: orjtcaSeQKWbHcvqL6vLWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="216922175"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2025 09:01:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vErYj-000NNy-0C;
	Fri, 31 Oct 2025 16:01:01 +0000
Date: Sat, 1 Nov 2025 00:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/ubus_driver.c:64:27:
 warning: no previous prototype for function 'ub_find_bus_controller'
Message-ID: <202510312355.LNPDosJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6a5b2f9a14178b13fe5efc52ba6575f5294c1270
commit: 26a640c9d1b1f7764bd933b7bf6ffca8ddbc6efd [3075/3075] ub:ubus: add ubus controller framework
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251031/202510312355.LNPDosJ5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510312355.LNPDosJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510312355.LNPDosJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/ubus_driver.c:64:27: warning: no previous prototype for function 'ub_find_bus_controller' [-Wmissing-prototypes]
      64 | struct ub_bus_controller *ub_find_bus_controller(u32 ctl_no)
         |                           ^
   drivers/ub/ubus/ubus_driver.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      64 | struct ub_bus_controller *ub_find_bus_controller(u32 ctl_no)
         | ^
         | static 
   drivers/ub/ubus/ubus_driver.c:154:28: warning: no previous prototype for function 'ub_match_id' [-Wmissing-prototypes]
     154 | const struct ub_device_id *ub_match_id(const struct ub_device_id *ids,
         |                            ^
   drivers/ub/ubus/ubus_driver.c:154:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
     154 | const struct ub_device_id *ub_match_id(const struct ub_device_id *ids,
         |       ^
         | static 
   drivers/ub/ubus/ubus_driver.c:484:6: warning: no previous prototype for function 'ub_bus_type_init' [-Wmissing-prototypes]
     484 | void ub_bus_type_init(void)
         |      ^
   drivers/ub/ubus/ubus_driver.c:484:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     484 | void ub_bus_type_init(void)
         | ^
         | static 
   drivers/ub/ubus/ubus_driver.c:496:6: warning: no previous prototype for function 'ub_bus_type_uninit' [-Wmissing-prototypes]
     496 | void ub_bus_type_uninit(void)
         |      ^
   drivers/ub/ubus/ubus_driver.c:496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     496 | void ub_bus_type_uninit(void)
         | ^
         | static 
   4 warnings generated.


vim +/ub_find_bus_controller +64 drivers/ub/ubus/ubus_driver.c

    63	
  > 64	struct ub_bus_controller *ub_find_bus_controller(u32 ctl_no)
    65	{
    66		struct ub_bus_controller *ubc;
    67	
    68		list_for_each_entry(ubc, &ubc_list, node)
    69			if (ubc->ctl_no == ctl_no)
    70				return ubc;
    71	
    72		return NULL;
    73	}
    74	EXPORT_SYMBOL_GPL(ub_find_bus_controller);
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
