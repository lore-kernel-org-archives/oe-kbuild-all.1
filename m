Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811368;
	b=3cqF2IDRfTsPlgria9NHlcjVtJdYf1pZ6C7hIMEa833iY2eXfBjod4KbyXq39r6Siy0a
	 J2WhhQ/MgcaKC5vOpem/6QVp50Df/BXjsRTYNFAwdlhZPqc2uw1H/1k2wVlmBLZ67gvyW
	 0T+buOoduutDwDfnZBFSw9v3w+DGjLs/ylPypyNsZDnMqiWviwxiECt9T873Td3tSzFY8
	 o43rTm3OZcWJN+lvWaCTv6UelXddDtHF2ZfBi454tlkl+3qMHCBB6nBojl9L2oD8WDMub
	 p27GPs+ysnjwXuZAEJJ7mgNiMpzo7KgSnB9bpDjhTPFkqFr9u6uiZl7Rvt3gbydlocA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811368;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QrSTBTKVvZvoBoFexX/f4J3BHiAFxWl31SsP22PpZo0=;
	b=LRP3HO4X/cml5aQTT7XAJgsgc9GjoWk/KeHXh8ukXS6zM3MlaFCq+kpY8f2vDTF9jwYF
	 IV4pBMJy5AOq/cpgyOwt9/618vAug9TQBKHh136jFJFtJKEq9a5XBP9UhlWmqcQ61LqiM
	 inp6uidy8XWvX+1DGxapkOdop+wr2OTPh2kvm4izvLvprJnV7TWRYC+JEvrlz0C40egqc
	 pi5SshpgJAlslIFfVTuxOqL8PD3u5Idn7fwHbK+CEEScPJt//jOB8dSvJxbl021wLRc2P
	 TywJrICAg62JbYFWXLxSAIEFRBZd5bhT7YH1cxsHtmr3jS29sEpKIIqMvh33hjBm12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FeHvdPts;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A04606A339
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 16:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A04606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FeHvdPts
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793811367; x=1825347367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GTK/899l7asGH7qQ7lG5p4rVflx34u2LUv1LGQrqB4c=;
  b=FeHvdPtsFUAN4gPRVyD8kRvRGJuFHnGQNZY1lXCgnwAAsH+eLmUtg9Oq
   ay7aBFBzZ9cyFM7q0e4XhtE++NNKsLIDe2gHJDVKqmw7Iljm3h9F46efo
   sU4sG+/BsqVsXbyuxoRHqatGm7zT43hfIqJWXb+Xt4qR9u5bs6tkX8BSD
   OhC2qbUqJowxAH0+3tDTYu40Fu3YVWMgk1pTzsGYJcWbdQQTDx3qcm1tq
   mF/QoiAHIFkgmT6hiR023Um8zrVyKa3Z5l6LmHcS2+v2bp52HNt0OFdt3
   YHp6AyEcV7L9PngbifCUnTAt68ursZzGaDCkr+kljbQ8pG7OSjPcvDqlL
   w==;
X-CSE-ConnectionGUID: 1IOn8pPXQrC9t7JQIT2tWA==
X-CSE-MsgGUID: gg3V+KLGT5ON+ns7fAk2KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2589122"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2589122"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:56:06 -0800
X-CSE-ConnectionGUID: qSb6qxkRR6WdnL/CDg7/yg==
X-CSE-MsgGUID: gM23zq3VT/Ght8Qz74jp1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6594868"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 08:56:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOeHJ-00000000kiP-2CDD;
	Wed, 04 Nov 2026 16:56:01 +0000
Date: Thu, 5 Nov 2026 00:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>,
	sakari.ailus@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/15] media: i2c: os05b10: add 2-lane support
Message-ID: <202611050041.o415KE0z-lkp@intel.com>
References: <20261030104806.1223991-15-tarang.raval@siliconsignals.io>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030104806.1223991-15-tarang.raval@siliconsignals.io>

Hi Tarang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tarang-Raval/media-i2c-os05b10-drop-unused-group-hold-programming/20261030-161750
base:   linus/master
patch link:    https://lore.kernel.org/r/20261030104806.1223991-15-tarang.raval%40siliconsignals.io
patch subject: [PATCH v5 14/15] media: i2c: os05b10: add 2-lane support
config: riscv-randconfig-1001-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050041.o415KE0z-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050041.o415KE0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050041.o415KE0z-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/media/i2c/os05b10.o: in function `.L0 ':
>> os05b10.c:(.text+0x1784): undefined reference to `__divdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
