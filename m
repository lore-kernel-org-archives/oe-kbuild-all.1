Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BDF12B94
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 05:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762405692; cv=none; b=XyoTQIpXXCUvVLyKEsGDSQr9caHfR8LIlsoAmYko+cPI4/Yj7zdTcmUlchjQqLGs7M0vYER726i5TN/7q4GCt2+YQIDmInzQY29BrXiLDrawohFyJOGZMu/uuTE+LgfbyRPIszGEQMboqoy7ZkKB4xNaBfqY3T7DHowrmABTbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762405692; c=relaxed/simple;
	bh=nllhApGmDMp1lSm4Kjfy1dk4lIl3KPNOG6HydHyjS7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORlqlIZ72/Gjbn6gf6ZyAFhNy9YhL89WNZujWOfp9SK8iWYD/zeN6/bxEWnn6jH1LwiQURnMnExc12QXOv+JifVn8jcD84st9Zlr9avfJ++cZBejMYVH6hzT1j12Hd+xMx9r3KBAB1RkXWV7S66VtPKe80KTEHeznv4R1NZevdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OF22swzY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF22swzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762405691; x=1793941691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nllhApGmDMp1lSm4Kjfy1dk4lIl3KPNOG6HydHyjS7A=;
  b=OF22swzY6efSKMo8lRQR28Vkjam+p77xTChO4qF354ndtbIx2Wi7mZaP
   dp1q3MHfSQRGcmf7S+cBjjTzjLvqJlqPHV9g2RuxQmPJQ7vVaC3HaxH8W
   sFSdkIbm+ctb94z6bj/H2nxdZaYMLYh6qkkc1Mp/LTJCqG6sScAbsIDzi
   6B7Hq53oEkN3O2rRGQhWly26KBj+OC9rgGpGarWracV5NfvFb1iWDv7Wu
   5UjkhBdbS+66wAR/euj/98GrEG5ru81RnhJ1guPiAyj/A4mufGqz01Obq
   GB/BfZRVuIoZC/RZqzvylBIzUudETa21lBjl8tAk6hkAGUuAbHEHGI7ij
   g==;
X-CSE-ConnectionGUID: ZQeuXY0/Q2K51l0NOu/Odw==
X-CSE-MsgGUID: ICVyAs9QRa+gwbEby7GqNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64459160"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64459160"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 21:08:10 -0800
X-CSE-ConnectionGUID: pR7BaLZ3QImdKeT/R+CNKg==
X-CSE-MsgGUID: pYTTesStQQWf2BqIajsPnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="188104681"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 21:08:09 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGsEB-000TVY-0O;
	Thu, 06 Nov 2025 05:08:07 +0000
Date: Thu, 6 Nov 2025 13:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [rcu:rcu/refscale 1/8] kernel/rcu/refscale.c:187:1: warning:
 parameter names (without types) in function declaration
Message-ID: <202511061357.pvrg4slA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/refscale
head:   0c990a8562a127b71e72eec4b9b92ba0f602510c
commit: 04f65881ec76959989d5218440085bb0a5042b01 [1/8] refscale: Exercise DEFINE_STATIC_SRCU_FAST() and init_srcu_struct_fast()
config: sh-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061357.pvrg4slA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061357.pvrg4slA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061357.pvrg4slA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/rcu/refscale.c:187:1: warning: data definition has no type or storage class
     187 | DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/refscale.c:187:1: error: type defaults to 'int' in declaration of 'DEFINE_STATIC_SRCU_FAST' [-Werror=implicit-int]
>> kernel/rcu/refscale.c:187:1: warning: parameter names (without types) in function declaration
   kernel/rcu/refscale.c: In function 'srcu_fast_sync_scale_init':
   kernel/rcu/refscale.c:222:22: error: 'srcu_fast_refctl_scale' undeclared (first use in this function); did you mean 'srcu_refctl_scale'?
     222 |         srcu_ctlp = &srcu_fast_refctl_scale;
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      srcu_refctl_scale
   kernel/rcu/refscale.c:222:22: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +187 kernel/rcu/refscale.c

   184	
   185	// Definitions for SRCU ref scale testing.
   186	DEFINE_STATIC_SRCU(srcu_refctl_scale);
 > 187	DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
   188	static struct srcu_struct *srcu_ctlp = &srcu_refctl_scale;
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
