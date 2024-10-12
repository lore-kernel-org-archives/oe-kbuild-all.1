Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB416F8E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728762198; cv=none; b=iEzuUWYmj/2sCsAjXBeSyNtXhYnHfLFJZGVEVhe0AOOQmjcIONwY4OZ1lj1jO8d4/p49tQjPyHhqMYuoaIu3+XE3VM8Z1kKTb2WVjG+JW7FrzXnuKNzy3I+meEI5IlUrpMHU2QI3yzBuYmLDwnzvEbosZpoHBbQs94W3xtfZQ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728762198; c=relaxed/simple;
	bh=T3JOk48fIs7CCb6qBCzPzwGAIsUsismrpBfEugdYG+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JB+2do7lQerC3Ux2fuguLZtVRNzYfsczwyRjv43Og8iYI4c6luyNTqsT/CWUfKzxBm5TzLaYjwIo9hePn/Wq1S54Nip2ppZsxywdNlmX3FLFaBJfO6Pk8AYDFAyS91ZTdKpa37Wto0pL9X66ZfT+B9cS/yZfXrpMIbF1v4zQYTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T95Gw6xz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T95Gw6xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728762196; x=1760298196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3JOk48fIs7CCb6qBCzPzwGAIsUsismrpBfEugdYG+4=;
  b=T95Gw6xzjrY1R+vNCTdO4uYCcMWydnfBaoYTKi2t0ZOE2Nq+V8+EITx5
   WlcbN5/JexJ+M/WsX6tn5OcfKApd4Mfer9R7ebx+mIEikRAcXmT7Y2MP3
   pJemWwTI3FutpL3DzY5uuSCZ3/8ICbDi4IBEHJOqTortgbcPF36aCEyFj
   9c9e4wsssLvxH6/2Ul8Tt0c2q+0K70D7gdpVoMcAJTTu1Yu/KFaKej372
   OooJLmUSnTY4I231Q85Pc616+X6Fbq84sB73ZKfH2UtMZopbhO8PLIoVE
   EzMZSTtaq6kcfOjvdL83+OV/FY1u1EuAi6Onb4UYLtREIGldWgzYDDTgR
   A==;
X-CSE-ConnectionGUID: srj6Nq4AReqhve4q98DkvA==
X-CSE-MsgGUID: 7wEyeT3RQoGaXdt7HZyixA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28320578"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28320578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 12:43:15 -0700
X-CSE-ConnectionGUID: a7qhg1AmSq+nKpbxkyoNlw==
X-CSE-MsgGUID: hoEZKWbUTtSYh+tL0w3alA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82216301"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Oct 2024 12:43:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szi1A-000DfH-1p;
	Sat, 12 Oct 2024 19:43:12 +0000
Date: Sun, 13 Oct 2024 03:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1552/30000] kismet: WARNING: unmet
 direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by
 INCREMENTAL_FS
Message-ID: <202410130357.xS2yRE9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   171355878e09938c06396498f584662e3eddcdbc
commit: 1be052b20ba04b635cf87bcff80de5314697953e [1552/30000] ANDROID: Initial commit of Incremental FS
config: i386-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130357.xS2yRE9m-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130357.xS2yRE9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130357.xS2yRE9m-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=y] && KEYS [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
