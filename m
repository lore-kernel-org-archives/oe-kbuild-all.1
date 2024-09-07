Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95A1B85DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725701476; cv=none; b=m532GGPog4X9efgmKPe/dv2N9ZLkNk/CA5FEI7WzToBG3R/OLYoRfs1f80Y37Ubldt2mYGsi7lFSVXm+jqOov9L3tlWJP4p1lb4z+9Lty2RXu1APWnz9giwWBAYorlY/bpyvnCQCJm+pIm2hyP7hYC6MB/xSVQTIviOfUETx4UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725701476; c=relaxed/simple;
	bh=a3Yo2BWchgOLvfHaIktXPzELtc8mqnxDf6lN1GXFKQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EVlr3bqCLQ1b8hTusLH36SdNT3aq+6uIYgURyFf54P5CKt4fe0gCPxRLOTO5Obj6KSkr+yp/POQfdmUDGbbdMLhpyoUkcP/sChpAd3s4UksLf3WMJiQ9C37F8cvHyIO1NyNzw4wz+55UGOhqoju+ewg4NLcubWD/EGQxJ4m+GNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yl7t7KUf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yl7t7KUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725701475; x=1757237475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3Yo2BWchgOLvfHaIktXPzELtc8mqnxDf6lN1GXFKQI=;
  b=Yl7t7KUfkmnp/yDOr/WfhN+nhOb/aX8NVd9GygrMq/rwdszb7sWxhLC7
   TVcCbRWcU/NhSOP52vJ0TnxZS+PKxpI4b4nUvyT+45k6WDcatkDK/WOE9
   hBssonkgLK5+EyGRFQI/LHJ5YzAG+TX6L0tVNIb3rzGCCIy3SpAt2uw3K
   J6wOUPHa5PKqL0SZFkwNllsM8S6SXzxZO9KWvcr3lePFqBbXCp5/EtJDf
   gUJ4i7h6D6KTzWuW7WqvlMb0JKCuw9X5Et4yjBP12bB2iwy9eT9oac9VJ
   2FcbO0v9d//9GFuWgGRLg5ZdIkg3ZKNAXWEs9BpI0qmekqUUAX2Hi7K0h
   A==;
X-CSE-ConnectionGUID: or5NzkFMRPKblFEn33DK+A==
X-CSE-MsgGUID: RUtkBZLWRniLU3LiBklMJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13420508"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="13420508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 02:31:14 -0700
X-CSE-ConnectionGUID: SbmX8xMwRbyTmohrunxlbQ==
X-CSE-MsgGUID: LSMj/L4ATMa4zET/zWSN9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66510213"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2024 02:31:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smrmh-000CO7-1I;
	Sat, 07 Sep 2024 09:31:11 +0000
Date: Sat, 7 Sep 2024 17:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 7679/30000] kernel/locking/lockdep.o: warning:
 objtool: lockdep_unregister_key()+0x30b: unreachable instruction
Message-ID: <202409071717.JoTK5KQp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Waiman,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c431540f5e2720652e293713c7358952cd0148de
commit: b91170be2b1f1ef673f5e79c7a4beb5673a8f881 [7679/30000] locking/lockdep: Avoid potential access of invalid memory in lock_class
config: x86_64-randconfig-073-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071717.JoTK5KQp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071717.JoTK5KQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071717.JoTK5KQp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/lockdep.o: warning: objtool: lockdep_unregister_key()+0x30b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
