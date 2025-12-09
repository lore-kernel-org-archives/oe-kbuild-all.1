Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9232E6A8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 17:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765302313; cv=none; b=U4rz3r505EKAVtJHGEQPxG812OwVzx4EHqBOZsqzrYR/0ED/+Kd+anJgWshSBBz6ri7HKV9FDJkvOKhPaueeGx5MF7k/y1teXq2aE6vJ20u5Iqk5YwkOrIceuP/LxPtwJUACQtfRduXyddcDayi1YpRE6rhuvLlt6tiZfCUSgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765302313; c=relaxed/simple;
	bh=1SDZrxF95B8VQ4fNhUbAQ66fAN/U8gSnEFxgIDeFzfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JxHbIiRHtpsWL7Vcba42U/OQZSZB6TvJ6vZoL5NujVIz3gtnkB0tz1Pu2zl0hUxACa8hnS3f92UquCuYtcsV0FxWv/YDBhfNzg/z2HLB309P6oDTHQGIu4RH100Y98JwSI/Olr9vEcWFq2hVIuVyN1TcZJ+HI9L3Gb/fHXwxN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKOXwl9O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKOXwl9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765302312; x=1796838312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1SDZrxF95B8VQ4fNhUbAQ66fAN/U8gSnEFxgIDeFzfI=;
  b=VKOXwl9ORkgq8+iRTWl1sMzllWQd+HIvnA07NlbWD72EZBpQd4n12XUg
   CQ7iOX91ShdFJ/yUZlmB03MkaSTdbKneQA6z/BG4kLhcRA35sA4ImogYh
   H1KZ6KlesGKxi3EGKswUfIwDS+sezB6Oci+3n+HFl0iWF3t7j+m3HwF47
   bdUWgrF07T1YJtrYUu/zfew3cbs24yNOwd9w8D38L+ROJRGbVC8WVYEH3
   bg4QoY1wGwRN/n+qFbQm9gHln3JjrHFJ9+Brb4Zvp/IvO9XdFmiZVCY9J
   8Avscnt0Wpl/vdUx/LeHSUaTBUpjiQt3RoLdmdj9DKvG4RBimBfiSIPp9
   g==;
X-CSE-ConnectionGUID: 72/kwRw1Qc+a39wcmf11Yw==
X-CSE-MsgGUID: kePNa24rRQCgPN0lLLY1DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77585606"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="77585606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 09:45:12 -0800
X-CSE-ConnectionGUID: ote9988yRYiXdP3UHY19mw==
X-CSE-MsgGUID: GcyP4eVETtSeKiGt8+Js+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="195540790"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2025 09:45:10 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT1lr-000000000KL-1598;
	Tue, 09 Dec 2025 17:45:07 +0000
Date: Tue, 9 Dec 2025 18:44:44 +0100
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
Message-ID: <202512091815.Q7TmALVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
date:   2 years, 8 months ago
config: arm-kismet-CONFIG_HAVE_ARM_SMCCC_DISCOVERY-CONFIG_ARM_GIC_V3-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091815.Q7TmALVm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091815.Q7TmALVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091815.Q7TmALVm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
   WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY
     Depends on [n]: ARM_PSCI_FW [=n]
     Selected by [y]:
     - ARM_GIC_V3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
