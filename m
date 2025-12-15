Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753913009EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765777437; cv=none; b=iCDF+yAkTdmx/+3l5PzX0jmx/nGzsiBLthfKnro0cllo7A5URpScUgbwAmncCciv17W5C6QlMWDTqdDduXEE7k9OEDGB20/eO7NsSn0syjWh/e+7A0+y4G6tr3J8hhuaU9UjMq+ZZ95sDn0u1IR0KhB0VOEBZA15kkLUbZhlP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765777437; c=relaxed/simple;
	bh=tsXPbrmjIAcA8u7eRNRj8q1+T3DY5GRgXTJ9xsWuLT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHRuce6TWT/CcsNvI++luHsRK6WhgGnhT9ihc1F80MZXDLyPrkiTXEY2X9EfPVSgFouo0XyEfduSIX4mn5qV8OdNw7nF+RPTE6U24h5Awp+CSxbqgJCIt3t9chOoQrrM4/cUIJjfWm3+yllPoUjsgilE85tPgn6vqHt2iBnuRqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPCnmyGO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPCnmyGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765777435; x=1797313435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tsXPbrmjIAcA8u7eRNRj8q1+T3DY5GRgXTJ9xsWuLT4=;
  b=gPCnmyGOLgeoBcYYRjVSTMxGEBh9/BQf0GMSF/Tn5Vqh767dm6kY4vS+
   m5XBC8If6KxC4z3olr/2N9vL8E/GpzYxfC+yfv+QOlOmya4WLcF9IHr1C
   6+Q5Q+BD5K6lzhMZUwhIofgx3Bvbz/vkwlakQQJuHKamalEQaJByODDYI
   K04zGOc7DMz4oEY4YcYNmEREx9t+eYEkDZZ8BAOVFQKIKIRoOEL+7TNj/
   EHqkb5upkEp0RycQ7HB3uDlEuMRUBw09mj1eGSbCbh3X5YXDRizWX4OTI
   0/I8GehKD8avB0Xk8x/pFngRQMJrhTxUtCDtjwsM5dZWQ7RerZytSr0D7
   g==;
X-CSE-ConnectionGUID: X35SaI8TQpi+SHYBBSOdAQ==
X-CSE-MsgGUID: 5tHyWcfxScOp6Wso1QIssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67612204"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67612204"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 21:43:55 -0800
X-CSE-ConnectionGUID: DJIsIjsGSASF15ekG72Ajw==
X-CSE-MsgGUID: waPrC4/PSFGs7tUPBROeeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="221026922"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Dec 2025 21:43:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV1NA-000000002aC-0FJy;
	Mon, 15 Dec 2025 05:43:52 +0000
Date: Mon, 15 Dec 2025 06:43:46 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/const_loadpin 26/29] Warning: kernel/sysctl.c:473
 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
Message-ID: <202512150621.5AHKcyv6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/const_loadpin
head:   641107f1177907e00b268c382a975fba184a6de4
commit: 708ac7fc82b6d315e72e11a74046b7dc515e7435 [26/29] sysctl: Remove INT converter macros and add explicit functions
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251215/202512150621.5AHKcyv6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150621.5AHKcyv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150621.5AHKcyv6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sysctl.c:473 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:473 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
>> Warning: kernel/sysctl.c:473 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:473 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:499 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:499 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:499 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:499 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
