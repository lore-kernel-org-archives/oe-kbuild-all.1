Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA4156230
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 23:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724888857; cv=none; b=aQwRyyB3n67WCj63c/u0tamxcIa4chD00L+eWCDFuEmsTZDKsY0DpGkAaLsrzDMnz+PnuVsu1EFbTjUSOu7UmBGrPzpTW4A1P2k8BQaTLrRW06yGInEniKaYwc+NpXok2owxfllVvJmbPuqrOIDVsXMRoXo7Nd6rc8l0EmLhVuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724888857; c=relaxed/simple;
	bh=83UHVjKzZ+n7R+okFA15A0Qtbr8siDpoYI2K8GmAXvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=il5T6ji8gyesing4C36I5DkLJcTkWliwfAIJr4R0heDZsbMznO8QIn94htYDKq4PF2s0M6CdLdey8aiENoKNPutD3C1Jt2obcoJCFDXkGnPB8TuByfPL/81B1aR9MPictgDF1ZTZf4+jdNVPPlG+j4gSI6PRvbnVQRok+7GyN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdcWRjW5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdcWRjW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724888855; x=1756424855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83UHVjKzZ+n7R+okFA15A0Qtbr8siDpoYI2K8GmAXvE=;
  b=EdcWRjW5PpyxgYJoPcxke06hQgH4z/robw0vPcMJkKK4hnZNQLPgyAvp
   CWS9+MsiHFhmgWzhs4NpIwGvzVLpLa+hsdeT2C041k6HBvDpDR35yf5m9
   Gsi5dXBpSbT60f96xtENWOHWBPrKRf4tbQ4cClYLaIYH7eqSMpDuVUy/C
   C7nQTflITkjwvgg3UhcImxaWSqw1JzcRL5HoWwDY8k9V+U4MtmEP659AK
   Xo2cQ+3RUVUt7IILDzzJSpmEOTCu/Red1X8qWuUqCZSEJrR41mGt99eXI
   pYiXjx1ULaQkL92Tmkv7OABghfhHqFX834NGF1Cz3o8DF53w5OB5P9Xyd
   g==;
X-CSE-ConnectionGUID: dvG+YQHITPyWSW2AjdMfFw==
X-CSE-MsgGUID: Etyi0jXZQ2WI49Hj8Tp7pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34024189"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="34024189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 16:47:35 -0700
X-CSE-ConnectionGUID: lYhGrTy8QAiBCDJ8n8OcqA==
X-CSE-MsgGUID: RgyQT4oKT+qx9h9nlKixPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="94204396"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2024 16:47:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjSNv-000LT8-2h;
	Wed, 28 Aug 2024 23:47:31 +0000
Date: Thu, 29 Aug 2024 07:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26952/30000]
 drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype
 for function 'ubcore_hash_table_rmv_vtpn'
Message-ID: <202408290746.znnxteuy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b3492b88408a530f644afcd9e80b98cbf9883a82
commit: 013280dfab06d20e73de842e8d2fc2a200055455 [26952/30000] urma: upload kernel patch for 20240224_rain
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240829/202408290746.znnxteuy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290746.znnxteuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290746.znnxteuy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype for function 'ubcore_hash_table_rmv_vtpn' [-Wmissing-prototypes]
     261 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
         |      ^
   drivers/ub/urma/ubcore/ubcore_vtp.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     261 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
         | ^
         | static 
   1 warning generated.


vim +/ubcore_hash_table_rmv_vtpn +261 drivers/ub/urma/ubcore/ubcore_vtp.c

   260	
 > 261	void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
   262	{
   263		struct ubcore_hash_table *ht;
   264	
   265		ht = ubcore_get_vtpn_ht(dev, vtpn->trans_mode);
   266		if (ht == NULL)
   267			return;
   268		ubcore_hash_table_remove(ht, &vtpn->hnode);
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
