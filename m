Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F629A2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764717058; cv=none; b=danhqe4yC3oogDvYtxecAfNtuzJvz3yPo77EbKcdhgDJl/T782Xceh0jlzg8imyXDniP2QoSIvWG7FW4N4nqcBQ79olRnK+fJCUUVgBj5u22h0pR2RSbggsKKhewJFH4YRFEimcb3luM20nl7bgQ0KF5JKRyxk/2iOIK7nZOFII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764717058; c=relaxed/simple;
	bh=3vSF+IMJmfeyEC5OMGJj5LCx7+7Y7mqhwgnzkTSV6+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcfljIiu/eF+iwpAUZtwJ+as39G19mwDVCy1rTV51lH6KLHyEOl7BcGnde4o/pzVsJaSgQnahUO2tJsPHpQ6BGH2VlVTGzafZc9hj66P3/XE2qJ7wUZIZjNzBN5wNSsI/XO4ZczxJVrANTM2djDTYQG7dGxzoutimlD0tIS6zQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DV0pAnw8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DV0pAnw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764717056; x=1796253056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vSF+IMJmfeyEC5OMGJj5LCx7+7Y7mqhwgnzkTSV6+s=;
  b=DV0pAnw8aRyLnkRlhFHzOWvZuEFOkpCbtpKFbXTUBwP9XF4DZc6x1574
   5vsoS1YtoP2B/7IlW+t4jGbaQerenbUsDS2Hc705e0sU1UMP46pXbi3k8
   o8BhH/UPN5jvmU2L/ZdTI+4kQLBnad/nefhN9Y7eP2qVk+2cpyAmrMIeT
   QpcNNVi8/yaSFh3VllWfwNlA/KgZOPLJ+t7wb3bTB3jyNE3TvaIyrts9l
   jOQxp/LdnhpjnDaehHvwDmUbuYKqRmmGOG4aajUn1gdGAlqJOgsnFS/F7
   eJBxdvYGD89otsZNCf0Nv7Zn4ZnHWIQlhSmYjjTl8fuicVltllZFTpl1m
   A==;
X-CSE-ConnectionGUID: LivFdVfdQ5+1054/B821EA==
X-CSE-MsgGUID: CNFw7HSBQ6i08VNHkcDKIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66423135"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66423135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:10:56 -0800
X-CSE-ConnectionGUID: TcBzDjGlREOgVBwIFYydRA==
X-CSE-MsgGUID: uEtHcYhPToCcewqtqVylww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194195933"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Dec 2025 15:10:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZWH-00000000AHn-0DPY;
	Tue, 02 Dec 2025 23:10:53 +0000
Date: Wed, 3 Dec 2025 07:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Subject: [linux-next:master 2926/13055] error[E0609]: no field `dev` on type
 `drm_gem_object`
Message-ID: <202512030758.EvlZkImM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lyude,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f [2926/13055] rust: drm/gem: Remove Object.dev
config: loongarch-randconfig-r134-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030758.EvlZkImM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030758.EvlZkImM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030758.EvlZkImM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `dev` on type `drm_gem_object`
   --> rust/kernel/drm/gem/mod.rs:231:57
   |
   231 |         unsafe { drm::Device::from_raw((*self.as_raw()).dev) }
   |                                                         ^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
