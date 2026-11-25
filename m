Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609583;
	b=EbAKsIBXf7W9tp1YBemHeONYbUC2VRqk+N8jxOQ6+jWYtIUZ9ChMIzm2zGbjEmdz3Wl9
	 6nceNdXWSAiiout9gTax/hjczLFPPyrIdE+YW5F5fAUnoeYK5L9sFFq4dwL9JBx+m9ENh
	 ICVcCt8cUR0fsOF31uhKJ5n9UqvRRcV3/0VGAl1oirRc0NoQ6KWRiYco1oBNebwhaYMJG
	 yIMDUdu2unoUCPFM8PI3B89rqkFBsl7RcOsRwGTEUH+OLa/qk4xWS9QvzvHf/0P47E0Ae
	 dKlyDViw4LlP3KiPNOokBLFFaZH193pPD1YuujfsCOQpPpdm+f/O+eIJ4EO45HPnM6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609583;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=X8PccwhnAouzfKjdZNvgU0mAPR/x11Pfn8PmYZRSF5M=;
	b=mssIAMx/AsHrtC3x8TdsOflimng+jpY9ldssIobQ7TlwyV8hQC6MBbwhWicI/dAEenm6
	 H3pJDbLsgnZ/cb4j2/IKESlzhKGmp3ie2h2nreazhddqhCsxiEYL0qHUvivInooG/zAcg
	 0ACAdvmgal4lOtBAKLEahCkYlsRzTOnJEaceYJOQ7FFiD3gaybKrpjJgiwKqzLMU5LC/T
	 7g5iUzoWGxaS4igsMoeznFvyU/1/P9gl2TsJsBus37NkzOrRM/T3/3LYH3xXbPz4R4HOx
	 aVJf2+qCA9x4aS7j+UuMqHggla3M6YKXYMeRye/HfHnwhXq2hIWew7jm2pbp+3wj0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OI1nOjFk;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D31606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 12:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OI1nOjFk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795609582; x=1827145582;
  h=date:from:to:cc:subject:message-id;
  bh=EIoV/3C7//+bPI8KEY3EIKVHTZrpfVhq1Jzu128BP3c=;
  b=OI1nOjFkdMA6R/GLmk3YtooUNPUmxfRzJgBhJ/S3JjbMmWTW3KsiiZXN
   SaQ3NU69ljUNL9eZg3Gmktez7CmWUNn0RP7s8NoCxs1UzHh9gTQO/EG2l
   IPxfzFakR0POtjQ/dqp3kxu4lEgP8Ja/FD/HuRCkOkLrxvfOQ6gHuIZDf
   Xifavj6xQEj5alPzcmey2op15kVIR07CONfLQjwc6Ezb/2gbXDDkkcNnW
   2ySa3EskXp16nM3rg618daya6csjx+y83Q2yxTJK8ILR3WBL8GX6R4kBo
   XxRuwffM9PhBrY8M0cCB1vLp0U6M17jcZt4SHD9jOGp2Mkn0EhjgJfVJf
   Q==;
X-CSE-ConnectionGUID: 0Q5xIVAlSJ29uOykIBbvaA==
X-CSE-MsgGUID: jrUInM+lR/ymC2G3KvnSXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4498293"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4498293"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:14:05 -0800
X-CSE-ConnectionGUID: I7V+4R5kQzC9LX1CqEQvYw==
X-CSE-MsgGUID: uT2rAJlfRVag74oBj+DQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="13527301"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 25 Nov 2026 04:10:39 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWBpc-0000000007v-0uPF;
	Wed, 25 Nov 2026 12:10:36 +0000
Date: Wed, 25 Nov 2026 13:10:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1] Warning:
 drivers/gpu/buddy.c:1474 Excess function parameter 'p' description in
 'gpu_buddy_print'
Message-ID: <20261125130235.gzyZWjuh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Carlos,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   6e4069d3308daddc8d27b337fbe2f6a9dca98ded
commit: ae567e8652463d5b9250758367303b6a5b261fda [1/1] Merge 0d8c1134936f ("Merge tag 'v7.2-p1' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6") into android-mainline
config: i386-randconfig-2103-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125130235.gzyZWjuh-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125130235.gzyZWjuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125130235.gzyZWjuh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/buddy.c:1474 Excess function parameter 'p' description in 'gpu_buddy_print'
>> Warning: drivers/gpu/buddy.c:1474 Excess function parameter 'p' description in 'gpu_buddy_print'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
