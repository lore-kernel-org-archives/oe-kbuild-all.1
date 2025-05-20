Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A478B1C69D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743698; cv=none; b=RweKhIoqHYRBq63ON4V7fKPpI58oIjV49lMlEhAVK+nkxOlhXhxyoNydIa0WzHSNb6GzlGGCtTwA6M2i/L047apPFJ7bqJ1AGuu9eTQ2UFdISJpZgDl0hnky5q3WVVgA95e2lfbo1IgiGbfA46b4WbtZzfLLVaBJ0eAZRRw3B5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743698; c=relaxed/simple;
	bh=zllXrsBodm5MqQAOjl/dA+OwatwCNNK0cyJTRWB7aYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8lkRYQq8PT/hRVCoZwSPKkcwCQiOHd/T6ZkVGXxLhLFh0WiP/mZR748auN5iBnWQjoP8jHkiO//F6TBhDVSLx/xPtLZiPlckc2QorVjbwO9ar3WYwJqG+noMYwnaBo/s+sfXd0FlbaD9nK5+fLZlKIh0YfzUzvi3ipUbTpzv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fapu6Odw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fapu6Odw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747743697; x=1779279697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zllXrsBodm5MqQAOjl/dA+OwatwCNNK0cyJTRWB7aYs=;
  b=fapu6OdwT21kJqP9VjBGz3hMWR0/y7+3G42YXbCalpsuOgzS6NTpnbk6
   V9IIRBiF8PoI9lPZUMRSQnb4gAOOoZnAcHWB397sNcYvjRiEoEEbOAIR0
   BQvj90zNmmCuvLIj+llnI12ZlkZMnTTKw4esPxuMi0P5NE2Yqtap6+52B
   S1jHsOCQSaF21tFMq9jWJHGy5mqAs4QPh1pzgsQKti2Cu+gPsM2lBQ8ma
   glbOEe1csB0gWQB/BIlcwDwa/GI9Q5HPgnppmi7EdPf0e6XFfjRCASM90
   UkRtgdaJ9Nel7W0g3Z1a0nvQ3ZQjtA+I3vxmFRyN8RrzxnJic6dXRmQTl
   A==;
X-CSE-ConnectionGUID: We4tFKlVQsCydlIoxEJ+Eg==
X-CSE-MsgGUID: no/fQILKSIKQADjQF/9UGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61069250"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61069250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 05:21:34 -0700
X-CSE-ConnectionGUID: WWihQK2VSbm3BU0COT89Tg==
X-CSE-MsgGUID: wuYyaP9vQOehp86ubi9ToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144932689"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2025 05:21:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHLyN-000MZN-0D;
	Tue, 20 May 2025 12:21:31 +0000
Date: Tue, 20 May 2025 20:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1646/1646] mm/maccess.c:64:6: warning:
 no previous prototype for '__probe_user_read'
Message-ID: <202505202028.GvFwJHdW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masami,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   2eb609d2f89b2d85d89cb018c3f97050989807e2
commit: 5c5bac1227aee80ee106ec07b32c981558049304 [1646/1646] uaccess: Add non-pagefault user-space read functions
config: x86_64-buildonly-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505202028.GvFwJHdW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202028.GvFwJHdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202028.GvFwJHdW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/maccess.c:64:6: warning: no previous prototype for '__probe_user_read' [-Wmissing-prototypes]
      64 | long __probe_user_read(void *dst, const void __user *src, size_t size)
         |      ^~~~~~~~~~~~~~~~~


vim +/__probe_user_read +64 mm/maccess.c

    50	
    51	/**
    52	 * probe_user_read(): safely attempt to read from a user-space location
    53	 * @dst: pointer to the buffer that shall take the data
    54	 * @src: address to read from. This must be a user address.
    55	 * @size: size of the data chunk
    56	 *
    57	 * Safely read from user address @src to the buffer at @dst. If a kernel fault
    58	 * happens, handle that and return -EFAULT.
    59	 */
    60	
    61	long __weak probe_user_read(void *dst, const void __user *src, size_t size)
    62	    __attribute__((alias("__probe_user_read")));
    63	
  > 64	long __probe_user_read(void *dst, const void __user *src, size_t size)
    65	{
    66		long ret = -EFAULT;
    67		mm_segment_t old_fs = get_fs();
    68	
    69		set_fs(USER_DS);
    70		if (access_ok(src, size))
    71			ret = probe_read_common(dst, src, size);
    72		set_fs(old_fs);
    73	
    74		return ret;
    75	}
    76	EXPORT_SYMBOL_GPL(probe_user_read);
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
