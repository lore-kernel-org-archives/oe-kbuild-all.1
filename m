Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75B01DFC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720875743; cv=none; b=Grc4Y7zyu1fxnwJz3TKIL1aZW64NnaiU9F6gbKOnDMu1wKoPy5xdUtnfwXSRQid2vVnK16rYdzvWv+7aldOIQRXAxG5bR0+Wthl0DLBV2xrNu7cDcpizbaJiO6oiOeA7qAQJcxv0jenFQ+FYR0nduw54SL4K0wNMe78lB7KXwvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720875743; c=relaxed/simple;
	bh=ptOGL8hgGUwZC1CcVSOlMSIku61WS7k57I5XBpluq9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCXi7BaEp1C+3g+KZCHMUrSKhAlZdkit1WaM6CNW6s6GRtjZY/CQ2m5Uzsf6VUByuqjDLDy1lRc0w38/pWT1UGyk+P2cxdEmMIWGs4/fYnlhwAPSb+InyVe1mnLetmSFV/ApASo2eEOOdTWE6ZL6QpCC2UTIIqV6LS4XpW4M4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtskWglW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtskWglW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720875741; x=1752411741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ptOGL8hgGUwZC1CcVSOlMSIku61WS7k57I5XBpluq9c=;
  b=BtskWglWuiOMHbSZwTFjmBCTyHfavZB9oFB4ybDA/3YCgoiutN1wmCDd
   JpRv3pnCGMmPpO9ylxMmddrUes89taeGjNCm/gBb7+ynPWP++VxGVfV0D
   ofPhrO+TYXgPNDaX7EesMghUhhxOwGaVAaMTGtuyKB/HVVRBZaI4mV5AS
   4FifUbzSOPNy1Dr9nD5314tO8A503YHZmJzDct6RNfrxeerADOIkQk1Jn
   NR5vRdYV+IpTgcD/4Viy6XgWas6v9GEAtfTArmoxVq1zqiOcarof4/n9Z
   8LVi2XxPsn/d7QuxJikrFdohiqw9DzH7NCAklO9c8/FsAjwrYwy9GcrC4
   Q==;
X-CSE-ConnectionGUID: mtYzhLyiRsqaHci+K551wg==
X-CSE-MsgGUID: lirUIX5CRX+FQHTJapWsqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35740975"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="35740975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 06:02:21 -0700
X-CSE-ConnectionGUID: vqmtKqmJQgGlZHTloI/9bg==
X-CSE-MsgGUID: dorE3kZ6R0OK8AUf2zuprQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49936594"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jul 2024 06:02:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sScOH-000c58-0K;
	Sat, 13 Jul 2024 13:02:17 +0000
Date: Sat, 13 Jul 2024 21:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/memblks/v0.1 15/19] acpi.c:undefined reference to
 `phys_to_target_node'
Message-ID: <202407132010.kfCLONyr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v0.1
head:   d024f77faa6fa51163d89871f2a255229097a1be
commit: b167986837bb5d004f2dc131c553d1d267a8279d [15/19] mm: make range-to-target_node lookup facility a part of numa_memblks
config: loongarch-randconfig-002-20240713 (https://download.01.org/0day-ci/archive/20240713/202407132010.kfCLONyr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407132010.kfCLONyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407132010.kfCLONyr-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/cxl/acpi.o: in function `.LVL656':
>> acpi.c:(.text+0x24bc): undefined reference to `phys_to_target_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
