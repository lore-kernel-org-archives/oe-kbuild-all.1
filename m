Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463BD2FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738211254; cv=none; b=jdZiq/zuGsFj0sxgaLMFOB8o4gqQPPRhv1lMpnEOOyhLeCSQtled8fMjc6UAFgBJV54n6rQO9jPcevTGjQjeCDWY+dK0ty5g/dJxkAmIiwrCm875TB4UVYFOxW/vVczV+t/Obyvv0ZRMwlIjH1PxNlrKz42fZqmWSjwpaWk/avE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738211254; c=relaxed/simple;
	bh=BCaIAuoY4+wgFo9QcXSHYfpH9uIpM+0gQlgW6XWcHzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDN1KN3j03jNqFpxIztwDlr9tIFFTfsA8SFl0JmplCP+uGbK5x6S3KZR5TINVXn7jE0DrUDCZxp2QI/vP0ofn37Wbxt1O0k58uB+qCu2sn50wL3L8Yt4JLvEEykF/PsScxNjpYMeHCOrQO3QNSnh24hM8CPij56e65iC5VNtCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6jctw58; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6jctw58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738211252; x=1769747252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BCaIAuoY4+wgFo9QcXSHYfpH9uIpM+0gQlgW6XWcHzk=;
  b=Z6jctw58We/yOHspGwPS3cvvde8yQQrpkdExpkqrt+7q7izJSuIwLiXK
   FsPEmoHadKJ+TFgwigNwl2cs2J1PPT1csO5ardbMt6c53DWypfiQ3pFuz
   nBfGQ3ugCknlzAw/wDw1cAYl6Fle89ZsFRxBrS2bntZDRRjjHBVuGREDF
   GywUvKmtctt2FQL0IZQ7j/SDNyBxxZdorSr651FXWOU4lMiqQ0MQSlXz3
   W/zUJ73R8Z4nAMeeMFUkdNfdYnfeEcaf2yp5BEEAd8a7/6FVawwnRO25a
   JxIZrFohmuRrwmrkz0EBg1jWi6s0WIauPQk8kON3hpwo9vODIfOkrDWKB
   w==;
X-CSE-ConnectionGUID: cp6HE8w1SUWYScKsEL6q3A==
X-CSE-MsgGUID: raLwqKdWSDqnMlWSQnUn8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49335495"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="49335495"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 20:27:32 -0800
X-CSE-ConnectionGUID: Ndh7A0DJQYmm5HVZs8oTow==
X-CSE-MsgGUID: fqeMxSXLSbanrKvrCgSnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140103288"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2025 20:27:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdM9I-000jfP-26;
	Thu, 30 Jan 2025 04:27:28 +0000
Date: Thu, 30 Jan 2025 12:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [djiang:cxl/fwctl 19/25] ./usr/include/cxl/features.h:17:9: error:
 unknown type name 'uint8_t'
Message-ID: <202501301237.wjZng8Sg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   a94a98755ebe43e2cf8fa8b60eb78c64f9d9bdce
commit: 2dad60b844396ca701a17305b9f67885c2cd9884 [19/25] cxl: Move cxl feature command structs to user header
config: x86_64-buildonly-randconfig-006-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301237.wjZng8Sg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301237.wjZng8Sg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301237.wjZng8Sg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/cxl/features.h:17:9: error: unknown type name 'uint8_t'
      17 |         uint8_t reserved[2];
         |         ^~~~~~~
   ./usr/include/cxl/features.h:43:9: error: unknown type name 'uint8_t'
      43 |         uint8_t get_feat_ver;
         |         ^~~~~~~
   ./usr/include/cxl/features.h:44:9: error: unknown type name 'uint8_t'
      44 |         uint8_t set_feat_ver;
         |         ^~~~~~~
   ./usr/include/cxl/features.h:46:9: error: unknown type name 'uint8_t'
      46 |         uint8_t reserved[18];
         |         ^~~~~~~
   ./usr/include/cxl/features.h:62:9: error: unknown type name 'uint8_t'
      62 |         uint8_t reserved[4];
         |         ^~~~~~~
   ./usr/include/cxl/features.h:78:9: error: unknown type name 'uint8_t'
      78 |         uint8_t selection;
         |         ^~~~~~~
   ./usr/include/cxl/features.h:101:9: error: unknown type name 'uint8_t'
     101 |         uint8_t version;
         |         ^~~~~~~
   ./usr/include/cxl/features.h:102:9: error: unknown type name 'uint8_t'
     102 |         uint8_t rsvd[9];
         |         ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
