Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0C1DE3B8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 19:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728330676; cv=none; b=uYPP9G8y0mp4OaicxGLvSitD0qN8X7X5ByoabbKi2IKqXO0wx+q6g4YPrYLt6Sh626LTGMXs3vW+H5H9crQFew+ukcrB+zPKblkrJUXrl3SVcjfb2Z/ZTC0pDTcTqg+G51TtCFtnjRgjBDd4+AZ7hArcDzPz66e77qc2DWRdC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728330676; c=relaxed/simple;
	bh=DBduHN1NwZ+HaFvJyUssezjD0W8/KuhRM5d8wB6fQeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loeMAhCSbsUfDzM0o+V6qEINAiyjfT/DhFQDmQm7jLCtpSiniEaW6beOXAhgAzY9NMA/LzjJRsdxUwvNkcr2bfe9Vih4KauMoupD9+36usxDvVb64eJ65Tdw8J5Gah/XG8nvpcfdqRwvMk3QCHIAOgq02gfrIoazfvibMTG+L0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWB+Hyr2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWB+Hyr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728330674; x=1759866674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DBduHN1NwZ+HaFvJyUssezjD0W8/KuhRM5d8wB6fQeE=;
  b=dWB+Hyr2k23RQwd4/jwme9KgzXyy+wuvG1AspGBEMHlt83Sr6U5iDVLa
   wCBrwUtmRlZcZi3Fe1FfozoKIERnzYrHv+gcAtR+ZdLQ9H7xjdHRQWdpo
   ph57Rd1TYzMVm8OmqjYK3puRAS6oCnmr6Tt6iDEbNm3/1kxr+Ixmu+SQ0
   gMI5DR0kyEQmS/tufQf1Wl27/YixCbnofvPsdqyK7D6jhMLuVE3hy4+ph
   bdq8qlpnMWwY4mv2vU05IdUdJJSJ3opyJv3u0kteAopotY2PQvMGS7MZb
   WljKKQy11tmvtf9hlxH9kkzLpIBUeZq6Y/+t6AyK7hPrvQuhU2FumVuDf
   Q==;
X-CSE-ConnectionGUID: TRamBcL+Q9e5vTBsvB6CtA==
X-CSE-MsgGUID: ehLQVN7oRQ68tPT7gXMyIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38099007"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38099007"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 12:51:13 -0700
X-CSE-ConnectionGUID: uLQaaFw7TxuaiW/vLWuMDA==
X-CSE-MsgGUID: MuSK/plWTxKDBXTU1Hcy9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="98911287"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Oct 2024 12:51:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxtl8-0005Sa-08;
	Mon, 07 Oct 2024 19:51:10 +0000
Date: Tue, 8 Oct 2024 03:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 7401/16788]
 drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10:
 fatal error: linux/mali_kbase_debug_coresight_csf.h: No such file or
 directory
Message-ID: <202410080331.NXulHibX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiyu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: c72487fafcbdaddc79c61ac5a119c5d89af807c9 [7401/16788] MGS-7531-2 [#nxp] update the include path
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241008/202410080331.NXulHibX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080331.NXulHibX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080331.NXulHibX-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: drivers/gpu/arm/midgard/platform/imx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/gpu/arm/midgard/platform/imx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/midgard: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/gpu/arm/midgard/csf/mali_kbase_csf_defs.h:39,
                    from drivers/gpu/arm/midgard/mali_kbase_defs.h:353,
                    from drivers/gpu/arm/midgard/mali_kbase.h:56,
                    from drivers/gpu/arm/midgard/mali_kbase_cache_policy.h:29,
                    from drivers/gpu/arm/midgard/mali_kbase_cache_policy.c:26:
>> drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10: fatal error: linux/mali_kbase_debug_coresight_csf.h: No such file or directory
      26 | #include <linux/mali_kbase_debug_coresight_csf.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   cc1: warning: drivers/gpu/arm/midgard/platform/imx: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/gpu/arm/midgard/csf/mali_kbase_csf_defs.h:39,
                    from drivers/gpu/arm/midgard/mali_kbase_defs.h:353,
                    from drivers/gpu/arm/midgard/mali_kbase.h:56,
                    from drivers/gpu/arm/midgard/tests/mali_kutf_irq_test/mali_kutf_irq_test_main.c:26:
>> drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10: fatal error: linux/mali_kbase_debug_coresight_csf.h: No such file or directory
      26 | #include <linux/mali_kbase_debug_coresight_csf.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +26 drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h

d5c5f8c95d8fe5 Shuming Fan 2023-08-07  24  
d5c5f8c95d8fe5 Shuming Fan 2023-08-07  25  #include <mali_kbase.h>
d5c5f8c95d8fe5 Shuming Fan 2023-08-07 @26  #include <linux/mali_kbase_debug_coresight_csf.h>
d5c5f8c95d8fe5 Shuming Fan 2023-08-07  27  

:::::: The code at line 26 was first introduced by commit
:::::: d5c5f8c95d8fe590d3ca321d3d5a04c32f50f11d MGS-7263 VX504X08X-SW-99002-r42p0-01eac0

:::::: TO: Shuming Fan <shuming.fan@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
