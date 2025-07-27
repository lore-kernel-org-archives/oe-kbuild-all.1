Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06019D09C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 06:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753597690; cv=none; b=rZPB1fkWxfEkTk5jo4AX2f3xCVkaweNF8keZazT9H4lAHQbH1uPG4OcmKKZJVq2y03MfTKTH6vnR1s1bRH4WOXiqfWUoFkGqmgDbMalkfKaseSTs6jHxEK/goMjw6dgbiHMgavbWPWccNMD1ojg8VuJGM6M2c8lSSwgypHAUkxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753597690; c=relaxed/simple;
	bh=8bDs7/nmrx6/JwfpaRk3Tn4ceZ8xNxurOefdIIXumpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf4F0W7WVKmyaPtCsluxGNMxJIPqoyhNB5mk52FnPS1lUsWvRVN2MczdCJJ8kKXin6xBDU74YhjeQFQeKyBTO3wuPi+ieG9TNxmKvjxNWomj73uFiYUfgJytZYX8A6Uyv9YnG2rp/abzIhgPkJenJq+iDYO6AF35bSzPMZo4gJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3LXZ+cD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3LXZ+cD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753597688; x=1785133688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8bDs7/nmrx6/JwfpaRk3Tn4ceZ8xNxurOefdIIXumpc=;
  b=N3LXZ+cD8/YTvyM0/BrKN8PZ5Th5InAj3bjtVX3T1y9El/7vgWRagXsV
   clFraMKh8wVgYxod97d+HER7+cDwjyNqKED2YGeSwJD/37xN1GO//vXFM
   sLvRpm7zbybFqZQLA1ov/3a2p0hyTNX6zJrFhtL7Ob/MmhbENoq2iJv4x
   tgUyn9be4bcbyWd3F96AcIyxRQ+95WKOtjK+H/hJb7egJJaB+zfbYUpGP
   29ugO0Y4vhQtZU/UIFwPXU3rNLSPcpATZyY2XlR5KbXJhdWApr5GRy1TB
   8jxrDkvGuEWgEJy8PBLkiilPOmlmZJcn5hKbusK7991Mio2KDGpSkYECt
   A==;
X-CSE-ConnectionGUID: TNy0DFDCTsGTLF8vuraqWA==
X-CSE-MsgGUID: +D0jhFFNSyW1c+oHkwv1Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66142922"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66142922"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 23:28:08 -0700
X-CSE-ConnectionGUID: yD55kSz9TeayH/ISabCJbQ==
X-CSE-MsgGUID: 0S4eF2+cQMCmBOUFUXEmwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161273878"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jul 2025 23:28:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufurd-000MV9-01;
	Sun, 27 Jul 2025 06:28:05 +0000
Date: Sun, 27 Jul 2025 14:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ignacio Pena <ignacio.pena87@gmail.com>
Subject: Re: [PATCH] net/tipc: Fix typo 'retrun' -> 'return'
Message-ID: <202507271435.9am5IiZM-lkp@intel.com>
References: <20250727023309.82920-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727023309.82920-1-ignacio.pena87@gmail.com>

Hi Ignacio,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ignacio-Pe-a/net-tipc-Fix-typo-retrun-return/20250727-103804
base:   linus/master
patch link:    https://lore.kernel.org/r/20250727023309.82920-1-ignacio.pena87%40gmail.com
patch subject: [PATCH] net/tipc: Fix typo 'retrun' -> 'return'
config: arm-randconfig-004-20250727 (https://download.01.org/0day-ci/archive/20250727/202507271435.9am5IiZM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271435.9am5IiZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271435.9am5IiZM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: net/tipc/sysctl.o:(.data.tipc_table+0xa4): undefined reference to `sysctl_tipc_bc_retruni'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
