Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBE154C08
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 19:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243220; cv=none; b=kBgBvuX59vWDxNu+3EF2AYL7giF4iagJB16xeyC0qDMe8hbCZe3XQS08o9JeZJdrXp/O83Z4Q7uKgVC2cZfOEspMubQ3DVyaCz0aHJEgOoqpDCQwoD7H5SD+Y/y5Mk/IKl/tZujCBgaY3txMyemIKnMpEY8rhJasoe4UdKKRGB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243220; c=relaxed/simple;
	bh=+Hd1WViUHOi4pR0VMSa3wMJBIja2MhTscL+D8cqaxic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNbNdeQrFcLCCfx3obUhZxmBIrdmEDa1X6BJiFfYDh222/2q0XvKqP/ti3h5fH4KCMElONmm7mSefiMvNaMohJ8KrciH6mXX7jsuaXJOmFA9krJ5MhpHVoVb4Q/1SG+nPE77X1C7fLeB5B5Q2ih3zGv0d8ilDZFr7Ud7ERlKg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyKNQgVm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyKNQgVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728243218; x=1759779218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Hd1WViUHOi4pR0VMSa3wMJBIja2MhTscL+D8cqaxic=;
  b=RyKNQgVmpWewvAAAh04l0I/L5UDIQvpiUsgoJ3183KTUGGLL7UU+KX2B
   MLp5jEu/K4ADNneCvXbVfU8xxp7egPIU+wqMJwEfFydnEVXwHOwCYGFv1
   dySd19kIH5PZu0JKW0vayFnQea37ZP1gEnCR+knCAZPLHVzeRgsTPzRW5
   KLFWfCVjv+UkOVd7jJr7hQsALeyWb6wurJqa8IbPRsUKkLGHdfeuElREk
   6HXRIh2bCBtK2lGRYzYhQps5W/7z40CTAPHrMh3aRRX/+1F5uVF1KWwTW
   TAMw+OWsGUONIPXkw6H7kGn3CN9ek63efP2ZyRaROJm9yCH1UW21x37Bl
   A==;
X-CSE-ConnectionGUID: SGGQBi2aQwelMO6vp1GnDQ==
X-CSE-MsgGUID: D/W1KKL7Q2SZ47BA2l5ADA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="52789896"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="52789896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 12:33:38 -0700
X-CSE-ConnectionGUID: zgNqv7ClT6+dg7aiAUHcWw==
X-CSE-MsgGUID: DjNVmqCvR6e9+vWuoh9cbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75394400"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2024 12:33:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxX0Y-0004Hk-2E;
	Sun, 06 Oct 2024 19:33:34 +0000
Date: Mon, 7 Oct 2024 03:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Salih Erim <salih.erim@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 59/81]
 drivers/iio/adc/versal-sysmon.h:167:27: warning: 'sysmon_oversampling_avail'
 defined but not used
Message-ID: <202410070345.mcNgmfW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   3c31f9d5fb29a99c43f59d424f7f717ee2177e14
commit: daaf857540cca50ef575b08c1619b7489dea4e15 [59/81] iio: adc: versal-sysmon: Adds oversampling/averaging feature sets
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410070345.mcNgmfW0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410070345.mcNgmfW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410070345.mcNgmfW0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/versal-sysmon-core.c:16:
>> drivers/iio/adc/versal-sysmon.h:167:27: warning: 'sysmon_oversampling_avail' defined but not used [-Wunused-const-variable=]
     167 | static const unsigned int sysmon_oversampling_avail[5] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sysmon_oversampling_avail +167 drivers/iio/adc/versal-sysmon.h

   166	
 > 167	static const unsigned int sysmon_oversampling_avail[5] = {
   168		SYSMON_AVERAGE_FULL_SAMPLE_RATE,
   169		SYSMON_AVERAGE_2_SAMPLE_RATE,
   170		SYSMON_AVERAGE_4_SAMPLE_RATE,
   171		SYSMON_AVERAGE_8_SAMPLE_RATE,
   172		SYSMON_AVERAGE_16_SAMPLE_RATE,
   173	};
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
