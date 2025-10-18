Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486AE218845
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760756803; cv=none; b=i1ECVni5qnTjdXymvH33Ek/Lr8yn32HlWLFf3jPxS0ZrVc/KfvJSE27EFV9n0leZfz+82Qd0lKRzYHqxMIjfk/aBNRHvmGPHZQ8E+9md2cn2s6o51ablESbYlHcHgyozEO3CkQToKCtxYFVGoeBrRSjOriMgPIcyzvekS0Ekz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760756803; c=relaxed/simple;
	bh=LzsQ289Hp8SaSjKNnBh0AtQEt3sau6q1yP095VEoWv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7vN7LZMMhLNkpaeG/YTpsgsFLsEwhgqKf6CG4QR2jv9VnjMtVIQTwGJ/pgZRmm2ZbiznEJ1BHr9cS+BrZEJRlYPF2ZYiyoFMP+7eoFuI94feSy4dB7jzv7UKE2HZrHspa/cnKf8ZU/w75ttVtQnboHlCa9f739Z3YwjnrAWt7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KlmadkXy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KlmadkXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760756801; x=1792292801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzsQ289Hp8SaSjKNnBh0AtQEt3sau6q1yP095VEoWv8=;
  b=KlmadkXy7SnxxmrvyBpnmLrlBGpSj8c54BXS4jk4jhAf9qbPjo1ps7yX
   kPh5bdM5+UvMBpEHPQFo5brs+f6eDpBYaec+GMtb3EeqEq2bkc6RUSt8s
   5CjUVxX0HZ6cTxxaB0G1RYO7RBcXOTRC3hNYbFDt+iiwkgCgPygIDQFmS
   QOtnNOwEgfIHV+pAdDy0yFF8X1YH+CNpV9FYT7dDX2WiZWCnChJEKwzb8
   GzYqJXFu99OK4o+McDjZjf664wsaxj48gBEH66dszvnRs6eJSZlRqRBRA
   Lhi3wbtY4wO8K8DuDNGnDydBSGnjnSMkta7KBy2M/pJT/+JPzFHrFCwMk
   A==;
X-CSE-ConnectionGUID: wrQ6xVTXRvCvJPyLf6gpWg==
X-CSE-MsgGUID: ODWNFcd4QPOW75qjyHlnOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62007636"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="62007636"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:06:40 -0700
X-CSE-ConnectionGUID: n48jYBmaR8Odj4hJgEZTfQ==
X-CSE-MsgGUID: Xmma48QeSz21B+hZHl9xYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="183608699"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Oct 2025 17:44:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9v3l-0007t9-2t;
	Sat, 18 Oct 2025 00:44:37 +0000
Date: Sat, 18 Oct 2025 08:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] fs/ext4/mballoc.o: warning:
 objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction
Message-ID: <202510180854.b1yio4sf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Theodore,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   045418106c25769e424b67183bab8f2333dc6278
commit: 41298197ead9e85ee2ec1d52122f03fd1863cff2 [1343/1343] ext4: convert BUG_ON's to WARN_ON's in mballoc.c
config: x86_64-randconfig-101-20241223 (https://download.01.org/0day-ci/archive/20251018/202510180854.b1yio4sf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180854.b1yio4sf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180854.b1yio4sf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/mballoc.c:4734: warning: Function parameter or member 'bh' not described in 'ext4_free_blocks'
>> fs/ext4/mballoc.o: warning: objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
