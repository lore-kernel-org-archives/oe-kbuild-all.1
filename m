Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870186;
	b=Pfgc4HRJyFvkUPh/2bIryVCqy4luNBhNsn5d0XmeLaScvUqmmIeMn35AZoSMg4xkYTqZ
	 gUGzXJ9+UzSR6mdR9AZ6Z4GMz+/KDUvve7kLg30FfMCwyPIR+qF9hJoekLHatkd3ajL/Y
	 263slnNmPHYUFm+wwFIfZeuYu4hFsvoLzj2TQFK+sx49rbsr+C9SsM49DiRFAtGBCZQ6N
	 PITt4ArnzNHJB5szoDQRcHtEDfEf3MxnLXyLjvIGZ46XE3PkZx7T8q88uchclzYEoaDS6
	 +20ZzQ7wXKCXQ7yIpGospWJKLLsZJqSlRlTm2/CNbGBgjCahFaJFZejXClnI1htxPrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wf7Ik254Hs1LnPHVTqliKwyaBvyUYHDcoNqQBpCGZmw=;
	b=4PcFZNdlaPu0axN9khRJHchiq7rFqDhUfYx8DyOzulhJrrqo38EvbyqyfGQNPCNaku6k
	 YMwkS/v/cJYAQfFcobG7ByYXYXb7G/Zqrm/47ZLlB1gB9lpgKFVFlysTfCrFYfvMBr47t
	 5y4mrihAfjgd0Po/TGOVGqBYF8T1E01gU1g4ysT9ABtYH58DZnkSM4RIPQYHz/fXS4M3F
	 kNP+QN9W7Ae+nsHtfTqT9HQugeXEZ80gy+45BGVyCKFY9dTygOAWBnhNpPBRqBhs88MBb
	 3Q0DLA/v5C7smI/WZSgZr/h2VU4TfLsLbMVaTcS+sbzebJ6hiK0QW5WfTi39WYsIBug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eYakE5HI;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB6606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 19:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFB6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eYakE5HI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792870185; x=1824406185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LhhCKSsi5TJmK4KnvzjxZP/PcsPAwBm1SWTrA8Wsbp0=;
  b=eYakE5HI83jspUpW75HuH/XrWl1EAeNCXS8k259jwgbTS6LOK6puI/oO
   TKk/5dAWKixkAO8njRr+VjDBQfPdLCAqpUnalHb7B77TK6bOBzyv33yv6
   ZS+F5Meb3JY89N34Vo7n4qMl8oZyy/EBJYLBMqVHiWiEI4vlI9cnNRcMQ
   dEqJJYfGi2V+oIA0WnXEyoDTXvocuiTWAeN7w7nVIO07A6OuzmI9SfVvy
   v2Sa6ngR4gsPr/xDN7B5feX88Gh8oX5AIUVjeyvLdCLU40I9VJ8HdV8tg
   Wb1ejjKCzV6P4udpgtcZh2xwXSrToEpUhhtqhdJJfV+oxgXf04eCseGKO
   g==;
X-CSE-ConnectionGUID: UBewk+LKRXu+plojQzqSnA==
X-CSE-MsgGUID: tludw3rOR12EJL1ijFoSAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1485908"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1485908"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 12:29:44 -0700
X-CSE-ConnectionGUID: 9SEKm4miRUSOFkMvE9pqKw==
X-CSE-MsgGUID: OJEVBD3DTOSKtnh5MNoZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3843058"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2026 12:29:41 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKhQv-00000000UBK-1jMj;
	Sat, 24 Oct 2026 19:29:37 +0000
Date: Sun, 25 Oct 2026 03:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Louvel <paul.louvel@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
Message-ID: <202610250312.7jcnCxbw-lkp@intel.com>
References: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
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
In-Reply-To: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0785f7172040512cba759838b27286646773c735]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Louvel/regulator-dt-bindings-Add-regulator-boot-force-off-property/20261021-122742
base:   0785f7172040512cba759838b27286646773c735
patch link:    https://lore.kernel.org/r/20261021-paul-lm51772-v1-5-25f0ffbffa8d%40bootlin.com
patch subject: [PATCH 5/5] regulator: Add TI LM51772 support
config: xtensa-randconfig-1000-20261024 (https://download.01.org/0day-ci/archive/20261025/202610250312.7jcnCxbw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250312.7jcnCxbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610250312.7jcnCxbw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x28 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: init_tracefs.isra.0+0x218 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> ERROR: modpost: drivers/regulator/lm51772-regulator.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
