Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887C8188736
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737997690; cv=none; b=nEbEwTjSl6cSFEHn6C9ArTORrGI4KaccDV63w1DrZa5U/+c2BBrq63GdAlWOZKOtmZmnI2RnOu7mfvIcjFaGOevqv9Eyb/0VEtnhJIra14WqArgsVAMDIoGgI0K6gj3xP5RN5lcITi34S48eLJM/f7QR/uPC3lX+v/c3Ek+HQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737997690; c=relaxed/simple;
	bh=6sTOr9H5o/tzGz3AoMnsYVlP7zF6J//89HKpIy//wR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DGWOg2cAcAXR9BiodtcAJfP6UINHC/Wye/xiMgeUj8SmZn0YIliFbYMyLPYM7n0XQOq/cLmDp4ECew/+dorQMrizkdBCmWO1R6xx0S9KzqSDKeGcax45+hfaT92UbFschCZjoD+hnZfKN/lZTY7anaBOR5G4kpXdBfw2HCZS69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/DJAcqz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/DJAcqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737997689; x=1769533689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sTOr9H5o/tzGz3AoMnsYVlP7zF6J//89HKpIy//wR4=;
  b=T/DJAcqzKDNcbCQARMzGslBNgqfYSKZny1drxnjhPpOoGSyOxmbRDOLj
   wY97r2gk5yDM4Bf+6jOx80TGkSuJb6LlnrAjNjYVyw/4kWvqlM3RtbyLu
   4LkeHqj77jVJjq7CUfKxdZq4FO/RQ/RBw4M/OH9g6pBzLm9NjWr840CKM
   nCb6RRuQu/+8WPgNy2CHeZ492kQ43k85Fvu+q5tkIKGAsCyhH4ofUZo8x
   m0+F0lMAxnSgeTZXMcw+b8XxxxN5sZlzOZah1SOZzcZTo47XB+zCtVmxe
   30SvKilUg2IN20EjrXF+tH0xx/jVU4Nt3HCUBu7IGMuvtnXnF/tc06pYE
   w==;
X-CSE-ConnectionGUID: /SHR47xsQP+AmLZamAUwSQ==
X-CSE-MsgGUID: z1JVJbveSAKLL5xE3g9ClQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="60936022"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="60936022"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 09:07:27 -0800
X-CSE-ConnectionGUID: DxD8aEBiTD+b7AoNtTsQhA==
X-CSE-MsgGUID: t5wtiKtCTw+NIjwFLiSs4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113630691"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jan 2025 09:07:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcSa3-000h0f-2w;
	Mon, 27 Jan 2025 17:07:23 +0000
Date: Tue, 28 Jan 2025 01:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 42/83]
 drivers/clk/qcom/common.c:290:29: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202501280115.7Da91CWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: 42a3f5c7d83b92f90275c45d319fe4d480d0378b [42/83] clk: qcom: common: Add support for power-domain attachment
config: csky-randconfig-r111-20250127 (https://download.01.org/0day-ci/archive/20250128/202501280115.7Da91CWx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250128/202501280115.7Da91CWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280115.7Da91CWx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/common.c:290:29: sparse: sparse: Using plain integer as NULL pointer

vim +290 drivers/clk/qcom/common.c

   286	
   287	static int qcom_cc_pds_attach(struct device *dev, struct qcom_cc *cc)
   288	{
   289		struct dev_pm_domain_attach_data pd_data = {
 > 290			.pd_names = 0,
   291			.num_pd_names = 0,
   292		};
   293		int ret;
   294	
   295		ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
   296		if (ret < 0 && ret != -EEXIST)
   297			return ret;
   298	
   299		return 0;
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
