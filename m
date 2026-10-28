Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191918;
	b=o7gDb5AF1UXZjqv74KV0uGuvMzgCdORkr9Vkp8oDngpNsOf9IlA9sibrZTWGR6v+w004
	 9Tq5DuA7+65aZBYiHCgaO3RNx6vPiVbF9/BB6TUk9rfbV0MygtrbtabWHJmACGU3ysODN
	 5+Fh09DIgPhEZyPGbqfo5MtDo+Vcjah1SdBU7zGMQersAuOsVVL2BiJDyQGNv8vtO9LdB
	 fzkSbRzFLLoxBPcPfB7rw/RfIC8Vksa1bn1yDT4IS0cKzxt3QJp5S3tofxJAFtuuMnb/v
	 fFDjlFRFAMyrcCdBlH/Q0SXdycPc6YQnvPmWW9bgxxpYhdZqm3jFc7jyupcznBP1IDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191918;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HRRbvGnkd4wy7yKZ7D4+Ao5BkplNm54OI8TE9z6tQ/U=;
	b=3qJaxDGV3uCVf5+s6TZAhiuJyRt1y3/NgkkpiZBOeirbgXdELjFq2mlKI6RqDx2oycxK
	 6eknPiPtPejWcVgURwzPIPxHx2s2x3Nw/GE711cwSatLkysrvV/6Drp608qw09OvLMmcd
	 t0HAfDhWOJcOVYDkxHh96UibD3NNdmYxhQWPy9+Ef8Mg8FAm3BbbgzwE8nk/lbsCpctIk
	 NmNDsx1Kz/aGzbuhr/QLsOk7otbyDNMO7L4wPaLKW3eahR8nbYhcjS31oqRL2Zb3MRr/I
	 YTdn/v8fZRfL3rYaV/joUGkCCT4Q8s7ep0nrq7YtVraa5XeT6xJ9V24PbsXCQizh+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLw1UA71;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F864606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 12:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F864606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLw1UA71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793191916; x=1824727916;
  h=date:from:to:cc:subject:message-id;
  bh=OeFluu4HJmFPcOfDi+G4Ptx2d24XgiXAE/M7dd0gk14=;
  b=nLw1UA71pI8psEFxxR9/opF8A/I8GGdDmpLCq+/g3ekx60CDdC/9FqZy
   yhj58ADxES+CFWKGCftiBFu8vMvot4MADEVkUHjvorzBe8BckH7s5BOCB
   GAPRaD7gnEpC6lcEHuFdUP56qL0xcwxQoSURf1sDbYeLH96f9eHZKCDsZ
   y9xkRafxq9RjTFJvkX9cZJBkjOtPDLpcV/uZ9Jmhx2+LP/g0GeKzw4R/3
   SoXAjpVASgzliy/QIrWA9UwHkrUgRxLp0+5wjC3u3E1KdUXfnBOhDH2CY
   RNk+1r1Lkpw+FrRcrpmxJR/viMp/xLP9OXa1XderYHn4f2/KkTis081+m
   Q==;
X-CSE-ConnectionGUID: /79fSpS3RSWrnqhMLSAcJw==
X-CSE-MsgGUID: J9gDmUbLQSG1cUweXV/O3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1922830"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1922830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 05:51:56 -0700
X-CSE-ConnectionGUID: 69ZIZ90FRpm5hBGt6N/Llw==
X-CSE-MsgGUID: P7nNqhVDRriRxQ8t7ipJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4769150"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Oct 2026 05:51:55 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM38C-000000004rr-2ntp;
	Wed, 28 Oct 2026 12:51:52 +0000
Date: Wed, 28 Oct 2026 13:51:26 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9]
 ./include/linux/iommu.h:1152:17: warning: 'iommu_get_pasid_from_domain'
 defined but not used
Message-ID: <202610281354.OaDqIDLG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e404899677bc470e620572471a562f09ea3de082
commit: ae98886a907851615758c891a5e488f1add0c69d [9/9] iommu: Add a helper to do PASID lookup from domain
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610281354.OaDqIDLG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281354.OaDqIDLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281354.OaDqIDLG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/pci-dma.c:4:
>> ./include/linux/iommu.h:1152:17: warning: 'iommu_get_pasid_from_domain' defined but not used [-Wunused-function]
    1152 | static ioasid_t iommu_get_pasid_from_domain(struct device *dev,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommu_get_pasid_from_domain +1152 ./include/linux/iommu.h

  1147	
  1148	static inline void iommu_detach_device_pasid(struct iommu_domain *domain,
  1149						     struct device *dev, ioasid_t pasid)
  1150	{
  1151	}
> 1152	static ioasid_t iommu_get_pasid_from_domain(struct device *dev,
  1153						    struct iommu_domain *domain)
  1154	{
  1155		return INVALID_IOASID;
  1156	}
  1157	#endif /* CONFIG_IOMMU_API */
  1158	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
