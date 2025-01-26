Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB8E25A645
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737927097; cv=none; b=K1TKEfkyxIi0sHxbgFemztfoOn/5LALZOIAVXuFdntFDXGNGuUSx0MsVg5BRDm7pVdlk+v1qNi7a4tsqm/XS+0e6xf7ymNlP41cfZ2mOcbkrcdiyYENQpKbS5Z8tLk7la4g73JMWjKIy9/VJtaC+FbBjLrJX6EAxLZg0Y2wgq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737927097; c=relaxed/simple;
	bh=imkCh/kNNYXrOJe7DfJouCXCBDATRPVlJtC2Om47qSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fE9qT7CClx1/q4Z8LTIk2m1xbCD+VZgTPjtVkVkGIdW9rq3aKDxWb2dtiXOTp7UjzJtYC54rhKuar0NOtI52BtPVploZ6AEy5sR5OJEj8NNDbFHvLifhN3or1q9wP6N2UJ3Bbi+D+XYMGSUpamgYnVNMWtO6scrxai+ngd+BDdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h98tTZDo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h98tTZDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737927095; x=1769463095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imkCh/kNNYXrOJe7DfJouCXCBDATRPVlJtC2Om47qSM=;
  b=h98tTZDojWJL8DpU188QQH0bfBJ5T/GHsAjvv6/raByxkT3KlmEuwppN
   4ZdHS9qwqMLF2GeVNNZAcWhfvRYeP/EaJRyRwBsYC7TmNX+vqR8SYAI0f
   GaCXa2R0RyfFGLBE5IRwe/bimCyIOawZiUE2XDZpZirbYRmpq7uwYHv8D
   PJgSgQttr7yie8YpTFZVU1C6xsZBvMJID7m9e5YhyZ4PqKiMLHiDS+gI/
   FNV0G1Bc+GNzR76IEqQGsKovu69x8kGC72mTRrlIpRCPrb5WkwJg79UtX
   XxwM+Df5Ek0CvezNm5PmgLndHT3X1ESgytDxziD82zNJW/chqhgGSs0cl
   g==;
X-CSE-ConnectionGUID: iUdFWkI6QoKX1lJpEZP0HQ==
X-CSE-MsgGUID: N+EsqMD+Rr2LxOfNWOw/dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="55929341"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="55929341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 13:31:34 -0800
X-CSE-ConnectionGUID: 7qag42kvStK1z1ry6F7zHA==
X-CSE-MsgGUID: QKUcn+rJTDihTOdGuAkjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="108845404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2025 13:31:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcAE7-000g4y-1Y;
	Sun, 26 Jan 2025 21:31:31 +0000
Date: Mon, 27 Jan 2025 05:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/zen-sauce 7/31] cc1: warning: iteration 214748365 invokes
 undefined behavior
Message-ID: <202501270512.bORuZWvW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/zen-sauce
head:   ae96db84281e1b10aee61ef832aabd0941743e99
commit: 1ab0facb6ae236af57bbcd06956a74fcf0599311 [7/31] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: nios2-randconfig-r112-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270512.bORuZWvW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250127/202501270512.bORuZWvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270512.bORuZWvW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'bch2_btree_path_upgrade_noupgrade_sibs':
>> cc1: warning: iteration 214748365 invokes undefined behavior [-Waggressive-loop-optimizations]
   In function 'btree_path_get_locks',
       inlined from 'bch2_btree_path_upgrade_noupgrade_sibs' at fs/bcachefs/btree_locking.c:624:13:
   fs/bcachefs/btree_locking.c:478:35: note: within this loop
     478 |                 } while (fail_idx >= 0);
         |                          ~~~~~~~~~^~~~
   In function '__bch2_btree_path_upgrade':
>> cc1: warning: iteration 214748365 invokes undefined behavior [-Waggressive-loop-optimizations]
   In function 'btree_path_get_locks',
       inlined from 'bch2_btree_path_upgrade_noupgrade_sibs' at fs/bcachefs/btree_locking.c:624:13,
       inlined from '__bch2_btree_path_upgrade' at fs/bcachefs/btree_locking.c:634:13:
   fs/bcachefs/btree_locking.c:478:35: note: within this loop
     478 |                 } while (fail_idx >= 0);
         |                          ~~~~~~~~~^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
