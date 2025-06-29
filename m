Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2627F1E521D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751192959; cv=none; b=RJz1pO7x0Bg/Alvhq9A01/FFPmeYJrR+W+mIeDfmTSqsZvKj7CJ+hA4+l8fKnW8Ur3kZgtxWPflujT8cBkRMviUotdT+EXt8UZpuhaBKr6bCF7V6pVyF3rGuirt56LsiJwB4EMfDr1pvpyA/hyNAOncXD955XVAiYL+nbpDwWrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751192959; c=relaxed/simple;
	bh=0gK4Hs3s8uJdCaSHxZMl8NCih4C/s280smu/7pQAwb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7Mpcutd7NGKrLrvNRPGeHmXt/MnNuROXgnsbRO0wcYnZp9Lw41WKMcwYZ5Se81Rcev4mDQVghUN9uX+qE5K7jlCpPbSEiOgfw0/fpfzTr1WEKfsDWIrsl8evL9raXJV0nBzcnC4RNg3W8SjDsKBbej69goa8wMiPSq7saYE5v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEK3Y76E; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEK3Y76E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751192958; x=1782728958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0gK4Hs3s8uJdCaSHxZMl8NCih4C/s280smu/7pQAwb8=;
  b=WEK3Y76EMIIO5jkEaTlVVqzXMfEjpC8TYRzJsvD7qfDhz5Pg/ZmMPiJo
   wOQRUviPI2OXiQ8YGDajgDMRsUo0Zv9FUiI9AliD9n0Qx4AhDZJkIl717
   LyJDEv5blbpbHL0Q/6TuV5XMyhUurmAut9z1VcrLnZrLi/NBAh7sCx4SL
   5D8omBjOFbJgTnUeEj9K2m7kdTx47/DRzEEF8Jhr0IpXaFD0f/Ij5QgWW
   N7JdRyeAiLC3sViGgCpTgiN7K9iPTR6DVdrg3FquBrqIWCg43QaQe6Y/C
   zm90THqniV9GdsTXQtpG7PoFSvFpjoXBytsp4ZvIqxndiD+KA2CNsv4zw
   g==;
X-CSE-ConnectionGUID: enkjkuPEQl+t0ohR+qAyBg==
X-CSE-MsgGUID: EGqugLo+Rm6mPyJ7nGO/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57215418"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="57215418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 03:29:17 -0700
X-CSE-ConnectionGUID: kGxp+xUHR8GrUGt8ePzRcw==
X-CSE-MsgGUID: SKs5jiZlTouK4MRet4e1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="157227896"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2025 03:29:15 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVpHd-0000sx-10;
	Sun, 29 Jun 2025 10:29:13 +0000
Date: Sun, 29 Jun 2025 12:28:54 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2985/2985] drivers/acpi/numa/hmat.c:726:6:
 warning: no previous prototype for function 'hmat_restore_target'
Message-ID: <202506291239.arFZDGuj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c245365237da527fb423d85e7ec54648113f843d
commit: 2e1b00fcf1e3152a1e73846f5f9ec37cef088a65 [2985/2985] ACPI/HMAT: Add missing locality information for hot-added device
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506291239.arFZDGuj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291239.arFZDGuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291239.arFZDGuj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/numa/hmat.c:726:6: warning: no previous prototype for function 'hmat_restore_target' [-Wmissing-prototypes]
     726 | void hmat_restore_target(int nid)
         |      ^
   drivers/acpi/numa/hmat.c:726:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     726 | void hmat_restore_target(int nid)
         | ^
         | static 
   1 warning generated.


vim +/hmat_restore_target +726 drivers/acpi/numa/hmat.c

   725	
 > 726	void hmat_restore_target(int nid)
   727	{
   728		struct memory_target *target;
   729		int pxm;
   730	
   731		pxm = node_to_pxm(nid);
   732		target = find_mem_target(pxm);
   733		if (!target)
   734			return;
   735	
   736		mutex_lock(&target_lock);
   737		hmat_register_target_cache(target);
   738		hmat_register_target_perf(target, 0);
   739		hmat_register_target_perf(target, 1);
   740		mutex_unlock(&target_lock);
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
