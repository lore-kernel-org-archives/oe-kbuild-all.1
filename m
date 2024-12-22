Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE90DDBE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734846811; cv=none; b=Pm1PJVCFyiQyQqO/2r95/K2akQ1wxotnqQMtqwhVgD/cxAXuLlATugjr8SrC4iKP63Ik+26S0TAShX8D16rNtGWubJYqKXHYcF19xH+3i+paJzZUmq3z95AI6k9vcZ4eFhj9lV9hNfXUwWuOH+dG1QuNKe4sQy5UpD6SaQMyvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734846811; c=relaxed/simple;
	bh=ghr+R8Xe5sJqdqJ1eb64LcNFNLohS6/fjj7PLeY9jjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2dP/dJBdxb3WgvVwUoDpIF97ebLVLEmC50D7GmWckBh43+mOtcwqHhoQomp0YPQx+CvQccZkgAG33dZv22K6LgsJp23AwtqTxXp0UGd299nQAsOcswZ1MSbyHOSI02IcFY4HQS5QW9iyt5NVM+/3QojnzvT/dPgTRStZ0M0+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRVlBCjN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRVlBCjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734846809; x=1766382809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghr+R8Xe5sJqdqJ1eb64LcNFNLohS6/fjj7PLeY9jjo=;
  b=gRVlBCjN8weXTtBOWYBNKXYXD3exAy73aycAci1LP8cEb22dYvy4t7qt
   XJa2vOOloixer8F+zsb1d3cVpp+H1cGUVhLSCWpIqUAqPy9kzIcDOOTqZ
   iJQGflcWJZVebNDH3Iyx5gJ7NcDIsn7HHFpHlLTZm6rE6Qe6Vc8gMO2lp
   Dz18SQPfjp1Cn67T33+rAJDlh+XQ6XPIYy6zSxgrzMRMfabK7X7eplrm9
   k87Y7+THoGeIuASqtvbMStCEpiGAfLABymnJa4jcchb4NFdKaq52HDlwW
   9V3HgLlobpe6KutnMxbmx9ta0pdg5TK70Qbe8DgV9bCTlxPsh9OJIIz4A
   g==;
X-CSE-ConnectionGUID: B8VsxAhCQpuFi5xRMlcsEw==
X-CSE-MsgGUID: N4ZvxHYCQaiScENL5d2DJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35505849"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35505849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 21:53:29 -0800
X-CSE-ConnectionGUID: 2I7rA+U2Q0aol3WOuAQxGg==
X-CSE-MsgGUID: em752ueQSvCk/7S0hhFSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98709846"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2024 21:53:27 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPEu5-0002kl-2w;
	Sun, 22 Dec 2024 05:53:25 +0000
Date: Sun, 22 Dec 2024 13:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.13-rc2/truncated-nonstring 6/6]
 tools/power/acpi/include/acpi/actbl.h:69:43: error: expected ':', ',', ';',
 '}' or '__attribute__' before '__nonstring'
Message-ID: <202412221353.rpZN7O4R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.13-rc2/truncated-nonstring
head:   2618dfca21ab2b38484908efbe94e5d17c7dee3b
commit: 2618dfca21ab2b38484908efbe94e5d17c7dee3b [6/6] [WIP] Add __nonstring where needed to avoid -Wunterminated-string-initialization warnings
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221353.rpZN7O4R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221353.rpZN7O4R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/power/acpi/include/acpi/acpi.h:26,
                    from acpidbg.c:9:
>> tools/power/acpi/include/acpi/actbl.h:69:43: error: expected ':', ',', ';', '}' or '__attribute__' before '__nonstring'
      69 |         char signature[ACPI_NAMESEG_SIZE] __nonstring;  /* ASCII table signature */
         |                                           ^~~~~~~~~~~
   make[4]: *** [../../Makefile.rules:25: tools/power/acpi/tools/acpidbg/acpidbg.o] Error 1
   make[3]: *** [Makefile:18: acpidbg] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
