Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705FCA32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741923706; cv=none; b=nRO0QH4X7dlhtJEToZXfbkXu4qdsHr72RcleCvOV+XDXIA3KpAKpFl20ePxb74MSBCEMXNtOS3BH6tPVziyFXt0/r8l7UJ4EETgIEEOmycyvF4IztJp79B2OMgwoebMPcee4BpWktEKMa3PzkAkjli5H8VggD78PPNZVrELogYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741923706; c=relaxed/simple;
	bh=kye1X3Dpp4K/zX6FQPohAkgrXV4kEedbD0DsqN1zA9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmWoLUxMByg5uP8xLfQtCJYdjZVQu9bRXQqADkVHLmqfhKBLRSDRPS/QdNPqL571cQStkDZO7Ma5tc5Vg7l715kImHRt/NiXR48lwvVe/FlZ4K9k8LpjgBv1BTmHHxlG0QuE+hB5FzDHJZ7K0OL3NZysVyG4PSp5WYTcWa/KBk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=das/KjPE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="das/KjPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741923705; x=1773459705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kye1X3Dpp4K/zX6FQPohAkgrXV4kEedbD0DsqN1zA9A=;
  b=das/KjPEDhrbf3vXTnpS/m3TwTReXqot53EmcKR1kb3MPxjcwGcKZWFG
   AvsQ4f1avjpRXlPxvQqlAz7MH5x00QoliuxnHe0h/cIqFPcNBUjC8TaxY
   o0HDh4JAHIF9QJzxjBFfHTP772Jcvpw5zZZ7jzeWWefcDx4fixX6XL/cq
   ub6kMgOZBGWyga8vX8689naLXEWxEyNtMraDoGsymONYhBjBxeEspjGmD
   QCe7nliOP7wpdVPtJkLKdtkrVJZHzTGStrxap1tlw7DEaNIZnb5BBPywf
   qfCeBalBShVU1SQWq2GR0a9Q2zGzL9032B40INsZnTyMOVcVrohaYnRjU
   Q==;
X-CSE-ConnectionGUID: 2CVHUZ0xQ4qIziGEalz2yA==
X-CSE-MsgGUID: jSgIba1ORYi7txnR8GvzHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60466237"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="60466237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 20:41:42 -0700
X-CSE-ConnectionGUID: GPBgAL2AQomOCQRcMmB85w==
X-CSE-MsgGUID: /aagp2BLQwKZUoYy2GRHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="152083458"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2025 20:41:40 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsvvW-000A6a-0s;
	Fri, 14 Mar 2025 03:41:38 +0000
Date: Fri, 14 Mar 2025 11:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 6/155] util.c:undefined reference to
 `__umoddi3'
Message-ID: <202503141157.4VJTnbcn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   1bce9e8f555efddfc701efbcb50af1c0728587bc
commit: 9c18ea7ffee090b47afaa7dc41903fb1b436d7bd [6/155] bcachefs: bch2_get_random_u64_below()
config: i386-buildonly-randconfig-003-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141157.4VJTnbcn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141157.4VJTnbcn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141157.4VJTnbcn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/bcachefs/util.o: in function `bch2_get_random_u64_below':
>> util.c:(.text+0x1a6e): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
