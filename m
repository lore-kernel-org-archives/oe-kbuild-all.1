Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB042AD14
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756763595; cv=none; b=TiyIZ+5EmfEAUI78OtbmVHQR1SvrMD44o7nqxVLoOsTwZPn3JRzXdCYg8nFX/NOfBcw5b5JWmOlYcCVOueK6lfNMnDabsSZsm+7aI3EIpsOyuVqdEK3qZjuPwuCpex2KHH9RVPtk0KrCeYG9Ys60hV698zV94/aBKUQFmGNj3uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756763595; c=relaxed/simple;
	bh=yCiNuaVDAoNiJs27P53eXzSxOUh1hlF8eWbRhSPf5hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPoAC+D+DipSOZqs/mXaDDuluAi+2X7khu6UMnVR3NcMU7xFj44B2AZC9SNFJOHfri4QRC9AzfTf1+nypFWg4kfBe8HMCsFiB6msZ/63V1Oq+k+KHN2gg0w5rZMGhd7SrLpF3eaNCLgupHPqzwGh4dDUtaOW72MSYm/8ufn1OtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csca2Cuk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csca2Cuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756763593; x=1788299593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yCiNuaVDAoNiJs27P53eXzSxOUh1hlF8eWbRhSPf5hk=;
  b=csca2Cuk69GWndToEIHfv6v8Cqz174IUxuPqLcuvYBOIlx/qDtlKQMzJ
   vfic1XWSgo3+/90oA75zM1VAqh2SsCgL6wxgiY5GUGpNo/YbpL/zO4l0N
   MzCo0HdVnksOMh00lufh1axwNkklRdBO4X9U5kYE9zoRVz26I7lc+DdLd
   UtTczAozUl1IwuWQawN/FjVF4H3bjacEMNJEX+Tgn+pj421L2aH/y9cR4
   uH5FFl3rhZH1ypHrKv3st6rP85VNxvjpCpPNd+KFyzwosOpNk4Lw21qJu
   sJMkZGk1N0bcwHBKO+/L/GpIZHYDXvCN075ITIoefkTa2FXghr4FFgHMa
   Q==;
X-CSE-ConnectionGUID: PJxqJMabRb2qotVF0KwFvw==
X-CSE-MsgGUID: xaaH44/cQGWv4JvLL713Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="62840357"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62840357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 14:53:11 -0700
X-CSE-ConnectionGUID: b6UBfpWyS325mKd4Xs7Jkw==
X-CSE-MsgGUID: 9MRIAChlT4eOtPMavE1AOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202060714"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2025 14:53:11 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utCSZ-00014t-2l;
	Mon, 01 Sep 2025 21:53:08 +0000
Date: Tue, 2 Sep 2025 05:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1774/1774] mm/maccess.c:64:6: warning:
 no previous prototype for function '__probe_user_read'
Message-ID: <202509020546.DO94LENh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54968bf23106d2ac31ede8dca013a7fadeb3dd75
commit: 5c5bac1227aee80ee106ec07b32c981558049304 [1774/1774] uaccess: Add non-pagefault user-space read functions
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250902/202509020546.DO94LENh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020546.DO94LENh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020546.DO94LENh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/maccess.c:64:6: warning: no previous prototype for function '__probe_user_read' [-Wmissing-prototypes]
      64 | long __probe_user_read(void *dst, const void __user *src, size_t size)
         |      ^
   mm/maccess.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      64 | long __probe_user_read(void *dst, const void __user *src, size_t size)
         | ^
         | static 
   1 warning generated.


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
