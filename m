Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D293190066
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354271; cv=none; b=AA42hej/qT6Z53D50bIL4Avnd6V0/bLkmD538gxqQbCHAsSEjd6jbLkYSV4xfmQo+qa/9+roq2Qaw+apxWTKTXeEwCVk69VJiB7FdTs1bq0WhrmfPiC2WIPDTWCAUw8XTAW/N4tV/VqinVr5kgW6YnAqli9JJ5dDmu9n+xsj5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354271; c=relaxed/simple;
	bh=sY+o6D5FiuiMBQ0JwarMcrr0nHlp9CdaGWaH8GbQ7ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SH0T9P5o85ekReKZhTxSrMCxs6qHBUp+t6IAQR7l7Wt/bRZBQkV0W315tg0FnW+VJojmiN6A4yB8YTHknx0XfVf5SLBD7j56Qv3zi7ifOFQDuDoQ8qJKhaiJf0U/jifMP6xluGdKHwLon7M9Dx9rQRhZoackbS0Bl+pFHHYfQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VdwFgABx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VdwFgABx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718354270; x=1749890270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sY+o6D5FiuiMBQ0JwarMcrr0nHlp9CdaGWaH8GbQ7ds=;
  b=VdwFgABxv4Lvron8hH3k/SX0VvujHYM+7TgpdP6bbe/s6Uf2x41Y/tbJ
   pfhZanwc+krQ0UuJRwPRNBejxOYIpeuW8Pc3cyjUk8e49M9j7QcTPwrHe
   ULsdpsb8Fld5rNgXDM+TLYaxt2r8mt2gsWN4y+ESCcKh2kfpV1uWo/l4h
   xsdx34jwXWXGJb6vjlBEgzCqGk2/QeITMasT4NUMoDYXEo6BKyFHHlsMN
   ZF3f/tp5iVsZUU+lV22eSDUeQ8zk5QYf8CUG9aYtn1En4HVHOnac5yRZE
   uLTRgDNem2Ch7rhq/mSU9h0GpaMQA+YvpQjcy6jZ46pZUBoeTRX0GbVim
   Q==;
X-CSE-ConnectionGUID: oGxudGSSSR+eIAYdmgOMTQ==
X-CSE-MsgGUID: NDaQttPoRp+t9+8I2yMRJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26649411"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="26649411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:37:48 -0700
X-CSE-ConnectionGUID: 9HJWuh0AS7y5ZzFG5Lxxlg==
X-CSE-MsgGUID: CXPK1hehRruLkrbGz/w5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="44809610"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2024 01:37:46 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI2RM-000122-0L;
	Fri, 14 Jun 2024 08:37:44 +0000
Date: Fri, 14 Jun 2024 16:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4606/5501] arm-linux-gnueabi-ld: error:
 .tmp_vmlinux1.btf.o is already in final BE8 format
Message-ID: <202406141603.O7gEs574-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6906a84c482f098d31486df8dc98cead21cce2d0
commit: 6e5cd25b08c23d691e1c3a5a1521e992ad90da69 [4606/5501] kbuild: merge temporary vmlinux for BTF and kallsyms
config: arm-randconfig-r011-20230531 (https://download.01.org/0day-ci/archive/20240614/202406141603.O7gEs574-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141603.O7gEs574-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141603.O7gEs574-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .tmp_vmlinux1.btf.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
