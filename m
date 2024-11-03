Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B44013049E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730655579; cv=none; b=OucFRvfCoMyKX8wXAmZ52sW0lmsjJ6hZ+cOU9RpSCw6PN+ldvyacxwLGev65LaCrjIfRwB7LWFsZWkuorfepxnyBeAvJu26yF0ikOfxu+uGVBHFdxlRLxbxVyko649s/Ff7fc29JLqtfui64MFwKKPUqSsp1hV/QOpIqjenwmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730655579; c=relaxed/simple;
	bh=GqOCBbhlF6oLnjwhNdacC1wz5i8oiJlBKJ6cMEMaJjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dbg9kLNeRYhRXSV8bQGRFkEgjsA3GsSeIq6pEUAS64Y5JAcYovcqdHf2eVD7H9ciYa9plv0PAQpXIPlWjbJfeVol5UFiW1KKzPzLsAlwJlcmDtSOKRzuBZViF2zaUObAB6WIg/Yb/DNv4X2Ww9MGxrCVHG8DX2D4Nzo42c3MUMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCTbkd+N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCTbkd+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730655577; x=1762191577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GqOCBbhlF6oLnjwhNdacC1wz5i8oiJlBKJ6cMEMaJjQ=;
  b=UCTbkd+N7JyekVeWh6bEYZV6QjpMGHUxbBLepDsgJpa2ybErXEHg+p2K
   N5lI7C3UwMBAXMmYREhboQEJ4N58BcuXzaV8meEWus5BYb5FsdgPEbEPT
   SEcHTKY/joHsY+oMT8t5aNjpqZRjHojyvbS8ohQ/y3M2XFw4e67tdYOR9
   vkQm7T2dNx14kH7e9VRn6ISTCB8f9ciHB62pHrpZzRb0YDJqtujZAPWDe
   2o/k+rsakIQM0DV8fX5Y/FPAf+6ZMJ/j4zaQI1o4Fbj7UD53p3DYwd2qh
   MdCZuITjP98dwcjZn57qCYXomC9WfLkTnYVDV66a6SxY/jmsLRMGE9Kim
   g==;
X-CSE-ConnectionGUID: T+9r59QYRruMK7srdQ3YDw==
X-CSE-MsgGUID: H8A1B4AORUyVzArV4J4k7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41746396"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="41746396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 09:39:37 -0800
X-CSE-ConnectionGUID: O7C3rr3nQ+WJDGzT5iaifw==
X-CSE-MsgGUID: Pq6gKnj7THOqYgmaHXYIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="83123544"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2024 09:39:35 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7eZY-000k6n-2H;
	Sun, 03 Nov 2024 17:39:32 +0000
Date: Mon, 4 Nov 2024 01:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JangShui Yang <yangjiangshui@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284]
 drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype
 for 'ubcore_hash_table_rmv_vtpn'
Message-ID: <202411040149.WTznzl9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WenChen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   170b758d064664f953e8f6de41dd4a3ef122443a
commit: 013280dfab06d20e73de842e8d2fc2a200055455 [2284/2284] urma: upload kernel patch for 20240224_rain
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241104/202411040149.WTznzl9v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040149.WTznzl9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040149.WTznzl9v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_vtp.c:261:6: warning: no previous prototype for 'ubcore_hash_table_rmv_vtpn' [-Wmissing-prototypes]
     261 | void ubcore_hash_table_rmv_vtpn(struct ubcore_device *dev, struct ubcore_vtpn *vtpn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


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
