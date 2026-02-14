Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA62B2F6573
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 04:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771044779; cv=none; b=KFKxZWOSroxE7t1rw2kVfXkBJ9hf1V8SpVql2/ML8Fh/T56w3EUN2m3Rcv3zELTEmSsZuhsgUCK2Kh8E7MAW2WEJABnSuDNgn85KzHFexHy2gM5rpxKQrKXRcn0d31SSVWPtfZ47QdlK5htpC7oLPmJ2U5G6VGAZpvEJL3RYfKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771044779; c=relaxed/simple;
	bh=iANsKlJEotTX6Qoh2vM0XJr/OHcevfTTJoh0P+xU0pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWDqwx9WyGlQ+Jix6StxeLiSjlQee71tbKnxCadvDHorcCMi8/Pegfja0ItGs+fdgsdhM3V+cFe+QzmVnPny6zo/UABX9ZOMNRXebyeEMwJhnlYxspi1uaxgaZBBBI69fmufVr+qSB1G6C4h1hQQqdEaWWqU7ITJVBYWU5gaPkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0YZLdHl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0YZLdHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771044777; x=1802580777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iANsKlJEotTX6Qoh2vM0XJr/OHcevfTTJoh0P+xU0pc=;
  b=B0YZLdHloU2WzRtnj+9/ReTPGDT+HzzqKYVe37iUx3fcJ7Of41FnUaxE
   qlmA/vZqiKRw8JGlq+2vM3AciRYoT9mA23rCJX9tT3CxP8KOGNaEOTxTq
   cJR0MHqBqKUIajSOcFB68zHOc1oRezQDKlI1NS4NqJ6Bw0IXr4iG7f2dY
   VQd2FBu7ZEZeflNgzXZo5R47MPdjOqdDYJX0Fx953JG/eK1ZDeowf4lFL
   4FMKusUWO3Z45N/0DX3G6qqRjhPrZ+kXDHgaJTwJ/X27ikkE1O3ypvh9x
   a505xdU40ZZlUsMxoo+l0Ptf/+KS5fejy/64kSt3mRONEJWwuSP8hQ3QY
   w==;
X-CSE-ConnectionGUID: Rrm/zmf1QTGK3Hjh5yojCw==
X-CSE-MsgGUID: stk4LM/1Rniz6Yq7UtS+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76077276"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="76077276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 20:52:57 -0800
X-CSE-ConnectionGUID: MyycxxVaSjuxYFKfJz5rLg==
X-CSE-MsgGUID: gMunK/aUQJeFmzMDkRdlwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212195051"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2026 20:52:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr7eG-000000001lt-3ciW;
	Sat, 14 Feb 2026 04:52:52 +0000
Date: Sat, 14 Feb 2026 05:51:59 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, dave@stgolabs.net,
	jonathan.cameron@huawei.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com
Subject: Re: [PATCH v3 1/2] cxl: Move devm_cxl_add_nvdimm_bridge() to
 cxl_pmem.ko
Message-ID: <202602140526.9iCVGQmM-lkp@intel.com>
References: <20260213224038.549798-2-dave.jiang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213224038.549798-2-dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63fbf275fa9f18f7020fb8acf54fa107e51d0f23]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Move-devm_cxl_add_nvdimm_bridge-to-cxl_pmem-ko/20260214-064242
base:   63fbf275fa9f18f7020fb8acf54fa107e51d0f23
patch link:    https://lore.kernel.org/r/20260213224038.549798-2-dave.jiang%40intel.com
patch subject: [PATCH v3 1/2] cxl: Move devm_cxl_add_nvdimm_bridge() to cxl_pmem.ko
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260214/202602140526.9iCVGQmM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140526.9iCVGQmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140526.9iCVGQmM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cxl/pmem.c:24 expecting prototype for __devm_cxl_add_nvdimm_bridge(). Prototype was for devm_cxl_add_nvdimm_bridge() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
