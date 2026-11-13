Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528980;
	b=0DOBz1BCjtyI3iw1CphXh8t5K9sGqJxK6HJKAskgR3++1WUDD7AZjHr55wD7PM8gtdhc
	 cebPhoFgqq1yCP27vlnjbWvozLyNAQ/kzVKnV0p5sJdzdpGA/IFh7tyC0EfhIk9nWgI1u
	 cMO5fujjZ1LRDWHjvaUZPj0YsZZPhgkHuK69XB0ti/yWqfQ/ZWh3oddDSXnlIWzhjEpDw
	 w7V5U9DIPqGuDSue6QL5uFjBbbrINUHE+3g+PzZx3aCQg23+Iq/Ob+JKWQYW85qk6Dwe9
	 ZCfXc0TOncQ2JkXrFiMeQJ9Ugz0l8f+d1mZ8bB0ivTlprkkvEhJXJ5q4A0AUzwmjt5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528980;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rbvLSrxfi4TPsrlLPmECmlk3N1ONwDWkQuRf81vDhNo=;
	b=z7FvkeGX3R7jpCC+SAzwrP1MHBzC5S+hPlcE2Lz+5iqtP5Pt3rLXvQZ1c4YHy8b/7dnH
	 qGX9ZQYmglgVadLy7cuSUCmLDB0DNgaN3YH/9JeNtJY/JckfdkF0nJcxUj2+IJ/0PS/zt
	 jqJwl8+qCZOMeHiYel+fCGoN+2MlCjBc+6A1i0RjfFfsB+qoDXVAXxSjsmOfg38p23bU2
	 5s8kXMkIzsCn5rlnr3/Ov3iDBeLVPL3u6AmGCv8HW1Ae0gfHcMRAp/NP8ryCHLSckkc8N
	 amk8j8nrg6hN7CefeKOZzjLHL/1CPV0wC1o+cvGT4nfJ/+xs9tkJr6A8RJsPhJS6hrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="R/gMN/Xh";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE53606A33E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 00:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE53606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R/gMN/Xh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794528980; x=1826064980;
  h=date:from:to:cc:subject:message-id;
  bh=GPtl0d81633vaCvcs/nNNgNMgYZGFFJspG1JKRTX5Ug=;
  b=R/gMN/XhtiE3+K4KCDjb1zTlOIgD9NFhuW9wRkBcR2GcnlGBat4Udi1D
   nHnqW3geySF/vxLLc5O0YyJXdh1h6dw/aOp2C3QoRPkO+mIctFLvnVm3M
   EUO5PDfBT67YeiZ9ThpOWvPeTLpvKYPdbwpndoLlYI3WZkrygl9+2N+cw
   bpefAEb5WzeUtjaE0OGgjPf6QSPyLGDT/udwUvjV6FOxS19WBKsnhWUAV
   ipIu8JZwYj057aCI5B9HcpVuvFLVaCRujdMwWHcNibBFDH8Y53GbhUsb3
   h7jl0bn2fbBrMunCKgjVUwLA5tuOcMYY7Y+ABnHEJ6ON1jNDdXKKrvbet
   w==;
X-CSE-ConnectionGUID: beO4xuD7Qzy8kkKMxMGbEA==
X-CSE-MsgGUID: 9dswhszMSq25oNXTQTiOhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3203956"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3203956"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:16:20 -0800
X-CSE-ConnectionGUID: E1l0M79JR02rwfsbEUQtDg==
X-CSE-MsgGUID: MdjR5UJXQwSsMvyed2ikDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="10520325"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 12 Nov 2026 16:16:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRexj-000000012C1-3paK;
	Fri, 13 Nov 2026 00:16:15 +0000
Date: Fri, 13 Nov 2026 08:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 8438/8621] WARNING: modpost:
 sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: missing MODULE_DESCRIPTION()
Message-ID: <202611130829.8EjabC7m-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Bard,

First bad commit (maybe != root cause):

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   12c4f99fb2450fd9162559ab2c43f12642dced17
commit: 626c94ed7156ece970ce4c8a4c9cdd1055e44417 [8438/8621] Merge branch 'sound/upstream-20260903' into merge/sound-upstream-20260903
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130829.8EjabC7m-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130829.8EjabC7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130829.8EjabC7m-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: missing MODULE_DESCRIPTION()
ERROR: modpost: sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: symbol 'sof_of_pm' undefined!
ERROR: modpost: sound/soc/sof/snd-sof-fw-gdb.ko: symbol 'sof_client_ipc4_find_debug_slot_offset_by_type' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
