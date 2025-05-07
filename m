Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D551288A8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596692; cv=none; b=B8njg3LeznWfRhGOR/OqstpYPFZUbv2PM9kfMkKKkoW8dvDMZOGar3Zlj/tbdq+Eaco/yoW0N4LGcuoMO3uAsUSobZI/pMP/WVyEzvOoJeOD0hOKR8CG+aQM0Uktx7X9OPVKyaAgy89ntOZ0hj0sRnCmu4/v4l2o0w6OEbwL1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596692; c=relaxed/simple;
	bh=BqL1RgHgu/Jht9WRoVdLTO3SxsVGC/adozBHb6Tswq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDslTVDqkoj/XVmkt7k7vCGAgadKwWMB6FRGnXiXmXd+mOEUYOSTIDY+cm/8TBrJMkUwGmQnS1MLAXbCzUW3ckIO/wrL2PNgs0jd8j4/n3I0oaXncybMetxWuP9ZSfluGBcAEVXGqk+5LkVE6fmfz7jnINzgaPbkabRmvjc9WZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFWEYJll; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFWEYJll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596690; x=1778132690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BqL1RgHgu/Jht9WRoVdLTO3SxsVGC/adozBHb6Tswq0=;
  b=XFWEYJllAdcrV0m6UT0rA53jaH7rzgPYx+0a8uMiFMG1AF7ubJYEYimK
   YPpyb8y9mUBzqWLi4xYM/3Ei4k27mJtjvEEqZzV23Q2nE4pFE4iiML7in
   Lo5qmbGfL3DyLKWTlqL7TgMCnOprx7a4BmAZAEVZaohVAcRJ33Po8z3rS
   YfRPRhXOLR4CvXvFCsrQbRGUPNZhiBQTT4nU9RAQAauzJhfZtJRB4gYHA
   WZ7RcYzWsPKkAw8Mmwp41yZJ7f3Mh52gnElg1GooAqTy8FirJ4XNfhuzP
   rTtboPa6z2ck4x6NlMABmP4mYjX7wSK8f6OSKUOmqvvU5GhmHUSeMP8ls
   g==;
X-CSE-ConnectionGUID: Yzd2ssQER2S1SOYzd+LJTg==
X-CSE-MsgGUID: kkWKO02LSB2qC78SI6xTDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48202517"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48202517"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: Alpo12lcSLaqtc4D7V/kOg==
X-CSE-MsgGUID: 4Xqo36j5SjGL+PyzJ+jn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135844093"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2025 22:44:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaF-00076O-2v;
	Wed, 07 May 2025 05:44:43 +0000
Date: Wed, 7 May 2025 13:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 62/87] ERROR: modpost: "rsa_disable"
 [drivers/tty/serial/8250/8250_base.ko] undefined!
Message-ID: <202505071358.VVPI3A9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: fa0317bfb9f28c33a9a84d824d1e8096a860b0da [62/87] 8250: move RSA functions to 8250_rsa.c
config: sparc64-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071358.VVPI3A9b-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071358.VVPI3A9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071358.VVPI3A9b-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rsa_disable" [drivers/tty/serial/8250/8250_base.ko] undefined!
>> ERROR: modpost: "rsa_enable" [drivers/tty/serial/8250/8250_base.ko] undefined!
>> ERROR: modpost: "rsa_autoconfig" [drivers/tty/serial/8250/8250_base.ko] undefined!
>> ERROR: modpost: "rsa_reset" [drivers/tty/serial/8250/8250_base.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
