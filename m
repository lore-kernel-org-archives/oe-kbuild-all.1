Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57B63D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 10:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139197; cv=none; b=g62PzELLjj8+0NRT3Cpy5pNhiI98nsEZPZUF4JgEXiMeghr2frCfhv0FqhyBs5RJFk3BiTGlBBbPNXQprhIRUmIh5ybpzvnWzkvSK9qWsifi569ozrb5swQypfDPcwgzRNDLj0iobnIyileZUseRAWDXV9kwRKGwNW7JlmS/6pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139197; c=relaxed/simple;
	bh=WfM5Jc3ANO2LCInJ1Fu9eAZxkW+c3noKDYLV2byfeVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7eh/uTRNEsddwvV7OB1yl+VncWfBpj5WttuRlCF9+5B7kRoO1Tn5/JGmSby1U/9Y/E+zM8pqVffYG+OssvUWNECRvEF+jyQ9nKMZODL00K/tgHl2ceHfj+8gDkiOe2j5r2yPo5LzU6B+VoalSIyFtB7GpG6M0LgSPkqjvsiNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaUUrnSn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaUUrnSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719139195; x=1750675195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfM5Jc3ANO2LCInJ1Fu9eAZxkW+c3noKDYLV2byfeVI=;
  b=XaUUrnSnTW4/7sjBixEA/7jwiPQO7QBGCXwWJ/wOT9mQJdQIHzx7wJnE
   O89144H6ZstvwTfjYJNlJH21h94PEeZhECOz1XzvvtcRbbq/2Wv/eUFAd
   01c5VjWTjV8ix7/MzdS2fW59WxC5OqOf8aIIfPUiTAup2AeBZnRViMf6z
   /KqN+FYmzFpb4Lc5ddU3pKi7f/cneVTNbMNpnora8XKlF4rtmBfkr5yS2
   ssNZD/na+njbYmdrQRBxVl1et1K7kuueU6AXSbJ5bN3J3nR+kRvzZp0vX
   51fHeTl74NBXrONVQDU1lVGchR1jUBBviNeUVpGrf8HMtY5oInq4YKA2a
   w==;
X-CSE-ConnectionGUID: TXRkoeYcRAGoEhO/YoA65Q==
X-CSE-MsgGUID: 2R0KOg5XTO6nPnYv8LnymQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="15997795"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="15997795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 03:39:54 -0700
X-CSE-ConnectionGUID: xA8U4AxNS2KTZa4ZMR90Eg==
X-CSE-MsgGUID: 9FWH/CU2Rnyd6rFDYizlyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="48183323"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jun 2024 03:39:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLKdS-000ARq-1b;
	Sun, 23 Jun 2024 10:39:50 +0000
Date: Sun, 23 Jun 2024 18:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/3] kernel/trace/blktrace.c:1913:46:
 sparse: sparse: incorrect type in argument 2 (different base types)
Message-ID: <202406231811.uWJn5nWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   2886675699f7a7405eb5103c277c1d6ab13c7f95
commit: 0dd775b383d77c40d66daf704badda57f2c5f34a [1/3] ANDROID: GKI: add vendor hooks for blk_fill_rwbs
config: arm-randconfig-r133-20240623 (https://download.01.org/0day-ci/archive/20240623/202406231811.uWJn5nWF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce: (https://download.01.org/0day-ci/archive/20240623/202406231811.uWJn5nWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406231811.uWJn5nWF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/blktrace.c:1913:46: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t [usertype] opf @@
   kernel/trace/blktrace.c:1913:46: sparse:     expected unsigned int opf
   kernel/trace/blktrace.c:1913:46: sparse:     got restricted blk_opf_t [usertype] opf
   kernel/trace/blktrace.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false

vim +1913 kernel/trace/blktrace.c

  1866	
  1867	/**
  1868	 * blk_fill_rwbs - Fill the buffer rwbs by mapping op to character string.
  1869	 * @rwbs:	buffer to be filled
  1870	 * @opf:	request operation type (REQ_OP_XXX) and flags for the tracepoint
  1871	 *
  1872	 * Description:
  1873	 *     Maps each request operation and flag to a single character and fills the
  1874	 *     buffer provided by the caller with resulting string.
  1875	 *
  1876	 **/
  1877	void blk_fill_rwbs(char *rwbs, blk_opf_t opf)
  1878	{
  1879		int i = 0;
  1880	
  1881		if (opf & REQ_PREFLUSH)
  1882			rwbs[i++] = 'F';
  1883	
  1884		switch (opf & REQ_OP_MASK) {
  1885		case REQ_OP_WRITE:
  1886			rwbs[i++] = 'W';
  1887			break;
  1888		case REQ_OP_DISCARD:
  1889			rwbs[i++] = 'D';
  1890			break;
  1891		case REQ_OP_SECURE_ERASE:
  1892			rwbs[i++] = 'D';
  1893			rwbs[i++] = 'E';
  1894			break;
  1895		case REQ_OP_FLUSH:
  1896			rwbs[i++] = 'F';
  1897			break;
  1898		case REQ_OP_READ:
  1899			rwbs[i++] = 'R';
  1900			break;
  1901		default:
  1902			rwbs[i++] = 'N';
  1903		}
  1904	
  1905		if (opf & REQ_FUA)
  1906			rwbs[i++] = 'F';
  1907		if (opf & REQ_RAHEAD)
  1908			rwbs[i++] = 'A';
  1909		if (opf & REQ_SYNC)
  1910			rwbs[i++] = 'S';
  1911		if (opf & REQ_META)
  1912			rwbs[i++] = 'M';
> 1913		trace_android_vh_blk_fill_rwbs(rwbs, opf);
  1914	
  1915		rwbs[i] = '\0';
  1916	}
  1917	EXPORT_SYMBOL_GPL(blk_fill_rwbs);
  1918	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
