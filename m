Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C0727FD4B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 20:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729366; cv=none; b=p3xl71eUoNTOagyiCZxIyEBQFZOFgZyIXcxpRR0zgZo2tQJF1X3mcR47FvFQv9MAGU1JgpEZy5QKb+MTwy8alCPvgglAsLZijxJ90jZI+ccPFFMbaiKkCLtxh3pE0RcoOvW6J/9qWGKV1glXmbROblFRE7PnE7lHQLnrdxapKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729366; c=relaxed/simple;
	bh=oACpUxmJ7d4aCTwv0h67vyoLm8Tpfct9F/O/q19H4Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=asOKHvrRXzmt56YNz0wpOQ9Kt90GRXhJdi71bqlOTZo6r7uueg1MMTdAgRnwe7GQ5rD8V9RbbOfcw/XF7nlfq/BW+hkDCMgoEoDOgSvrdQZSEm3Wsl7s+33IlHg9gem4kxxIQ67vOcRFLTgvpy4384oHqgBpOuAFO9qWnaUydh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UafMWekk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UafMWekk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781729364; x=1813265364;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oACpUxmJ7d4aCTwv0h67vyoLm8Tpfct9F/O/q19H4Ik=;
  b=UafMWekkvwVDq3eYuMyPnL/vhBArHqEnAtKmOg/W88Heaz5MCekhLEZN
   Joo5czBLzlUN07268EofT3QVYIcR/QRwIjMwonT+0WevdHbpMfyXSEjed
   zdQu6+mhYV2P0laTxmNRVewUrOMb1hmzIZXmQYWeEnN/xxbNo0xDl1KKe
   013xoLS8YLptb6Qo0uMvhdKMgG189JwZImfhc3rgZCP4Ec5yaAZ3IFUsx
   FcenlcA5srP1i66rPMgrK0E5ojqdd/1pOya06V/CA4Tqx2524yK6k3a/W
   fVdbKU11WBEdddOhti6C+OGuZeBHt4gSB2Ft3fqMAulN0EJxLfISXRom2
   Q==;
X-CSE-ConnectionGUID: HO3RQ+4cRYu3+yFB2NT+uQ==
X-CSE-MsgGUID: +WLPK8XLQTW36J1ltw934w==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81535072"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="81535072"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 13:49:23 -0700
X-CSE-ConnectionGUID: 0YAqFEneRe2r1h1aLnzyIg==
X-CSE-MsgGUID: dhHTZIcCQnSrKTUnLVdR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="250056678"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2026 13:49:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZxCJ-00000000UyE-1ZcV;
	Wed, 17 Jun 2026 20:49:19 +0000
Date: Thu, 18 Jun 2026 04:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/thunderbolt-big-endian 3/8]
 drivers/thunderbolt/test.c:2607:9: sparse: sparse: cast to restricted __le32
