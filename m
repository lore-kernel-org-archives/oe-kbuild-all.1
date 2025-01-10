Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7BE20E03C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736518097; cv=none; b=fvbdbSCDTqrEQ3VnBRsinGU4TtUsJ1/fCYrRUIXbY41DCJFYJOcyQS8QyvFKpi53QbER2GYGgafeLenOMNa63qxAxP0YpUvXx1p3njMX45o/2MnLcEO0J7R9sm9CBBAvh9caWRgrHg8mgC+7SywPzMKVSHyl0K3vx4f+XXfDjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736518097; c=relaxed/simple;
	bh=xTxYIU+a0jTZerK2+Dz+QTjbeTFLkWeC5fdnY9q8BO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e++junHNNfAckSJCs6aoZ87xBt937POdAMoHp0D+kHg028fDowqKcolBfoxM+U2kh5kU/K5xu+PupNrkWzRgeEWo9CNV4I6528390+zHSO3m8lcC4ZOmajZVOn99Irk/l0WSE6MwVMZMUd+uCr5yg7s3o0BnXcV4JU8fp6EOf7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BB7+OD5u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BB7+OD5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736518096; x=1768054096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTxYIU+a0jTZerK2+Dz+QTjbeTFLkWeC5fdnY9q8BO0=;
  b=BB7+OD5ud3lAMH0fP8jo9WShAfbbpN0ZjK+RiPXWt0gfQFpHVL1ix0iY
   e0ITgDktsuE5t82PYjDimvCZjK8aihFKZb8rERT7OQpX7P7ypl9l+7yLQ
   ikx05WXr7/ug3n+aRFvVAszQRcqwrdsOFmOj32RU7pgc/6XqyE/7ACFHB
   ynbqpRQc8BcsIL3PVKEmeC5oOylfrJHkF1DZUmAqvHtQDX2uNDpLCwAoz
   +6pslmM2jHfEplcreIQm4Ffb4RCrriKY27D1SM64HjM/u1Ze1GYkcHh20
   5iOzykK2DGpK0sCASBr7Bzg5V7QJ/VPE0Ay9awKUHHRWyj9jfBR/a+9Ui
   A==;
X-CSE-ConnectionGUID: Affy3M0iQRmqDwAM1FW5Vw==
X-CSE-MsgGUID: MMeCT2DRRISVhhWQGrM3Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54230084"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="54230084"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:08:15 -0800
X-CSE-ConnectionGUID: O+5c85cbTUWn35+TT3YnmA==
X-CSE-MsgGUID: 6DTB6rfSQQmHxWXPaNrfOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103687941"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 06:08:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWFgK-000JLP-0a;
	Fri, 10 Jan 2025 14:08:12 +0000
Date: Fri, 10 Jan 2025 22:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>
Subject: [linux-next:master 7298/7860] hid-lenovo.c:undefined reference to
 `platform_profile_cycle'
Message-ID: <202501102124.sIJS5TKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: 84c9d2a968c8276f1ceddaa1526c803263eae2b4 [7298/7860] HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys
config: sparc64-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501102124.sIJS5TKl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102124.sIJS5TKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102124.sIJS5TKl-lkp@intel.com/

Note: the linux-next/master HEAD 2b88851f583d3c4e40bcd40cfe1965241ec229dd builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/hid/hid-lenovo.o: in function `lenovo_raw_event':
>> hid-lenovo.c:(.text+0x1790): undefined reference to `platform_profile_cycle'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
