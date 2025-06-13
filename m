Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882B2F4317
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 01:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777082; cv=none; b=DMvz32jaYGUqrqKhyzVtXUH7sXYhq29appmmZ2xQ7/clUfR5ww+HH9PbOsjDOWCQi08S3e3MvQnxu7poKN4okw/zJ054vWfZLKw9wuXBPt7niGafpeGi96m/bD+jVtHGXVTJkG9FqChCk6UI1jR9xsLQcjbMRQ+AmPS1QNGKbiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777082; c=relaxed/simple;
	bh=gvocdldHRMMRxng2VCAgV7EFcHUuRu5q50LzaG/WQHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oONCszdiMgZmFXGQg3+aeebV3LYh2rgfXZFRmyqeE6ZHZjON5AxQK8m9zeu3M89eVLwsQDJPzoyFtS6XBsomJRYqUofKGfGFqlz6b3Xo4+2PyrJxO9vdpR+CgjcIlAyzPl6h35UUuCAx1Ad3iL7gbOdFAcjAcFdNxqBEHiG01VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHbPu/9A; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHbPu/9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749777080; x=1781313080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gvocdldHRMMRxng2VCAgV7EFcHUuRu5q50LzaG/WQHU=;
  b=iHbPu/9AI9/oxrNSZIMk+vGcD6Ftk7kZNRhlZYh2PCtTmcuV0q+XcWwG
   I+ThldPMn9qqBrHyM5HpPKSUKEr1HyUln2ZTvSkFVslCRTGIthFMlZ4n2
   LY+KW6POA9p7yBxA4aD8VrsU9qkVk5cPgdzRJFh5PBjvzo9l7v07heyyU
   fO7UEtOHtsNqwckz6KKEmFFEQx+Crb/YcsHa5hqH+d7JsI6JAATTwMqdK
   crO1IQDl8osvO6RKU8LSIoEQXX+JrPCEjAbjVa78PZ8i1lNWY8O/3Mgjq
   gbGTPTr7N1ou7qssAxq+HhSSqXGMs3T44MuGhpFRcPEycdOUs4YZg2n4M
   w==;
X-CSE-ConnectionGUID: CSOzyexVRgCLgsQvjPwV6Q==
X-CSE-MsgGUID: 8bnWE+DYSpO/vrD2R2h2Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51852837"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51852837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 18:11:20 -0700
X-CSE-ConnectionGUID: eR/2qlwYT/CRMDTR/MgUOg==
X-CSE-MsgGUID: Vv5/g1bzRsGxwoRtGlaNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152840065"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2025 18:11:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPswu-000C5Q-3D;
	Fri, 13 Jun 2025 01:11:16 +0000
Date: Fri, 13 Jun 2025 09:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:log_dr6_changes 4/4] vmlinux.o: error:
 objtool: exc_debug+0x18: call to _printk() leaves .noinstr.text section
Message-ID: <202506130911.7zRGG9uH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git log_dr6_changes
head:   089725f91d941f038c917afe6334a5f46fff39f0
commit: 089725f91d941f038c917afe6334a5f46fff39f0 [4/4] x86/traps: Log DR6 changes
config: x86_64-randconfig-076-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130911.7zRGG9uH-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130911.7zRGG9uH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130911.7zRGG9uH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: exc_debug+0x18: call to _printk() leaves .noinstr.text section
>> vmlinux.o: error: objtool: noist_exc_debug+0x18: call to _printk() leaves .noinstr.text section
>> vmlinux.o: error: objtool: fred_exc_debug+0x12: call to _printk() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
