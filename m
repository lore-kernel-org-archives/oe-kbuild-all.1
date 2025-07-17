Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6B2036F3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 06:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752732579; cv=none; b=RHLSllypHl+0E+z8VFTFi4ABFpO+R/okJeE2fqBo+5S+Op/4/C5mXNlz1BOOd39hrVmQfR95HXS5zp/zgggZROXGFoW4LFRotDJDDgTR2SyKBcq1OFl7EQSfpoVSKnh6hVspSQxZPYP9xkz2wEuQjRZ1r85K1ccpy06QLuQC28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752732579; c=relaxed/simple;
	bh=06sfEwPwapl7HSwBzGHEiTcJjFqV4RXxkshBTqEhmwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wq5b1u+aljxPkEeFHSL57knYJ9ajO7Hlgq9tUjlbuuAH7f3JcdA6ZXGTVwi/f5ioZQYnb27s9HC4G2UvOGWKA51eebiws/I/o8Y/sXPuxdOv4NEzkDzSlOH8LjINn0zxahPQqMSh1JGBVnGA+Og80grm3AMy8dOvSuE1AR3zufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8mupa7H; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8mupa7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752732578; x=1784268578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=06sfEwPwapl7HSwBzGHEiTcJjFqV4RXxkshBTqEhmwM=;
  b=c8mupa7H9PuA6RfQyftp5tLXPiHVZzBK4jKfOUcvOS7xcHkC3g1qPdXk
   ANeMzGm6U65aW0EldONUrTYS8B/c3O935WTVkMbNJfwDRikiOZv1ugRcl
   881GU3+uRFHojr9CJj1KaaZU3B0NOABsFX7+l6M54WkeQX0e0tRw6zSGp
   fYH6Xd2oz8eKOAe5jRFJeJRHD23TGMOFyD/KPk71neCvW4uysiAP0fv/q
   GpEiKKp8mss/9qUauvFeXp3MJOA+3oUvoKyN4xtZJNY5AlXfTR2iQZoC4
   yqHG692sRJf+PCfUnFIIQLe46RXLCkYqWOmUBrQ44lYNeTsKWqru3IcF6
   g==;
X-CSE-ConnectionGUID: IbmF+E5WRcGSkbGbsRd0Lw==
X-CSE-MsgGUID: 1x5oqO0uQeGJxkmbt/up5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54711582"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="54711582"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 23:09:37 -0700
X-CSE-ConnectionGUID: 8o1ZTcU5T068tA/m6Rj96Q==
X-CSE-MsgGUID: GNfgJmtrTmaUQvJelTDqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="163340836"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2025 23:09:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucHoB-000DCr-26;
	Thu, 17 Jul 2025 06:09:31 +0000
Date: Thu, 17 Jul 2025 14:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202507171313.1yaQJ9Tl-lkp@intel.com>
References: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5@allegrodvt.com>

Hi Yassine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 155a3c003e555a7300d156a5252c004c392ec6b0]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa-via-B4-Relay/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250716-225824
base:   155a3c003e555a7300d156a5252c004c392ec6b0
patch link:    https://lore.kernel.org/r/20250716-allegro_dvt_al300_dec_driver-v4-4-f87c01c9f7b5%40allegrodvt.com
patch subject: [PATCH v4 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507171313.1yaQJ9Tl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171313.1yaQJ9Tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171313.1yaQJ9Tl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_cleanup':
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c:149:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     149 |         kfree(cmd->reply);
         |         ^~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c: In function 'al_codec_cmd_create':
   drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |               ^~~~~~~
         |               mm_alloc
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:165:13: warning: assignment to 'struct al_codec_cmd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     165 |         cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
         |             ^
>> drivers/media/platform/allegro-dvt/al300/al_codec_util.c:169:20: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     169 |         cmd->reply = kmalloc(reply_size, GFP_KERNEL);
         |                    ^
   cc1: some warnings being treated as errors


vim +165 drivers/media/platform/allegro-dvt/al300/al_codec_util.c

   160	
   161	struct al_codec_cmd *al_codec_cmd_create(int reply_size)
   162	{
   163		struct al_codec_cmd *cmd;
   164	
 > 165		cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
   166		if (!cmd)
   167			return NULL;
   168	
 > 169		cmd->reply = kmalloc(reply_size, GFP_KERNEL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
