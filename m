Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69692DE6E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542155; cv=none; b=H91CSR+B534pc0gSsJYhHOuIsJS7tA57vP9Zu9yr/T1aLIB9hYwC+011iN7fP58gH9B4FA36SpctdYqPc3smPt3X1hxX6vwhVVwx1FMaKZG7ZF8Ry4X6P2vlPE4zc1mhc2TUDnhuf4pHAb2PPYyYgtb8d5ulTAmE1CwNB2M10wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542155; c=relaxed/simple;
	bh=BQlQhMAY7wyR/OULV0qPVGjo7Ubla2JSBNcV2Ffeyms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrrTIWLLdy+YHIxnK5Ll3LMzOTb4SU/G2ndFnk3VYUzBzL+DVb0FVt9m/1X1u2gnfmBA1n9YlJoWr5ZUK6e9UW9VM0+D2BDFXmlAAvVN+/lIPTb2w7/yGcUXup19U8IIqqNn8BG5lx2OBHbjSSw2R7SJ2J6lgKOVYnDq902BPpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbqWRPGG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbqWRPGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751542153; x=1783078153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BQlQhMAY7wyR/OULV0qPVGjo7Ubla2JSBNcV2Ffeyms=;
  b=fbqWRPGG+a2APdccuO4uTMoVOkmN0YHHmEthLFilPIAmuocVY3tXwJpG
   FfltSCXCOuT6MJnqJHicPaMZch3tvaalVF4wzFfedZYhdEFe4NiTPFLlC
   KpSKJTVh5lx0vHNKUCMX26VWmmuir1C/v4oK5H/m4AGJhURLlodblktq9
   wy7rqGoV7XOmhNlpF9dgB1NEUtKp+luGU2UrI4pbCJg1iLb0lW6Wvagc4
   0I4qfWtTsCYQjs1vnmy9EklIBTciHIChBmfVSEjb040wc/RmDwEcWz8fh
   b/aPoAVo5YYCHLbFhnKM5VU4dpLx4YHbftlBhCwuyRONwKdKI3NL6FLYe
   w==;
X-CSE-ConnectionGUID: gq/z6lI+T7ixa8QMHY2EbA==
X-CSE-MsgGUID: Cujdmp3yQOWIuWoccyzKtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53731900"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53731900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 04:29:12 -0700
X-CSE-ConnectionGUID: Hr3W/qEXSEeKvTSlPs/eeA==
X-CSE-MsgGUID: G8Wq6UBrQ1uXcMTWQ71B3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="185293873"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2025 04:29:11 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXI7p-0000TL-0U;
	Thu, 03 Jul 2025 11:29:09 +0000
Date: Thu, 3 Jul 2025 13:29:01 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] kernel/cgroup/cgroup.c:2240:
 warning: Excess function parameter 'lock_threadgroup' description in
 'cgroup_attach_lock'
Message-ID: <202507031346.HRMtINKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   26d81348fb134a6bffb49fd1b55d8842cbf6424d
commit: 4924308a1ca9cc2f791398836a8744c22078ffbd [1605/1605] cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250703/202507031346.HRMtINKf-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031346.HRMtINKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507031346.HRMtINKf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:2240: warning: Excess function parameter 'lock_threadgroup' description in 'cgroup_attach_lock'
>> kernel/cgroup/cgroup.c:2250: warning: Excess function parameter 'lock_threadgroup' description in 'cgroup_attach_unlock'


vim +2240 kernel/cgroup/cgroup.c

  2215	
  2216	/**
  2217	 * cgroup_attach_lock - Lock for ->attach()
  2218	 * @lock_threadgroup: whether to down_write cgroup_threadgroup_rwsem
  2219	 *
  2220	 * cgroup migration sometimes needs to stabilize threadgroups against forks and
  2221	 * exits by write-locking cgroup_threadgroup_rwsem. However, some ->attach()
  2222	 * implementations (e.g. cpuset), also need to disable CPU hotplug.
  2223	 * Unfortunately, letting ->attach() operations acquire cpus_read_lock() can
  2224	 * lead to deadlocks.
  2225	 *
  2226	 * Bringing up a CPU may involve creating and destroying tasks which requires
  2227	 * read-locking threadgroup_rwsem, so threadgroup_rwsem nests inside
  2228	 * cpus_read_lock(). If we call an ->attach() which acquires the cpus lock while
  2229	 * write-locking threadgroup_rwsem, the locking order is reversed and we end up
  2230	 * waiting for an on-going CPU hotplug operation which in turn is waiting for
  2231	 * the threadgroup_rwsem to be released to create new tasks. For more details:
  2232	 *
  2233	 *   http://lkml.kernel.org/r/20220711174629.uehfmqegcwn2lqzu@wubuntu
  2234	 *
  2235	 * Resolve the situation by always acquiring cpus_read_lock() before optionally
  2236	 * write-locking cgroup_threadgroup_rwsem. This allows ->attach() to assume that
  2237	 * CPU hotplug is disabled on entry.
  2238	 */
  2239	static void cgroup_attach_lock(void)
> 2240	{
  2241		cpus_read_lock();
  2242		percpu_down_write(&cgroup_threadgroup_rwsem);
  2243	}
  2244	
  2245	/**
  2246	 * cgroup_attach_unlock - Undo cgroup_attach_lock()
  2247	 * @lock_threadgroup: whether to up_write cgroup_threadgroup_rwsem
  2248	 */
  2249	static void cgroup_attach_unlock(void)
> 2250	{
  2251		percpu_up_write(&cgroup_threadgroup_rwsem);
  2252		cpus_read_unlock();
  2253	}
  2254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
