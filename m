Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36752AE77
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729900962; cv=none; b=Kqhxfuuthcoj8iKkykUXlemYEpQaalWx1Z5/36ZAkNmBGf1wlnFMMc7nOIodUOInPgs3veY8LCELLhtIEBjlIMUdfJjqq8Z7Pf/KZfRKJPb2ZR67DfWRcCSooY9yoRGpIeLITznmZ04ruQEC+eIzQVnnVKs2WAceNv1MPQP0qFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729900962; c=relaxed/simple;
	bh=WhA+MRyIkILMib0XyBXeyP0YN7mFuIRZYWogtZc3tuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8bc/S8X5Gl7vbPvJJw0HSpyj+ryiQfrTfyZ5tO/OdVtIa+hAvg4dUMz06YOWIhtHTSt8OeWEE3svX3JlmjWXVELW08lnsQUfa8NpFd4mI793jVXjZVpHU8I4ZJOLReSKKZgN6f3i35uah/oRxSZ9NLPZIhySjPZeyncWh/CPd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6hUogF9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6hUogF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729900960; x=1761436960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WhA+MRyIkILMib0XyBXeyP0YN7mFuIRZYWogtZc3tuo=;
  b=b6hUogF9yAvDWofc7ou9QbFP8QAWNrYvgciU6dV3S+KhHVG6FRMVUAjO
   auw64V0nG1aNf9IMSB0Ux5LR9ZezkiWGn6ZITU7hy1UMbAyKjGEndRCZM
   ZdefBr/oyenYI8hEzemR1FOkp4Y1DzYg1W3YaV83wptZzNb4mLy+k8/GN
   VvUv0UhTtbXe0n3zF3rwMSTI/eIZpHjspN7uGErJtTzJ5oyGddgbHkZ6s
   lfZpm3TmYIuDh089/N0VDr8EkTWpPAUvoOEUacVe5b3lJFjzywTf0jBbz
   01FG1UzIrIQ4nIpNIIluwEDJ6a2sEvL6/rNRHXUJBQgr5SVKKZRr0SC1W
   Q==;
X-CSE-ConnectionGUID: WCSTsptfQ3y5+Z0Tqq21Aw==
X-CSE-MsgGUID: /iBb2T35TaCPHmB+Idvm1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29035918"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29035918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 17:02:39 -0700
X-CSE-ConnectionGUID: 3L601U0sQrih3PIdOvn36w==
X-CSE-MsgGUID: IqdH0PL3TyyJN9oXeamSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="81362154"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2024 17:02:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4UGJ-000Z4P-37;
	Sat, 26 Oct 2024 00:02:35 +0000
Date: Sat, 26 Oct 2024 08:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14594/23859]
 arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct
 sched_info' has no member named 'run_delay'
Message-ID: <202410260758.Qe33nEsp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chenjiajun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2a40c79ddef4b96b8a7a396bd7273121b1b4a5c
commit: b94fc31d4e16ff65dc2141f0a1a3af6a3aac5bb2 [14594/23859] kvm: debugfs: aarch64 export cpu time related items to debugfs
config: arm64-randconfig-003-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260758.Qe33nEsp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260758.Qe33nEsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260758.Qe33nEsp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/arm/arm.c: In function 'update_steal_time':
>> arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct sched_info' has no member named 'run_delay'
     411 |         delta = current->sched_info.run_delay - vcpu->stat.steal;
         |                                    ^
   arch/arm64/kvm/../../../virt/kvm/arm/arm.c:412:47: error: 'struct sched_info' has no member named 'run_delay'
     412 |         vcpu->stat.steal = current->sched_info.run_delay;
         |                                               ^


vim +411 arch/arm64/kvm/../../../virt/kvm/arm/arm.c

   406	
   407	static void update_steal_time(struct kvm_vcpu *vcpu)
   408	{
   409		u64 delta;
   410	
 > 411		delta = current->sched_info.run_delay - vcpu->stat.steal;
   412		vcpu->stat.steal = current->sched_info.run_delay;
   413		vcpu->stat.st_max = max(vcpu->stat.st_max, delta);
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
