Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF6F1A83FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275187; cv=none; b=fCSIK2Ciw1lHIsM754dyCpIYP42cbGpVBhmavRapcq3G5MFVU3qPoLfIuCMr6VUEn3k3nWOqM23GOzK3yYSAG/EyMbDHhb5hsjc0HSmWe27AwOsIytBq60fF96392HTi58QcjFqvp0lczGeYsflMrXh5l/do+u8RuCySoxJ1bWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275187; c=relaxed/simple;
	bh=aRNEwlvu1L0K1hpqaOu/EumwRq7lE59ql3ssXEe5IEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNcMrcyy8TFFZklGtcj5gZqQeeFfSiCWYHftsZLhfjqPGrseUMxq1BnFNNEGXAJlOFEB9Xpznz0TENEE1iJGHCQ5wYAtiWBBu1f2D9bPPwUDRm5+/dWYjYw603lHHyPJEL1pGiAddFktKgjZGB+8gQ4oHsST3PVodqCoqHhzoh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNWIeNuE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNWIeNuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738275185; x=1769811185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRNEwlvu1L0K1hpqaOu/EumwRq7lE59ql3ssXEe5IEo=;
  b=iNWIeNuEshgbz3BMe7GCz9CcdQ8Mb/N+G6ICwGZt44V1AtYayHZ98jGc
   YqBhTUJ9WHBkgAUFMNrPtlKzS8TNUGScW2UpSPxJRwALelZ3gWDPXU0nd
   PwXm4ApVn01q4WRT4FX/sW3QtK8aIAst/K4/X4L9bpuHaMskGu9TNUBMv
   lRW23/MdH4qi+GHLjaCqC8Dv5oZVqfOEY04BrKA3uO+nrTTaWffgW9CrT
   JJ9pTAVXwD2wC8KzGOJgwT6RndNjuzRoCfAk97EtbM/1SGdeYrYUVzWug
   05xOcvnMwpZOx1rTHVKgm4rKi2BmsajPGD71Ubj0BckxViS0l3r6rxWAX
   g==;
X-CSE-ConnectionGUID: SuMW+D4TTHat75NmoVdLfw==
X-CSE-MsgGUID: cOUZUHr6SVGMBw3oRr78lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49502646"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="49502646"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 14:13:05 -0800
X-CSE-ConnectionGUID: /gCVUzSgRMCe2sQertcuxA==
X-CSE-MsgGUID: fYJBorZEQeWWdjAQo5SB8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="140346820"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2025 14:13:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdcmT-000l2l-2B;
	Thu, 30 Jan 2025 22:13:01 +0000
Date: Fri, 31 Jan 2025 06:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-msiof-2025-01-30 2/2] Warning: Duplicate compatible
 "renesas,rcar-gen2-msiof" found in schemas matching "$id":
Message-ID: <202501310652.x58kYrVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2025-01-30
head:   d9a82c93cca8d2f5381062d77bbab0736dd6dc5b
commit: d9a82c93cca8d2f5381062d77bbab0736dd6dc5b [2/2] msiof
config: csky-randconfig-051-20250131 (https://download.01.org/0day-ci/archive/20250131/202501310652.x58kYrVE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310652.x58kYrVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310652.x58kYrVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Duplicate compatible "renesas,rcar-gen2-msiof" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a77995" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,rcar-gen3-msiof" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a77961" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a7791" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a7790" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a7793" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a77970" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a7796" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a7794" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a77990" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a7792" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a77980" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#
>> Warning: Duplicate compatible "renesas,msiof-r8a77965" found in schemas matching "$id":
   	http://devicetree.org/schemas/spi/renesas,sh-msiof.yaml#
   	http://devicetree.org/schemas/sound/renesas,msiof.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
