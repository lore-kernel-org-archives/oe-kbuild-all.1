Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D5A57
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="my+WzE6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697944365; x=1729480365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dYLRHVqUH9MeQ3JCRz2tdEwJ989TgPV1m7cc1y7m9wg=;
  b=my+WzE6IVgARuV1xQdRclsgLC+HB5OLizR8IkTM99vAJb4ye/taSJc5g
   QZEio5MrWeIt01BahW4CmJmArmr7lGYgzrIIZzwnJVn5v5cO9bfXDq94e
   2DTa+8hSp6RVdjo9mM9y0vBCWo0WpXWlOsKeXOT1MywJn2naWJUjKY3mG
   M43XhloMvHu/M9eIHbe42fP7++QXWe6PVwgvQIQEvffqZDLhBLVLxq+tl
   5QrN+3O182FyyOCwE687FAe82+yyot66Vj5uUvwg6zKe0W9ybQT5H5SRB
   +A4JiHuF86OAglTHJBaQF6NdVPlnRHZcMYEh1TrRHLhue2VCI5lijGb3v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="389529416"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="389529416"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 20:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089106532"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1089106532"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2023 20:12:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quOtJ-0005WM-0G;
	Sun, 22 Oct 2023 03:12:37 +0000
Date: Sun, 22 Oct 2023 11:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/5] exportfs: make ->encode_fh() a mandatory method for
 NFS export
Message-ID: <202310221030.mHFGcTOT-lkp@intel.com>
References: <20231018100000.2453965-4-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018100000.2453965-4-amir73il@gmail.com>

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on trondmy-nfs/linux-next xiang-erofs/dev-test xiang-erofs/dev tytso-ext4/dev kleikamp-shaggy/jfs-next cifs/for-next v6.6-rc6]
[cannot apply to xiang-erofs/fixes jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev mszeredi-fuse/for-next linus/master next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fanotify-limit-reporting-of-event-with-non-decodeable-file-handles/20231018-180124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20231018100000.2453965-4-amir73il%40gmail.com
patch subject: [PATCH 3/5] exportfs: make ->encode_fh() a mandatory method for NFS export
config: powerpc-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231022/202310221030.mHFGcTOT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221030.mHFGcTOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221030.mHFGcTOT-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/mfd/rsmu_core.o' being placed in section `.init.plt'
>> powerpc-linux-ld: fs/ext4/super.o:(.rodata+0x1314): undefined reference to `generic_encode_ino32_fh'
>> powerpc-linux-ld: fs/squashfs/export.o:(.rodata+0x54): undefined reference to `generic_encode_ino32_fh'
>> powerpc-linux-ld: fs/fat/nfs.o:(.rodata+0x80): undefined reference to `generic_encode_ino32_fh'
>> powerpc-linux-ld: fs/ufs/super.o:(.rodata+0x224): undefined reference to `generic_encode_ino32_fh'
>> powerpc-linux-ld: fs/affs/namei.o:(.rodata+0x120): undefined reference to `generic_encode_ino32_fh'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
