Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485A1DE4D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730190775; cv=none; b=ANRxh9nT1Tmsm7R6c0y/gvU4OzPDzxn+PBZKDo2G8Gbvb7ughPl5o8NeIUyKZDX8udQZED6FL8lXeFv1I78ZhHImjfpR5wK99FcHOwwLQEyT0u6Tc9gYkrWc7eUFxH+T1GuQ9HpDNIIbvTXEsyqXS/GfGZZxGXpVMw2jcni0tG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730190775; c=relaxed/simple;
	bh=inSbF4SXeyZLDlzC27YVr59hBiJS+BwIGkvXtK2vPq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7KcZ0KIzi7w7cGuYPMeIc6/lQWllkMunZeAdn+BF8TN/skv3DxNaTS92O+dNE2p4zF7LDaPeGnc+dvVTj3UaSkm1JVgL3GNT7UL1j7tih6Kl8R7AdhrxIE48B7fjNjy/ltxf8GKD+3DBXvHwpyhzNMK03pu5f3vZ74eVC9/9Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFSlBPus; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFSlBPus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730190773; x=1761726773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=inSbF4SXeyZLDlzC27YVr59hBiJS+BwIGkvXtK2vPq8=;
  b=TFSlBPuskBgnTLJ1QYK1YZLX4UbQP74a4wF9pIGCcQtwMlay823GFp3h
   P4Vey9kCdLc4C8Xs8nv/uXMWIBxhC8yEokPz338xuvV4evA6IWsk6cC2W
   TZmqk9VN9xgMTsuUGlQV3sHssovr7qK8Efhv9nR6bjnUaxlpbx+2Hxxic
   6hXgmeB20Ml7s+QekuF3lLO+8F9LRj6535nwKQRlnFnvY1FeRJ8ftmRKK
   +rY8zKodb2s6cMvSQqRaG0sHTDaMG7suWcX5k0DdqetWQeA+ZVP6Uog5k
   rSGjolRzl6lRa23pE6eK8A+NRoXrzUmQsVlI6CW5Nl6Axq4D1JHrMpoKC
   A==;
X-CSE-ConnectionGUID: iGc/1raiQTCrLfTB8QRMtQ==
X-CSE-MsgGUID: NLMCRh/CRk+zUyHEqKIQ2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30002829"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30002829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 01:32:53 -0700
X-CSE-ConnectionGUID: 1Z55dVRySe+5+i4KB2+PPg==
X-CSE-MsgGUID: q93Ua0mnTDOPqooXwfcXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81957001"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2024 01:32:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5heh-000dR4-33;
	Tue, 29 Oct 2024 08:32:47 +0000
Date: Tue, 29 Oct 2024 16:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 25/98] net/core/net-procfs.c:344:45: sparse:
 sparse: cast removes address space '__percpu' of expression
Message-ID: <202410291614.5UV1JF06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: d9324ddd538a0b57dbee8623806ff9b9f7811202 [25/98] net: dev ipv4/v6 stat
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291614.5UV1JF06-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291614.5UV1JF06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291614.5UV1JF06-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/net-procfs.c:344:45: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/net-procfs.c:344:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *mib @@     got void [noderef] __percpu ** @@
   net/core/net-procfs.c:344:45: sparse:     expected void [noderef] __percpu *mib
   net/core/net-procfs.c:344:45: sparse:     got void [noderef] __percpu **

vim +/__percpu +344 net/core/net-procfs.c

   334	
   335	static void dev_ext_seq_printf_stats(struct seq_file *seq, void *v)
   336	{
   337		struct net_device *dev = (struct net_device *)v;
   338		int i;
   339	
   340		seq_printf(seq, "%10s  ", dev->name);
   341	
   342		for (i = 0; snmp_devstat_list[i].name; i++)
   343			seq_printf(seq, " %12lu",
 > 344				   snmp_fold_field((void __percpu **)
   345						   dev->mib.dev_statistics,
   346						   snmp_devstat_list[i].entry));
   347		seq_putc(seq, '\n');
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
