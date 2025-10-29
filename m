Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2831258ECF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724179; cv=none; b=rXfAlrr6ffmQRNnMfn1lh+zFDkOmoIcrFts39aJJhkkfR3Vjjkl6pMsrgYTjCnxC8ISEOqK4kFigi8jQ5Aq+TqZ/ZHXQ3DuTXZnM9SJSCrwun6RlmD4Zht9cUBU3YP1yeelFfrC0NC0h2Gc0JuE4P9KqAMyNmONzBaqRUcW85wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724179; c=relaxed/simple;
	bh=fR5s3LmSaA4+4MXHTtCGfXShwcuifNimh1/NbgsXHb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebiRJhj+Mpwb3jl+pjlTAVt5TkBTCn7FOz38L06Q17N/jZtqt18TX0oJ4lNUqdRcUOoqeydmNIA/W+9tNdNFzpwDhq6AlNGK6Dw0zGdesLhzbBIZPc3j1Pnp1JXjlVBP7XNSRIWX+5F5MgPcdtul4Y2OrAT3bGw4RNLfGpZv3Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8FUIxYp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8FUIxYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761724177; x=1793260177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fR5s3LmSaA4+4MXHTtCGfXShwcuifNimh1/NbgsXHb0=;
  b=Z8FUIxYpXKbRzVJMqaE3CW5lqlk1FIFTsyE0cZ0NGQxEBUZmZmGL5hpM
   Q0dbZT09L30S2eG/gEcrYiOQX9WU7C1Yt+qKk14z8Y01T/z93jcNjcZzP
   N/7azpzPQqZs6huCAGK5g8z18lzJhBHEo6ZLvc8M2rPkqXCOWtLLEO2tB
   3yxG93JNYz/rNYn47KcSQ5ectj1zQgSsbJBsotpfPOENy2EkROESjMHVU
   1J525UZvQs6B+iINwNUrJs2VNWvy+temOw6yq5Th1qjMbtA2yff/g2QXI
   W14/HzVWH5WoSJg+zrLQPe+hf7PEMXTaLS9/7MfdJJk/CmDuT0OMB8L2u
   w==;
X-CSE-ConnectionGUID: XSekyWXWS/6eo4eq9IYkTQ==
X-CSE-MsgGUID: XRFtcd5WS9uXc/zCfWHfLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74435012"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74435012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 00:49:37 -0700
X-CSE-ConnectionGUID: XZiiapFcRu25hsNgaqpcVQ==
X-CSE-MsgGUID: Fn/uWcduRWqWvgE6tF9xzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="216240133"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2025 00:49:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE0w1-000KMn-1Z;
	Wed, 29 Oct 2025 07:49:33 +0000
Date: Wed, 29 Oct 2025 15:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] fs/binfmt_elf.c:2143:19: error:
 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202510291505.w0IItUxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ec806d3e1816ea12b3a00ef4a73cb0d81c718c77
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291505.w0IItUxT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291505.w0IItUxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291505.w0IItUxT-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +2143 fs/binfmt_elf.c

  2140	
  2141	static int __init init_elf_binfmt(void)
  2142	{
> 2143		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2144		register_binfmt(&elf_format);
  2145		return 0;
  2146	}
  2147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
