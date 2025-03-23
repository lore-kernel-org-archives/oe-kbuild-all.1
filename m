Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728201C84D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742695836; cv=none; b=MltQqd8Vx4llOeHbwT7AicUfnhnJ1mFykhNbsUFAufajkgX9dCzcKcTOvGVkA3FbA3HSdTZH/5ebU5HS8e1kVnKYpgHtLJPkSQKa1LVwYxrjtb544+W5m+XGe/qpQsA56CSwnXStPN7HOU6XEBFgQzzz6RORNiHRgvLGVHt7aco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742695836; c=relaxed/simple;
	bh=fXOFHY2W/leFIFKt8WNymZNh7D9aQsDF+5b299aGPTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UkfSxcyvF+dDtiaiRYf1oi3uDK9NAK1F/x4SvBFgakcc9nsFpcHQX4vJXG2Y6wXldOT7tSp9MvNp0gjhuImvSb9sE/UJ08LaUwYrmURjzSZahEgEH0QWJEcU0WdDTI2MD/TkVbBoeyh+l+NUBORTOBYLNHZtvsa9SAXExU6kR7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SV5/ds0c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SV5/ds0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742695835; x=1774231835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXOFHY2W/leFIFKt8WNymZNh7D9aQsDF+5b299aGPTQ=;
  b=SV5/ds0c/t2w8YYsKTo19YC5xBfEKG8f+7PFIUO6mx4RUsTUIbuUWQUJ
   k+nLknzJxc6S009nigJ793JhKcxqB94Q9cp61H0JUwqVN3tBxjqlkS1lJ
   yzcRXPeWWCk8psDZHFvtbXxx/3FSZ7eILZPF/31TkQ09eTwPAHkCz4GYz
   VclvOc+vBKz4B+aHbF7jF39GZPyV2NKFwXCmX/hVY3rUC2Hm0ItexciEl
   XfykFI6ArSWmSgBURONxhukkLs+AhTBUdwDIpbiY3tTqbm7nQNlby0ZUM
   dKvDwpGojJ/mtb7r7fXfWz4KQnDys9Wi26e/bmh0x8x8pNgnBKQAKkwga
   A==;
X-CSE-ConnectionGUID: jrCWrP9PT3OOfUXX0WRSKA==
X-CSE-MsgGUID: 0BYxvt07SACvwP/zbU+wDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="61446944"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="61446944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 19:10:34 -0700
X-CSE-ConnectionGUID: BxdzlhuuSfGh8TAMPkVUSw==
X-CSE-MsgGUID: 6MO6qf4fQ+SWwS2QIQDs2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="124501280"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Mar 2025 19:10:33 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twAnG-0002Wn-2g;
	Sun, 23 Mar 2025 02:10:30 +0000
Date: Sun, 23 Mar 2025 10:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] udmabuf.c:undefined reference to
 `vmf_insert_pfn'
Message-ID: <202503231033.lJj42KGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c7dcc4c417018dab67322244bfaff4338c43b3ec
commit: ac48ddf6b0232863674d38d4d0edecb40a1bda78 [2/2] udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap
config: arm-randconfig-r121-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231033.lJj42KGM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250323/202503231033.lJj42KGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231033.lJj42KGM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
>> udmabuf.c:(.text+0xba): undefined reference to `vmf_insert_pfn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
