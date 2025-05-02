Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEBB26772C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205883; cv=none; b=YiUKeE/MfzL3aQaXjO8YFgcGEtRsPlOxatG6U2T9QAHrXm5JiIkLkZylfqInMPNjSXObL2bWNcNasHjISN9Lf/RMxyj1DFB5+iU6EIvYTRzTLR8o6iaHrqiEcAMOGgmUS61nwrQ3KlSK9STB/fpD6nmHXJbd5Ylmc5NviAG16SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205883; c=relaxed/simple;
	bh=+L9LQK2OF0HJlo8+wmaQY3XFhRzCsOycJkXzbMO8Ciw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI3MJqnpPRX/hbkEqj+vj11ihGtiB32L9RGktdyE9StWNmpFsugeMYCUCdY93Xm+LyNMQKlQ5PyYW5sFIY3J7iMx1WDB2Vg4GwzFU9JlslbWq8U1FaU/R2aDmrGN/zrXhMzGDmdAMmL3LqZFnC+0umVGlLhf82uBTtMhJPwewno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZA2FENb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZA2FENb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746205882; x=1777741882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+L9LQK2OF0HJlo8+wmaQY3XFhRzCsOycJkXzbMO8Ciw=;
  b=DZA2FENbpdahz0nTYC++sW1yh3pxRZ8hpaM1RD5C6ATno2N/4saQRnUH
   foa1KlXj7yLy/4t5ckuTZYN9i4iL0CpnIkC0QhFAtsezasbzAwl3Ja+W6
   0OsZ9mvWDy0dYd3D5Co9yPAOzQqDsktYBt2ZeZscwbYkwnIyVk4l7Xq9G
   2TodeYj2bPtQS4zY379cWe+iFPQrzx++nKnUfNQR+ycYDZh0sHKpNAjFX
   hMSzW2dcW6yBmL+86SYyAWAPgHP/23Z2PP9ydIOvvpfDw2OI8QcQlaiOE
   ZLShk1gQM5uI2byI8y5EstKRDlLcj22qgGUcnz+n5VUVBTbcIgHfUwfGw
   g==;
X-CSE-ConnectionGUID: +U7BHbSXRqO8TqPQSx6McA==
X-CSE-MsgGUID: xnkKna7SSB+/MMlkbFizhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48036730"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="48036730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 10:11:21 -0700
X-CSE-ConnectionGUID: PmTYEdw2QlG8zt3S9s+1Ew==
X-CSE-MsgGUID: 9NkHv8IHQ5KFU7szW8rpyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="134645726"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 May 2025 10:11:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAtuv-0004ud-37;
	Fri, 02 May 2025 17:11:17 +0000
Date: Sat, 3 May 2025 01:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC, PATCH 04/12] x86/virt/tdx: Account PAMT memory and print
 if in /proc/meminfo
Message-ID: <202505030027.1GN4OM5j-lkp@intel.com>
References: <20250502130828.4071412-5-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502130828.4071412-5-kirill.shutemov@linux.intel.com>

Hi Kirill,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next next-20250502]
[cannot apply to tip/x86/tdx tip/x86/mm kvm/linux-next linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kirill-A-Shutemov/x86-virt-tdx-Allocate-page-bitmap-for-Dynamic-PAMT/20250502-211346
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20250502130828.4071412-5-kirill.shutemov%40linux.intel.com
patch subject: [RFC, PATCH 04/12] x86/virt/tdx: Account PAMT memory and print if in /proc/meminfo
config: i386-buildonly-randconfig-005-20250502 (https://download.01.org/0day-ci/archive/20250503/202505030027.1GN4OM5j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030027.1GN4OM5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030027.1GN4OM5j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/vga.h:11,
                    from include/video/vga.h:22,
                    from drivers/video/fbdev/nvidia/nv_setup.c:50:
>> arch/x86/include/asm/set_memory.h:93:34: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
      93 | void direct_pages_meminfo(struct seq_file *m);
         |                                  ^~~~~~~~


vim +93 arch/x86/include/asm/set_memory.h

    92	
  > 93	void direct_pages_meminfo(struct seq_file *m);
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
