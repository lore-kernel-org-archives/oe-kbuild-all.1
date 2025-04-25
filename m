Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676AF2417EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579472; cv=none; b=eNuT0h+SVioXBguW68K4OkOyKLHu9bl6AwYO/+G5t//VqOScdbcpWNvoHgKE6aBX4w1afsVuqOm85x40TgnVrns27OT9K8kXxy05zwJD6cjmGDIt/8cmqIx0AJU6Eh5+P7pFgMOwU3baI8F/KHEk/ucyIE6QHLkY9OGSxx5sots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579472; c=relaxed/simple;
	bh=nH13tBn7FAb/uVDXZ58yw/K6CdThofHyLAqYbJ6+WVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2hrxlOQpjJZcGeIt1O/PbSo+4dy5p3HnK2R4x42Tb/A8ozuS4zmoMdoHDVXGi8FrgtPwrunEoENAdGn7SjDXw9itev7mSBjUpUSIVDSrVrjWegkKtfHFxGzEVSw7MJhJzmvOHndyxdueoewoFJQZPr8kp8lNgQQmKZ0hmyA+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBO/FvPR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBO/FvPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745579469; x=1777115469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nH13tBn7FAb/uVDXZ58yw/K6CdThofHyLAqYbJ6+WVU=;
  b=lBO/FvPRVriuLaBKMzzPG86WCPhUP2KwzIWrMfks/HT90W9rp+JCxpYN
   sQaBS8pL/RrQ705eLVccxpLLcIx1q7vtWoEFT8g4XhvIjEooy/CccR0qg
   FCYeqvSRk6jNH1wtAWD9O8QyHZj872nCJOireosh4S5/G/wjYlypiPWLA
   weExW32+JJQ5ltrwbhXjY9riOxtTHYrPoQagbDWnN+qQi4Qko7fTUz4tJ
   RqRoZwdm0MINZjCu/uPkBiLJ6omEbrGBG97beq0zWuZ5fsygid90iroeI
   InI3KxL5J75S0K5z1mUUWdvcgwVki6vpSErVfFBq5uCTNLfbjDmDF495E
   A==;
X-CSE-ConnectionGUID: Tvg2DJYGRXmAo3OwpTvIew==
X-CSE-MsgGUID: eXwi1MfeTXWOWOGQbR8XQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51060260"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51060260"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:11:08 -0700
X-CSE-ConnectionGUID: cdpo4Np2QS6XaBbXMlVLpg==
X-CSE-MsgGUID: VazdxfVoQ4KUHVMbA1Mx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="136943684"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2025 04:11:06 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8GxT-00056h-26;
	Fri, 25 Apr 2025 11:11:03 +0000
Date: Fri, 25 Apr 2025 19:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongqiu Han <quic_zhonhan@quicinc.com>, rafael@kernel.org,
	pavel@kernel.org, len.brown@intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_zhonhan@quicinc.com
Subject: Re: [PATCH] PM: QoS: Add support for CPU affinity mask-based CPUs
 latency QoS
Message-ID: <202504251831.lUheTrIK-lkp@intel.com>
References: <20250424095228.1112558-1-quic_zhonhan@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424095228.1112558-1-quic_zhonhan@quicinc.com>

