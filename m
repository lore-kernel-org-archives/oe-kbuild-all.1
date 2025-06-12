Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17862770FE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734176; cv=none; b=nRdd1YUkskvsX9mBqAHo0cCUBfK6tLJ7enfjviDFhN/uCzl9Art+aALtbh4YpvdBVQHgVEahOR60bfnrnp0RrQYY1rddZM3QYcJxqtjcTWhmZsai6FoQtwXQdkUMRfbwtrC9ZX94D0JkHG6bXHULbF2n+vjbuotouFOwiyEGNKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734176; c=relaxed/simple;
	bh=ahNKs67YLHlfIWI6Nc5n3/U2m37YWfh/X9S9SLQe9Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDYQPJMQZSIEU4qef3VnmL1YLRjA4fkb+FlQFe7eD9cx1pfXQKh+Tz9HvguDNpYYKJ/KNWZORNaBiMfZrtsLkwomS4BIao4vKQ9oRDwAzRD5g94ngC2t6BGcXAuO9xj2JwOwu3Jo19eJK9azXvsHHSNmDqt1s6TSme81t1wiURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qpdc7hnn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qpdc7hnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749734176; x=1781270176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahNKs67YLHlfIWI6Nc5n3/U2m37YWfh/X9S9SLQe9Hs=;
  b=Qpdc7hnnRKlHySDdyVqMYXDlpj0GE6Tg40cqi08L/y4k0ggKbmNp9T8S
   6owpSeT2fgADMvL+eMf1Y6BIbwuqipVUJUIkiYv+Zv2pt2vxUoxRDEcGk
   R3z2IkpdbEu7HmV7al0Bh4+tWZkX6PaCf8hgnUqUKUpxcKu5abuXaIviz
   rNOfeY9oHAJNN+MnF7xmplKHMq+8l2AOZrfYStZhc7HK5J1hs3Japy+E5
   UYUYWp9MO2rRt6bzWTX501Fpp34pNb/OA2jsrFR6UwMH+WY2gIHx/S53w
   iwZgdxs+Cawd8oPRjBhk8UiLbQo8ah1uiGKQta4on8pR0ruIB9A6neg9T
   w==;
X-CSE-ConnectionGUID: +p4pC2+6TNaovFwxnAX/jQ==
X-CSE-MsgGUID: fMMFfTwqQvive16jUGY5Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62192054"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="62192054"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:16:15 -0700
X-CSE-ConnectionGUID: AmKrRNBSTDi5Idid/vCUtQ==
X-CSE-MsgGUID: buB/boyRTBuRNM3c9va0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152283783"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 06:16:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPhms-000BYa-31;
	Thu, 12 Jun 2025 13:16:10 +0000
Date: Thu, 12 Jun 2025 21:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 1558/2199]
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c:126:24: sparse: sparse: symbol
 'multi_mux_s7' was not declared. Should it be static?
Message-ID: <202506122145.wWAtKBoy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0bb71d301869446810a0b13d3da290bd455d7c78
commit: 1f8e5dfddaa794c97a80b2a9952be368d8fdee6e [1558/2199] pinctrl: meson: support amlogic S6/S7/S7D SoC
config: arm64-randconfig-r113-20250612 (https://download.01.org/0day-ci/archive/20250612/202506122145.wWAtKBoy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506122145.wWAtKBoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506122145.wWAtKBoy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:126:24: sparse: sparse: symbol 'multi_mux_s7' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:135:28: sparse: sparse: symbol 's7_priv_data' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:140:24: sparse: sparse: symbol 'multi_mux_s6' was not declared. Should it be static?
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:154:28: sparse: sparse: symbol 's6_priv_data' was not declared. Should it be static?

vim +/multi_mux_s7 +126 drivers/pinctrl/meson/pinctrl-amlogic-a4.c

   125	
 > 126	const struct multi_mux multi_mux_s7[] = {
   127		{
   128			.m_bank_id = AMLOGIC_GPIO_CC,
   129			.m_bit_offs = 24,
   130			.sid = (AMLOGIC_GPIO_X << 8) + 16,
   131			.eid = (AMLOGIC_GPIO_X << 8) + 19,
   132		},
   133	};
   134	
 > 135	const struct aml_pctl_data s7_priv_data = {
   136		.number = ARRAY_SIZE(multi_mux_s7),
   137		.p_mux = multi_mux_s7,
   138	};
   139	
 > 140	const struct multi_mux multi_mux_s6[] = {
   141		{
   142			.m_bank_id = AMLOGIC_GPIO_CC,
   143			.m_bit_offs = 24,
   144			.sid = (AMLOGIC_GPIO_X << 8) + 16,
   145			.eid = (AMLOGIC_GPIO_X << 8) + 19,
   146		}, {
   147			.m_bank_id = AMLOGIC_GPIO_F,
   148			.m_bit_offs = 4,
   149			.sid = (AMLOGIC_GPIO_D << 8) + 6,
   150			.eid = (AMLOGIC_GPIO_D << 8) + 6,
   151		},
   152	};
   153	
 > 154	const struct aml_pctl_data s6_priv_data = {
   155		.number = ARRAY_SIZE(multi_mux_s6),
   156		.p_mux = multi_mux_s6,
   157	};
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
