Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9339AD2A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216862; cv=none; b=uASoP2wT1QjTiaUQRx/Fp6LDCC3vJfECeLLllG2zbhNO4MzpYaLQcnat9UxO7EJ0lb8qOiSYHXtg/1Abefi9ZoEHEvczr9mkiEBUTFzk2wQwiLM2RuCWID5AemPw/z268dKQksANWHZSwgkfs22y3dtnkCCIcm/JgyOgEuGSgw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216862; c=relaxed/simple;
	bh=BWTmKUzCeyZqxKtsk53GBn9Aoxf8dfYtrsSLmc1Ih4E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S2x6T2R1SQWSxs8i/OlJlexMY1Qtl+6vBp4sDbkSwSDnmBQ5ziRipNUF26+L/7tLt8IezOdrFH9zlXHZrpT+NgV2/4M7M1dxzU6HVoTyrY8VUusy4IVZyPyP+gJwu5SDsQXPiN09AkUUohxTC+/dReGSvEvUO/yDMEeOMZcoFcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyjCghDO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyjCghDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789216860; x=1820752860;
  h=date:from:to:cc:subject:message-id;
  bh=BWTmKUzCeyZqxKtsk53GBn9Aoxf8dfYtrsSLmc1Ih4E=;
  b=VyjCghDOGAUJePmH0ZM8vqXBcT+Lle5ejfYLOF6NPNSZLtUDI4vb/mvm
   H4Dow8YFKGIkRqBGYWvzX6SsoJ9nrAZuHxS3Gwfc2bGBWyNFGDVaCY4eD
   +fR/1AeQ+K69Xo+d4b6rcuv542U4dmSopUaHExKXzZH6Yqe9mWnVojAWD
   e4kkjLRLmb3LpA5G298TfncXZ/uc+Oxsf+LrmHKZzoeXqvzfJ9SMRws/z
   35/OQtr3udahM3aXbs3NjkAqQUIpnaFuZAf+xSqrYiNPOelksRIJsXbTU
   j43bswQhxV8E5b8BP0yONBo12xGb1i5Jrdo7CB0wrR63wSjz8MAt5U0Zo
   Q==;
X-CSE-ConnectionGUID: DmKdczg2Q5uTsl920Yixkg==
X-CSE-MsgGUID: f4j9NYZCSVSsTfVRCXPq2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="101011077"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="101011077"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 05:40:59 -0700
X-CSE-ConnectionGUID: knZWXLLARQ61W5za1ITC1A==
X-CSE-MsgGUID: jd6C4sTDSHStWC8PDpkUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="276328213"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2026 05:40:58 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5N2M-0000000016D-17c7;
	Sat, 12 Sep 2026 12:40:54 +0000
Date: Sat, 12 Sep 2026 14:39:54 +0200
From: kernel test robot <lkp@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:tdisp_phase1 24/34]
 drivers/virt/coco/tdx-host/tdx-host.c:222:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202609121407.f92etiw5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git tdisp_phase1
head:   9ed1a749a8eadfcaf42268f321a1569907d5efbc
commit: b88bd1acf12bf8d5e9501fe72f8544597143a874 [24/34] coco/tdx-host: Establish an SPDM session with the device
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260912/202609121407.f92etiw5-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121407.f92etiw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121407.f92etiw5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tdx-host/tdx-host.c:222:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     222 |         if (!out_msg_page)
         |             ^~~~~~~~~~~~~
   drivers/virt/coco/tdx-host/tdx-host.c:244:9: note: uninitialized use occurs here
     244 |         return ret;
         |                ^~~
   drivers/virt/coco/tdx-host/tdx-host.c:222:2: note: remove the 'if' if its condition is always false
     222 |         if (!out_msg_page)
         |         ^~~~~~~~~~~~~~~~~~
     223 |                 goto out_free_in_msg;
         |                 ~~~~~~~~~~~~~~~~~~~~
   drivers/virt/coco/tdx-host/tdx-host.c:215:9: note: initialize the variable 'ret' to silence this warning
     215 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +222 drivers/virt/coco/tdx-host/tdx-host.c

   211	
   212	static int tdx_spdm_session_setup(struct tdx_tsm_link *tlink)
   213	{
   214		struct page *in_msg_page, *out_msg_page;
   215		int ret;
   216	
   217		in_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
   218		if (!in_msg_page)
   219			return -ENOMEM;
   220	
   221		out_msg_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 > 222		if (!out_msg_page)
   223			goto out_free_in_msg;
   224	
   225		tlink->in_msg = in_msg_page;
   226		tlink->out_msg = out_msg_page;
   227	
   228		ret = tdx_spdm_create(tlink);
   229		if (ret)
   230			goto out_free_out_msg;
   231	
   232		ret = tdx_spdm_session_connect(tlink);
   233		if (ret)
   234			goto out_spdm_delete;
   235	
   236		return 0;
   237	
   238	out_spdm_delete:
   239		tdx_spdm_delete(tlink);
   240	out_free_out_msg:
   241		__free_page(out_msg_page);
   242	out_free_in_msg:
   243		__free_page(in_msg_page);
   244		return ret;
   245	}
   246	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
