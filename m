Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B90192B70
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479456; cv=none; b=pTYa1uU4mQvlFy3Nj6TnB4754gx2N6Dsux99i35WdJQDqJg66mY0elmfSZkLTwdFQIIz8RewU96Wxopo+zzLakpzx/G8N62wrYano+cMlpZt+nHsiPsZLjtuj4pEN+3Us8hETD8elyqGKcDLQ2PAViFv3jL82I3D8V07KkjrfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479456; c=relaxed/simple;
	bh=NdvfvWHZN7x+lxzPIZRz31hlqdL9nl+0vXGs67jq86o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q32PFMom4M2J/h58BJoCCAnOdICkJZM6g6KlY3fUp5oHwfOX+NDS9d1ATbEWB/cvcsOsWQKT/14rNtN161EkFE3S8+WbpgQJNhGStReUKHDdzzupfUpufcFwMoTycOVSuxR2KMeNYj3s16VRmzM5B5kdhPWZt/pigDWg5j7TJ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPJ1vDMx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPJ1vDMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728479455; x=1760015455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdvfvWHZN7x+lxzPIZRz31hlqdL9nl+0vXGs67jq86o=;
  b=cPJ1vDMxCmK1R4UA004Gq7ml9SOoEfP3bCq4HTM63GY6UBNgkZZQOMET
   BzUPeJ3s8SQH0VfRMwFwx8agpvHaEHbXflpEgXQK/hd9inGIACw0wkwMK
   DmGJyFSxEs+jfiQ3psxbtT/fgXfNwZCk/mrQ6ghGcgFMzfIUm9++ryKU9
   rAsmm9XRkIpE5ITlX0CmWvo85g1zx3xiR5Qzejg8XI9R4PI2ruQkEI+k3
   bMpDgvadOs3c5cPnMNUNSwvnT6oA7NigQVCVyIevNXhVbFXrTdzi4UgdC
   Ikmhv/7gAKrNLMQ+mWhrqAxUAoo0EDR3+c0gV13oyxV9/Tf1569w5giGU
   Q==;
X-CSE-ConnectionGUID: zSxqpmZ+TJCAF7wIUopDgQ==
X-CSE-MsgGUID: qBathtwdRLShv4vlqwXOFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38342088"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38342088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 06:10:54 -0700
X-CSE-ConnectionGUID: RTK8JO6xQgel2UK2QSYgcQ==
X-CSE-MsgGUID: gYEwTlmHQaGf1YghbHWaJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76697448"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2024 06:10:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syWSo-0009FQ-2l;
	Wed, 09 Oct 2024 13:10:50 +0000
Date: Wed, 9 Oct 2024 21:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15690/22152]
 net/bluetooth/bluetooth.o: warning: objtool: .text.read_commands: unexpected
 end of section
Message-ID: <202410092107.9mzSMdqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   50301ab1b2f709483eab8942bc407ad5340bfa6f
commit: 4710b99a4638f3f20c747adf2043aaba7c8872a9 [15690/22152] CHROMIUM: bluetooth: Support userspace SCO
config: x86_64-randconfig-075-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092107.9mzSMdqk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410092107.9mzSMdqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410092107.9mzSMdqk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/bluetooth.o: warning: objtool: .text.read_commands: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
