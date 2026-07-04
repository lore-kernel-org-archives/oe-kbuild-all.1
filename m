Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE36DDC5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 02:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783131440; cv=none; b=GtsKtPPsRygOVabq+HsnWBCKYhxXZ4Dip8GCMmh/5h7kemrvmWqn7Cda3Jgud0BbN0wWu3p9p4oQJzrQJCaHpuR04UyGdp+cSsLq0BJrl+l/C11/67Ccy1WtDnVRgR4fjZmcJAMY0Yf6DpUf3taPM3U7ProKexCWreizf6zn/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783131440; c=relaxed/simple;
	bh=KJYSwf2bYa+Z0J1WXKTXAj6Jf97SbfmH7dRDXg286aE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FksluIC8L8cUPWDTjrNK+72xzvg+HqduE7XEqpjkOv3dFKrwGZ9HojZ/XekNcAe3bzKnVmW5ObaUWbbuSl11SfgfrsBOmsfSo3q+QVpseu3J4CLugz5/4m2eM/PwqwVhjNtppUNKmViRRbun88QHvMlYCN0Glr4zOmZJCJhs2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvwWR72F; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvwWR72F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783131438; x=1814667438;
  h=date:from:to:cc:subject:message-id;
  bh=KJYSwf2bYa+Z0J1WXKTXAj6Jf97SbfmH7dRDXg286aE=;
  b=GvwWR72FYnNQLkeFArEhUhlQ1dCqjTIfXnVspD78iDLAqYF287peL9gK
   U3hx64EtQpEJkgl4qpz7udkwup8UV4MEs1HuvCjwhSjnI7vYkF6vnO4E4
   Z0/AE/N4olBm+vp2RisEjlYpp42SsPmWuXMTKbw+lJx0zwoLK+nex1G5s
   gDvPh4wWTezAPRs4wMnM8HysDmIb52HgfrFwvzpK1oltyv8c479M3je/w
   pvaevxSeOpndwNZ6+/4nBM8WgFsXkDQom7EjRs19HJFy1klzrHCG+XEfM
   JbM0apOYurOY42OorT4m3Y/zBCg0S+lWO0nQkLtWHgbcEm2Y4dqxNkfgk
   g==;
X-CSE-ConnectionGUID: ThHmDDdARsixxIMuRjKJNA==
X-CSE-MsgGUID: Wm8Vj7t1S8SesjBvyn7WIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83901864"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83901864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:17:17 -0700
X-CSE-ConnectionGUID: piXglZZ5SWaWhYphasvjdw==
X-CSE-MsgGUID: K6/C7I2mRr6U8QyT86sxyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="276433779"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2026 19:17:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfpwL-00000000Cln-0Ayd;
	Sat, 04 Jul 2026 02:17:10 +0000
Date: Sat, 04 Jul 2026 10:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V5 24/27]
 drivers/firmware/arm_scmi/scmi_system_telemetry.c:580:41: warning: array
 subscript 2 is above array bounds of '__u8[2]' {aka 'unsigned char[2]'}
Message-ID: <202607041006.sXXkxHWV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V5
head:   12bf8bf979989adcd25b57e702706658e00cee91
commit: 7fd3f28bf9eec2fd5f7d048c336d9b2035d263e2 [24/27] firmware: arm_scmi: Add System Telemetry driver
config: sparc-randconfig-r073-20260704 (https://download.01.org/0day-ci/archive/20260704/202607041006.sXXkxHWV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041006.sXXkxHWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041006.sXXkxHWV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/scmi_system_telemetry.c: In function 'scmi_tlm_unlocked_ioctl':
>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:580:41: warning: array subscript 2 is above array bounds of '__u8[2]' {aka 'unsigned char[2]'} [-Warray-bounds]
     if (dei.pad[0] || dei.pad[1] || dei.pad[2] || dei.flags)
                                     ~~~~~~~^~~


vim +580 drivers/firmware/arm_scmi/scmi_system_telemetry.c

   567	
   568	static long
   569	scmi_tlm_de_info_get_ioctl(const struct scmi_tlm_instance *ti, unsigned long arg)
   570	{
   571		void __user *uptr = (void __user *)arg;
   572		struct scmi_tlm_setup *tsp = ti->tsp;
   573		const struct scmi_telemetry_de *de;
   574		struct scmi_tlm_de_info dei;
   575	
   576		if (copy_from_user(&dei, uptr, sizeof(dei)))
   577			return -EFAULT;
   578	
   579		/* Flags does NOT make sense in the input param */
 > 580		if (dei.pad[0] || dei.pad[1] || dei.pad[2] || dei.flags)
   581			return -EINVAL;
   582	
   583		de = tsp->ops->de_lookup(tsp->ph, dei.id);
   584		if (!de)
   585			return -EINVAL;
   586	
   587		scmi_tlm_to_uapi_de_info(&dei, de->info);
   588		if (copy_to_user(uptr, &dei, sizeof(dei)))
   589			return -EFAULT;
   590	
   591		return 0;
   592	}
   593	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
