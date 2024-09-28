Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D014A1487E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727511908; cv=none; b=JOC5Sw1Ii8fnHMSUbySHHj/ZFUQb1NeLmQ3oNneOFLHaLwEk6l3fh3Dw413vuzJ/Mss1rQvVMDLI9TbVadmZM6hXq508kDr87L9l6qRNhBRcCg6kgnqgM8n/IiJB94NGeWrmRmFxcKuxhCq5EfmfxPbe4cbmWUUwN/Sz7Aa0zrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727511908; c=relaxed/simple;
	bh=tHcrgZCFxqVdjnac38mq9YidsKyR9R5+AZMnzTFd8S0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCYpaV9Yvursq/pKofVNPvEED8CPfd0LZgnUtQylvMkgnRiS0elFag+iFocsj2gQodJweW7p84t0IqbJngk4SxJowv29KfPya9BWSI/CJCC/Co2bjgbAU/YaLWFAIFMlZaKnveLzZhyI4hvRtWTyVR9zu49r7r5xpD6M4cEZdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI+KO9Yv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI+KO9Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727511906; x=1759047906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHcrgZCFxqVdjnac38mq9YidsKyR9R5+AZMnzTFd8S0=;
  b=QI+KO9YvLObDtywereqHE7kBeb0YfoIFchRKbtfOyOWkIAbBEde2DmLU
   2Vtxd/Yd3emdI37FRolxjmL4i4gfRGCctiyf7bH24/2panaYDyGKpHwgW
   yo9aJtlM/jHMef4WonkyKecTlvprKfovFCYK2FzeWdBRpJAn8a7N0Z8N2
   2DeHAno7XkiCxk8I40lTONsamZ1+Iq7oVKYgA47mE4ttPcvc4+eBjro01
   nqDvgvrPfciBKwkY10fp2Wgna6PjAVKoQ6UDqch/qV36CPDh3TjvmKwM3
   hUNdYAYrr2adFlK3JvSdgA2LvD/3035V3Lfsn/9IHJAGUb5LzihlqNbV8
   Q==;
X-CSE-ConnectionGUID: fG050Ry3StKWANjfdjx33w==
X-CSE-MsgGUID: 92pvpi2NSYqgiLaf5XffuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30547192"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30547192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:25:05 -0700
X-CSE-ConnectionGUID: WEJl7AqiSvaWHiNZBA8P6Q==
X-CSE-MsgGUID: XyeLxxhBQ32TiBTlWyQTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103578911"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Sep 2024 01:25:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSlC-000N23-0D;
	Sat, 28 Sep 2024 08:25:02 +0000
Date: Sat, 28 Sep 2024 16:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 104/16788]
 drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous
 prototype for 'report_to_audit_notify'
Message-ID: <202409281648.cm2MetjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 81a1a8eade1c5d83dbf1fc9bad8f385ea60f3f26 [104/16788] SSI-87: soc: imx: secvio: Report to audit FW all security violations
config: arc-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281648.cm2MetjL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281648.cm2MetjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281648.cm2MetjL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-audit.c:11:5: warning: no previous prototype for 'report_to_audit_notify' [-Wmissing-prototypes]
      11 | int report_to_audit_notify(struct notifier_block *nb, unsigned long status,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/report_to_audit_notify +11 drivers/soc/imx/secvio/imx-secvio-audit.c

    10	
  > 11	int report_to_audit_notify(struct notifier_block *nb, unsigned long status,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