Hi Zhongqiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongqiu-Han/PM-QoS-Add-support-for-CPU-affinity-mask-based-CPUs-latency-QoS/20250424-175559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250424095228.1112558-1-quic_zhonhan%40quicinc.com
patch subject: [PATCH] PM: QoS: Add support for CPU affinity mask-based CPUs latency QoS
config: riscv-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251831.lUheTrIK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251831.lUheTrIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251831.lUheTrIK-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: sound/firewire/amdtp-am824.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/amdtp-stream.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/amdtp-am824.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/amdtp-stream.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/amdtp-am824.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/amdtp-stream.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/amdtp-am824.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/amdtp-stream.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/amdtp-am824.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/amdtp-stream.o:include/linux/pm_qos.h:353: first defined here
--
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-stream.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-stream.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-stream.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-stream.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-stream.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-pcm.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-pcm.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-pcm.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-pcm.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-pcm.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-proc.o: in function `cpu_latency_qos_affinity_add':
   sound/firewire/oxfw/oxfw-proc.c:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-proc.o: in function `cpu_latency_qos_affinity_update':
   sound/firewire/oxfw/oxfw-proc.c:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-proc.o: in function `cpu_latency_qos_affinity_remove':
   sound/firewire/oxfw/oxfw-proc.c:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-proc.o: in function `cpu_latency_qos_affinity_release':
   sound/firewire/oxfw/oxfw-proc.c:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-proc.o: in function `wakeup_qos_affinity_idle_cpu':
   sound/firewire/oxfw/oxfw-proc.c:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-midi.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-midi.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-midi.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-midi.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-midi.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-hwdep.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-hwdep.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-hwdep.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-hwdep.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-hwdep.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-spkr.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-spkr.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-spkr.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-spkr.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-spkr.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-scs1x.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-scs1x.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-scs1x.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-scs1x.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw-scs1x.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:337: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:342: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:346: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:349: first defined here
   riscv32-linux-ld: sound/firewire/oxfw/oxfw.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/oxfw/oxfw-command.o:sound/firewire/oxfw/oxfw-command.c:353: first defined here
--
   riscv32-linux-ld: sound/firewire/fireface/ff-transaction.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-transaction.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-transaction.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-transaction.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-transaction.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-midi.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-midi.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-midi.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-midi.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-midi.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-proc.o: in function `cpu_latency_qos_affinity_add':
   sound/firewire/fireface/ff-proc.c:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-proc.o: in function `cpu_latency_qos_affinity_update':
   sound/firewire/fireface/ff-proc.c:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-proc.o: in function `cpu_latency_qos_affinity_remove':
   sound/firewire/fireface/ff-proc.c:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-proc.o: in function `cpu_latency_qos_affinity_release':
   sound/firewire/fireface/ff-proc.c:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-proc.o: in function `wakeup_qos_affinity_idle_cpu':
   sound/firewire/fireface/ff-proc.c:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/amdtp-ff.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/amdtp-ff.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/amdtp-ff.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/amdtp-ff.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/amdtp-ff.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-stream.o: in function `cpu_latency_qos_affinity_add':
   sound/firewire/fireface/ff-stream.c:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-stream.o: in function `cpu_latency_qos_affinity_update':
   sound/firewire/fireface/ff-stream.c:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-stream.o: in function `cpu_latency_qos_affinity_remove':
   sound/firewire/fireface/ff-stream.c:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-stream.o: in function `cpu_latency_qos_affinity_release':
   sound/firewire/fireface/ff-stream.c:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-stream.o: in function `wakeup_qos_affinity_idle_cpu':
   sound/firewire/fireface/ff-stream.c:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-pcm.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-pcm.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-pcm.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-pcm.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-pcm.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-hwdep.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-hwdep.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-hwdep.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-hwdep.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-hwdep.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-former.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-former.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-former.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-former.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-former.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-latter.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-latter.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-latter.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-latter.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireface/ff-protocol-latter.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireface/ff.o:include/linux/pm_qos.h:353: first defined here
--
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_command.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_command.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_command.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_command.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_command.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_stream.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_stream.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_stream.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_stream.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_stream.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_proc.o: in function `cpu_latency_qos_affinity_add':
   sound/firewire/fireworks/fireworks_proc.c:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_proc.o: in function `cpu_latency_qos_affinity_update':
   sound/firewire/fireworks/fireworks_proc.c:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_proc.o: in function `cpu_latency_qos_affinity_remove':
   sound/firewire/fireworks/fireworks_proc.c:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_proc.o: in function `cpu_latency_qos_affinity_release':
   sound/firewire/fireworks/fireworks_proc.c:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_proc.o: in function `wakeup_qos_affinity_idle_cpu':
   sound/firewire/fireworks/fireworks_proc.c:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_midi.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_midi.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_midi.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_midi.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_midi.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_pcm.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_pcm.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_pcm.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_pcm.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_pcm.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_hwdep.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_hwdep.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_hwdep.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_hwdep.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks_hwdep.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/fireworks/fireworks.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/fireworks/fireworks_transaction.o:include/linux/pm_qos.h:353: first defined here
