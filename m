Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2571E47A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511938; cv=none; b=oyhDVI4LDTi9XtoiHgG5wKBlv26ZVtdCHiGMbyga1L94LBtLi9gD8zOnW9XC83GNxlwNl35DwkZv9NqBF9oTX8fZT+Hnryc8mSlDpzE0j07NSTOS8zQDs75hRw1oSBsAHig1tQ4zxNyDqX+k3siZwdngyqyv7recKcuk/lzCO1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511938; c=relaxed/simple;
	bh=LmkSYcfsUEbSoMcZ9wITnu8GeT1Dou8S6eS57/P/hdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjisIX2og/ftqCx32e7Sl8JCL7y44yi0IeTZDlyko96ZjBpPkhZAyjZRT/1u5Tj7dtAS6QeBQvauOAHRFV8qB4zfpCzbDubWqoZypj7DLsRq896ClBnDSu8D0hDHrqkuWwZ6+xGHSi04sAohGUFujm/ImyQGSaoCmw2xa5ZWXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmG/jZCO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmG/jZCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757511937; x=1789047937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmkSYcfsUEbSoMcZ9wITnu8GeT1Dou8S6eS57/P/hdk=;
  b=RmG/jZCOiuRpGKHjt2eb1IafdRFjXC/jk7iy9hNZJxza0ujf5TRd4fyO
   zlwEqQv7pnketuBX6fRk0CMA/Mdue8JRGGgGyrZJCO3UJgSjlAh4tFNvT
   Ib2TjD5qnG+YlKzNU4RUx0Nqv+xmNYwCtv00vnSHW9ZhuRDryjMpbLZXK
   0f/ly+atqAdOh/E3kYkme3f89VcpVUKKfxJceq44AZ8SaNi8aZMKEFaD3
   OqmkSAucvURXPqPi8W9nSd6w2WSr9kQk1cNSIVX4Ok5xQ2n7a5hhD5UWK
   n2TgQH6SguNtBXkWzp5wJKzmzDPsCkYuXTQ5OuqhaVVhA5OzYAoeBfws9
   Q==;
X-CSE-ConnectionGUID: pktHshWZSJOnxy1/JRin3w==
X-CSE-MsgGUID: wd6Cwc8ITuysa3U8NrM/HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70076597"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="70076597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 06:45:36 -0700
X-CSE-ConnectionGUID: NxztgTrxTBakdGAzrosHng==
X-CSE-MsgGUID: Hqr+d1o2Tgq04rgR9lAZ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="210509793"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2025 06:45:36 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uwL8e-0000000004H-28kQ;
	Wed, 10 Sep 2025 13:45:32 +0000
Date: Wed, 10 Sep 2025 15:45:08 +0200
From: kernel test robot <lkp@intel.com>
To: Yang Weijiang <weijiang.yang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Chao Gao <chao.gao@intel.com>, linux-doc@vger.kernel.org
Subject: [sean-jc:q/cet 44/55] htmldocs: Documentation/virt/kvm/api.rst:2917:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202509101552.nq7TgVwt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux q/cet
head:   4a74767a033d98cd3e37a25c072d200d2d5545e2
commit: 3ee447c42c42b6df04a5c8a0b9694bd0a5935078 [44/55] KVM: x86: Enable guest SSP read/write interface with new uAPIs
reproduce: (https://download.01.org/0day-ci/archive/20250910/202509101552.nq7TgVwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101552.nq7TgVwt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
   Documentation/virt/kvm/api.rst:2916: ERROR: Unexpected indentation. [docutils]
>> Documentation/virt/kvm/api.rst:2917: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]


vim +2917 Documentation/virt/kvm/api.rst

  2908	
  2909	  0x9030 0000 0002 <reg:16>
  2910	
  2911	x86 MSR registers have the following id bit patterns::
  2912	  0x2030 0002 <msr number:32>
  2913	
  2914	Following are the KVM-defined registers for x86:
  2915	======================= ========= =============================================
  2916	    Encoding            Register  Description
> 2917	======================= ========= =============================================
  2918	  0x2030 0003 0000 0000 SSP       Shadow Stack Pointer
  2919	======================= ========= =============================================
  2920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
