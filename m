Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFCB8F5C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 00:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748910850; cv=none; b=Okn8P3te1BCZY80lD16AKyJ99Jmp8JZlD+2k35lrsF88toyVUbmyXOafQPyaDQmT5qkAZZ3j3SDCE+5CoLyGf9YHOEynLGpfFoHiyspviT4HSaTPx+yMl1F37fjus75LOBkfBBhb1nkMn8umrXMaecztIvHpkXqV0VXRmhverxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748910850; c=relaxed/simple;
	bh=EipwtN8u+izV6lY5ST+sEAd9gzKtGs+HmKfJPhKHyzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=copT/aJq0phmFjOOB4T58Kak0bJUQpWQLsktHSABlDpDEiIGT0buqitMJ+vELXhhQe2jETW8C0z8ObWBRdfcVAjNPeGNjmHcvMsaK7E+6QvvWdc8vEnjwTR9n5jLV/HE5cDQQf/i401//uYd6dgWw7nbv6VbdbRU4+ev08yHBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5qHwrK1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5qHwrK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748910848; x=1780446848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EipwtN8u+izV6lY5ST+sEAd9gzKtGs+HmKfJPhKHyzo=;
  b=j5qHwrK1xabjdElQccpPMzq5i7rFHCYOevamgdso+xVIsS4Ugk7jQX0l
   0uPOCuOFDX3KvX1jq0ros2Rv5OXF9t1/YqLezkYVs9Vly+epr46y1bX3G
   AEmLQXtvFGaA2yoEhJHTcXFZDBxX8nMrGrcmPJ3D5gsRnlQYxzaMsT8Ku
   QRmdykIPSBsocRmYIHqEbf3DaF7xirJYdbZvitNSPfH7Z34wzqLXThjo6
   TOIclLIWRxZ+39AtTplCSOoJU7Z2/c7I2sEkJy8tCAsgMi+PaWV+CG/Ic
   P4E96xBHjovg5EUjEdDqzuJcxnij5RZJ/PlJ21S1UbHwJWpRrCWy/2xE4
   w==;
X-CSE-ConnectionGUID: +xgXlXuYT5y8S4PDoEdBPQ==
X-CSE-MsgGUID: CfBXsEI1T/GfBOV/vyxYSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76322154"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="76322154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 17:34:07 -0700
X-CSE-ConnectionGUID: jF8LEfYERXqmdqLihqnMQw==
X-CSE-MsgGUID: 86/453vzRXCCfyEZQkXIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="149959629"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jun 2025 17:34:07 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMFbQ-0001OM-1r;
	Tue, 03 Jun 2025 00:34:04 +0000
Date: Tue, 3 Jun 2025 08:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/memory/mtk-smi.c:856:41: warning: 'mtk_smi_common_mt8196' defined
 but not used
Message-ID: <202506030810.jphtcjZ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   21fc2218c3dfde22b522a0352bb0112b85d0fe72
commit: 7b7b8970eff74cbf25bc36080d0f7ff5e4fd6ca3 [0/1] CHROMIUM: memory: mtk-smi: Add mt8196 support
config: i386-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250603/202506030810.jphtcjZ3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030810.jphtcjZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030810.jphtcjZ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/mtk-smi.c:856:41: warning: 'mtk_smi_common_mt8196' defined but not used [-Wunused-const-variable=]
     856 | static const struct mtk_smi_common_plat mtk_smi_common_mt8196 = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~


vim +/mtk_smi_common_mt8196 +856 drivers/memory/mtk-smi.c

   855	
 > 856	static const struct mtk_smi_common_plat mtk_smi_common_mt8196 = {
   857		.type     = MTK_SMI_GEN2,
   858	};
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
