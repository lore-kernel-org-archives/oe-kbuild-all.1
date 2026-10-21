Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582761;
	b=xxPDpVzf5CqlElD0eMv0K+wtDq9QtFPcUP5eI5mLS9B/K38Nt+ThEr28LoYIqvv6FGbS
	 QOxdW0fqd9q7kpqPwQ/SF/lmUIQnxK0pSPtcAN/vjdKa2VmP1YHo3eoHNtj/BRWdtAEQP
	 3sy6NHIctW8t+g1JM2ZCEAPCGWB8FD3iHLeXj2tCpGjpFyRKx6pPavrswmUK2FKpG9hRG
	 O+abTyg9RbUdv7jig910Xkoe6rWR4Bjp9YoX2cnrl2wwsvSdRcYuDUvHSng+G7RtXstN2
	 E8AbcaxicgpyIAibCNr/7UkfFynqFAQJOiwgJ7aow7spQtqtY1sA/NUHu/BMTOx1exg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582761;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8MKozKA+x0bWHXJj5Vg2zejDw4viPs+2b3SLqYNpt1Y=;
	b=xFoOChMJupcEDS+2met5Bnend5dxKjK1os49mIPm+9TwoulHKkuDrFrmI6s7Feb36iMM
	 lXJdPWoTPS2zM5+0nymKd4qtHTASI5kOitwtuHaGBB6p+3K8bAb4n/UOcI1eksgrZ353Q
	 xraRX/twY9cxJGmsRX4rcEaH6qvXbAvocw+pBo8yH33/ouKg4d1aYB1QPtJBIQyAn5Ukq
	 cNLyh7LLvENe1scHIs3RgSRRCGSAy0wlXN/SLSP5EmX9GrgPGD8NQ2iVPJbl+x6rsdKL+
	 8P5IDdiNs9RDqTqeA0yOFrtzyYv/Ih4q9LqdfagTZL+CMtFI0CgJgbXYKTjLMQUHRmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CHBrrJbB;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45EB606A321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 11:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CHBrrJbB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792582760; x=1824118760;
  h=date:from:to:cc:subject:message-id;
  bh=6sgbMmy8LA5DfPRGKkhCZT2MKaphKVXigGNxFpKyMkQ=;
  b=CHBrrJbBA+MNHBisUN2CA8CvnPiUoMDcyM3gNOMTbjLZAR3f75Yg7aA5
   sQ5SHxpZ+IueCGrp4bid3lQmCpv8UmDJ2LSABzKwv2Z2KE8Nb4MIojxJk
   u4ipmjLPTrQMxpJPibwvVxqqTHiBjIuwarfir76PTJIbt0pDw1PWdCA19
   UECFZ11iQBDLIH6hxsX3xgd5mBXnjjRmQgl6BqG8d4QuJyaSCtYd95O6p
   jBFoFWUAYURM25p7iNTw+BH2sRAKneePQfoWWGrxmt0Ziafl3H1rjE8CU
   jzEad0QwR09atkijLwzJNeNWNzMz2KB9JBFwLLYk5RtKuc4+CyIua8TAE
   g==;
X-CSE-ConnectionGUID: +iycM+QaSMKggEL9fBM8VA==
X-CSE-MsgGUID: UMhYUhvYSfCQLbSMqWZRhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1305991"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1305991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 04:39:19 -0700
X-CSE-ConnectionGUID: BBhegxI1SX2gMb2U27YJbQ==
X-CSE-MsgGUID: 7ssdZBZtTHW5aZyCPd3yTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="2955042"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Oct 2026 04:39:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJUf5-00000000PPy-3Ply;
	Wed, 21 Oct 2026 11:39:15 +0000
Date: Wed, 21 Oct 2026 19:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 /25] arch/x86/kernel/kvm.o: error: objtool:
 __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable instruction
Message-ID: <202610211949.q6RAQ3Cv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   ca5230e56516de1b31360b0783934f3b1af46b40
commit: 60aee4318ce34e68540772a2cdb3f57b04d4c9d1 [/25] x86/kvm: Use RIP-relative addressing
config: x86_64-randconfig-1002-20261021 (https://download.01.org/0day-ci/archive/20261021/202610211949.q6RAQ3Cv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610211949.q6RAQ3Cv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610211949.q6RAQ3Cv-lkp@intel.com/

Note: the ardb/x86-pie-v4 HEAD ca5230e56516de1b31360b0783934f3b1af46b40 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arch/x86/kernel/kvm.o: error: objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
