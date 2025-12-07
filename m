Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064DDDF49
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765091430; cv=none; b=OFuD/v3QiTiVTU3M4OIL8xXEJj7jkeKtU2Kw9t0+paG2uNLGmtQVKxDcH4cNQr1ahBojUPpwan0Bto6r9vYqG+IMBrYmi6ArAd41q5SUdowLQS7hxc0AkQUuAJ+Idhhdv1S0ar+I3MUBpR3h+q5BKsqfqst83x+uIGbmu5QxJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765091430; c=relaxed/simple;
	bh=no4D/wwDS0bXEh3JLL+OiqGVyWTDDSiMCcb3AJvQPnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohqWlp26ByTpfxGfJCacmKCBIkvE6O4lBCiMvhNNpoQAfhhYWHo9bTMYmGHMDpFo7fMQ1qlF8Huasj9R8uHCeNKYZYv9c8gqLttpqxbDcbx4GOmEwrhR09eHA5lSc0dyqvIJ45G3E1+99KX0i+ZqOWMqvClXgAlT+LNzhcS8OUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHEGXsrm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHEGXsrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765091429; x=1796627429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=no4D/wwDS0bXEh3JLL+OiqGVyWTDDSiMCcb3AJvQPnc=;
  b=SHEGXsrmrmw78sxqaWVjtAjgrvwlAu32aXCK5RA82j/sdhKH6t+kWvbh
   iQ8IMLxzPMo4p5qceDU73CCCalef7/oSoNarXzUn8pjeWAo5lCp5mtQvc
   jLcqn1l3mvwFzKvxi9S29p3g0J0DGUFCiQEKV7f07MY9R6534NsWi25AI
   uVY2tFNnnZJWLXAke2EYuvHUs8c32suvt08gRiBfbUlO0Rz0e1VtXsSqj
   I/41dwdgg1meQAQJIawmeKa3M6lMc1Yt71P1zSct7AI2PdktHFG/E2QCQ
   Ec4H63UKYXD3gArE8TTSieW+zV5NKi4t9Tv8bbrNL1ro6WTR5f1v2Xhdy
   w==;
X-CSE-ConnectionGUID: Lkzbio7gTti90IVGIsbe0g==
X-CSE-MsgGUID: tplA4NHhToWRZki1ZcAbVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="84666969"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="84666969"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 23:10:29 -0800
X-CSE-ConnectionGUID: 26sJOqweTN6nGw6YDtVWaQ==
X-CSE-MsgGUID: Ju+e3TKMQEaXuS5Qxez+8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="194708531"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Dec 2025 23:10:27 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS8uW-00000000J4b-3xAh;
	Sun, 07 Dec 2025 07:10:24 +0000
Date: Sun, 7 Dec 2025 15:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18.0-2025-12-04-sparrow-hawk 12/34] ERROR:
 modpost: "vsp1_isp_alloc_buffer"
 [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
Message-ID: <202512071505.ibWhnG7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18.0-2025-12-04-sparrow-hawk
head:   8cebe7f77cc2463d5f4317cbdcb9b2e179c8aceb
commit: 05fdf1f3b7fc904954b481ffaffd4c8e6d348b3e [12/34] media: rcar-isp: Add support for ISPCORE
config: x86_64-buildonly-randconfig-003-20251207 (https://download.01.org/0day-ci/archive/20251207/202512071505.ibWhnG7H-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071505.ibWhnG7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071505.ibWhnG7H-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vsp1_isp_alloc_buffer" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_init" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_stop_streaming" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_job_release" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_get_bus_master" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_free_buffer" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_start_streaming" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_job_run" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!
>> ERROR: modpost: "vsp1_isp_job_prepare" [drivers/media/platform/renesas/rcar-isp/rcar-isp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
