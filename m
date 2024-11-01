Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471914A62B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730460460; cv=none; b=PXJnVNoL9SbRJ5brrhuFhKZQFqqSPWYgz+lvJ0H5LhTmuRjJ0lO6FASyDUx2t+DGtsNouiDV5ppgwyJ54zNNYwOGm5mMDDOUbeKVJsTiJHOhUuqs07O625pOQsrxsXl6PLMcOkF1sZK5Xb6hF4+i9dEbu0cG4uNmez6nZQbJbu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730460460; c=relaxed/simple;
	bh=fTMgxiGEzWQ/4iwKC1bgteIDdVSG/2oCT+t0K7fquOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X78unccYUYSSIzQ+6iWnro2qf0261EHYRfXu5a4/Awp6dy1TiWBqQNtkFAsT6hsFY5f3G43H5jVqdJxBYvOLPSjmrLaca5jqxFKHAfYnh4+LKypwkCR5Qo2/fCLIJ+PvCn+I405Oy9tYC9mpixpZRpxh/NV0r6MyuVaxWI2zNnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTOPdSGa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTOPdSGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730460457; x=1761996457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTMgxiGEzWQ/4iwKC1bgteIDdVSG/2oCT+t0K7fquOc=;
  b=eTOPdSGat/zMBJikMX0IpmUA2caIzNb+l7DTJiC6aWSMBBPVcQSy3kug
   oiG4YAM2fR+GvtKkvbBmWoYNtuh5jXQw5ZwgifbbJVvpBiKtWfonz0iQZ
   p1qtTcAiAY1/+kakqkRSZOosGDBmUfsZI81UKuzefLYUyRIKwRuH3q0HI
   Be2nMtZCZeYIPeFIAuAJVNKX6jre1c9Y3SET66dld5xfL5xp7e0zqX/Lh
   XBYOh/FZtyTwfzabL26gAXMqyqNf6mkM6m8nTcmSZoUQ15YWURkmNf9Lw
   asDc4NpzXJizSsqe1kGkjtPXDwb+/Bg6U+lSM1+S31P6rxb3o5fCDNWmi
   w==;
X-CSE-ConnectionGUID: kSZO2rXnS3aeXPoxRv9W2A==
X-CSE-MsgGUID: qariBs8wSkW8aEURGZ0NBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30410561"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30410561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 04:27:36 -0700
X-CSE-ConnectionGUID: WXKjg8i4QNmSgYffjZiF3A==
X-CSE-MsgGUID: 9hO0mICpTdO5CzeGbIESHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="120396296"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2024 04:27:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6poS-000hTF-28;
	Fri, 01 Nov 2024 11:27:32 +0000
Date: Fri, 1 Nov 2024 19:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2332/2332] fs/buffer.o: warning: objtool:
 __breadahead_gfp()+0x9b: unreachable instruction
Message-ID: <202411011918.G4zrdL90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cc5e1415473b95a8a68887dbb9c459ed50de9f1e
commit: 1ee722823d036ae6478e6bdb1afb12abff10a907 [2332/2332] fs/buffer: replace ll_rw_block()
config: x86_64-randconfig-005-20241101 (https://download.01.org/0day-ci/archive/20241101/202411011918.G4zrdL90-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011918.G4zrdL90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011918.G4zrdL90-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/buffer.o: warning: objtool: __breadahead_gfp()+0x9b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
