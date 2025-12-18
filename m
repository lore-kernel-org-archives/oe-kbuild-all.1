Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A92315D3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766060407; cv=none; b=smLZ3VWnZFsCxGA0YvtmqLolUdM2XRtr9PbRiJMhcaPAu6YrGBdACL+7v4paw5B/xPzaRN/c945Qq7PU07BoRZJ4kNRcWuPUnpPsIjO9HrA/+bMFtEk5IQs9c93ARVRFhBWuFhHHD9fdLsbKn/5bgHFws76iPf6dIZse3eV8uI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766060407; c=relaxed/simple;
	bh=iz0R8iSHlm4dGAKQZ0Ahak46IEtGYrQ1W/c3vqT2lr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hm9J968bx5ikl++Fe0ywUZY+PAy2FMb4Pr/lk7i1WfeLlb2pcEPi1nPHrXHRcFD1gS+bMblBR28vpzASH9DngoMW4z/K6Hixaah2FyLt3ifAgP77E164wJFKhrvV4dok/p0injoR5Lvz0yjCz2mNjMVZ6jN9O5KGnuIleDUtXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxf60C3h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxf60C3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766060405; x=1797596405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iz0R8iSHlm4dGAKQZ0Ahak46IEtGYrQ1W/c3vqT2lr8=;
  b=mxf60C3h7qaixH53Ftlo68Cjclv8nwhRB3c18QiujrW2lI58AJMtYGvE
   PuDiq8mg125Qh8njAKxikKXlWEQ8EPyEyDPFyAkuIDxNsqUbz+4HDqLNV
   PR7knuguW1AUBWq+/p9KHm3ZrhUbBzrN2qQXiJ9imfTTVkZnTIz3ffxbu
   SiYxbe8vFpQ9/pw9XXYuivVgmayRDGzqb+Vc7nYEKjfLUSJrwuHJLu+Wq
   SajsAZIC9B0LXlt1rxYgpFYes8K36cAzDor7CIfZmervwHO+lhm5gnT7o
   /V499hQYKQT6orv6h2apuZDX+Qx46epzh9yqX0zeLSWAxsWNz0GlKRBgp
   Q==;
X-CSE-ConnectionGUID: tqinWbZfRmqouDsjywXTmQ==
X-CSE-MsgGUID: BD347MARRbKu28idHpVZAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93486040"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="93486040"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 04:20:02 -0800
X-CSE-ConnectionGUID: mtNy8rLrSQWlzF8lP8lUjg==
X-CSE-MsgGUID: dDjUgRzpT2iv4RLVfTFvdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197830349"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 04:20:01 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWCz9-0000000023p-00lV;
	Thu, 18 Dec 2025 12:19:59 +0000
Date: Thu, 18 Dec 2025 20:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp/nvhe/modules.c:43:10: sparse: sparse: symbol
 'num_dynamic_hcalls' was not declared. Should it be static?
Message-ID: <202512182009.IQJnnNzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: e2eb8807e6b795dfcef162f7c4a45954077401c5 [43/43] ANDROID: KVM: arm64: Add support for custom hypercall registration
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251218/202512182009.IQJnnNzo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512182009.IQJnnNzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512182009.IQJnnNzo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/modules.c:43:10: sparse: sparse: symbol 'num_dynamic_hcalls' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:44:1: sparse: sparse: symbol 'dyn_hcall_lock' was not declared. Should it be static?

vim +/num_dynamic_hcalls +43 arch/arm64/kvm/hyp/nvhe/modules.c

    42	
  > 43	atomic_t num_dynamic_hcalls = ATOMIC_INIT(0);
  > 44	DEFINE_HYP_SPINLOCK(dyn_hcall_lock);
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
