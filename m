Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD06A1DA4C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 02:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726711931; cv=none; b=Gx2j1fV1nZVljUAQxSo4iegra7mtP+t8tbWoIefhpSAVd7ETMJ+3ThN9KYCfaTIgZDCz7BbQopKKjqlPzhx1BLh55n04wZ9m6ZW3HwFLujXLff1W7j/RXu0poFeCSJRRwlmbL8idTujZ73HT9N8qhiSK9/BhOHaAP3EYsC12xXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726711931; c=relaxed/simple;
	bh=mJq/xzYe2+9feJme3GujHfgEecKDaVqsOc6FRQI9Dz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=szUBKqFRFMhOKYBDthkcrR/1iJfjWmlISOCDeoQMqsTU0MKF1dcW7Pwc3gRcu8e53C7NUl7dw6q6JCwTBu/fTeaaGq3a5u6Z8sFf8etvXoR3zo6U+O8gbq4V3yFXDFsxr3hNU/XuLrCE4B9p2/pdZ21o/2khBTNzEO/mcptia34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bnlxv7gz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bnlxv7gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726711928; x=1758247928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJq/xzYe2+9feJme3GujHfgEecKDaVqsOc6FRQI9Dz4=;
  b=Bnlxv7gz405sooN1MFrWtQcoHuCfgg/2pzV/lllEbzuEjZttNivVW0bS
   gqGzePyD1od1BAW/W4HiaaIIksd39Tzp4dMzYyRj4KQp5aMQ2E8PsFKhd
   bQo0YbtT+6+33hHvUXczu7PgpiMnnBTXcQiLcw8tq7ifLg0IRyF9/eAs4
   AdLVLfeuE7etf8nRnnvhVZaKsNq25zSzQKqtloN6Q+z9OFhpg9MCSfAIV
   TU48X/9FH/ZIxknWIq943yb2mPcMVrwQ4uNCOfV57fB/ZNaalnLW8CeA0
   2iPI2k7Hgoiyk4C36KBvXfz29TBOTWgtwpiphMG9kHHUNSKWpTA/lkHLX
   g==;
X-CSE-ConnectionGUID: a6OEiPFpRP2DtBq/FJH2ng==
X-CSE-MsgGUID: /sjx67ADSNW2euvuNw/O+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36322057"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="36322057"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 19:12:06 -0700
X-CSE-ConnectionGUID: FjhW4PYqRTyxIbRxMm8YZw==
X-CSE-MsgGUID: nqYkEslGSoGv0J0TFCYibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="74549113"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2024 19:12:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr6eI-000CoS-1f;
	Thu, 19 Sep 2024 02:12:02 +0000
