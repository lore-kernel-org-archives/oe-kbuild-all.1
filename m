Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABC2773F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078181; cv=none; b=rd8OltvHz0mH1updGrR2cYEZ0KkhovWVBaBZeptxgRGibswqFi5Dmtx8zwpGbaafotf5YTiHbIiUNcRLhSXT4xBV3amlXGNbcBIokvjBpMAvqYcYK/R3K6Fqd45VyxvMDODt9Zx1yY8PNo/sUUgEkcbvfrd/zQWfrFD9xYi7gEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078181; c=relaxed/simple;
	bh=2gwYsMTBy66BIiBT9rKE3Bdz7Agx0BWt7v3x8sBJRiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MG8Zi5kuw1espmho/rRAF43ugBUR4JdFZUnKo7VJvQHkV0WpmpDa5khgnRh7wJN5wBdjFBpeCDZ0Kiv4BsH4uZzQEbje6BggRNUu8xvKBY4UHfbbXFI6hzgWZJzLxtGi7vbOc9+ygYAPHqsXfJEtVWMXE0mCIAS5k/oOLrWVOsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OX+Hi2je; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OX+Hi2je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766078180; x=1797614180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2gwYsMTBy66BIiBT9rKE3Bdz7Agx0BWt7v3x8sBJRiA=;
  b=OX+Hi2je9UrUklKTSvfhbjQf0W2T+s9/Mf1sTNjIDBTYSBWDEPRZ4HFh
   yyRmOFLmOl8/uz7v9wBAAqoqpw7pLxt0gIs74lqVaNFRrmm+Gy7KR/DCm
   H/CytZQnYI8HG72YQ98Ouzojbv3rsPpHBFWdw5fZ5ojg+YY/KfUBLIG/E
   6efnvLrVtssJVDy1BITAiFyfkjzCQ8ckLdwBClsiVeWrwFI+QzPNfwjSV
   PkBsV+b36mgNwN+u22KSD6qqlCKjXkOjyevnFZUHa/xZGBjA8zwRhPrzf
   tGHvCCmLPNGGVSEQ8ZqXvMIpt4kHp8K/YxHS/msXgmMlFzpxOBbAY6MQ2
   g==;
X-CSE-ConnectionGUID: Nho915csQMu/5slvm7ySdQ==
X-CSE-MsgGUID: gRElOwuUQbyiClQ6+DH3eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71889077"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="71889077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 09:16:19 -0800
X-CSE-ConnectionGUID: cB1/KljMRO2tcDt4ty0VhQ==
X-CSE-MsgGUID: +4e5vfTaRu+UkEcu2/gsfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="236060736"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2025 09:16:18 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWHbr-000000002Mn-49OR;
	Thu, 18 Dec 2025 17:16:15 +0000
Date: Fri, 19 Dec 2025 01:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp_trace.c:96:27: sparse: sparse: symbol 'hyp_cb' was not
 declared. Should it be static?
Message-ID: <202512190110.0DlheVAc-lkp@intel.com>
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
commit: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 [43/43] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512190110.0DlheVAc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190110.0DlheVAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190110.0DlheVAc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp_trace.c:96:27: sparse: sparse: symbol 'hyp_cb' was not declared. Should it be static?
   arch/arm64/kvm/hyp_trace.c:488:5: sparse: sparse: symbol 'hyp_trace_release' was not declared. Should it be static?

vim +/hyp_cb +96 arch/arm64/kvm/hyp_trace.c

    95	
  > 96	struct ring_buffer_ext_cb hyp_cb = {
    97		.update_footers = __update_footers,
    98		.swap_reader = __swap_reader_page,
    99	};
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
