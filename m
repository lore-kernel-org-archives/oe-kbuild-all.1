Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD69396567
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768620; cv=none; b=nmucC08AKzIHch71AopfTNey+EXXf4KG8PqFmyTnv5O2cnjs/x+/+nRvmsMqiMwhU83qNs8QiWszwa8KxxLrsE9acHivurQxdCsJLyKwd88Ou4qYgfQitaTheS3sdgA7/QGYTEgf/lG9sjHAXrS29uFZhXwHHrgwEx1qTi4uv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768620; c=relaxed/simple;
	bh=T2bjIy/bNzwxYpVXwrwsHZoUyxi3XQTxSvs4OoRPBiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5T4kzS0kYCb5jWiH7fWdWVdcPGTQHHfUy31lQPP6UcVVsUL4jFJhKL+RdVTFbC0NK34dboAx4I0A2mzqq+fxwSuLIjsKmayfOg9mFb9fmkb9RE6hzKxRmzob8amafpwPyvWCWw25iwWjj4FdqWwZsP4JbU/YuYG5iKnOKbmR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2ddqSUI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2ddqSUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787768614; x=1819304614;
  h=date:from:to:cc:subject:message-id;
  bh=T2bjIy/bNzwxYpVXwrwsHZoUyxi3XQTxSvs4OoRPBiQ=;
  b=n2ddqSUILxn2a5H1cAQsmWwS0iqYLhFqf9istDUFJIr8imaC/TgfPbfZ
   4p6fgzbRO+y9Zs1vs30tlOuhwqsoO/HlzoEQLEoQadsASDI67UQnl7HBU
   s0aeXyO16joRk/8bk9k46833Mw08I3ny3Fm3mURdSF80IvnOHLL0UZPF3
   R9iKV4qXnPTI7/Z9axP8YPU5ehDxpeFFkEwEMfERmn7rPtbStV8eUjxJs
   pxc+QmYtzc077ODSgKGWYIrqPlR0c8Hyk6bqtAZcNiluyzSeSw9HPBzVd
   TDcq5Z8vJ6bvf+mheDpsvapW5+362igWvtDTFrqihmbtNnmAp9xCLVu94
   g==;
X-CSE-ConnectionGUID: zoxLok7bQPKHhk1Wnl5udA==
X-CSE-MsgGUID: /Dd7c3HmR6yUp5mr9u+xuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88464070"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88464070"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:23:29 -0700
X-CSE-ConnectionGUID: YHsumuZOTBOrbJh7hbtU1A==
X-CSE-MsgGUID: kVkSQeGIQDaBn15TbXytDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="263354332"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Aug 2026 11:23:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzIHU-000000000Yb-3SG9;
	Wed, 26 Aug 2026 18:23:24 +0000
Date: Wed, 26 Aug 2026 20:23:13 +0200
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 8151/17167] kismet: WARNING: unmet direct
 dependencies detected for PM_GENERIC_DOMAINS_OF when selected by
 COMMON_CLK_MT8173_MFGTOP
Message-ID: <202608262030.J1VAWFxU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f82a5da2f04960df9fb57489992d03dd5e64ec6f
commit: ebd0b73d2137c2277440da04124a0ce7011b2d1a [8151/17167] clk: mediatek: Add mt8173-mfgtop driver
config: x86_64-kismet-CONFIG_PM_GENERIC_DOMAINS_OF-CONFIG_COMMON_CLK_MT8173_MFGTOP-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262030.J1VAWFxU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262030.J1VAWFxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262030.J1VAWFxU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF when selected by COMMON_CLK_MT8173_MFGTOP
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
     Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
     Selected by [y]:
     - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
