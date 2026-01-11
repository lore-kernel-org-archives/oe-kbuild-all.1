Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877832D5924
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 23:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768173265; cv=none; b=eA/0UbuOOFgH9X8oR5gogw65ykLe80TgMxiIEmfL9quehTTdq0obZPhRRSP5B1sy13edJLckOTsD7JlbT12c3Mpc/APndIapDahyvc63CLaAxZZx1sbertexfda9ZasnK1cmjGaTnnVIrNJFrVzVRJNiu1daVrI5QOKCCacUDzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768173265; c=relaxed/simple;
	bh=AzZwH4XlB6giQrfdVVmDpTqO6ZbQDSG/EvUx55Go3tk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OnBDbj6ZMc/gI6MQVG4RDDcyQThdiYFh0UmDiScXvF08bp+RhzBtAwmGXABpA30gK7cASPKSvUb4SYK8BSChlqY7fHmXyVaGVnc4utLs28qVeP6owG0YUS13OZZul0x9LVySHl5D/HH/etKlHJMkPEXGqG3F6daDhizZBfC7iN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFKxyULk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFKxyULk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768173263; x=1799709263;
  h=date:from:to:cc:subject:message-id;
  bh=AzZwH4XlB6giQrfdVVmDpTqO6ZbQDSG/EvUx55Go3tk=;
  b=nFKxyULkq95V/l0mgfkzYRiOK8Sk9y7SQ1ljKkCGVslnlmhiQmejPgm/
   Zb0ALqrRrlps0Maz05801OtMcrvIlr6Ln84JW1nPxybM/6KvpaGw/+Evl
   ZmyUVn44hPdfxZDDKTqgMeXhFsLSbf91fk52seCc4BrGZnf7a9g0OCm/p
   JEihcR1xpNPDYaYYMioFJFvQLgWfwCu1Pt3o0ma2q2ybZNTrIUfGfc+gz
   gj83K6pjAoW8nf5EQTx9KohCU6snviICjCC0wYHk5dxy273YCqFgkqngF
   XhfNfdbJxKWqKrj07HUV9zcZ22cM1lhl0V7Fob/gAwMOpCJm4O2L9s1wi
   A==;
X-CSE-ConnectionGUID: EabixeHHS3yTPZYTwPNaBg==
X-CSE-MsgGUID: fWNfkS96TfWHBQyWDjuiAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69503033"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69503033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:14:23 -0800
X-CSE-ConnectionGUID: 5haxXp0gRuSQixPvQYKd/A==
X-CSE-MsgGUID: Ih/RqmW0TX629vypHUsaYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203096853"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2026 15:14:21 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf4dW-000000000Wr-1xWm;
	Sun, 11 Jan 2026 23:14:18 +0000
Date: Mon, 12 Jan 2026 00:13:40 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SIFIVE_CCACHE when selected by ERRATA_STARFIVE_JH7100
Message-ID: <202601120009.KrExszM6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: 4d1608d0ab3365d1ef9447bdbc0cb4c0962f1774 cache: Make top level Kconfig menu a boolean dependent on RISCV
date:   7 weeks ago
config: riscv-kismet-CONFIG_SIFIVE_CCACHE-CONFIG_ERRATA_STARFIVE_JH7100-0-0 (https://download.01.org/0day-ci/archive/20260112/202601120009.KrExszM6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120009.KrExszM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120009.KrExszM6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SIFIVE_CCACHE when selected by ERRATA_STARFIVE_JH7100
   WARNING: unmet direct dependencies detected for SIFIVE_CCACHE
     Depends on [n]: CACHEMAINT_FOR_DMA [=n] && (ARCH_SIFIVE [=n] || ARCH_STARFIVE [=y])
     Selected by [y]:
     - ERRATA_STARFIVE_JH7100 [=y] && ARCH_STARFIVE [=y] && !DMA_DIRECT_REMAP [=n] && NONPORTABLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
