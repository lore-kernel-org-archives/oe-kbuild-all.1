Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258165;
	b=1m7Na6hrYGFWdrQjkp4HmFMayokpbPPCoO0FCgIzB7XPwbuMI1tAZlBI4d+qVU8gXn/Y
	 075d4zQ5dziqUwJIPiXm3y8TESA8E1bnR0lX1kTBRROEeiS1AIrQgrr9T0YANyFWsHv00
	 Yj6OmWDjEXb1GhSbyH/O8/zCBo54YOphVQ9RmR/iODQSepTwNe4caRNZemTCWJ2Jw6u9E
	 AYRoAQko13wovr7WVUhI9EE/CT25VI5KWyib7fQeczjX724fTKVCRNiBxp5JBcSwXHQZ0
	 uHcNTr+bOfBan+58TKFxLsB6iZHxvwjsEmqFHKXQP7yJMSZmhT6MbyjnMbxmtyWjyzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258165;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NIkf404soNRJHDZ1xYFWb9owbhyCtxOSCqIg+SqbyCM=;
	b=Sn/eWFSAOAJU3+QIXlMQCXa65OTjl9ql6YEZsYaDA2OguxTDphh5IrFFNrgIHmHn2Twq
	 Kc5QPpQLcP2SAtueppPxxSfC/EoXUq6/Z5lMUPsC4WraMSUOdj0Xm99wcdQ2PkSedWhYq
	 eFIGFisQ1wsv2lQAPkJBWbz0e3sWyAi8pFyLf1SnZTHIq5C5wG2zQEPT+CUpMIWUr84sz
	 1SgT8YYblwu8qHMYYMkZfzQxHTvn33v2zKfcIkcwD/8FsvoMyGCvMMikzxuxYdrpjpTGr
	 N515Uc7VwfDurzWFf16898AOPXIdc4TQ0hSZUhlJCgG5lEgyOspaMspH2QtdL/TkmXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvlSdeRL;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6357606A320
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 10:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6357606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvlSdeRL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795258164; x=1826794164;
  h=date:from:to:cc:subject:message-id;
  bh=LEvLQJiFGTYP/ViuY7Lg3eIHI9gpBcmvmGEkaSlKtMM=;
  b=DvlSdeRLwAFvhwhUqyvt1ddql4u3AzoSTi94Dg/yBcWVofeFLqSzCuyA
   Khd5nGWaMybqIuZL2TTZq8blvQAfXuCnT3jDrDJz3BZnVRFrHdQATi0k1
   3fCgbF1GU+vhW6Mu3GIuCMi5gY7FpWuQI6s47gDfZ4BNnQ1Y+nxmKOUFh
   MvfAxcQJFI6W7zd4KStMkldBqJdMzdg+mXXUG3kOw73lqUr+ZzJkBnf0s
   Op7eLwfLX2W1Hzx4r/PMEwEOLmFjT8HxBI9/r3vzsLdTxslI4khSyHOjL
   MuACHAaIji7PY3/l1F+OXj31lWfth+5GOXF9plyzeU7Hqh2HijxpgboKt
   A==;
X-CSE-ConnectionGUID: vhwkadP3QL64sUPoSABJzg==
X-CSE-MsgGUID: YX3yqitLTAesmgj90Gt//A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4115200"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4115200"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 02:49:23 -0800
X-CSE-ConnectionGUID: oGLkYxYDQRuY9z2/kjtAKw==
X-CSE-MsgGUID: Im3rGHhHQGOhft48WdqXEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10975558"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Nov 2026 02:49:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUiel-000000004Ij-19b3;
	Sat, 21 Nov 2026 10:49:19 +0000
Date: Sat, 21 Nov 2026 11:49:04 +0100
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bpf-next:master 38/51] verifier.c:undefined reference to
 `bpf_prog_offload_verify_insn'
Message-ID: <20261121114707.HN6vjKEy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: 09c84023b0b4ef040548929859de81177a15bab2 [38/51] bpf: Verify in passes
config: powerpc-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121114707.HN6vjKEy-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121114707.HN6vjKEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121114707.HN6vjKEy-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
>> verifier.c:(.text+0x3cebc): undefined reference to `bpf_prog_offload_verify_insn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
