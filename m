Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2A47EEE1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 07:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709624803; cv=none; b=sbAqcTZxCFKlvza2+MrRMBmuKbPb5vMhlqeWenMLOL13SR2KkieY/E9iUKuI/zrhXAhEtbL5m1hsFC6TITvIBHOQr9I41ncX9LWQfnQUvnuOfqKRqe/6FmCa9fZqOXqfWqE7IjF8h23Gkl+3Gv6+EbBjdbKTrXAU97inG1ar4lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709624803; c=relaxed/simple;
	bh=z8bj/IykcHR/87vGL4bK+zsA6sWUdt+vcCpGj7kqcGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RJdcWbQ9G71z3PelckSLjKmEvw6BTyRXLJqouyure0mS+RNnfKfpFujYLvGmbMDYWgoplQuMqHj0yIOBjgJcpfEWHvn68bGHyHEdhXhcz58EehqSCgLz1NFb/3L22S9x67HX0SaoWMsMQDqC03dbEAPaujwrsBaOmHWWIS8dT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eB+8WO74; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eB+8WO74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709624801; x=1741160801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8bj/IykcHR/87vGL4bK+zsA6sWUdt+vcCpGj7kqcGk=;
  b=eB+8WO749PRJBvFTEnLevIROEFZcUlKrZxC18FNer8YANevh3OPLQSnY
   JEx/nGAC9yn9WFzRILbDqU5IQ3evjYt2r/EIAP4wC5ZWvmPYPF343uDRZ
   iBtygFXL+9yuJdHErhdhMtTg3G/ZBKGwEbzp2DKwGObALgDU6KHdrUMn7
   i4DK38aBOX+dmZnsN/DmYP9VBBJ+/Kjf8VfDJksemwDI+ythtQx+iXuyl
   4HTMeKDak2GiQcvLgdaDVBItMeM79vgJQXkLV534RtD4NZVZF4kPzSihB
   5DdEa8Kfg2yRj3opYCK00zD5q/zMT+OhOjY4nAJIkS6+Ihn54rSUgrvqW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4327731"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4327731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 23:46:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9402917"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2024 23:46:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhPVT-00037z-1P;
	Tue, 05 Mar 2024 07:46:35 +0000
Date: Tue, 5 Mar 2024 15:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25541/27434] mm/unevictable.c:495:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202403051540.JUWrj5hq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: d13d95abf0625cd43326197aa331b4feee0b7cc0 [25541/27434] ck: mm: Pin code section of process in memory
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240305/202403051540.JUWrj5hq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051540.JUWrj5hq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051540.JUWrj5hq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/unevictable.c:495:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     495 | const static struct proc_ops add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:500:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     500 | const static struct proc_ops del_proc_fops = {
         | ^~~~~
   mm/unevictable.c:500:30: warning: 'del_proc_fops' defined but not used [-Wunused-const-variable=]
     500 | const static struct proc_ops del_proc_fops = {
         |                              ^~~~~~~~~~~~~
   mm/unevictable.c:495:30: warning: 'add_proc_fops' defined but not used [-Wunused-const-variable=]
     495 | const static struct proc_ops add_proc_fops = {
         |                              ^~~~~~~~~~~~~


vim +/static +495 mm/unevictable.c

   494	
 > 495	const static struct proc_ops add_proc_fops = {
   496		.proc_read  = proc_read_add_pid,
   497		.proc_write = proc_write_add_pid,
   498	};
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
