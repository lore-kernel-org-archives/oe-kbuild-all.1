Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17805EC0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpqYSW2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699550479; x=1731086479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMwn/Vym2og5mrMvi2S9kt800BD1g5MXR73BO15EsdE=;
  b=VpqYSW2f6boGOYqeZXvylW+Z3OIjmhm5W/VlxHBPEdb+GrhPXJISE+Sn
   90Dwo1EQhJUR+idVf7hcS3LSd3RSpQaOnA6R9pzKaxGSqOOM71Nqvx3wz
   8QNjfA13wEjIfkzE1RTp5OaiBQh7tYpY6/ws4sNOCiALS9vtDZzP19GV9
   EKrtqTFxXR5W6ZUMF86c5k9O0TANnVfomSN490SeMlszcoL0TcHWKbLvG
   dlCxnYo0vxBhPs1bpM8LV9mHgKo9W7y62SMi525YMo0fqKFKzUQUUwbTK
   0YrxfDpH6rt46a9WA5ln0jaXwGorgDb1c5QURWed1DKARmqCA2uldrKoA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393941560"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="393941560"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 09:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="854135336"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="854135336"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2023 09:21:14 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r18iO-0008xS-0y;
	Thu, 09 Nov 2023 17:21:12 +0000
Date: Fri, 10 Nov 2023 01:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-ia64@vger.kernel.org
Subject: [aegl:resctrl2_patches 9/52] fs/resctrl2/kernfs.c:6:19: sparse:
 sparse: symbol 'resctrl_file_ops' was not declared. Should it be static?
Message-ID: <202311092324.LZXnUp3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches
head:   a6866c2d6be6dd4997cd46120e288fe0b5e16c9b
commit: eca79ecf33e9c18bcfe7c9c39f2cad22092057ab [9/52] resctrl2: Modules can add file(s) in their info/ directory
config: i386-randconfig-062-20230922 (https://download.01.org/0day-ci/archive/20231109/202311092324.LZXnUp3D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092324.LZXnUp3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092324.LZXnUp3D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/resctrl2/kernfs.c:6:19: sparse: sparse: symbol 'resctrl_file_ops' was not declared. Should it be static?

vim +/resctrl_file_ops +6 fs/resctrl2/kernfs.c

     5	
   > 6	struct kernfs_ops resctrl_file_ops = {
     7		.atomic_write_len	= PAGE_SIZE,
     8	};
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
