Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673A262A6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 02:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744079771; cv=none; b=hsjA2iyHtsIxwekFUa1VKSnCK6WfjvlH2q/V4haj7p5dC5/IUY11wRKLdKtHZlPgnFueGIEjEdWXtEp7Pcm9wla7YapvSnfpo8KMJzqx+KsKBA2/dSPHa/GEj/LnCKZKhoLJQOZEiHDx4jW49HYBSXQXjmnXCZ8IWsgznCU1c+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744079771; c=relaxed/simple;
	bh=o6nM2KEa542dL8jnTA8/uy/9KeA+si8l2hlkVuRTpts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4GbFps4nFm6fKVidnKMCeVsdUX29ostw36HfFq/q84yx8tovqAt1mYqJoqwSVMSvazZjNgLWeBoF8ASc0hNAu09QVmlChXraMADXgr8TqUFP8RWdIqic+uiaHCgGLbXX3iSeI16nd50qopswEfGpxo6e+8MfrMqFgWsCj+gkdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB2ZteDD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB2ZteDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744079770; x=1775615770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6nM2KEa542dL8jnTA8/uy/9KeA+si8l2hlkVuRTpts=;
  b=YB2ZteDDqiFFrdv6x4iZmlGqRG2/lgGCAen+YRcgYUi6YtcpVP6P6yom
   0OsITyA93AKDW1FLk8koFUJLlySzemAXJcOtTRZWRpIJSfltU21PKT35C
   XIT5u+qIxGnROXqCXVQoBoCscvR62eG3fLJhRJIWOEqyKvlhPEV8csCRn
   4rCSr8ikm9tsRR0vAMkf6kAzn/tU6OvvpeVPuslAUsCKDArkFIuNKNUbE
   Si/g4TlCGwXOOWyri//pN7OYMaWOl6V4dg167X4FWhxBWrfNbgPOjavbD
   ILg7YwsgxHparLQgs/iSqvuknRCssgQMGXU81IAMWJlQlV8PAhSUUlOHQ
   Q==;
X-CSE-ConnectionGUID: XO9QhhM5SHakl4cXOTv3Zw==
X-CSE-MsgGUID: cN/v7F4kSpGUs8j67Sf+Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56860721"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="56860721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:36:10 -0700
X-CSE-ConnectionGUID: 2a4CY3WoQMWWPoOSu18rYA==
X-CSE-MsgGUID: qFuUy53fQZGfu3s1wvH8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="132262106"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Apr 2025 19:36:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1yoo-00041p-1T;
	Tue, 08 Apr 2025 02:36:06 +0000
Date: Tue, 8 Apr 2025 10:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/unevictable.c:501:30:
 warning: 'del_proc_fops' defined but not used
Message-ID: <202504081039.mlJzUKG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: 9eee07ca21b4bcb78a9e0092696f13a0b3db291a [9/9] ck: mm: Pin code section of process in memory
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250408/202504081039.mlJzUKG1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081039.mlJzUKG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081039.mlJzUKG1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/unevictable.c:496:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     496 | const static struct proc_ops add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:501:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     501 | const static struct proc_ops del_proc_fops = {
         | ^~~~~
>> mm/unevictable.c:501:30: warning: 'del_proc_fops' defined but not used [-Wunused-const-variable=]
     501 | const static struct proc_ops del_proc_fops = {
         |                              ^~~~~~~~~~~~~
>> mm/unevictable.c:496:30: warning: 'add_proc_fops' defined but not used [-Wunused-const-variable=]
     496 | const static struct proc_ops add_proc_fops = {
         |                              ^~~~~~~~~~~~~


vim +/del_proc_fops +501 mm/unevictable.c

   495	
 > 496	const static struct proc_ops add_proc_fops = {
   497		.proc_read  = proc_read_add_pid,
   498		.proc_write = proc_write_add_pid,
   499	};
   500	
 > 501	const static struct proc_ops del_proc_fops = {
   502		.proc_write = proc_write_del_pid,
   503	};
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