Message-ID: <202606180439.AeBJRt2b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/thunderbolt-big-endian
head:   593931a2f088b13b1cb0e823ae12ce1fcc1be35c
commit: 3a43bc0bf824f5410252af2ec3f8b10e07e726b9 [3/8] thunderbolt: test: M=
ake root_directory independent of host byte order
config: powerpc64-randconfig-r134-20260617 (https://download.01.org/0day-ci=
/archive/20260618/202606180439.AeBJRt2b-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260618/202606180439.AeBJRt2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180439.AeBJRt2b-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/test.c:2607:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2608:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2609:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2610:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2611:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2612:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2613:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2614:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2615:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2616:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2617:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2618:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2619:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2620:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2621:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2622:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2623:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2624:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2625:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2626:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2627:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2628:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2629:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2630:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2631:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2632:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2633:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2634:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2635:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2636:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2637:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2638:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2640:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2641:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2642:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2643:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2644:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2645:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2646:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2647:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2648:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2649:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2650:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2651:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2652:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2653:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2654:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2655:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2656:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2657:9: sparse: sparse: cast to restricted __=
le32
   drivers/thunderbolt/test.c:2658:9: sparse: sparse: cast to restricted __=
le32

vim +2607 drivers/thunderbolt/test.c

  2605=09
  2606	static const u32 root_directory[] =3D {
> 2607		le32_to_cpu(0x55584401),	/* "UXD" v1 */
  2608		le32_to_cpu(0x00000018),	/* Root directory length */
  2609		le32_to_cpu(0x76656e64),	/* "vend" */
  2610		le32_to_cpu(0x6f726964),	/* "orid" */
  2611		le32_to_cpu(0x76000001),	/* "v" R 1 */
  2612		le32_to_cpu(0x00000a27),	/* Immediate value, ! Vendor ID */
  2613		le32_to_cpu(0x76656e64),	/* "vend" */
  2614		le32_to_cpu(0x6f726964),	/* "orid" */
  2615		le32_to_cpu(0x74000003),	/* "t" R 3 */
  2616		le32_to_cpu(0x0000001a),	/* Text leaf offset, (=E2=80=9CApple Inc.=
=E2=80=9D) */
  2617		le32_to_cpu(0x64657669),	/* "devi" */
  2618		le32_to_cpu(0x63656964),	/* "ceid" */
  2619		le32_to_cpu(0x76000001),	/* "v" R 1 */
  2620		le32_to_cpu(0x0000000a),	/* Immediate value, ! Device ID */
  2621		le32_to_cpu(0x64657669),	/* "devi" */
  2622		le32_to_cpu(0x63656964),	/* "ceid" */
  2623		le32_to_cpu(0x74000003),	/* "t" R 3 */
  2624		le32_to_cpu(0x0000001d),	/* Text leaf offset, (=E2=80=9CMacintosh=
=E2=80=9D) */
  2625		le32_to_cpu(0x64657669),	/* "devi" */
  2626		le32_to_cpu(0x63657276),	/* "cerv" */
  2627		le32_to_cpu(0x76000001),	/* "v" R 1 */
  2628		le32_to_cpu(0x80000100),	/* Immediate value, Device Revision */
  2629		le32_to_cpu(0x6e657477),	/* "netw" */
  2630		le32_to_cpu(0x6f726b00),	/* "ork" */
  2631		le32_to_cpu(0x44000014),	/* "D" R 20 */
  2632		le32_to_cpu(0x00000021),	/* Directory data offset, (Network Directo=
ry) */
  2633		le32_to_cpu(0x4170706c),	/* "Appl" */
  2634		le32_to_cpu(0x6520496e),	/* "e In" */
  2635		le32_to_cpu(0x632e0000),	/* "c." ! */
  2636		le32_to_cpu(0x4d616369),	/* "Maci" */
  2637		le32_to_cpu(0x6e746f73),	/* "ntos" */
  2638		le32_to_cpu(0x68000000),	/* "h" */
  2639		le32_to_cpu(0x00000000),	/* padding */
  2640		le32_to_cpu(0xca8961c6),	/* Directory UUID, Network Directory */
  2641		le32_to_cpu(0x9541ce1c),	/* Directory UUID, Network Directory */
  2642		le32_to_cpu(0x5949b8bd),	/* Directory UUID, Network Directory */
  2643		le32_to_cpu(0x4f5a5f2e),	/* Directory UUID, Network Directory */
  2644		le32_to_cpu(0x70727463),	/* "prtc" */
  2645		le32_to_cpu(0x69640000),	/* "id" */
  2646		le32_to_cpu(0x76000001),	/* "v" R 1 */
  2647		le32_to_cpu(0x00000001),	/* Immediate value, Network Protocol ID */
  2648		le32_to_cpu(0x70727463),	/* "prtc" */
  2649		le32_to_cpu(0x76657273),	/* "vers" */
  2650		le32_to_cpu(0x76000001),	/* "v" R 1 */
  2651		le32_to_cpu(0x00000001),	/* Immediate value, Network Protocol Versi=
on */
  2652		le32_to_cpu(0x70727463),	/* "prtc" */
  2653		le32_to_cpu(0x72657673),	/* "revs" */
  2654		le32_to_cpu(0x76000001),	/* "v" R 1 */
  2655		le32_to_cpu(0x00000001),	/* Immediate value, Network Protocol Revis=
ion */
  2656		le32_to_cpu(0x70727463),	/* "prtc" */
  2657		le32_to_cpu(0x73746e73),	/* "stns" */
  2658		le32_to_cpu(0x76000001),	/* "v" R 1 */
  2659		le32_to_cpu(0x00000000),	/* Immediate value, Network Protocol Setti=
ngs */
  2660	};
  2661=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
