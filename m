Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749079;
	b=ccskY+Bx1BiksXRXp+Kv2GB3V1TKPK3G1o/IlgzwjMrjWbNlnxNAd9GkPYwZ+KUsaOVq
	 Rbwt594tXbQS7qfhlHDv0ZYvy9jF/Rb1eEcJCjTqV78uB2KUvB3JknqmNI2UsAq9OHWrw
	 8tDN7QtYXc72jCf8LXBYGkP0jpsfgEC+xhWEtEg3n/LARE/uQjirkugngLWf1g+IL75JO
	 tX8Mw5MdETkc8xh4K4EC58uh/AZXPX+ofFKCgOiU0TUIdMNmkew4AHGFTYKojIjx/Sj42
	 ZZH9FXbP0KNlWK5QDBDuSoUHkrzZdxf0JvysSV5ruaTqe146igpKhCcS2Mtwi37UsPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749079;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=A15Gdcq9WpK4r1RNK9dh3AU9QnNdGIL6o83dJ0zeW34=;
	b=g5PZEG8jBh9iHdW5crBigsWy3kDaI/XKqwqRrQ65Gh+GLE5MTFc0n/39BnMURgEkrIkX
	 g0/R/rbyp9KzXrzYbNsCRdMAg3Q9IB2/SLw6p6m610IgzDCHZJyn1I7/M2mePdOzN61tQ
	 QAtRxZdFCUHBDqQCTIfgcdFBQVyxjBG6DJV0z1nVakxHfrhOG618DFq0DKcGryX+P202Y
	 8w5P9UXsGZzgs/vwiQUdtB2JFbg0yri3kgVJpXNeHQOz8sBXSCLaW71QAcGhOkEJprJar
	 yQ/v/xt/a1uGEVCT4mQyUaPBP2ea6xZiDjsYO3HZ1QdcCPUon3KHjcJN0fQUpXBMycA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QvAtVbKX;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD42606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 13:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QvAtVbKX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794749078; x=1826285078;
  h=date:from:to:cc:subject:message-id;
  bh=Pe2UskNhWVt1YuwVclXrlyePUgeif9fkf2Up8/16weg=;
  b=QvAtVbKXxtP7H21ih2ZeeFB2LcuTjRngNoUDaEL2G1dEsLZiyDcEukje
   nfik6VZUE07peow8JHVlx3IcVy4AUMTTooVsltP6oTkw2JJ4AOs8L1/H+
   r4EKKPoA3+4lCfj75pfI067mS67r//5GpEqmcTCIcmBV1VGTPB1S0j5/O
   QYJnKFEWmogKPmu8Z3iq3k/a1fpgOleMyRv3hEt2oC97rCW9NFKILWG0o
   p04mmWU2RwKzc2TX1oGa67qM8oDR8uS7t1RshoDvHNXM9NAGAdJzgYKa+
   E8+nLPSL8ziYZLr/HsPMvgYBwg3BpnGzijkY7s1wDGYkBUjQb4l3ZRXHb
   g==;
X-CSE-ConnectionGUID: P+VV0uwXREqh7shc4unY+w==
X-CSE-MsgGUID: oRYlwVzMQ4q0NF35IV874g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3495356"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3495356"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 05:24:38 -0800
X-CSE-ConnectionGUID: GIv8GcelTLasdgMmqJlkKQ==
X-CSE-MsgGUID: V+udDuYQTounrQezJCbVYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9405102"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Nov 2026 05:24:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSaDj-000000002D6-0orq;
	Sun, 15 Nov 2026 13:24:35 +0000
Date: Sun, 15 Nov 2026 14:23:38 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/tty/n_gsm.c:1276:2-3: Unneeded semicolon
Message-ID: <202611151435.TVnaEQqQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3540cf724bf0fe246a3131fd1f3e9342fa03b03e
commit: 5020173e7e7725110a8d4be1359bf1dfc4b1814d [0/2] tty: n_gsm: fix deadlock and link starvation in outgoing data path
config: i386-randconfig-2105-20261114 (https://download.01.org/0day-ci/archive/20261115/202611151435.TVnaEQqQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151435.TVnaEQqQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/tty/n_gsm.c:1276:2-3: Unneeded semicolon

vim +1276 drivers/tty/n_gsm.c

  1228	
  1229	/**
  1230	 *	gsm_dlci_data_sweep		-	look for data to send
  1231	 *	@gsm: the GSM mux
  1232	 *
  1233	 *	Sweep the GSM mux channels in priority order looking for ones with
  1234	 *	data to send. We could do with optimising this scan a bit. We aim
  1235	 *	to fill the queue totally or up to TX_THRESH_HI bytes. Once we hit
  1236	 *	TX_THRESH_LO we get called again
  1237	 *
  1238	 *	FIXME: We should round robin between groups and in theory you can
  1239	 *	renegotiate DLCI priorities with optional stuff. Needs optimising.
  1240	 */
  1241	
  1242	static int gsm_dlci_data_sweep(struct gsm_mux *gsm)
  1243	{
  1244		/* Priority ordering: We should do priority with RR of the groups */
  1245		int i, len, ret = 0;
  1246		bool sent;
  1247		struct gsm_dlci *dlci;
  1248	
  1249		while (gsm->tx_bytes < TX_THRESH_HI) {
  1250			for (sent = false, i = 1; i < NUM_DLCI; i++) {
  1251				dlci = gsm->dlci[i];
  1252				/* skip unused or blocked channel */
  1253				if (!dlci || dlci->constipated)
  1254					continue;
  1255				/* skip channels with invalid state */
  1256				if (dlci->state != DLCI_OPEN)
  1257					continue;
  1258				/* count the sent data per adaption */
  1259				if (dlci->adaption < 3 && !dlci->net)
  1260					len = gsm_dlci_data_output(gsm, dlci);
  1261				else
  1262					len = gsm_dlci_data_output_framed(gsm, dlci);
  1263				/* on error exit */
  1264				if (len < 0)
  1265					return ret;
  1266				if (len > 0) {
  1267					ret++;
  1268					sent = true;
  1269					/* The lower DLCs can starve the higher DLCs! */
  1270					break;
  1271				}
  1272				/* try next */
  1273			}
  1274			if (!sent)
  1275				break;
> 1276		};
  1277	
  1278		return ret;
  1279	}
  1280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
