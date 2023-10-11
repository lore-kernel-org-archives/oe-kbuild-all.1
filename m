Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11BA369
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 00:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2TheuIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696983101; x=1728519101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3jLU9aqB2RJBVcLlyr0gv8SiSxLQ8ss0otno3odaaY=;
  b=J2TheuIMkgXIdkhG2k0/M9eG0usDj/lhGZn4+0i38v8zDH7toniEsZkP
   i6ct+w0eUo4jX5FVdJe2JL9GBiRYADjoSQb2vtIMgSalMJ0N0sAAulAb2
   rhqnfaYbhYO20pWeWQTZrwETyHZwBMa57/FesrbEpnQ36w1X7JMuUHGPS
   7od6Tfg5Yy9/lW31hCAL/tbADtSyAZx77y4i7XCN6LXL6AER5uvU+dDyw
   LCkqxD6s9rbNuQbOrCx9qPgMOhcMH7qg/QDA4hGSXIehaEYZCBJKBZSE4
   bq2BJueoY7BtQUCewC7AqzuWaHvjgP5nR4+oLlSQ9ALelIaQ+RKtTLsm4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470810206"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="470810206"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 17:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897423327"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="897423327"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 17:09:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqMp8-0001QA-0k;
	Wed, 11 Oct 2023 00:11:38 +0000
Date: Wed, 11 Oct 2023 08:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lwn:docs-mw 9/27] checkpatch: WARNING: Missing or malformed
 SPDX-License-Identifier tag in line 1
Message-ID: <202310110809.ln6M6LFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-mw
head:   1fae02e7eb99fa8feba18ce444d8ce3546e6010e
commit: 1f597b1a6ec28f848fc236f17f246c4cac7aa8cc [9/27] docs: security: Confidential computing intro and threat model for x86 virtualization
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110809.ln6M6LFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110809.ln6M6LFd-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#49: FILE: Documentation/security/snp-tdx-threat-model.rst:1:
+======================================================

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
