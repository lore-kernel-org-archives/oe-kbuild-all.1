Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA2E5BAF0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546200; cv=none; b=nt0uJ4BoDv0tDitZDBy8S3bQewlqZZi8SJu5lG0Ezw+7HgCnVCBjVWnh7wfR3WWbnBHFaCs2o2ejfVKBUhIymOfIZsZAPZmqvD6y/nBW/tmRBCP+r6n5ySzEaLciWtp2WBB5NjyCpyh064DSgd5rmC6FR2mrGHUg2vcAstT/AG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546200; c=relaxed/simple;
	bh=Nw3WCXpt4jOzztfNgptMGy+V8DKs5hTXA8VEG0h7lGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRL22wHYLMAKQa6LkoC7L1lbRg7oaFI9azpC2FG++y5QhFdHP6QQrALUuP5aN4XU7PBw270DVe6K5qcjSfY/liARagK6xHDP1nwgQvfUYLVxdcRsX/uoRmNUoh0afv20Rq9WADAoBdbn5awbmEHEpqlwXYvYWW9uoT8KWSxKsHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fa67I1gy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fa67I1gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754546199; x=1786082199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nw3WCXpt4jOzztfNgptMGy+V8DKs5hTXA8VEG0h7lGY=;
  b=fa67I1gyGZUwTapVvytpAKy2vwQxpNxFAbCN37hSOOmC14NrcLD5xWy+
   0VsRaHgloRBL5ft6UFCUYTB+OhBAHa7udCAVSXYIxgCUDWe3fjXsJA1dA
   RDeUVq0PrXnf7o4Q3yzo7lAUPpQFf3nor5mh703hituG3oVlAdKOI5rqk
   OQEPwGLNV+cXJl1H/tgfmfTCj70r7KgP21zwgc/Qfh0mVcS0boxLQpPdI
   3+Kvr+inM48NAzd7Apl3ioVBs7nYpWVfGVLTXUyGlLT341hovAyu7llVo
   tyxL6L3lJ7AnvY0eq4PsHdutNKc9sZiLvMBmTPm4edfLgEBbaZLGoOpwP
   w==;
X-CSE-ConnectionGUID: qRl//JVqTN+QsMfZN1wlew==
X-CSE-MsgGUID: O4Rn3sZzTRm/Ubh3akxpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74331538"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74331538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:56:39 -0700
X-CSE-ConnectionGUID: 8NhGMF5rQcqM8c7xVi3r2g==
X-CSE-MsgGUID: wNnNPYj4QZ2JNOkJg+Nf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164495100"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 22:56:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtc7-0002RO-25;
	Thu, 07 Aug 2025 05:56:33 +0000
Date: Thu, 7 Aug 2025 13:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 58/801] Warning: Duplicate compatible
 "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
Message-ID: <202508071313.3V0z2UUn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 6889ef7546a877bc3f226805c3816ec7c59b3187 [58/801] dt-bindings: clock: Convert marvell,armada-3700-periph-clock-sb to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071313.3V0z2UUn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071313.3V0z2UUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071313.3V0z2UUn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
>> Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":
   	http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
   	http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