Date: Thu, 19 Sep 2024 10:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5a 67/96] crypto/tcrypt.c:1443:9: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202409191059.B3f9WTVK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5a
head:   3079cee00bf8a364b3e9bfc570420ed3f37c5250
commit: fcfc4c3cafc46f7cea949dd3f76b4225ef53f33a [67/96] dyndbg: move flags field to a new structure
config: parisc-randconfig-r132-20240918 (https://download.01.org/0day-ci/archive/20240919/202409191059.B3f9WTVK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240919/202409191059.B3f9WTVK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409191059.B3f9WTVK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
>> crypto/tcrypt.c:1443:9: sparse: sparse: Initializer entry defined twice
   crypto/tcrypt.c:1443:9: sparse:   also defined here
--
   fs/affs/dir.c: note: in included file:
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/bitmap.c: note: in included file:
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/inode.c: note: in included file:
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:255:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:255:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/namei.c: note: in included file:
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
--
   fs/affs/amigaffs.c: note: in included file:
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/file.c: note: in included file:
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:255:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:255:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   drivers/md/raid5.c: note: in included file:
   drivers/md/raid5.h:271:14: sparse: sparse: array of flexible structures
>> drivers/md/raid5.c:426:9: sparse: sparse: Initializer entry defined twice
   drivers/md/raid5.c:426:9: sparse:   also defined here
   drivers/md/raid5.c:104:9: sparse: sparse: context imbalance in 'raid5_quiesce' - different lock contexts for basic block
--
   fs/overlayfs/namei.c: note: in included file:
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
--
   fs/overlayfs/util.c: note: in included file:
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
   fs/overlayfs/overlayfs.h:317:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:317:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
--
   fs/overlayfs/copy_up.c: note: in included file:
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
   fs/overlayfs/overlayfs.h:317:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:317:9: sparse:   also defined here
   fs/overlayfs/overlayfs.h:370:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:370:9: sparse:   also defined here
   fs/overlayfs/overlayfs.h:373:17: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:373:17: sparse:   also defined here
   fs/overlayfs/overlayfs.h:230:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:230:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
>> fs/overlayfs/overlayfs.h:284:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:284:9: sparse:   also defined here
   fs/overlayfs/overlayfs.h:317:9: sparse: sparse: Initializer entry defined twice
   fs/overlayfs/overlayfs.h:317:9: sparse:   also defined here
--
>> drivers/mtd/mtdpstore.c:76:9: sparse: sparse: Initializer entry defined twice
   drivers/mtd/mtdpstore.c:76:9: sparse:   also defined here
   drivers/mtd/mtdpstore.c:66:9: sparse: sparse: Initializer entry defined twice
   drivers/mtd/mtdpstore.c:66:9: sparse:   also defined here
   drivers/mtd/mtdpstore.c:66:9: sparse: sparse: Initializer entry defined twice
   drivers/mtd/mtdpstore.c:66:9: sparse:   also defined here
--
>> drivers/vhost/vhost.c:1356:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1356:17: sparse:   also defined here
   drivers/vhost/vhost.c:1364:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1364:17: sparse:   also defined here
>> drivers/vhost/vhost.c:1356:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1356:17: sparse:   also defined here
   drivers/vhost/vhost.c:1364:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1364:17: sparse:   also defined here
--
   drivers/virtio/virtio_ring.c:336:29: sparse: sparse: self-comparison always evaluates to false
>> drivers/virtio/virtio_ring.c:1453:17: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:1453:17: sparse:   also defined here
   drivers/virtio/virtio_ring.c:1527:9: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:1527:9: sparse:   also defined here
   drivers/virtio/virtio_ring.c:597:17: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:597:17: sparse:   also defined here
   drivers/virtio/virtio_ring.c:698:9: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:698:9: sparse:   also defined here
>> drivers/virtio/virtio_ring.c:1453:17: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:1453:17: sparse:   also defined here
   drivers/virtio/virtio_ring.c:1527:9: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:1527:9: sparse:   also defined here
   drivers/virtio/virtio_ring.c:597:17: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:597:17: sparse:   also defined here
   drivers/virtio/virtio_ring.c:698:9: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:698:9: sparse:   also defined here
>> drivers/virtio/virtio_ring.c:1453:17: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:1453:17: sparse:   also defined here
   drivers/virtio/virtio_ring.c:1527:9: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:1527:9: sparse:   also defined here
   drivers/virtio/virtio_ring.c:597:17: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:597:17: sparse:   also defined here
   drivers/virtio/virtio_ring.c:698:9: sparse: sparse: Initializer entry defined twice
   drivers/virtio/virtio_ring.c:698:9: sparse:   also defined here
--
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
>> drivers/power/supply/bq27xxx_battery.c:1136:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1136:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse: sparse: Initializer entry defined twice
   drivers/power/supply/bq27xxx_battery.c:1117:17: sparse:   also defined here
--
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
>> drivers/mmc/core/core.c:892:9: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/core.c:892:9: sparse:   also defined here
--
   drivers/mmc/core/sdio.c: note: in included file:
>> drivers/mmc/core/quirks.h:245:17: sparse: sparse: Initializer entry defined twice
   drivers/mmc/core/quirks.h:245:17: sparse:   also defined here
--
>> drivers/usb/class/usbtmc.c:812:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/class/usbtmc.c:812:9: sparse:   also defined here
--
   drivers/usb/host/ehci-hcd.c: note: in included file:
   drivers/usb/host/ehci-q.c:1386:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-q.c:1386:27: sparse:     expected restricted __le32 [usertype] old_current
   drivers/usb/host/ehci-q.c:1386:27: sparse:     got int
   drivers/usb/host/ehci-hcd.c:568:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-hcd.c:568:27: sparse:     expected restricted __le32 [usertype] old_current
   drivers/usb/host/ehci-hcd.c:568:27: sparse:     got int
   drivers/usb/host/ehci-hcd.c: note: in included file:
>> drivers/usb/host/ehci-dbg.c:275:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/host/ehci-dbg.c:275:9: sparse:   also defined here
>> drivers/usb/host/ehci-dbg.c:275:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/host/ehci-dbg.c:275:9: sparse:   also defined here
   drivers/usb/host/ehci-dbg.c:266:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/host/ehci-dbg.c:266:9: sparse:   also defined here
--
>> drivers/usb/host/sl811-hcd.c:291:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/host/sl811-hcd.c:291:9: sparse:   also defined here
   drivers/usb/host/sl811-hcd.c:283:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/host/sl811-hcd.c:283:9: sparse:   also defined here
--
>> drivers/usb/misc/legousbtower.c:281:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/misc/legousbtower.c:281:9: sparse:   also defined here
--
>> drivers/usb/misc/iowarrior.c:249:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/misc/iowarrior.c:249:9: sparse:   also defined here
>> drivers/usb/misc/iowarrior.c:249:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/misc/iowarrior.c:249:9: sparse:   also defined here
--
   drivers/usb/serial/generic.c: note: in included file:
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
--
   drivers/usb/serial/cypress_m8.c: note: in included file:
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
--
   drivers/usb/serial/io_edgeport.c: note: in included file:
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
--
   drivers/usb/serial/io_ti.c: note: in included file:
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
--
   drivers/usb/serial/garmin_gps.c: note: in included file:
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
--
   drivers/usb/serial/kobil_sct.c: note: in included file:
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
--
>> drivers/usb/serial/quatech2.c:216:17: sparse: sparse: Initializer entry defined twice
   drivers/usb/serial/quatech2.c:216:17: sparse:   also defined here
>> drivers/usb/serial/quatech2.c:216:17: sparse: sparse: Initializer entry defined twice
   drivers/usb/serial/quatech2.c:216:17: sparse:   also defined here
--
>> drivers/usb/serial/ssu100.c:140:17: sparse: sparse: Initializer entry defined twice
   drivers/usb/serial/ssu100.c:140:17: sparse:   also defined here
   drivers/usb/serial/ssu100.c:153:17: sparse: sparse: Initializer entry defined twice
   drivers/usb/serial/ssu100.c:153:17: sparse:   also defined here
>> drivers/usb/serial/ssu100.c:140:17: sparse: sparse: Initializer entry defined twice
   drivers/usb/serial/ssu100.c:140:17: sparse:   also defined here
   drivers/usb/serial/ssu100.c:153:17: sparse: sparse: Initializer entry defined twice
   drivers/usb/serial/ssu100.c:153:17: sparse:   also defined here
--
   drivers/usb/serial/ti_usb_3410_5052.c: note: in included file:
>> include/linux/usb/serial.h:388:9: sparse: sparse: Initializer entry defined twice
   include/linux/usb/serial.h:388:9: sparse:   also defined here
--
>> drivers/gpu/drm/display/drm_dp_helper.c:492:17: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/display/drm_dp_helper.c:492:17: sparse:   also defined here
   drivers/gpu/drm/display/drm_dp_helper.c:495:17: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/display/drm_dp_helper.c:495:17: sparse:   also defined here
>> drivers/gpu/drm/display/drm_dp_helper.c:492:17: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/display/drm_dp_helper.c:492:17: sparse:   also defined here
   drivers/gpu/drm/display/drm_dp_helper.c:495:17: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/display/drm_dp_helper.c:495:17: sparse:   also defined here

vim +1443 crypto/tcrypt.c

3f3baf359dd3cc Jussi Kivilinna 2011-10-18  1438  
01b323245e4f6d Herbert Xu      2008-07-31  1439  static inline int tcrypt_test(const char *alg)
01b323245e4f6d Herbert Xu      2008-07-31  1440  {
4e033a6bc70f09 Jarod Wilson    2009-05-27  1441  	int ret;
4e033a6bc70f09 Jarod Wilson    2009-05-27  1442  
76512f2d8ca5e6 Rabin Vincent   2017-01-18 @1443  	pr_debug("testing %s\n", alg);
76512f2d8ca5e6 Rabin Vincent   2017-01-18  1444  
4e033a6bc70f09 Jarod Wilson    2009-05-27  1445  	ret = alg_test(alg, alg, 0, 0);
d6097b8d5d55f2 Nicolai Stange  2022-02-21  1446  	/* non-fips algs return -EINVAL or -ECANCELED in fips mode */
d6097b8d5d55f2 Nicolai Stange  2022-02-21  1447  	if (fips_enabled && (ret == -EINVAL || ret == -ECANCELED))
4e033a6bc70f09 Jarod Wilson    2009-05-27  1448  		ret = 0;
4e033a6bc70f09 Jarod Wilson    2009-05-27  1449  	return ret;
01b323245e4f6d Herbert Xu      2008-07-31  1450  }
01b323245e4f6d Herbert Xu      2008-07-31  1451  

:::::: The code at line 1443 was first introduced by commit
:::::: 76512f2d8ca5e68160f4df0dead5e8e7b4bdb08e crypto: tcrypt - Add debug prints

:::::: TO: Rabin Vincent <rabinv@axis.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
