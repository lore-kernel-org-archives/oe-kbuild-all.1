Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA1145B0B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781402; cv=none; b=tjDgXOsNgGm4aZzVX6UHMMUsr5LJOfilIrwvxrsSIJq2k3I4YeQVrazUgDzvx2Kbmsd4s2+StdK1q6bUF/ceMZmI9kzpIP/CswKgsBqlDIePZaW8bFSZ6HzN6kf2BCF05xQNPIMd8I2W93rZoO9BnSszUhWII/tj+CqTouuMYlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781402; c=relaxed/simple;
	bh=8nq6hQAU0GCCOfi4zt2xO+5aWx8e+5vtF1efULp4Ehw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s5jQq6zihrd7svccO1xhPEr+SE067zEZ5EnrwWirSVcO47jOptDp0hD6D7XF7Abee/tfUF3gOoBy536WYlgdgebpP9BiJPe+NE2yyzrkYsP5oLvAD/RUEK5vkDHpvgCwjmjCfIqzpFz4WiA7PiQBMwalHjz6fPKQ1gzrBGxT5mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVTyTZdV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVTyTZdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729781399; x=1761317399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8nq6hQAU0GCCOfi4zt2xO+5aWx8e+5vtF1efULp4Ehw=;
  b=NVTyTZdVzH7c+hEuxL9+c9JQ0LD19I3YFA2J8xD4y+izRUSg01JU0Hvl
   hsKJBayoQN7lEV3V9IweY0ovPW8k0INlkMA2T3spUXm3q4ctTEeQ68Xcu
   GT758iJhw0slrcIHfxedPhS/yAMcGjArDJrR8CNKybsCRuf+NvCGOCFfN
   M4XORwl+c2oNdO8/bBgQnheiU7CkAEovLIMUah1OTgxuopi711uYNPnzP
   EbuSUcdk5y4Do8NxtG7UZ9S1qP9+4mwueziTKRcZUcCkq1+W8WhvVByqI
   pUFn8M/U8Mjme90knfwIiyw0ps7F9YYDBIfahSPpXLZdD3z9z+yCYY0NB
   g==;
X-CSE-ConnectionGUID: N7ZIIjTnS5SNBWnRBGMy+g==
X-CSE-MsgGUID: Hj9dOVj2TnOFPuPxxckwuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40808053"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="40808053"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 07:49:59 -0700
X-CSE-ConnectionGUID: JnOHHdobQuSN7E+A7fl2Iw==
X-CSE-MsgGUID: /wIoAijBQKGTmbkwK3Ydsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80262572"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2024 07:49:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3z9v-000WXQ-2Y;
	Thu, 24 Oct 2024 14:49:55 +0000
Date: Thu, 24 Oct 2024 22:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7453/15273] mm/kasan/shadow.c:90:undefined
 reference to `__memcpy_mc'
Message-ID: <202410242202.olRfrxYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ed7fbeaf3f3511bb3db6134d07f614d513c4273f
commit: b991780c836ceb9a479c6c6e385e914b487e353a [7453/15273] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242202.olRfrxYG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242202.olRfrxYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242202.olRfrxYG-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
>> mm/kasan/shadow.c:90:(.text+0x6bc): undefined reference to `__memcpy_mc'


vim +90 mm/kasan/shadow.c

    81	
    82	#ifdef __HAVE_ARCH_MEMCPY_MC
    83	#undef memcpy_mc
    84	int memcpy_mc(void *dest, const void *src, size_t len)
    85	{
    86		if (!kasan_check_range(src, len, false, _RET_IP_) ||
    87		    !kasan_check_range(dest, len, true, _RET_IP_))
    88			return (int)len;
    89	
  > 90		return __memcpy_mc(dest, src, len);
    91	}
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
