Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52FA78C6D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187051; cv=none; b=sbrLi9XAk/slLoIsN3czrpuEdRPGfnx8TDXuumvbBIkeHv2rcu/siFkZefVNdidSNT89x5kJbgbjHQxCJ6vlBfpsukr7tbzEkPgcp3s+yuaWs+/blHw5gB2rNEznd7o0846mWCeW9R3kGlFkyrVf5HfzxXSE9uuD4BysqbNWrHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187051; c=relaxed/simple;
	bh=nPh6Gp2LO5UKbq5RG2+QcOxT18DG6vkUNRBX2ICOOlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tDWc0YTati7SqrmCTRZFcOdntuVwMRLpBsgAgC+p8kLghouq8vTirCP7edzDBTBj8xKlAFRiBboMC6VfOPm1LvT1buu6knixLswTspSQUzs1wcIVHqoVQf4+hRfakXLtVXYpph4FZnnIgx49SaDdAuYNT32FnveCC5ntfJwO5Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjwYEl1j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjwYEl1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730187050; x=1761723050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPh6Gp2LO5UKbq5RG2+QcOxT18DG6vkUNRBX2ICOOlA=;
  b=KjwYEl1jM7ibjCkLsVUu1nCAj95agp5hyQfaUZ1CAR7dDNVZa6bDukJE
   Pu1tBIUKXz5fCin8IkV1WvbLKkne6JbVau21/OnWf+f5K1t0MT+WeacGY
   GF6lppePVOaVLY/ttIcwlyvhimy3kgpwfSp7/jF+u8SoKycVD1wxVSqv0
   r8HV299Td1jiqP90r22NTt7qswpnTL8M01CYbg9B4QphK4fqaeyAgrhr7
   089zoFh1WSgfdihlmk/er6tgsw2JBYvrDZG3wDAMNGbxvAWC0uk+3P6w4
   oEUhu2xQ5L4eRAGk/fOoU6JfDoST+hlfIpret6UD4i6p8pCqj5jYO43mX
   A==;
X-CSE-ConnectionGUID: KhxVHjsVRbmuTLye0mAerw==
X-CSE-MsgGUID: g2N5eyJZSBSsLj/lbdxSow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29951642"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29951642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 00:30:49 -0700
X-CSE-ConnectionGUID: 1yWy6eg6SE61B4E8GB/rPw==
X-CSE-MsgGUID: /qDEvUWAQwiiD1k0xN6Fhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81958217"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2024 00:30:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ggf-000dNs-2k;
	Tue, 29 Oct 2024 07:30:45 +0000
Date: Tue, 29 Oct 2024 15:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19410/30000] fs/xfs/xfs_buf_item.o: warning:
 objtool: xfs_buf_item_format()+0xb66: unreachable instruction
Message-ID: <202410291534.uR1i7cip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c0e2b3247172ef46c6a75823867d668ad1c84e0c
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [19410/30000] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-013-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291534.uR1i7cip-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291534.uR1i7cip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291534.uR1i7cip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_buf_item.o: warning: objtool: xfs_buf_item_format()+0xb66: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
