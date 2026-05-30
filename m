Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D013090F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158965; cv=none; b=Gk2xsoLv+jZbW2FzNYsdkIzteCklOX3Y5NQ00ukqvGe4kT/PhKX4HVWJ0irAuMychvMOnrL5St3JCl10G7Rto4WUioPeE+Y//XK0Q+l6vqBy3qms8P76Vbc0bRRTIsOPugr0i+J7MP4fz74EtqghbwCyAoB2Ip+D3ITFDXlg4w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158965; c=relaxed/simple;
	bh=/oddMMc2fuRt/BBx+u9GpuxMF62RC3U+dXumuHnENNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ryuDN5rHp3CK4Ops15+Wo2eIv5QQv+NyGr3S8F5mFkcLnoizuFITOWk2r0xNOmX3KEon8P7nlSawLFDXMMrZQgCPYmxLejQw90TYilsbN0Pc8tvi1XhpuLL0RcXkpJWyJQJyZpE4HQ4oGINbaCGFHYk/ZoYZyTOo3IOiMgILLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmtFJ984; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmtFJ984"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780158964; x=1811694964;
  h=date:from:to:cc:subject:message-id;
  bh=/oddMMc2fuRt/BBx+u9GpuxMF62RC3U+dXumuHnENNg=;
  b=OmtFJ984CgHQSvAsyMYFS56mTaqvJZvDos51x4UZhxVX39dflD5nj7p9
   VwulzRf6uRtZke5twRK3XfpuwaJTDORIU/6h4dyfqbRPbHYgEiBkDoW3S
   ZNROVdtwOrAkcCw+0848/wOkoIexDuDzfM5wFq3AQO9RF0fax6xYF//yc
   S4QLRPC74VTr89p6fxXiAL1lEY9ZV9lJQbM7geERng1kB1RffureXrW9H
   Pk3fKXASisX2pQrDkcLqTl2sB3f3WIv+yegPUNwrMeVyIH4TIN04Kvp10
   vdAnHoKxCbPvFPbxzrfeSAxBVD78xAhMMD095TD8idJ1wrYjb6IanwHUn
   w==;
X-CSE-ConnectionGUID: oi+AxKmVSsuNiv4uMkyTYA==
X-CSE-MsgGUID: iprKpgwNSk+sbnqSLqKS/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="81009494"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="81009494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 09:36:03 -0700
X-CSE-ConnectionGUID: sdudZVwXT9SAn5I+WqanFg==
X-CSE-MsgGUID: q5nWEFopRAO1WNMMZoAgLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="281248298"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 May 2026 09:36:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTMfH-000000008gK-39Kb;
	Sat, 30 May 2026 16:35:59 +0000
Date: Sun, 31 May 2026 00:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvm-ktime-snapshot 41/41]
 arch/x86/kvm/x86.c:10185:28: warning: unused variable 'tk'
Message-ID: <202605310038.xMRqoJ5Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvm-ktime-snapshot
head:   cf64d2c481a41a8fd0a1afe2368c30675871b740
commit: cf64d2c481a41a8fd0a1afe2368c30675871b740 [41/41] KVM: x86: Remove pvclock_gtod_data and private timekeeping code
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260531/202605310038.xMRqoJ5Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310038.xMRqoJ5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605310038.xMRqoJ5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'pvclock_gtod_notify':
>> arch/x86/kvm/x86.c:10185:28: warning: unused variable 'tk' [-Wunused-variable]
   10185 |         struct timekeeper *tk = priv;
         |                            ^~


vim +/tk +10185 arch/x86/kvm/x86.c

3f804f6d201ca93 Thomas Gleixner 2021-05-06  10178  
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10179  /*
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10180   * Notification about pvclock gtod data update.
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10181   */
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10182  static int pvclock_gtod_notify(struct notifier_block *nb, unsigned long unused,
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10183  			       void *priv)
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10184  {
16e8d74d2da9920 Marcelo Tosatti 2012-11-27 @10185  	struct timekeeper *tk = priv;
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10186  
16e8d74d2da9920 Marcelo Tosatti 2012-11-27  10187  

:::::: The code at line 10185 was first introduced by commit
:::::: 16e8d74d2da9920f874b10a3d979fb25c01f518f KVM: x86: notifier for clocksource changes

:::::: TO: Marcelo Tosatti <mtosatti@redhat.com>
:::::: CC: Marcelo Tosatti <mtosatti@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
