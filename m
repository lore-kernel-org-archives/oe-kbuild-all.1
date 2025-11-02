Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821818991E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762046264; cv=none; b=AMM0U950bflTOVvMqTrMgpMrzfGsNxVnY12PgqrCK1/I0tsIJohleKlqcIKSk5+DdjLwL1cDytdZBUNsyZb2sQB9h2FG9x8NF+5BBjqh7yYLXd+A/nlwjcsZNFiPi60QeaSHBLheHLlrlBy0zCJ3dUFZs+GxWoEFJhMaAo+d2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762046264; c=relaxed/simple;
	bh=aTt4eS27Wvt6v1lb7dva4/dnmlK8wsZpYIsO/IBxny0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMDylMb9mzejF1FfKonOBixpkkHZURmxIYivrcbvIh7ek4x4ED6bBB0Abu8tbHYnCLWCi3lXz2DKk0CGbK68IMJ91TVZQQwryxfPjV7VmjGvyhO3pud3OMYEVLycluGWOwq5Op3cWrJi7lAS2Ly85BVS2IH3pLCwGaD3D2KhLjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDVSAxfS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDVSAxfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762046263; x=1793582263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aTt4eS27Wvt6v1lb7dva4/dnmlK8wsZpYIsO/IBxny0=;
  b=lDVSAxfSM2T2Y1Px1aWCvAkIQ086ZmBKVq7Z5QdjguYJr0kzdEoHfnoa
   BB9yGzmG0QSCPMM5xXmiM5nft8xZq5mBa2i9OqTEYG3NMlyE0mF/8tDpx
   xwFH32zinp8vIzCucFH8BaxdMAxOrzOtapCKqTyAsQCkihpC1f1dLQgtU
   486xmMcIwTu/ZtCVgPwd0Z/jnU5MfLTE7Hdaf+8m9mIf3xzNZSvlhEaRD
   PjF5jswTaH/hiLNM5mOrVBCim999TIPojbTpNs43ylawQF9YSoL3UiMdr
   8g9A24aXZaK2xIVsAG9lEjgcK6/kM0o4zZSDQz2TI/JPjRZt2D7IT1UO3
   Q==;
X-CSE-ConnectionGUID: PbhhSaePTSuq+TrBQClRaw==
X-CSE-MsgGUID: KErWJ+/7RYKnsaK3M8Lr2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81578630"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="81578630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 18:17:42 -0700
X-CSE-ConnectionGUID: fdFjWTHdR4apzCLCFEM/mw==
X-CSE-MsgGUID: 7BslhuLGQJyJ+8W1Xt1xlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="190636013"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2025 18:17:41 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vFMix-000000001Q4-2NNf;
	Sun, 02 Nov 2025 01:17:39 +0000
Date: Sun, 2 Nov 2025 02:16:48 +0100
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 1/57] checkpatch: ERROR: code indent should use
 tabs where possible
Message-ID: <202511020236.pLpmbPzl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git must-be-lval
head:   ddd6ff4d1945e2040067848741c3e94855fd43c7
commit: b16c5d81ca625b3c883853bd496c48fe8445cd87 [1/57] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
reproduce: (https://download.01.org/0day-ci/archive/20251102/202511020236.pLpmbPzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020236.pLpmbPzl-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#70: FILE: include/linux/dynamic_debug.h:138:
+        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))$

ERROR:SPACING: space required before the open brace '{'
#70: FILE: include/linux/dynamic_debug.h:138:
+        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
