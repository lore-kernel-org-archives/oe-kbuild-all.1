Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A37315DBC1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 10:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754303945; cv=none; b=l5SuqQUf7nJ8Su+5GiO+zv9mcuWkifnpbclLRbHnB9wgHlye5MIEX0ZEVtIIfq4OFG9DRcscWYiAEKzSyLQCxKtoZtTdrY6VmqsVRrbh3CBVVFT1vzcOKpv8mPoFvscW2nxOVMLVXqRAdzcIufN+djnLM/CzMZ9TBhdF5JMOxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754303945; c=relaxed/simple;
	bh=rFLZzKEgeJwNBO0NmhQDQRGfh3SVn0ZKa/sjBk11XMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sB11yZnfTS66Dcl0EUyoULSEnDV98XLoReQEnPxM/p6j93Asj90uq9OHyhj8X5WV3+E7xFRLZAfuivnfzXdu/wMm///J6xjtNj6vl28MYQBDyYNqB72RKWrDUgKn30bxiyUbt6keAPMY95JEDVNkaGBN0L6QeP+h6unPZg+kp8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBDn+ALj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBDn+ALj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754303943; x=1785839943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFLZzKEgeJwNBO0NmhQDQRGfh3SVn0ZKa/sjBk11XMU=;
  b=LBDn+ALjheIGL9tsPYgqhu6C0sQKAlKLKWgecKxKDfTYjNzEtCzQKWJD
   zxNIb1/O/FVIowNasw8y5pH1Nn/FBdMJreFF7EjZM6/c//GLA1xZ//P1N
   wwZgaXJZJLZhtbSY2olp32+9LWtjBLqLkq+XzWU9JEUNTIrAZ3D/fSacf
   i36wUbxCL1D/WAbEU1ij2T213O/2HUsO9XRNaK0riXkw37c+HmB4M2oML
   cZBQaaCgx7eY+f1tws12gLRni/UnJ187bCmRqyo2vtu5EgcpP1dHqyMWX
   YBJuTEcrQvWHs/Z/rCwWDOo3A3HF62voiotVjH6eciQc0XLmisuVAOEdR
   w==;
X-CSE-ConnectionGUID: zHxffKpYTzmLZwQ7TNSHbA==
X-CSE-MsgGUID: KQMWgbOeRnGxC0vtnATb5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="74148768"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74148768"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:39:02 -0700
X-CSE-ConnectionGUID: heFv0lDeT1yVWyRSmBJuXg==
X-CSE-MsgGUID: ZjZRLMnmS4Ohsv0U7oJJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164521084"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 04 Aug 2025 03:39:01 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uisao-0001mB-26;
	Mon, 04 Aug 2025 10:38:58 +0000
Date: Mon, 4 Aug 2025 12:38:12 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] block/blk-merge.c:688:16:
 warning: no previous prototype for 'blk_try_req_merge'
Message-ID: <202508041253.AJArCfly-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: 5f100bc6aabbe30e55cf20af8e163bb6dba3a3aa [1743/1743] block: fix the DISCARD request merge
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250804/202508041253.AJArCfly-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041253.AJArCfly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041253.AJArCfly-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-merge.c:688:16: warning: no previous prototype for 'blk_try_req_merge' [-Wmissing-prototypes]
     688 | enum elv_merge blk_try_req_merge(struct request *req, struct request *next)
         |                ^~~~~~~~~~~~~~~~~


vim +/blk_try_req_merge +688 block/blk-merge.c

   687	
 > 688	enum elv_merge blk_try_req_merge(struct request *req, struct request *next)
   689	{
   690		if (blk_discard_mergable(req))
   691			return ELEVATOR_DISCARD_MERGE;
   692		else if (blk_rq_pos(req) + blk_rq_sectors(req) == blk_rq_pos(next))
   693			return ELEVATOR_BACK_MERGE;
   694	
   695		return ELEVATOR_NO_MERGE;
   696	}
   697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
