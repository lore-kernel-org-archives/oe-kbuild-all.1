Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F0A49D5A4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538432; cv=none; b=jL2wSqFRjWmGerp2JOwuxCQ7nGI40kO+y8wOsycu3ju77XV3qCvkebchT11fwd5CmcvHYNs8ZqGUa2d4eZwrC5WFr5dEnOGmHiH/dzmE2eSPQetx2753GeRJpy1sh46F03cyv3FhaGBVQtBGJR6kCZp95/msAc5AeQvxtkgBYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538432; c=relaxed/simple;
	bh=NDN7Th6UcN9xykLGtC0NnmeJeTXTadL+Sd8QNuTyhfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AKq/iZYICr5lIl7gYRJIV1QOngBfU9XSG1JlJZ3xNsDJuX2GQ9/YrT6astd4JBeaMzGeQtY13nJM4y2tFALe4/Z80ZVicdcRS0vbSi8QiWEtvIJUIaPITVHN7T5EcosjGdE0ISWghdFazd0NUq9Cbdim2qjEzMytAI1UgylqaQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3x0YIqg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3x0YIqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791538427; x=1823074427;
  h=date:from:to:cc:subject:message-id;
  bh=NDN7Th6UcN9xykLGtC0NnmeJeTXTadL+Sd8QNuTyhfw=;
  b=A3x0YIqgUzJuxiwFEjatNHePAsH1BhNywDQ3Yvck1PGKweEfSmHxFrNK
   WXsCY+OAi/aia3Wq841DcjoyjPrXdeToNs9TNZSpjaqpDRv7uBTqF6F6A
   l8H0ugLngxZA2jlVXd+7LJ3c8UOn/q7AvN/QWGTTIDLadN4/OcVCcUKR9
   h6aVDWlBrDw3vTEnHlwFwYzEMweI46OfMlXwEXiDzMo/p9R+DUGZRIHGi
   HLN8o2gL/u9LqdnXy2x0cNGgeQMhkh023qQRkrtkLTrqi4MZTnFcPyRHU
   YXB+BWkPp7WNS8DPtvhP+58UNpo6UsLrUW/tBAj1lS4JkmNKG9D5YbG7D
   A==;
X-CSE-ConnectionGUID: +8dJLp6SRMGzrM239Ng5HQ==
X-CSE-MsgGUID: ZtBYL70oRwKtI1KO8+Oh6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="346668"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="346668"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:33:40 -0700
X-CSE-ConnectionGUID: UdO3wG0dR5ScGjU21dZVtQ==
X-CSE-MsgGUID: T89dHKj8RH+6qPWMrd96tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2015898"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 09 Oct 2026 02:33:37 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF6ys-000000006uV-1yOE;
	Fri, 09 Oct 2026 09:33:34 +0000
Date: Fri, 09 Oct 2026 11:32:56 +0200
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>
Subject: [linux-next:master 2129/15343]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:3124:5-12: Unneeded variable:
 "handled". Return "1" on line 3134
Message-ID: <202610091139.jj0KTOHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: 27e8d24f653f2089b2eaea55538b7d172a77e46c [2129/15343] drm/amdgpu: Add UALink IH ring and enable interrupt
config: x86_64-randconfig-2100-20261008 (https://download.01.org/0day-ci/archive/20261009/202610091139.jj0KTOHT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091139.jj0KTOHT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:3124:5-12: Unneeded variable: "handled". Return "1" on line 3134
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:3157:2-34: opportunity for str_enable_disable(state == AMDGPU_IRQ_STATE_ENABLE)

vim +3124 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c

  3119	
  3120	static int amdgpu_ualink_process_irq(struct amdgpu_device *adev,
  3121					     struct amdgpu_irq_src *source,
  3122					     struct amdgpu_iv_entry *entry)
  3123	{
> 3124		int handled = 1;
  3125	
  3126		dev_dbg(adev->dev, "%s client_id 0x%x src_id 0x%x ih\n",
  3127			entry->ih == &adev->irq.ih ? "ring" : "ualink soft ring",
  3128			entry->client_id, entry->src_id);
  3129	
  3130		/* Copy IH entry into ualink soft ring. */
  3131		if (entry->ih == &adev->irq.ih) {
  3132			dev_dbg(adev->dev, "delegate to ualink irq soft ring\n");
  3133			amdgpu_irq_ualink_delegate(adev, entry, 8);
> 3134			return handled;
  3135		}
  3136	
  3137		/*
  3138		 * Call amdgpu_ualink_interrupt handler
  3139		 * amdgpu_ualink_interrupt(adev, entry);
  3140		 */
  3141	
  3142		return handled;
  3143	}
  3144	
  3145	static int amdgpu_ualink_set_irq_state(struct amdgpu_device *adev,
  3146						struct amdgpu_irq_src *source,
  3147						u32 type,
  3148						enum amdgpu_interrupt_state state)
  3149	{
  3150		/*
  3151		 * Don't set register to enable/disable nHT controller interrupt.
  3152		 *
  3153		 * F/W running on MP2, which can always send cookie to IH block to
  3154		 * interrupt driver.
  3155		 */
  3156		dev_dbg(adev->dev, "ualink interrupt %s\n",
> 3157			state == AMDGPU_IRQ_STATE_ENABLE ? "enable" : "disable");
  3158		return 0;
  3159	}
  3160	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
