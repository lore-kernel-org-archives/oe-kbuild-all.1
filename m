Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748FD2EDD40
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768757472; cv=none; b=RB+WGNyIsgRthOXfZt/x43zxEuA9jBdZj2kYEvyPLQ8KSihbL4oz4zdiBXnRqO2MxMlshcILlwGUuVtrcSe30p1bvCRSNwto7O4pYLeFrjotfuvEt3CE2G18dGIqdb81xvK9Kn/ASJdkST3VURxBswbucpp8ULyZis+aAMCnqvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768757472; c=relaxed/simple;
	bh=qpHP2r/UkqvOOGaSJfa0j2ENPrp6BCaNMaAKckrdrsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TMTegPTvKCaKzu6XkNmB6rNeoAuFQAiMz6vLQMzqyxNjvGgUIY8+1KAflKgNUvIMgbg/o6zAmS06Ss9UcbMDYew9GSh1SENiLym8xxUziw2GP1qFUpcPf0fqcDY4+3RPe4b1fhQichdKpBLQAogOvR+ZUvMJjxC+4C8L0LI0J9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/uNfhlC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/uNfhlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768757467; x=1800293467;
  h=date:from:to:cc:subject:message-id;
  bh=qpHP2r/UkqvOOGaSJfa0j2ENPrp6BCaNMaAKckrdrsc=;
  b=j/uNfhlCPCdjrpLds6+caajBpcDvuq+fosuQtUu9t3gjkzffWWVU+4A8
   AGOk/BWaX1mnDDYsHrkWW1bpS6u9pKUzp7PPJvGZW7dM4oc0CYh4l0N2b
   2WnnP/lqPtsZClPuQwyX19WwurKv4B8RS1OKVZECBG9pvWLuCAfNiSPwy
   CuAWK0OLvvDtNQzfrjr0ldvXAZRym+dC+GxmSv6NWNuC+psF9LjjJxB6B
   ATVYVPox8+dNXDRLTJ43NTQJhZoSM4O/6naYW1R19tLQg9zcE5YlJQ7fV
   NuMN3FO1AC7YYHHla9JcSQAnXVTPrkZdm3wgpuwfPj0etYGBsujqBWfAM
   g==;
X-CSE-ConnectionGUID: 4PwE31oPTlaYTLaNFa6Jiw==
X-CSE-MsgGUID: VVEEQ5n9SFCfhzUyzDHDvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69886384"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="69886384"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 09:31:04 -0800
X-CSE-ConnectionGUID: nRiL+uoVSTSvZVh3rz0xWQ==
X-CSE-MsgGUID: SQlwqQKeQT6G9kOgklugjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="204824595"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 09:31:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhWc8-00000000N7o-2B3t;
	Sun, 18 Jan 2026 17:31:00 +0000
Date: Mon, 19 Jan 2026 01:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-both-restrictions 14/19] ld:
 kernel/bpf/syscall.o:undefined reference to `io_uring_filter_prog_ops'
Message-ID: <202601190135.yN7DQnIK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-both-restrictions
head:   101d5f0794ddfbee7649bbfa145854ecfa7d1994
commit: 09ab6f4eda4c6ac7cb99b8c1f61a062186002733 [14/19] io_uring: add support for BPF filtering for opcode restrictions
config: i386-buildonly-randconfig-001-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190135.yN7DQnIK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190135.yN7DQnIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190135.yN7DQnIK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: kernel/bpf/syscall.o:(.rodata+0x964): undefined reference to `io_uring_filter_prog_ops'
>> ld: kernel/bpf/verifier.o:(.rodata+0xb04): undefined reference to `io_uring_filter_verifier_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
