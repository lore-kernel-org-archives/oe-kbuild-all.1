Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDA3101A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471314; cv=none; b=sD7mvFj5q/FZ2cQyGZkYP3Jy/fDRuZDoqPyzt/TOF8FA2pE/1TDYbH6p29+kepim7LvvBN7vSOHE4kkQKKxqJdSYTY+wdf5QEVwsqyW2tAEwdY9Fl/ELs4J+ntVwBdQTzuh3VuLYnPbR7SpwpFIYfSuX0aUp6kFzX7/2agmULD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471314; c=relaxed/simple;
	bh=CB7OvyRFr+V17h/1Day0meqPEHiy/xiBBUKqg+Dnuug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDIbgG+kybJYyI/FqqbLkJpKYaWxxQoXZZl91fPKy1wKQhsIRMZDCCdJO1NM0qx9bPhfIVLEMKZlpBdIyk3mbW33wvKqbM+IUK9HuVHkVvLVsZoF2sO0mWw7Oj9YYleq2lAe4DPtMlFk+ZIJHBEvW9AIbdyovkarvBVgvpsjkDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtPaBB2o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtPaBB2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765471311; x=1797007311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CB7OvyRFr+V17h/1Day0meqPEHiy/xiBBUKqg+Dnuug=;
  b=NtPaBB2opRqmCsadlLPCketMaeipqs2heU1Nzf+lmSuDvkjgyE2CWSGc
   Pgj2D/Tsdyq1riwKqFMFIEUoFSiju2sfknYvJQGiCHC+e3QH8qF5JmjR1
   ELgEiRSUTBPIiK8h2U/Cn3aSxb3oK9KncAuo9KDKd90eRSatCrTVBF3uy
   oVPC6oIQCDZ0zHML692qgfiXfn08Kk6rK0l4tjHQKW7Rcd7wmn+Mlxm6e
   AMgoXaS0HrJRA5LK1XlPg8vpT8PEmo+Dw4CuqYJek6IQQY1ob4n5kafJ3
   88DM5+5Fe+T/d1hj5sxINpqPjpwi4lljlYYVe0qtS9UI89DSzd+fSlSWf
   A==;
X-CSE-ConnectionGUID: OLf0uF1uSKOyNNJiYrNhdA==
X-CSE-MsgGUID: XbzmJv19QPK7EgygPmSTQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67343911"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67343911"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:41:50 -0800
X-CSE-ConnectionGUID: UIXwxqhwQ7WO4ts4LhDujA==
X-CSE-MsgGUID: 2AO4hcMETfKX17BBOwViDQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196454983"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2025 08:41:49 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTjjf-0000000019E-1aFQ;
	Thu, 11 Dec 2025 16:41:47 +0000
Date: Thu, 11 Dec 2025 17:41:36 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/irq/proc.c:334:13: warning: no
 previous prototype for function 'register_irqchip_proc'
Message-ID: <202512111720.WtJhXDC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jinjie,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 3053668e6b211924bb67c19d791a5a532eca2ad8 [3534/3534] arm64: Introduce Xint software solution
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111720.WtJhXDC4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111720.WtJhXDC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111720.WtJhXDC4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/irq/proc.c:334:13: warning: no previous prototype for function 'register_irqchip_proc' [-Wmissing-prototypes]
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         |             ^
   kernel/irq/proc.c:334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     334 | void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
         | ^
         | static 
>> kernel/irq/proc.c:335:13: warning: no previous prototype for function 'unregister_irqchip_proc' [-Wmissing-prototypes]
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         |             ^
   kernel/irq/proc.c:335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     335 | void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
         | ^
         | static 
   3 warnings generated.


vim +/register_irqchip_proc +334 kernel/irq/proc.c

   333	
 > 334	void __weak register_irqchip_proc(struct irq_desc *desc, void *irqp) { }
 > 335	void __weak unregister_irqchip_proc(struct irq_desc *desc) { }
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
