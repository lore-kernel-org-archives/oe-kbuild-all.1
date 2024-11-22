Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D518CC01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732319020; cv=none; b=ub3/N482d1IGOrobd1RcQLKSN2qIE+n6FsB12qMz3ytCLALHjg2s7jEPDnd6NKrUSwaSI0AQoiPCc4Wrn1txzbWkgVaHR/sSBjoRDsINxB6b409/wzHXTGfyMGO+BVzWQ1FtMh95q01vj4JmINfoYibBK9kfyEUW4tg6QOyZ+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732319020; c=relaxed/simple;
	bh=sl5M2UB9O9kKrE3RvznayfrHHY2b9GxhCeGRz2MTV1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGSXqKf1IDLQbQfR9KfyF7rVFlbHJWsr+O8IIEBcZknPfFws1lLYm5dI/HF1Ou306Y2DCCh4SetO4D0jZ93BDajaE+B1HCSAjl4TVFBgDV9HAAzsh05WCgLkwXBmPx7+LSMfYwKX8Lkdbe/lMl6GQfDeXl7a3o3s058zgEwdOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxFZCRUU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxFZCRUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732319019; x=1763855019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sl5M2UB9O9kKrE3RvznayfrHHY2b9GxhCeGRz2MTV1E=;
  b=ZxFZCRUURKQqYNeGnBgEb5Ov2Uz3FlwtYwrGtl1BBzPNMQMGMGHVmxlh
   YrwsHpCfmms0JbEgoU8+MnRtAMC9qgwniUZOmx86Wwg6yk9mGdFKF7oy+
   3f8+lvoNaM/vMiTqhnWmZ8u3RgOGFy3D8thKGpNmZOzN1qwgWrjhEGy5l
   iTRbFu+AeItxa+3hqMY2MiQnFRNRLMMlRzFn3cMwnIyDnpcV0M6iZQQyh
   hUVBeS/FaDIA/GmDxvX+x7RbGdm5GaEXd5sJt7nRCjP3rTyjhzcqq43at
   QZ9sufnJtj319UW+Rvxg+WnUXV+QPdbvkf5tUHrtmcAhE/mfnDsJ55r9R
   g==;
X-CSE-ConnectionGUID: z+odrjPdR+aLM1y9WBN3mg==
X-CSE-MsgGUID: dBkcEEWxRqm+wIzCx2MwSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43135396"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="43135396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 15:43:39 -0800
X-CSE-ConnectionGUID: 9lEEB1sVSLyjcERrTsX7xQ==
X-CSE-MsgGUID: 1+x0A+8GRC2e9FWz/MAXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="95129569"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2024 15:43:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEdJH-0004IZ-20;
	Fri, 22 Nov 2024 23:43:35 +0000
Date: Sat, 23 Nov 2024 07:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/platform/x86/intel_speed_select_if/isst_if_mmio.o: warning: objtool:
 missing symbol for section .init.text
Message-ID: <202411230724.SOpvtlro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: 8453d1c1d4ecff553e6c5d7ef7671ab91a241f4a [1297/1297] Intel: platform/x86: ISST: Add Intel Speed Select mmio interface
config: x86_64-buildonly-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241123/202411230724.SOpvtlro-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230724.SOpvtlro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230724.SOpvtlro-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel_speed_select_if/isst_if_mmio.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
