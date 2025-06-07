Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FDB4315C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 20:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327937; cv=none; b=SnyfO0KCZnINCLdUHNhFpL3TmNCCqCRP7tRkgp4VrLc4KxKhb5EhQnXapKYI+/GcjRdXVMk7byCOebh1CDU8/oXsDdpOKEaHSQAnDxZi7bKSIp++FsQ0UrtyTG5fT1A2TbppcbNsKh76oMAvmQulvIqHeBa8JEg+yjctcIuklOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327937; c=relaxed/simple;
	bh=qxs6BOSv8MnfedNquxCSk69yeDNBoR9n2ajRRR3gGiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k24mhL97BsjfaT/Y4Uiv1vxs2Ky3jw8KJJCXLWkOVE1potovK5dJxjIdwa3cK0WGuVpApaGh1RovYyl/9exIe4aBkkqkJBQpkdWyY25kUxANhzP9q0qav8BrlEdh/8nQAdBPLIzkM8h/ZzcLcg89x0vbqEukf+0Lu2H7YRmtMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqOomNcW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqOomNcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749327935; x=1780863935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxs6BOSv8MnfedNquxCSk69yeDNBoR9n2ajRRR3gGiQ=;
  b=dqOomNcW9rmJMh9WwvPzE+LgAmNNBfLNUrnFmYuOBatAnkhAkD+YNEts
   ZMqurJbEvFAODfCZ3Wcfv2uTcVNoS8ub3emBsIRb46IdhCwv3A1UWAGUz
   ZU8tToK7x8YE+nCgVnbv+VG47m7xa7v9h6RZCsz8QLGgIVZ6R1TMfZwXa
   fmh9oIjkGDzAIwgSEZV+w0uxn11c+W/URkeXqXNW8LgVWUqljq8D5jmiO
   OcMD8QBll373N5frpAyc7n+wI2t0YfQ/TWy7JwmvUwP0Gpi0HE8d5VrnA
   oXQilERbc5D4otgKqLDTHsOxs17hETAfmqU9FjuwGkajXWc0NsINrLSV2
   w==;
X-CSE-ConnectionGUID: NL+0u5wpRymtdsUgkWZ1RQ==
X-CSE-MsgGUID: 3NXSsaWyTHuRCD9BC71tDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="73979699"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="73979699"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 13:25:34 -0700
X-CSE-ConnectionGUID: EKbbVrsCTJyG1VIu4CjLJw==
X-CSE-MsgGUID: V+2WUq2xR0KRYOHogf0nRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="146054185"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2025 13:25:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO06c-0005zD-2W;
	Sat, 07 Jun 2025 20:25:30 +0000
Date: Sun, 8 Jun 2025 04:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Ge <gehao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 27/59] ERROR: modpost: "_shared_alloc_tag"
 [kernel/rcu/rcuscale.ko] undefined!
Message-ID: <202506080448.KWN8arrX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f3021d9246bc454732836ab31f200fac366f1d94
commit: 686f7f1fa647e3f365b603dd44d39e9e9106b9ac [27/59] mm/alloc_tag: add the ARCH_NEEDS_WEAK_PER_CPU macro when statically defining the percpu variable alloc_tag_counters
config: s390-randconfig-r111-20250607 (https://download.01.org/0day-ci/archive/20250608/202506080448.KWN8arrX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250608/202506080448.KWN8arrX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080448.KWN8arrX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "_shared_alloc_tag" [kernel/rcu/rcuscale.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [fs/binfmt_misc.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [fs/overlayfs/overlay.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [security/keys/trusted-keys/trusted.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [crypto/cmac.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [crypto/cts.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [crypto/xts.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [crypto/ctr.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [crypto/hctr2.ko] undefined!
>> ERROR: modpost: "_shared_alloc_tag" [crypto/gcm.ko] undefined!
WARNING: modpost: suppressed 112 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
