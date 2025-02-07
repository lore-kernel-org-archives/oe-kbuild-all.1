Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA9238D51
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941442; cv=none; b=H5g2EUrHEqB+tsjM6Xv/hOR6iKIMN6Ysv8lFBYIM2vg6BrEwZDS8XSNLzh1gakxy8Eko5IoLkIedoTe9oupeYQbgLDTfG6m4arUeYDeKGNkM2pxoxYPF+CtvpP/4uyODFZgmK4bn/gTi2fj7llK/7QbFvoz7whhMdrEdQ6LwGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941442; c=relaxed/simple;
	bh=AlWkW/bn/wwn+0Act9PRVvMzz/ucwlHmdx7axDlSsNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNcBNyNaDK2oAVfJtcO2V4Qr7C/fTpZc/af+HlKmbAWRv1gPX18wcOetKV1BehwuAkCJxz4K5kEWgTl4U4bWcoscaZ0fVmofcxJNuKZoMM5fP1wZghPt8fFZVGQEjQfNJ4BCgqpaiuIAdC377MwkYXpFbiPUKW1zKvgolH3xZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kp62T8XE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kp62T8XE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941441; x=1770477441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AlWkW/bn/wwn+0Act9PRVvMzz/ucwlHmdx7axDlSsNA=;
  b=Kp62T8XEUMv4pseK7MMcNfXz28DK9vipvmdKqt5abchke1k8FcyONArA
   M34e92DNGZ/uIFFWG054xEGo3+Op0Brn7GTAECU/XQeosLQn2LAm/IDBU
   Rd8TUaZMUWTdAKAM+YMf6a8TWQHTC7YO/Vw4UNCxmJ5rUtr8ivYPNyWKE
   oR+6htNtBPKzRHKG02Y6/nk2SAuv5eFhWevJeKcM/M9Brzs0O6nLLcLnZ
   SzI+7D5lCWNXVsSMoiFwKS6pgvnCtDPXOXI1pNJyTc3pY434Jgnft9Zi5
   Zh+o9w9D0S181AyEmvDEEpjAFYr/ENc+qtWPhLM7Af4X+ULqTNqlYiSok
   A==;
X-CSE-ConnectionGUID: tCOxXQ5SS9qZyNBR7Z2eXw==
X-CSE-MsgGUID: +UT0P5NxQKK1JiniKxLoqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57000469"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="57000469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:17:20 -0800
X-CSE-ConnectionGUID: 2lZJKGmURmqXM4NfGiqrAQ==
X-CSE-MsgGUID: T43U2T3YSviP82D3PZ/QRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111756911"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2025 07:17:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgQ6W-000yVd-2j;
	Fri, 07 Feb 2025 15:17:16 +0000
Date: Fri, 7 Feb 2025 23:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/ioremap.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202502072305.gE5j9Qd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3e25b4f1b2a403f9c9bbcabb005b882397477053
commit: 004cface9c1c0b6351473934a4ce452193e05b07 [1418/1418] mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c
config: x86_64-buildonly-randconfig-005-20250207 (https://download.01.org/0day-ci/archive/20250207/202502072305.gE5j9Qd8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502072305.gE5j9Qd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502072305.gE5j9Qd8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ioremap.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
