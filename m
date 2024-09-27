Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3218872D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463162; cv=none; b=MgSXhMnz0iFKBbX6HhXMh5mPhI2Vd4ne+S6pWiTOeRvpVF1+7H4k7qnSuAiOsUady/jtdkDykPUmxQ7KwozhvaYWuVW+S+vlrDe6aN9+TtxC/tAj3x3o0lJ6jd4GkU+DHUG8XMAEfQVv1Bk9GhUJ12cmrBcKjSCoNhlDORU56Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463162; c=relaxed/simple;
	bh=ZURsOaXhKIbigK991qWS8CA5Xw+GKxYqAUH2Ma/AXBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tgvGBXZAmYdIGXz1nt7hEj6wOwv+UZqgYT/m6L5Fvz36sqBr04KqKb741cCiCDC5At8JKhr5g1xayv8tF6vJnSY88LgSQIQLNxLnRREfGAZM1ofCN0ylf9tEYOwXxxaGNvOKlBogGnsS9jkejS/njgDLh0vqnzG8t9WvOTBXDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S12OjGve; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S12OjGve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727463160; x=1758999160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZURsOaXhKIbigK991qWS8CA5Xw+GKxYqAUH2Ma/AXBw=;
  b=S12OjGvesi+N3RzhWXrGyqhEOhbljDuCnXbZmou1UWHjziUh4qOREMbm
   AOQG6uUk3QRvmZVIFjKEdxIC+oSs0EnIkrXgJNacw9p2wOPbAjlhjuvzt
   fWzwuumIdAiw0ombP6MX/E1QWtAiz3lDsHL9JZraMf6URzzeyUveaB4F3
   trnkWTuQdHmxZ/efyou23Eq2qa/TFsuJzH1i+6Ra6GlpZ3ckuw4X3Ffvz
   YLTFdh4dTJ9XObsgZFfvwRZCoUs4ofeUjTu31PW/wXNnvru8OmlKe6Id9
   yY3GN0e4FAqR/9G+EmxMwrO1AvV4Gq3rix9l0r5GSDmdZycwN096Zdaqy
   A==;
X-CSE-ConnectionGUID: Fd2Y4ZT0ROiW/LJ+jcst/w==
X-CSE-MsgGUID: hKyI34fLQUGsCbjRWbM6ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44139816"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="44139816"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 11:52:40 -0700
X-CSE-ConnectionGUID: rQeGMzvYTS+XnX2QcB1heg==
X-CSE-MsgGUID: UW7AAfKvRSuFtCjmveCQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77447574"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2024 11:52:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suG4y-000MVh-1W;
	Fri, 27 Sep 2024 18:52:36 +0000
Date: Sat, 28 Sep 2024 02:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <min.li.xe@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 984/1001]
 ./usr/include/linux/rsmu.h:88:9: error: unknown type name 'bool'
Message-ID: <202409280201.QVySO04P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Min,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 7d3c0f27dc86aab8e1ddd1683691633e72f28174 [984/1001] misc: rsmu: add rsmu cdev driver
config: i386-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280201.QVySO04P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280201.QVySO04P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280201.QVySO04P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/rsmu.h:88:9: error: unknown type name 'bool'
      88 |         bool continuous;
         |         ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
