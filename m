Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF2E339387
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914010; cv=none; b=NXEZxbJGYNmbZcEIpjH7+KeH7cko+g3UgOfF3EukYoDq1Mo8LFPYjzLBzz7HJ/oyo3ebrNu+yLKnVF3vOVwNwUZRhXmNxcxLqqWWmHRrAnqor/JzRfXzCW+4UGigoAfz+4vhcOVYB62lj6IudU//g6wH7yRITccrxMjXmP0KHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914010; c=relaxed/simple;
	bh=csJTK9DFMPYjmmiD5M7S/sgDDRfYoWeFo8FwZyf6XIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VHR6wf2MCuHi095ap9/w7O8Alrw+v9ep6UsD0uvpihRIxc/xCOS8VuML2ogai/y+Z6+JuV0sFV1SDNSh5HO467wPxFRzSjmS6/XRNDyXn0c0JPTSgTYvxVavtTuJLpl1gBMzB0+cQYqG9JtdGZ2bWJikIKQVp7itsZS4quY3N+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uybt6toJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uybt6toJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790914008; x=1822450008;
  h=date:from:to:cc:subject:message-id;
  bh=csJTK9DFMPYjmmiD5M7S/sgDDRfYoWeFo8FwZyf6XIc=;
  b=Uybt6toJehTj7S/ulPC1S0QyRHC7gY9BmoHcMh1m6s/Zh0OodHb8+zi6
   9p3KRPK/18a5Tk75ZHCY1wbSRbsqrHV1DhGURLGu03WxyYRJ63p69No5C
   VmV+tPtjfO2QU5cAjEG7HZaFLB5ztBPiS1dr3ANmJ9o4+6FKdjkwMqZER
   iR2VTaGf5Cq072UtMdNKKJAsj3MTG3djqCtSHah5sVkzJmeGZSU0WFp3Z
   R1nnumbbE560R8Sp8FCzYF3NzgZ7amb4ueMwakHfXbk/3sACU6oS9J7SC
   Ps2NBQf0OFAsCpUCm6tBD6PxqIBH2DD4DYuKXGsLQrXCAVWThapHetMmh
   Q==;
X-CSE-ConnectionGUID: 91kP7XZIQr2yO4V+KThE1w==
X-CSE-MsgGUID: SbBIEbicSXq8Jk/XfkMv8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91701619"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91701619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:06:48 -0700
X-CSE-ConnectionGUID: f6lZG85gQzSVHQqQ68Q/3g==
X-CSE-MsgGUID: zl3rqmYOSvKjUoyuTs438A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279419436"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 01 Oct 2026 21:06:46 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUXk-000000000Ok-0DMz;
	Fri, 02 Oct 2026 04:06:44 +0000
Date: Fri, 02 Oct 2026 06:06:20 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-thread-safety 36/61] Warning:
 drivers/scsi/ipr.c:5017 Excess function parameter 'shost' description in
 'ipr_device_reset' (did you mean one of: 'host')
Message-ID: <202610020527.a83fGhIC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux scsi-thread-safety
head:   80f80428caac0784b2b3797b8e201d885d1b034b
commit: 435d2ce20391217cbecec0cd05798857a5a48701 [36/61] scsi: ipr: Pass the host pointer directly to several functions
config: riscv-randconfig-r2103-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020527.a83fGhIC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020527.a83fGhIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020527.a83fGhIC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/scsi/ipr.c:5017 function parameter 'host' not described in 'ipr_device_reset'
>> Warning: drivers/scsi/ipr.c:5017 Excess function parameter 'shost' description in 'ipr_device_reset' (did you mean one of: 'host')
   Warning: drivers/scsi/ipr.c:5058 function parameter 'host' not described in '__ipr_eh_dev_reset'
>> Warning: drivers/scsi/ipr.c:5058 Excess function parameter 'shost' description in '__ipr_eh_dev_reset' (did you mean one of: 'host')
   Warning: drivers/scsi/ipr.c:5017 function parameter 'host' not described in 'ipr_device_reset'
>> Warning: drivers/scsi/ipr.c:5017 Excess function parameter 'shost' description in 'ipr_device_reset' (did you mean one of: 'host')
   Warning: drivers/scsi/ipr.c:5058 function parameter 'host' not described in '__ipr_eh_dev_reset'
>> Warning: drivers/scsi/ipr.c:5058 Excess function parameter 'shost' description in '__ipr_eh_dev_reset' (did you mean one of: 'host')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
