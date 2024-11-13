Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE318B499
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535127; cv=none; b=a9pCGer/1QJ/BcKqaICLs26VrtCeisFH/H5n7CQlj/0AVvHIXV1x5+qrNtTM2s0Esny9eITnOkrzUWzVaUHTWt6Z6VHJZymF1UfviL/NyCtaL04cafOfktpmHy/05zKjYdaPn2XTKgJGDZ7oVnHZHZ4MzsIh5JZFFQgI5eO6mF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535127; c=relaxed/simple;
	bh=BxMHCgfUNCTWs/1ducWYB54vLx+kxzMLamRU0OUjJKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMWwN/G2W0AMQ0hirZa22lO77W9VstFPP1i8hTe6oGNZJEH4X7CVsQxPx2qJefOVNxLwXN0qKiEflsoktlsAlOTY1YRC+VJS8BflCtziRqab8C9fdskInMDFFnTEUe0OcMSgVPpCJ+sCG+lBXGdPf+7pxuoegbO6FZwWA3+mbVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cznOOyj1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cznOOyj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731535125; x=1763071125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BxMHCgfUNCTWs/1ducWYB54vLx+kxzMLamRU0OUjJKw=;
  b=cznOOyj1g2YHhSAXlrAeDKB6xqkabAo+enJIXiH2rhTH/7d6ykNjc9n/
   4vR8WHvYliUjlJGUqg6xxxP77Cy0P0HPWuNKLQSLhswMqsxBZzVeEWSy7
   L4y+vW6t1ixBkdSGPTOmIESdsV7dR4kzVDfoEPwiC6Phy3uiO+YSRkwbA
   Ee5BCS2XWQ4jlgLVSTFKRjLzRsBN+qdyviq4CIzdUNSDfAbUDmuo5dIkL
   KJF4qCHAyQj3n5/TOUy8KzHgP8cDu1IHjH+OkzmAwg4U33qaJddqNqB62
   NczzX4XbNpNeCYFrp4iNaFkjd4l3RCu33ZlaO2yf3JHC89RGNpetsLkT5
   A==;
X-CSE-ConnectionGUID: K4IVGia5TUqtd4GhbKr2vQ==
X-CSE-MsgGUID: +Q3OYKZFTm6sgjjUOhS1mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42011790"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42011790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:58:42 -0800
X-CSE-ConnectionGUID: D7CqsP0XTpCg6+AUbvoK5g==
X-CSE-MsgGUID: hqV7zTnOSiCyCcve147Dpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="87558343"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2024 13:58:41 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBLNm-0000lJ-24;
	Wed, 13 Nov 2024 21:58:38 +0000
Date: Thu, 14 Nov 2024 05:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 10438/30000] kernel/kthread.o:
 warning: objtool: kthread_destroy_worker()+0x12f: unreachable instruction
Message-ID: <202411140501.wM0s5XtN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   1c09cb196f189e020c247591189c112f2512e4ab
commit: c797384edc967d42ee00e3cafaf2f20a826cbe45 [10438/30000] ANDROID: kthread: break dependency between worker->lock and task_struct->pi_lock
config: x86_64-randconfig-004-20241112 (https://download.01.org/0day-ci/archive/20241114/202411140501.wM0s5XtN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140501.wM0s5XtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140501.wM0s5XtN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kthread.o: warning: objtool: kthread_destroy_worker()+0x12f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
