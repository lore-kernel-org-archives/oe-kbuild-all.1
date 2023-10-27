Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91323AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 02:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5iY5qtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698373377; x=1729909377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qh16vCpPEVWr45BgPugRiFS5uS7JwQVCKWphzi6LWQo=;
  b=A5iY5qtPX+UhT5esGj6tM/yfi1p5GI9ZFfxLt950Y91N5wAIC83NNhJJ
   R3dwXDG/6wPv/cRxkwB8CoOKShnu4bQk5wL9zkAK1G7sE7X6tOllO77+U
   ftOUlRtalkB5HqSrO8SDVjP0emBmHFCXaKcFl8l/vzDLATFndLuJdTQMU
   NCIBZKQO/Dhk2YjWNHmzdKuDK0yG5iPXFbWp0YfgS+t6r8mLQmNN5mCDE
   oXOWhVW3mmsJFvRnMcsSmXyrSNzIYw9TtN1AS1cTpzw1HSR+GmLzKE6G+
   GFjNpivd9J2+0FpitTk7dFHtX+Rea9IfXb9H4nnPWePYDNSsfKUzU+BCC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="451934724"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="451934724"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 19:22:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1006603269"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="1006603269"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2023 19:22:55 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwCUv-000AL1-0d;
	Fri, 27 Oct 2023 02:22:53 +0000
Date: Fri, 27 Oct 2023 10:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org
Subject: [linux-next:pending-fixes 188/225] htmldocs:
 Documentation/driver-api/cxl/memory-devices:454:
 ./drivers/cxl/core/region.c:1541: WARNING: Unexpected indentation.
Message-ID: <202310271027.qxOXN1YI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   68c0e1797270c7a6e3cf334a026e82964e90d90e
commit: 9f3899fd1bb5cf809964e06d86f28fe8b7643a00 [188/225] cxl/region: Calculate a target position in a region interleave
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271027.qxOXN1YI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271027.qxOXN1YI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/cxl/memory-devices:454: ./drivers/cxl/core/region.c:1541: WARNING: Unexpected indentation.
>> Documentation/driver-api/cxl/memory-devices:454: ./drivers/cxl/core/region.c:1548: WARNING: Block quote ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
