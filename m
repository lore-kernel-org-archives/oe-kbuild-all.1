Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E71714A3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456137; cv=none; b=emSLDoZ9b/YXB04f1IRSJ0XyTMffVlGmSsGflGyg3tbBHib+JlnY3iHszdiZKsp9ciq55SSw7E8bwQcgYio1h8HgADgIu5IFO9UVZO4HwibhZs8heTtC/H0XnUPMuiKGrHUBz3DmM+nb/mbpV4mfMC3WrYh5W2yZckcQ87yFVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456137; c=relaxed/simple;
	bh=rlyx01qn6iChv0MnnqErg04+ujbkbuq+XwqSqJctQVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bGc3cBA3I4H+le2V/yx6EO2WGfADJtAj7FTNot9s+wAAqV0dElUGvy4K0FTUMFfH2ioVIhOTlrbJGc9zGeUZtfx70ryWFdpImeQnCDYJEuc9rY4ebFWz5xsijSD9DufrBztAVmU7SoD38HWXOWPAAUMIO3efsEJDhqa16DYdeOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9TLqG5E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9TLqG5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730456135; x=1761992135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlyx01qn6iChv0MnnqErg04+ujbkbuq+XwqSqJctQVo=;
  b=e9TLqG5ETLsXLFnWuGrnIVsAG2Nz4pYF7APV0abczISF//2dlbzjBabZ
   qGpxsdEENmkW8PGujetuXbeAObnbrzdHYPDSgVbAOXXrQtrxrwIecjdx2
   ALrd4UE0e6PkBVm2NBYd+eCEWvnOYgd/7OfE5hK7qi0iOpnuy/VbyosVh
   sTLbpcxEK89XW7knB1JmhSY27wiotiW9c8Absdz0HKbbb5JvrmaHxnZda
   WI81XE9JbLtTxjtwe1PbZG8DfosRawQWWkatm0F3PQ5DmH0taMx47iQgZ
   WLM0hXeqJJpYrbzRCXq1UD+s7U9ZrqypoWWvON2f3bJauetXgjZ1KT+aR
   Q==;
X-CSE-ConnectionGUID: iE33h9wUTQqvkvo37tUC6Q==
X-CSE-MsgGUID: QE+ZGFz7Tk+tKoZuMraOAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40767536"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40767536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:15:34 -0700
X-CSE-ConnectionGUID: LQq/OTYASg2SRrxUDWMd7A==
X-CSE-MsgGUID: h6PQx6GPRnC1iKdmz0fsLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="88048391"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2024 03:15:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6ogj-000hP3-2P;
	Fri, 01 Nov 2024 10:15:29 +0000
Date: Fri, 1 Nov 2024 18:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 104/113] kismet: WARNING: unmet direct
 dependencies detected for ADI_AXI_DAC when selected by AD3552R_HS
Message-ID: <202411011805.vP5f4Zma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   b569745666d49101f7a9a2a6df122bfbd89156ff
commit: 7bb79aecbdd2f137650685ee1171575c0daa4ff9 [104/113] iio: dac: ad3552r: add high-speed platform driver
config: x86_64-kismet-CONFIG_ADI_AXI_DAC-CONFIG_AD3552R_HS-0-0 (https://download.01.org/0day-ci/archive/20241101/202411011805.vP5f4Zma-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241101/202411011805.vP5f4Zma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011805.vP5f4Zma-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ADI_AXI_DAC when selected by AD3552R_HS
   WARNING: unmet direct dependencies detected for ADI_AXI_DAC
     Depends on [n]: IIO [=y] && (MICROBLAZE || NIOS2 || ARCH_ZYNQ || ARCH_ZYNQMP || ARCH_INTEL_SOCFPGA || COMPILE_TEST [=n])
     Selected by [y]:
     - AD3552R_HS [=y] && IIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
