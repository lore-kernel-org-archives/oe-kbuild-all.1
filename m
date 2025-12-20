Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811831519B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766264147; cv=none; b=XZSyqF2vMkUF6XaiH5iF77N6ZBohjwphyGN4/qMOvUcv993WbFJTJav1qeBasqQOz5W+FYQCs8PulmBaY5JbTjgSq2Wik/q/JoVvBxv4nVorwU0p5dST1ts6QrreNiYQhVA3o194R4MSlZdUbb86mxMazGzrtXlQZLZfx4H+uPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766264147; c=relaxed/simple;
	bh=au2zSiYkKksFya67H4rl18hVP0C74QQhnoX+xpUANN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5diOMXao+dcHZQ7b4f5svvzWjewUeMsgeKMASJNHZsfNZHgGfx1FY1hTLmG65u10mycIAs57G517cO/DEjbmw/PSg2Oqr4mMDEiYG9WLXBIHQbknWMtqpq9WrEJqtlklOtPw4qKIjwayPWGRCoEGWMQDW5TfFdp/PWK67eTKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mC/grbMj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mC/grbMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766264146; x=1797800146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=au2zSiYkKksFya67H4rl18hVP0C74QQhnoX+xpUANN8=;
  b=mC/grbMjL6F8WcZubBPL6JxRr1uaZLDqiQuSCIyo9a1GQYa3300VgpCW
   zZ1KOcrULLLWiSAnpWK+sebMT8Zr5Yreg8iIc/P95s4ycXgg2YN2GK4Mq
   qJl7+kLu1zBh+Fx4qY1Q5HZQAQS6QlXuzUDmq3mu4ZHqegHs36z5lng/O
   2RWsgNlixPWMmXVhQ5+ZV3rPdpxV47aNLruCxcN2H+ggJi8/zAwjP7mAZ
   YxZM8fAIp8qF8+hziBKgs69hX179F7zhfBLNCgDz4gaRu76Tjaxou98Sy
   lGgyyzhbUPyvyagicTLsObJTAeuueCHl+zIeeC5rHnVm7S8wZJGiBnvA5
   A==;
X-CSE-ConnectionGUID: qKYhiap8QteYAXvnD8uaqQ==
X-CSE-MsgGUID: xgGyDZ1wTKWPMOtGDF1Exg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67936865"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67936865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:55:45 -0800
X-CSE-ConnectionGUID: ChvyIQJ0Tt6/0KjtWLE8IA==
X-CSE-MsgGUID: s6J6BHhcSSCxbA4gVctWSQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 12:55:43 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX3zJ-0000000057x-3qo1;
	Sat, 20 Dec 2025 20:55:41 +0000
Date: Sun, 21 Dec 2025 04:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544] arch/arm64/kvm/cca_base.c:52:6:
 warning: no previous prototype for 'set_cca_cvm_type'
Message-ID: <202512210402.xNA4HhAd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 419da4d196ffa97d1430d017d1b36348fea395e5 [3544/3544] VirtCCA: Add CCA base operations.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251221/202512210402.xNA4HhAd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210402.xNA4HhAd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210402.xNA4HhAd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/cca_base.c:52:6: warning: no previous prototype for 'set_cca_cvm_type' [-Wmissing-prototypes]
      52 | void set_cca_cvm_type(int type)
         |      ^~~~~~~~~~~~~~~~


vim +/set_cca_cvm_type +52 arch/arm64/kvm/cca_base.c

    51	
  > 52	void set_cca_cvm_type(int type)
    53	{
    54		cca_cvm_type = type;
    55	}
    56	EXPORT_SYMBOL_GPL(set_cca_cvm_type);
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
