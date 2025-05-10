Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5665611712
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 04:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746849699; cv=none; b=Ro211UpArWtriqaoLC6/AjtSGEv7h/q0RybHCZSIZeMspoKaqVibzsIoJHxxUEcqtvFyizrY1B+x4GUv4wo/7reHu5uQoJed2GpKzb4Ll/5TzYMr0uggaHMB85+YBIGTAKp9uXjoDO3ZOV/zLjxq7Qmay3JVltIYPH34tpfJDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746849699; c=relaxed/simple;
	bh=Deo+6oxk9tgCvvmgKhgGTSiYGFZ3lSmAy95Bd5UKhZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqSP6CDTGL7CjTLVC9EfimsydUySfAUmR5Uw9d1N+IJy4IjymQFOBbkAPP0wJAWdYzBdTTTXJYUb6Z4E4hrn7FxP6I14uramsLtv5KDpdgIfAuWay7FrDLy/BVrDtu/Ra7RZN+I/JHEsmKm2QAM9yF48poU75B4SNXkakGfoyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gv0DN7qh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gv0DN7qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746849697; x=1778385697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Deo+6oxk9tgCvvmgKhgGTSiYGFZ3lSmAy95Bd5UKhZU=;
  b=Gv0DN7qhxcC/2CSKmgwFQGxMdcWXeTvdSXu/q+Xt+aq8NvGxqR93cqCc
   f/SDGXdcPJesCV+vZD9c5OgaFECKFfHfS2yymasqUaS6Vqdo7Yaz/kAKo
   KNAujTH7hI+PUcLiJRouvcncJ8/+p1d8MKmLKD83TPZCWVoyeGaAjefFW
   f4Nb/c/T2cTqrHnxNYdxG+1ndHlSkVtgvjjO7ngHr92fTFzzSqoJhwaTM
   tSf8FFu/7iUEDlN+tTxjm+3uIHS7jkEZVlV7telhfw6BtCLCfucseQUDS
   YZuZQe4vDVY/f9xq5qeemHxfdTnohpHLd1ZN4HqML/C6/p3tY/uLmA17m
   g==;
X-CSE-ConnectionGUID: Vxdftf+0QOSX+7YNby2FqQ==
X-CSE-MsgGUID: K07ag0VuSs6jeq5l/zFZGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59322528"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="59322528"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 21:01:34 -0700
X-CSE-ConnectionGUID: hmKiWyDOTqKPis88jgz3Bg==
X-CSE-MsgGUID: lKJWOaGGTHCBMjCN7YVw1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137296523"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2025 21:01:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDbP0-000CmB-1m;
	Sat, 10 May 2025 04:01:30 +0000
Date: Sat, 10 May 2025 12:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [linux-next:master 9250/10031] ERROR: modpost:
 "wmidev_evaluate_method"
 [drivers/platform/x86/tuxedo/nb04/tuxedo_nb04_wmi_ab.ko] undefined!
Message-ID: <202505101133.3BxQOK6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: cfd84b3f419bf0aec60ecddc92c61b539c339ec9 [9250/10031] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: i386-randconfig-003-20250510 (https://download.01.org/0day-ci/archive/20250510/202505101133.3BxQOK6B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101133.3BxQOK6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101133.3BxQOK6B-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "wmidev_evaluate_method" [drivers/platform/x86/tuxedo/nb04/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "wmi_driver_unregister" [drivers/platform/x86/tuxedo/nb04/tuxedo_nb04_wmi_ab.ko] undefined!
>> ERROR: modpost: "__wmi_driver_register" [drivers/platform/x86/tuxedo/nb04/tuxedo_nb04_wmi_ab.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
