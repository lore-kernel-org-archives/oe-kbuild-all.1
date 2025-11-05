Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92FA41
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349743; cv=none; b=rEJAisyvX4IY3Z6Q0JbAPhe62MRax89muh8KbHq31bFtrbiJakJM9UCJQQCZBW/46T9JXJoUvybs3akijFJpCBf2FX6AG+D8vN7GCXBGxtMqqsjKAVorWs4+jyrrklidWsF5eHM/NNKc8qYzoAaEDrMZL7bY5QgJ8syB8ydGQAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349743; c=relaxed/simple;
	bh=XNW+tgFo3/5bq+0yOHRwGDUL9R37SAh0QvpNiGKMA8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMi0NcRxvSm3w2fO76WDVGMI+F3Dx75Gp72VWak3SMIP3pQAaNrMjeYCpzeQkNTvZ5zVaIhJxpSTJlzbbeDjTBwBRliuh8/KkkwL0izvrup/5O+nBTQ6KiIZGNvnMf6iHx5Vz9Zlxjko50Idfn7AdpzE0VuRsUkM6981eqA/GSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtKWz0qb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtKWz0qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762349741; x=1793885741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNW+tgFo3/5bq+0yOHRwGDUL9R37SAh0QvpNiGKMA8c=;
  b=WtKWz0qb0wfPr5c6jZtOcQts+A7UEAfKK6B6s3uU2RWuzmucvFn6S4/O
   4PTBfwBuFCVdX3ueqLmO8OwyjOLQK1U1MKrDfiBqwPYaZ2JSFNVQ9MZHk
   5In6Ia8V1PLRa5qtCRjjtd2aUc1/JecWtF0pljGXrkXpn+wrF/ClckYob
   aeTA+WOQLove+OsX06iDe5bcMCqfUAH6D2WrPvGvCDYBuqJwrE3AsaTx4
   pRfiXJqMzmo/AkYWCY2kZXS37Fw5abKwz3f0eVPaMJUbAJwxOeXh2S82m
   D+Kur9WSKPPaVvMg76FxuLi5HjVpxV2wDDoHl4MDlx3HRiZRq0+o1EB1J
   A==;
X-CSE-ConnectionGUID: 3F1w56V4R/GV4MxMjNbcFw==
X-CSE-MsgGUID: 4Yfl8BT6Qf+hjo7wHdB9Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64369041"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64369041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 05:35:41 -0800
X-CSE-ConnectionGUID: EyJ5bRp1RUacHHNmDKn8PA==
X-CSE-MsgGUID: EMyZoi7/Rz6Y8sUAKPsObw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2025 05:35:40 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGdfj-000Sd4-2N;
	Wed, 05 Nov 2025 13:35:36 +0000
Date: Wed, 5 Nov 2025 21:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:measure-error-v1-devel-v2 6/6]
 include/linux/ima.h:56:1: warning: no return statement in function returning
 non-void
Message-ID: <202511052159.kUB2SfaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux measure-error-v1-devel-v2
head:   9a18812bbd152e161681fe65e9414e05c5aa3480
commit: 9a18812bbd152e161681fe65e9414e05c5aa3480 [6/6] ima: Deny file op if a measurement error cannot be recorded in the TPM
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511052159.kUB2SfaZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052159.kUB2SfaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052159.kUB2SfaZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:15:
   include/linux/ima.h: In function 'ima_kexec_cmdline':
>> include/linux/ima.h:56:1: warning: no return statement in function returning non-void [-Wreturn-type]
      56 | static inline int ima_kexec_cmdline(int kernel_fd, const void *buf, int size) {}
         | ^~~~~~


vim +56 include/linux/ima.h

    55	
  > 56	static inline int ima_kexec_cmdline(int kernel_fd, const void *buf, int size) {}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
