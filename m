Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF84B0493
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786217923; cv=none; b=s2YYcBPdQEje7u2MA+MwuyiVaVVvrS2y6J9+TfNDHgv9J87mU3VK5e8UboLc8erVaQnOjWONreu6SnZ0/IpL6XPaL+qDrpQh9a6klVxS0KlMhKO1EL+hgOdwEaFnd7vxXSV1md35EAvCWvea/MuRudqLqubJA7Wzy58F3YMwpsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786217923; c=relaxed/simple;
	bh=zNiSuZBP6/XcJWLV/x++jNMGX8oaj9uVLIraZEhDvQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pBQPeYNogf7ucF1VfvYgK9t1Zboj7v3umy2vSif/SvyJo+EU6g9iNbl1h2kVLc/XZQstGuqmXJVJKb0Of9KNOh3qwnBeYBk6ZePCncPWzHLIfU7TKwQHoJQpdHocvXHe56NH4QNvUuS7C5Kxku5gqUJxDmobhfSTOWG0VTYv72w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkpje5EX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkpje5EX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786217921; x=1817753921;
  h=date:from:to:cc:subject:message-id;
  bh=zNiSuZBP6/XcJWLV/x++jNMGX8oaj9uVLIraZEhDvQQ=;
  b=hkpje5EX9jpxzuBuD9+RmGjOIvjlGjymCFWe9NsC3OEMf2r9wUpMaevS
   3r5AwRjx8jdFeEiUj2kE5H4f6EwRbIG94AI60XyoQoazWJ4hBXxdho6aD
   x03p0MGYJ0SwXM5PcaCsMolQVbOM8e6a0a0lDoRqgftTDFjXbuJAEIQTH
   xxYj9gjDU7f/sBnWLrOVTRK+lCepeWQ0D2b1Bu4eA8623dkIoyPrr6pwh
   VBilU839n2bYMKyTKJ4YDbqNnW9Yuhsuw2Ji5zxOseLwho8tdE+r6gGOR
   FEyaKhszXZmj7rmHsan8GyyrG13UCgc9qzfAGhyV+a9DtGJhV5gMAjRON
   A==;
X-CSE-ConnectionGUID: Gjn3jajUTmC8OtR/rxotaA==
X-CSE-MsgGUID: 6BkVSjhQSfyVirDtCGgsyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="85761706"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="85761706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 12:38:40 -0700
X-CSE-ConnectionGUID: ChP0M2ogT/+E6UqCDD53bw==
X-CSE-MsgGUID: 0WaiSJP7SUaB6+It1WgtTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="263297737"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2026 12:38:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsmsO-00000000Kgr-2xdz;
	Sat, 08 Aug 2026 19:38:36 +0000
Date: Sun, 09 Aug 2026 03:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [thermal:thermal/linux-next 20/26] make[6]: *** No rule to
 make target 'drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.o', needed by
 'drivers/thermal/qcom/'.
Message-ID: <202608090331.xrMWaUzd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jishnu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   55c16e15ff9f91bc994a20124b83faf27f0e3690
commit: 948ee3a74f35644c16b6c100f19ff0799cebe0b5 [20/26] thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260809/202608090331.xrMWaUzd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608090331.xrMWaUzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608090331.xrMWaUzd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.o', needed by 'drivers/thermal/qcom/'.
   make[6]: *** [scripts/Makefile.build:289: drivers/thermal/qcom/qcom-spmi-mbg-tm.o] Error 1
   make[6]: Target 'drivers/thermal/qcom/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
