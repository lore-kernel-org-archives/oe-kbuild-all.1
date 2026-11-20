Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148457;
	b=rRDX3gS/1ikwpustZzMY5t1WKHAqQ8ap2ID2Z+BwFaxYfJY5RYeIsxakNUgZbDsyNH1C
	 th+VzISQ/b3OO4zXKbQ2vKcPm0xTPan5PM033NZBa7mwZMhvogTc+xAK/mJHa1Ic+N34k
	 8SPjhiM1N2nmIFpv6OTJ/sRtoqwH6KoXwqd6ZXp3CyQx+ao+gRkC7RgAyAu0dbd4+whB9
	 kw+c7BPpE4Ry3Z5Mkenvhx6EPz/V5jBqmV+KLCv2f2FAfOmWbPDNe6qDua6U0hkTg6Ffv
	 fZvx5i4Ts0NgRYXsNQDqx8e1ESSKi19BxH/MaK6fI6UxM/68PV8ImRszfsCfbVmONbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148457;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=U8vZ3RscFNEIN8HBGlNzyJ8ZnCYLwqUGWGvB6ZCcBwc=;
	b=IUrVp/TIgInVKHOlr02vWsr2ibjSV/Z6yFVRqLXNLhPIE4ff0+T6OIsW6jTu9uPb7DBb
	 7EvanCSEjEEMKOX8cWuNquxegEWD1IS+ZdC+Rnj349bdq+4jYIkLtzP4BLsIA1IleJZp8
	 oV2sF0q1GY4shvG9Ud0smHXOj/bsNsDqh/xsiovFGABxqzJLKSXmRCcCyTTUikmxvUwjD
	 5UXYHEQmt/L3VD2JK5TnqE6mst27r8zySCXKHEhH+nIyYJBOJfn0+deFazM0fUbkH1KQD
	 pmtYAzXy//Xqa8dSkSZl1ChjKs5zMY2Y9PKd0hAJx/s+DP2HU6yGqXEy2/PTqU5oSAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F0aAuHUr;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6C606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 04:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A6C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F0aAuHUr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795148456; x=1826684456;
  h=date:from:to:cc:subject:message-id;
  bh=SDQYkQvrMArph21jwwh0H72br3P+iEsvUWvZapOAoVY=;
  b=F0aAuHUrFt/dU7yixKZEUYdjdg3+34VW3YjFAjinQ6Tem29Wez5RR9bu
   BTHfOJ+XX2a3t/m9lvuttcaHCMYaLtEq9CboFFPKmSLYif4JwVtSKzNz3
   CxRQURGmYyImWeReuRCJhSF2ZcE1wJ69aJ6oGMvaWmLAl4FUc3cI/JluM
   Ayhb5eklJqLB0dgCN0nBTg0aaiRG9TRh4nj64mHNmLlZwlG++eGTk5/1l
   PDETnDaTRfOQkspMc1nc9S68tDKte1Xl68K+yxwguLyMV7dD4jAXyCR/W
   9c92xqJgSQRk6M4B1ONRQv6HwIYRFjZ6nl7QohjdRublgGLK2FvGyqatn
   Q==;
X-CSE-ConnectionGUID: v+MprAJwSSurTuLxXe12LQ==
X-CSE-MsgGUID: XP8TgzWhRQem6HbR2HaHeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3903965"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3903965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 20:20:55 -0800
X-CSE-ConnectionGUID: mUhYl1kRS2CuAajjZsbFYA==
X-CSE-MsgGUID: hspnDBmKSZ2EwXKsXOfD2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10834151"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2026 20:20:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUG7G-000000003wn-2GO9;
	Fri, 20 Nov 2026 04:20:50 +0000
Date: Fri, 20 Nov 2026 05:20:48 +0100
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [btrfs:pr/1630 14/90] {standard input}:66762: Error: operand
 out of range (0xffffffff not between 0 and 0x3f) `l.slli r7,r28,-1'
Message-ID: <20261120051235.MZR0XhHJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/btrfs/linux.git pr/1630
head:   f2805cb657ae9d55652ad04da371371c7fdf7f5b
commit: 439c95be8c857a2db105d7b176d3597c92798dd4 [14/90] btrfs: add a new 'stripe_len' parameter to btrfs_stripe_nr_to_offset()
config: openrisc-randconfig-2000-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120051235.MZR0XhHJ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120051235.MZR0XhHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120051235.MZR0XhHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:66762: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r7,r28,-1'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
