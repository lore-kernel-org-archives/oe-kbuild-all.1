Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F8164D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737940677; cv=none; b=RkLN5TWPXzCoy+mpRcpJoIN5Q8kl66ZxLVIkU6IBhfgMAJ+K2WKJQgK/+TGhhhWjzuHHlFRBueXNJvKxtYcv8cmD5NIcxtZauEUuIX37VwQXBAqkDk2F26bO2FHbn6p0zvnkAfqvxwqyzTBV7+b3u1zUIgWahNsPiolQE2cdjn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737940677; c=relaxed/simple;
	bh=xgb5JRctYWTmL6osh14r8nUQbMKmtih4lzFe7P81Mvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDQMQuECgSNzQBE7tuhX5DRpJGde38Ugun7i78+iMPl04gzq2FGR17JXD6hbn7t9kH4bWtYPc+qfJ0CU8CZX5xwMmrgICXk0inXn/tEFQYXyeB1LUxkIPWGKU4qeA+nW43jK6d387gSJ8B9hFNCNZaLQrset+WevMQ31NORkRxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6i3T6c+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6i3T6c+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737940676; x=1769476676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgb5JRctYWTmL6osh14r8nUQbMKmtih4lzFe7P81Mvo=;
  b=X6i3T6c+nqwWwRXmICPSULgHQeFKedrGYLms68AGQvyLbpVRZiKUKJ/x
   T5RonHM7ZOQ5JZe+gFv4S2uNY4fLYrGxNVPJhEBIlNB5/Go1mzWwV8IYG
   UEGdmreDdc6f4yBf4PwHxN1lpHX4rWwGcVLrD3/egGul0bq63H1DFMIGW
   WDxzXhiLblSHjQvoGg/kr9Whfcw0fF6v+e1KpdxALa4BorLKv4yp9plFb
   RF5LW3FWbztIAvZEZaI89k8zu8hz8S3JeKC4yTGoHUXErQB66IXhS7RPq
   NBYHHCQE4X1YfQU3cWluR0szYNqBYTehTohGODRqCCuGE0uS8nujUaA6u
   A==;
X-CSE-ConnectionGUID: sGAlNpU7SDWiQqnLWklqzg==
X-CSE-MsgGUID: 9p06oqflThaGD9d5UuB9xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="25995864"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="25995864"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 17:17:55 -0800
X-CSE-ConnectionGUID: FKzzYSz9T2a9ZkR8+n03AQ==
X-CSE-MsgGUID: ZkTyh7Q5RiqGovuZywEDJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139152116"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2025 17:17:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcDlA-000gHX-0i;
	Mon, 27 Jan 2025 01:17:52 +0000
Date: Mon, 27 Jan 2025 09:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 77/83] dwc3-qcom.c:undefined
 reference to `dwc3_complete'
Message-ID: <202501270940.Z8b7NNjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: 6d5cb9b07c07bdcbb8f6c93aa52b89034c2e6983 [77/83] usb: dwc3: qcom: Transition to flattened model
config: sh-randconfig-001-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270940.Z8b7NNjJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270940.Z8b7NNjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270940.Z8b7NNjJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/usb/dwc3/dwc3-qcom.o: in function `dwc3_qcom_complete':
>> dwc3-qcom.c:(.text+0x124): undefined reference to `dwc3_complete'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
