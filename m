Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8759111AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 01:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724463475; cv=none; b=uEf1VJ+Gj0XF54vEPfXt5+HqbzgIq/KkhtQ0t/Pv+S+ssPw4n/S7YOLVwi6enOGgkY66rwr1Wqx/1/kmc2BnP38fI3HUSNXv7HAUl7RSSIWji4crfAosbC263t8nlFIcVHCw/24TBlapvqiKzikj2egUtl6xlb8Bp+F0pDkFaso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724463475; c=relaxed/simple;
	bh=C7NAJPbsX49BZP75hDMyeNDCJLOJqAMAvFR2XabvOXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abADRqGbJP3Tz2nxa8GcZ1RCB61AWacFRKu1VUSKSnD/ohIv2DIZtfnLs5uAcxb7+xqqOxhdDM9h4VI0ONamPOembwQFwpl+sVosC4wPvwGKNYRFB7VJYm5MKPYUsGyRxiAIieqrEM9FVlwIVsCvEMsu+Dc7+N8PtyuGPDSA5cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0A3GFle; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0A3GFle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724463473; x=1755999473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C7NAJPbsX49BZP75hDMyeNDCJLOJqAMAvFR2XabvOXE=;
  b=H0A3GFleh6UlJnw3ywGySyf1V27OfroWHGU+CWTeoRuD/NyvUCz/rkgM
   fOI8nXElu9IkysSOAkcrROAwmvVgHFtmQ4+UQpL2QTMEMhmqWTIwue8BQ
   Viu6dZwkZp6OXqsDBy/Qn7e7oHWsR9QRuTKDLlCm37qrPUj2tCs+Jp5Ec
   LkCMcvPKziGMY9B6ETTthMLqSnJcEhuKXpfNqN00+ubPQhzph1fWYu4rg
   VYf1g66Tv50tSVw0CvSjA8O7IUyhen/Bnjcr1GweuensUR0uAQvu36Owp
   JfjHnru+lZou8h0wPMI0hMXcJ8XweWAKnMBJVCP4dR7U3EFyrIF031lrN
   g==;
X-CSE-ConnectionGUID: EppuokMiRIW8dYliPUWsWg==
X-CSE-MsgGUID: QO0NJesZS5+s4FIgv6L+ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34373162"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="34373162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 18:37:52 -0700
X-CSE-ConnectionGUID: cPY17AyPRCO+jCQtqJYidw==
X-CSE-MsgGUID: pgImnqnNTpGemjC4VgPf/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="66887543"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Aug 2024 18:37:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shfiu-000EC8-37;
	Sat, 24 Aug 2024 01:37:48 +0000
Date: Sat, 24 Aug 2024 09:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8557/23546]
 drivers/firmware/efi/.tmp_runtime-map.o: warning: objtool: missing symbol
 for section .text.unlikely
Message-ID: <202408240958.qJvsrII0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   05b69c92264287aadadd460be9e52ddff17ff1e9
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [8557/23546] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-001-20240821 (https://download.01.org/0day-ci/archive/20240824/202408240958.qJvsrII0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408240958.qJvsrII0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408240958.qJvsrII0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/.tmp_runtime-map.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/firmware/efi/.tmp_apple-properties.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/i2c/busses/.tmp_i2c-amd756-s4882.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/clk/bcm/.tmp_clk-iproc-asiu.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/clk/renesas/.tmp_clk-div6.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
