Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FFC20ADD6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 22:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765666780; cv=none; b=PDGoJ6q07T+jopjuGvqTpIRwW1ETiFGLaIF3BULiM+KNRr1BN3/RJXtV2iWj5Z8C76SvJcUlEQRkPo/IkIcIn5oMQ8ZqjXWQODK3N9f0sYxvLcJvSXLSpcebUZA5G+Q9AzoVUPZtjwyPS+h4gQbv2c5h05Eqvs5ITwUFqWEkqgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765666780; c=relaxed/simple;
	bh=GCsb8ebj5nqo5lFTS9f2PvvXWZQB7nMTjOTX07aJDkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJleBjiTPcJjQlririL5jou6a8QqGO1arkguV9/HPbxA5sy0H9Txt8CdS8Iu9FBeX/9pxheHZPXrMBX41z8l7w20H2d9QSnhstPR2uKErxjBfGxyFdh/SlhWuDj25mBY8RB8gGUCSVJAc3Do6YxwhmCkSjer+PDqrUuwFkF7KOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZ2wsL8J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZ2wsL8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765666779; x=1797202779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GCsb8ebj5nqo5lFTS9f2PvvXWZQB7nMTjOTX07aJDkQ=;
  b=NZ2wsL8JqYE4LFin7IZunNgrETySyInWpTTSJRQiBKbrH94dRhu3vxDS
   YsC4qgtLKCptyZ+LoXDttEUGIcZExnRFaz8kjJOjMxJ6e+ARUgDgX1Yps
   mx+FYeTWFdhpJG040dK4ufnce+Ckisase+jPQM8t4u2Wlh/0kKzmTPBwe
   fyp3UGvjZOe74iDGioSr12Ngh9FGESIT3FBtk1T/nxAR+JKhWMzbRcPFW
   itwDmhjRXdNW1fQhON0ysFMJlRx/qwAg+sjoF7/SU+m20/qm2oP3sbeVr
   40nhzULq0XxcwSjwvS/OiS23PS19xkh1mv4PLW2X9Qpr5VdnCqD1vfHCc
   A==;
X-CSE-ConnectionGUID: kC/sjBqIRmynR+BUNa9D0Q==
X-CSE-MsgGUID: MW3RSE0rSLCIVkqTVA4dlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67374736"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67374736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:59:38 -0800
X-CSE-ConnectionGUID: 4ZeR5KfFTTatqVvHDbs0Kw==
X-CSE-MsgGUID: CXf62XkiTa+pv2g+yefyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="198221566"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 14:59:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYaM-000000002CW-2jA2;
	Sat, 13 Dec 2025 22:59:34 +0000
Date: Sat, 13 Dec 2025 23:59:33 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] kernel/cgroup/cgroup.c:2240:
 warning: Excess function parameter 'lock_threadgroup' description in
 'cgroup_attach_lock'
Message-ID: <202512132306.9jtRj6o7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 4924308a1ca9cc2f791398836a8744c22078ffbd [1941/1941] cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512132306.9jtRj6o7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132306.9jtRj6o7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132306.9jtRj6o7-lkp@intel.com/

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