--
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-stream.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-stream.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-stream.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-stream.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-stream.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-proc.o: in function `cpu_latency_qos_affinity_add':
   sound/firewire/digi00x/digi00x-proc.c:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-proc.o: in function `cpu_latency_qos_affinity_update':
   sound/firewire/digi00x/digi00x-proc.c:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-proc.o: in function `cpu_latency_qos_affinity_remove':
   sound/firewire/digi00x/digi00x-proc.c:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-proc.o: in function `cpu_latency_qos_affinity_release':
   sound/firewire/digi00x/digi00x-proc.c:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-proc.o: in function `wakeup_qos_affinity_idle_cpu':
   sound/firewire/digi00x/digi00x-proc.c:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-pcm.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-pcm.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-pcm.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-pcm.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-pcm.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-hwdep.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-hwdep.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-hwdep.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-hwdep.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-hwdep.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-transaction.o: in function `cpu_latency_qos_affinity_add':
>> include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-transaction.o: in function `cpu_latency_qos_affinity_update':
>> include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-transaction.o: in function `cpu_latency_qos_affinity_remove':
>> include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-transaction.o: in function `cpu_latency_qos_affinity_release':
>> include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-transaction.o: in function `wakeup_qos_affinity_idle_cpu':
>> include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-midi.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-midi.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-midi.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-midi.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x-midi.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:353: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x.o: in function `cpu_latency_qos_affinity_add':
   include/linux/pm_qos.h:337: multiple definition of `cpu_latency_qos_affinity_add'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:337: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x.o: in function `cpu_latency_qos_affinity_update':
   include/linux/pm_qos.h:342: multiple definition of `cpu_latency_qos_affinity_update'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:342: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x.o: in function `cpu_latency_qos_affinity_remove':
   include/linux/pm_qos.h:346: multiple definition of `cpu_latency_qos_affinity_remove'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:346: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x.o: in function `cpu_latency_qos_affinity_release':
   include/linux/pm_qos.h:349: multiple definition of `cpu_latency_qos_affinity_release'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:349: first defined here
   riscv32-linux-ld: sound/firewire/digi00x/digi00x.o: in function `wakeup_qos_affinity_idle_cpu':
   include/linux/pm_qos.h:353: multiple definition of `wakeup_qos_affinity_idle_cpu'; sound/firewire/digi00x/amdtp-dot.o:include/linux/pm_qos.h:353: first defined here
..


vim +337 include/linux/pm_qos.h

   325	
   326	#if defined(CONFIG_CPU_IDLE) && defined(CONFIG_PM)
   327	int cpu_latency_qos_affinity_add(struct cpu_affinity_qos_req *pm_req,
   328				const cpumask_t *affinity_mask, s32 latency_value);
   329	int cpu_latency_qos_affinity_update(struct cpu_affinity_qos_req *pm_req,
   330				s32 new_value);
   331	int cpu_latency_qos_affinity_remove(struct cpu_affinity_qos_req *pm_req);
   332	int cpu_latency_qos_affinity_release(struct list_head *pm_reqs);
   333	void wakeup_qos_affinity_idle_cpu(int cpu);
   334	#else
   335	int cpu_latency_qos_affinity_add(struct cpu_affinity_qos_req *pm_req,
   336				const cpumask_t *affinity_mask, s32 latency_value)
 > 337	{
   338		return 0;
   339	}
   340	int cpu_latency_qos_affinity_update(struct cpu_affinity_qos_req *pm_req,
   341				s32 new_value)
 > 342	{
   343		return 0;
   344	}
   345	int cpu_latency_qos_affinity_remove(struct cpu_affinity_qos_req *pm_req)
 > 346	{
   347		return 0;
   348	}
 > 349	int cpu_latency_qos_affinity_release(struct list_head *pm_reqs)
   350	{
   351		return 0;
   352	}
 > 353	void wakeup_qos_affinity_idle_cpu(int cpu) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
