Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FC936493A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784025131; cv=none; b=MRao/02YeeiFl/59RW+dJ4aTiooRnE/dofKXhb5Q2ZEn62pNgvnWYIHeiG/Lar8Y380pcl6QY2l9sC41TjA80fIfEqwG2DNh2MejnQnejmTa6BKWdjbNgVc09/gSWUySWDfTQBlKK2WQzyfoUZKpVW4YrFoUulcz4ysl59g0zYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784025131; c=relaxed/simple;
	bh=SEHFWxQVLDZaS2j6tVLhHda3ex8OReu/MjCtv0QbceQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cwOJMTnDLUAaUMlaN9jmSHvINKbyW0jtTgYoAgKGvGPaq9g5xmVcZS05GkJCVBalD8TKOag6Pua3+euCxjNbQyQT4LUTJsmlElONiYasM7xoXWct2ZOm2hW5UQDu9L2lVQEZaSu8YaYGz/uD11FP0dGIY4uBnSb4D9JRyxUNPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADNssUUF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADNssUUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784025129; x=1815561129;
  h=date:from:to:cc:subject:message-id;
  bh=SEHFWxQVLDZaS2j6tVLhHda3ex8OReu/MjCtv0QbceQ=;
  b=ADNssUUFa8WPRo655T54FbR8Y0/hUTt5IsrvT5o9tNsMtgh3juUK+9t1
   wsM0ZoNTgR9Q3xBfH/0/4uBQjV9qrrtyHx68ursmjwCmIs04b5be+fwcu
   9wchuYLkYdcd/Yyu6EmMN3ss74Kghtyk+EWRL4o1Y6ZRAgOL0jfSypGzR
   drpvm1pY3e1x/QqlVa25pMS3QVIwvRV4nxLZvGchV78UO4XWb06GwDK0v
   wbzXAe85ISGXJa45AYCyOjxAUgDvuEifU3mMSHKesxZYFSEtVL2kM7DAJ
   +TLwi3S61rWwbRfvSvsscntuWn4qe8w8Qcea5cgHq2uJmAgCr/p4bHPWs
   w==;
X-CSE-ConnectionGUID: 0kHbi2kATsSVAGcDH5HiIA==
X-CSE-MsgGUID: 5/6KKsQOSI+5AmSWvTnwbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="107436436"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="107436436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 03:32:09 -0700
X-CSE-ConnectionGUID: aWUfkMIoRKWtFagwig5k7w==
X-CSE-MsgGUID: 9rrGpE4NRDWn5uEjgq0KMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="251406016"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2026 03:32:07 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjaQn-000000003xd-2Y34;
	Tue, 14 Jul 2026 10:32:05 +0000
Date: Tue, 14 Jul 2026 12:31:33 +0200
From: kernel test robot <lkp@intel.com>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/ptp/ptp_vmclock.c:389:31: warning: unused variable
 'st'
Message-ID: <202607141227.yWxMnmZT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Arthur-Kiyanovski/ptp-Add-ioctls-for-PHC-timestamps-with-quality-attributes/20260714-100812
head:   3e68248a2ac27fbf44717e13dc62b2276c0b3a87
commit: 5edbefdffcd49d8e1e090b0afe7e8f32e14c7326 ptp: ptp_vmclock: Implement attributes ioctls
date:   8 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260714/202607141227.yWxMnmZT-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141227.yWxMnmZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141227.yWxMnmZT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'ptp_vmclock_do_getcrosststamp':
>> drivers/ptp/ptp_vmclock.c:389:31: warning: unused variable 'st' [-Wunused-variable]
     389 |         struct vmclock_state *st = vctx->st;
         |                               ^~


vim +/st +389 drivers/ptp/ptp_vmclock.c

   385	
   386	static int ptp_vmclock_do_getcrosststamp(struct vmclock_crosststamp_ctx *vctx,
   387						 struct system_device_crosststamp *xtstamp)
   388	{
 > 389		struct vmclock_state *st = vctx->st;
   390		int ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn, vctx,
   391							NULL, xtstamp);
   392	#ifdef SUPPORT_KVMCLOCK
   393		/*
   394		 * On x86, the KVM clock may be used for the system time. We can
   395		 * actually convert a TSC reading to that, and return a paired
   396		 * timestamp that get_device_system_crosststamp() *can* handle.
   397		 */
   398		if (ret == -ENODEV) {
   399			struct system_time_snapshot systime_snapshot;
   400	
   401			ktime_get_snapshot_id(CLOCK_REALTIME, &systime_snapshot);
   402	
   403			if (systime_snapshot.cs_id == CSID_X86_TSC ||
   404			    systime_snapshot.cs_id == CSID_X86_KVM_CLK) {
   405				WRITE_ONCE(st->sys_cs_id, systime_snapshot.cs_id);
   406				ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn,
   407								    vctx, NULL, xtstamp);
   408			}
   409		}
   410	#endif
   411		return ret;
   412	}
   413	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
