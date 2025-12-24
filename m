Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBDA1A00F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766566615; cv=none; b=JH3qekxSpGf4DCkxLjWEwYujrF7YekPy3N+2iGAWtGw+gYpJwrLsKkTAyh4AtW2OF03AM4HB/RYmMlymrTMiA/TuVE14TtemRxJzk4O7qWLPhKh1/P7pbz9daRGYJ8xElhTC1kfEAUD/ubPLdVSbr/j8iHnyGSHoEarjRBAe+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766566615; c=relaxed/simple;
	bh=so2owS4XLQkiVBZDYTkDDlfgk8WuRWP+JqK6hne0N2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qiE4YzGjISDQmvcMesSW+lI1RIHB02ZQJYyo4pKaUwtNWVIooivmHMIyFKK9lu40iDVzVZxjanhvmQgVYcAF1yLIzizqOM9WCIfKhUsG++vSWmZAC5qBe/xKqPepfMI7hKVIMk8vL6ecNOULJrR3U+Ka9jH06OnmYEeQtwmiQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLvLu8pj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLvLu8pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766566613; x=1798102613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=so2owS4XLQkiVBZDYTkDDlfgk8WuRWP+JqK6hne0N2M=;
  b=ZLvLu8pj6PG+GuXRZSvBhlH5n8bW67YNduuHJk1dN5AXr00h4POnMWIZ
   C7i+MqYpvQQRgyYap/W9vWIeFSa+G3p5NjLVnJEnpDKRMDLDZCj9owI+B
   eQoFxn09rjheKGnqlSpY35H6hMdQdRIb3PM5WS+IuDZEujKwoA4SbcIRy
   vJXnUGe16O9Nhx3suXz840GjqT6Zg70G3mxcG1AmBTuRadLGF0zRd5HSk
   w9tww7XIMaeEFmn3BA/csmW24Tt9R+oCgusHKYmgqgZUKrEcM3zavd7LY
   vIh/DfKpoIV30XsIaLkbUn5/1eX32+4MY9Vi4iL3KrEL80NMj3bgN/qu4
   w==;
X-CSE-ConnectionGUID: h1QFr4p+QeKA+hF0//JtYg==
X-CSE-MsgGUID: y4ppPiQUSjqtVr8YADY8FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79770070"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="79770070"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 00:56:52 -0800
X-CSE-ConnectionGUID: KU1KZ4M9QaacIl/IbF+1Iw==
X-CSE-MsgGUID: E2drWKrRSKyTm4Twe/A6Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="199636358"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Dec 2025 00:56:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYKfp-000000006B2-1Hwy;
	Wed, 24 Dec 2025 08:56:49 +0000
Date: Wed, 24 Dec 2025 09:56:43 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring,
 error parsing file
Message-ID: <202512240916.s1OpFy3F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5453f12f6799d8f600197663a7bf7039c2e0dd7e
commit: f51d1788938f74dab42d10114f59a836b44d1823 [2/2] ANDROID: dt-bindings: CMA support for Virtual Machines on Gunyah
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240916.s1OpFy3F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240916.s1OpFy3F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240916.s1OpFy3F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring, error parsing file
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())
                ~~~~^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/mk_schema.py", line 28, in main
       schemas = dtschema.DTValidator(args.schemas).schemas
                 ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 399, in __init__
       self.make_property_type_cache()
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
