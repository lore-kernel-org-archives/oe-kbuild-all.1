Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC781ACA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766083768; cv=none; b=OgJZeoxKPJuNY/dUfAft5xwiALVzRt5qEokWGByUySu/cmWuCYensrabXzai7qx9gZHM2YCoeVABeyrra1+vf03kAZAhSfPTJyrCjoEw9cNtT9rjekqyYJfVimx4/35IknQ1I1l6g7pTCU7ftYC9At1vHIw3nQXR5rE5gZzTDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766083768; c=relaxed/simple;
	bh=dNGANY9noIPAuN+KNYR9LxbLbW5zojIEsan+FhJdXBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oeWa6Je9fWn/As89Osl0+wp6hgdNBHT/SV1AomC1W8i6KTRPYw9zKLqkss7GSyg/ERU3WUwsKf1aNSwObmNul+kWyov0SXL/jUBPFzD4DDp1Tu7ipGde8ekKDqoIbOJU5xVDXVtJef3LZh1JcgA2kxB8zQfvoXEECFoCmEUh3Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKEbTDem; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKEbTDem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766083765; x=1797619765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dNGANY9noIPAuN+KNYR9LxbLbW5zojIEsan+FhJdXBk=;
  b=MKEbTDemsAA9v74ecoFORdH7ju/V4E4CfRtkFC1rKNRbAVHQykkBANfS
   JSR7RfRvsqpAC2Qc4RTLmWrwvci+7b2Ry+PtAUNmTekBfw+tu7xEXr14q
   9gGlxV17FnoTQR2CA/LqQsQdQ5hHenf0nLoys+pJdw3HFShb1ZRhmBtfU
   ZmAyAUhPuFj6UoK0T/se3QVwySNPWPSlkqQ0VS1bH1z05J9T4S/i7dieW
   GCoQRQ2T/AXnMYJTA/Hddxqd/EDrNoIlRzQP9HhMxEEcdZgZ7QQ6oMtYD
   DFe5ogwOUL0VkWxHadDDMtr+oBmFxQbx+zAXnSFCUyeg2hR/u8HXLzZkP
   A==;
X-CSE-ConnectionGUID: QdMjiIHLQxmV8KxNUPjiGw==
X-CSE-MsgGUID: +HyUB/lgT4a4vzcJij8EzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67798708"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67798708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 10:49:24 -0800
X-CSE-ConnectionGUID: alOERiLXSRm2AkAUfYAg0A==
X-CSE-MsgGUID: yY/xhxdMQrqF2RyeLtLTRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229330625"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2025 10:49:22 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWJ3w-000000002Sj-0YsX;
	Thu, 18 Dec 2025 18:49:20 +0000
Date: Fri, 19 Dec 2025 02:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 kernel/sched/core.c:6995:5: warning: no previous prototype for
 '_sched_cpu_deactivate'
Message-ID: <202512190217.T9J0FxwN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 683010f555d804c2b9b01d327767755fa78a3ce5 [0/4] ANDROID: cpu/hotplug: add pause/resume_cpus interface
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512190217.T9J0FxwN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190217.T9J0FxwN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190217.T9J0FxwN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:2410:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    2410 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:6995:5: warning: no previous prototype for '_sched_cpu_deactivate' [-Wmissing-prototypes]
    6995 | int _sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/_sched_cpu_deactivate +6995 kernel/sched/core.c

  6994	
> 6995	int _sched_cpu_deactivate(unsigned int cpu)
  6996	{
  6997		int ret;
  6998	
  6999		set_cpu_active(cpu, false);
  7000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
