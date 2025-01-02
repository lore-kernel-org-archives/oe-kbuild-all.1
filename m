Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A011ABEAC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735833833; cv=none; b=Ul/XIpmP4wwNuNQxw823510DCPPtiTB+ucOdyTUkNkK5Ok8vhQy++uN+0zOPwhgNXvuhzHslMZ0HD0UToZr5ZegPHbjA+WAkhE5/psKH1ZgxaW3b5oEeGuZiYR6IzGSa3ZFoSHL58I7eHlxh/yQ533e88wHtJ3eFypAcGe8s8Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735833833; c=relaxed/simple;
	bh=bFMyrCKCo1FoxkIqW0lHkkvs0Ui3q7Li6kl+gjQqrHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THaYavBb2xIYYx9UcOR8hoaM6OT1fTzWrE+7SwcwxZkR39etGwmjl1xb6H2oECX/flRZyh8gqUuaHxjK9N4agNxIT5BtP4vADxJFo/p4cGRcLAM8iLg2PDbHnRZH3A44y5sAkx7exQABmct+QWbpYqQW7hxH40J6/zyU5+Okc98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zbn94aKz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zbn94aKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735833832; x=1767369832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bFMyrCKCo1FoxkIqW0lHkkvs0Ui3q7Li6kl+gjQqrHE=;
  b=Zbn94aKzyf627aZ9zGURrXe7Y3ErW+i8XsIb0mnuNAT7YNTRJ1DJ0c3L
   BVr1TeLLWij5t2UcCkTYUPo/c4w4MvhKyF0qB26tds8+Ik1JD8hZZ4Vb4
   BNjcSNkjwDHirZY9IhiMt/Be9e4aZZ8e8jzsLTEzWqCgd3QYu+QgbuvpX
   xBUs0ZyCX8nRJv9o0DZJnIcDEp7adRiPQrZqfgcIheTOt8loKFtNpOtXf
   SLzp0DXjNtLzGr43lobvFlmBq8Im5cj8HU2cuNK1t2aQbePr3mo6nqI2T
   eV40hvKV6eQxGKrvwwZhExvbmzZGl89kFlunD7m3ZmZhEN1L9rHa3gOnb
   A==;
X-CSE-ConnectionGUID: Wz5BjMASQJ+C/7beFXiUQw==
X-CSE-MsgGUID: VX0IajLSRnK3IVoyZJ6pgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46564632"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="46564632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 08:03:51 -0800
X-CSE-ConnectionGUID: uwAcR5vQSH2hmJ51Bh7fCA==
X-CSE-MsgGUID: V4BkvL/TSfOOdmE4C9+czw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101627818"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2025 08:03:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTNfn-0008dD-1X;
	Thu, 02 Jan 2025 16:03:47 +0000
Date: Fri, 3 Jan 2025 00:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: arch/x86/platform/olpc/olpc_dt.c:226:19: warning: variable 'len' set
 but not used
Message-ID: <202501022345.kLLyXfmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lubomir,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
commit: a7a9bacb9a32f9cebe5feda2e33064440f52d61d x86/platform/olpc: Use a correct version when making up a battery node
date:   6 years ago
config: i386-randconfig-002-20240720 (https://download.01.org/0day-ci/archive/20250102/202501022345.kLLyXfmM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022345.kLLyXfmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022345.kLLyXfmM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/platform/olpc/olpc_dt.c:223:5: warning: no previous prototype for 'olpc_dt_compatible_match' [-Wmissing-prototypes]
     223 | int olpc_dt_compatible_match(phandle node, const char *compat)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/platform/olpc/olpc_dt.c: In function 'olpc_dt_compatible_match':
>> arch/x86/platform/olpc/olpc_dt.c:226:19: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     226 |         int plen, len;
         |                   ^~~
   arch/x86/platform/olpc/olpc_dt.c: At top level:
   arch/x86/platform/olpc/olpc_dt.c:241:13: warning: no previous prototype for 'olpc_dt_fixup' [-Wmissing-prototypes]
     241 | void __init olpc_dt_fixup(void)
         |             ^~~~~~~~~~~~~


vim +/len +226 arch/x86/platform/olpc/olpc_dt.c

   222	
   223	int olpc_dt_compatible_match(phandle node, const char *compat)
   224	{
   225		char buf[64], *p;
 > 226		int plen, len;
   227	
   228		plen = olpc_dt_getproperty(node, "compatible", buf, sizeof(buf));
   229		if (plen <= 0)
   230			return 0;
   231	
   232		len = strlen(compat);
   233		for (p = buf; p < buf + plen; p += strlen(p) + 1) {
   234			if (strcmp(p, compat) == 0)
   235				return 1;
   236		}
   237	
   238		return 0;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
