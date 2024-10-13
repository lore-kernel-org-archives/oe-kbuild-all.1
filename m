Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1B7231C84
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 01:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728782673; cv=none; b=af+dgRHWfhM/SckPeras1Ru+fc6yPg9rzBIK1pJCjQdSyPyTsMxHsNxPjEJ2IUrSexyNLiGNrfJWu+0FcnAoTx0fzXUTbAeh+tJGpYQ5Evsb6CURhndWFpCLsK1+qiPk1pUcZEBkdqUM0XdT3Cf+qqpm1x9Rz/R3QmmolknYAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728782673; c=relaxed/simple;
	bh=+qMbNKoJtlv2lC81UEJpHl1Uzzsr4K3aY+9SKnBFS4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLgjtcVudNhOcYSNfBzWfMw5d46fuFogPh4fc70MMIIKHCFoX/xg4m1I4I8594HmwIcAQYyFDw4n1Mwv7BFZMBmyBGmnobWom2WGNfW1WvS6HAqJ8YD1uK8vtsWME4JxEbM/TJVZhwdJn383hLuDsOsL9TueBkhNNfuvgFmH9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSOI+H30; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSOI+H30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728782671; x=1760318671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+qMbNKoJtlv2lC81UEJpHl1Uzzsr4K3aY+9SKnBFS4o=;
  b=VSOI+H30u+UnA0qrh3x8z5aMx/5RPg8n8YdKYmbe+bvM1Jjjh8CVUaGZ
   7HvOgrNJhHo5SFsL31OS5BFS6U6FNMndrqNkMuRJHCPVaAzFJ1Bf9g40D
   B9zZbzECIPMiyeGV6wCOlPnOpP0P/5SqVnNoOwp34etw95DQv92usgws+
   Ps3so4jV53cnzsgIQKyW6T5LUe+9AW7WVU616oOG0KVyYbFaKB8ojDxe3
   +75QqBvVRJdNb3V/UvULK70S6UVGjsajGb7Fc4JAcc4y80rnifRJe6P2b
   q7sTMI53CUcBGdqVaz01BKuCGOs5ZpKHBnGdDvf3RqSMn44lCU6TOR3UO
   g==;
X-CSE-ConnectionGUID: U94m6QayShO7Q77qKJ46nA==
X-CSE-MsgGUID: /rTweevgQ7K9SR0ARUN10A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27958468"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27958468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 18:24:30 -0700
X-CSE-ConnectionGUID: ML5FwHU2SK+ZtTOn3DVErw==
X-CSE-MsgGUID: RFrvKbkbRUeu1LQNMtox5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="76873368"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Oct 2024 18:24:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sznLP-000Dwx-2F;
	Sun, 13 Oct 2024 01:24:27 +0000
Date: Sun, 13 Oct 2024 09:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9843/30000] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202410130904.4YCo9dav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   e6ac8beecb16a01c48914693e8fe47ca86927309
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [9843/30000] ANDROID: Incremental fs: Add zstd compression support
config: x86_64-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130904.4YCo9dav-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130904.4YCo9dav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130904.4YCo9dav-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
