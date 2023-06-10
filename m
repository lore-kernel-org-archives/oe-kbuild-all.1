Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58077110A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686430455; x=1717966455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6XL1B+TcmACKhdvc9yqDp5YmbCjNm5IFnI5ipcP8RQ=;
  b=hmPyuayhhSDdzDTu6E5k7k7LIeauRwfDIYQhFACPuQFW+5D4BM6+nmoC
   JgcSIdg0f15vxguvetr6W/c0oZyd1ZOukK5nypQt3lpCLNCK+WU9CZtDd
   38zyj5Z3xo0upOM9CK4jME3D2XOVvOzCjKGHRRG5gmi71Va+ObQJEje+C
   r2VLnU69ffP3tgANg8pnHvdxEQjSb8lLlcUQLpxlhORPt7LauruAkGlrv
   XcgdeXHUFl37eOey44w926vlWrKGZu4qXP5kb7MqOUgWnlHs05Yz7MW8V
   2JySUh3GXqkf3NF27bWib0ahIEEGqTR8Rcdghn+4dA/+9eR+7Krqj7cP4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="423681730"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="423681730"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 13:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="855119964"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="855119964"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 13:54:13 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q85bA-000AQ8-2t;
	Sat, 10 Jun 2023 20:54:12 +0000
Date: Sun, 11 Jun 2023 04:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_encode_fid 20/23] fs/open.c:1132:39: error: 'file'
 undeclared
Message-ID: <202306110409.YtcVLfjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl_encode_fid
head:   0ba31a7b3dcbf443fbdd938d66dd9fdc5218bf9d
commit: 67e5341e22f0f5cbc1d3a0bbb4c2131b2bf896e6 [20/23] ovl: enable fsnotify events on underlying real files
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230611/202306110409.YtcVLfjG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/amir73il/linux/commit/67e5341e22f0f5cbc1d3a0bbb4c2131b2bf896e6
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il ovl_encode_fid
        git checkout 67e5341e22f0f5cbc1d3a0bbb4c2131b2bf896e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110409.YtcVLfjG-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/open.c: In function 'open_with_fake_path':
>> fs/open.c:1132:39: error: 'file' undeclared (first use in this function)
    1132 |                         fsnotify_open(file);
         |                                       ^~~~
   fs/open.c:1132:39: note: each undeclared identifier is reported only once for each function it appears in


vim +/file +1132 fs/open.c

  1118	
  1119	struct file *open_with_fake_path(const struct path *path, int flags,
  1120					struct inode *inode, const struct cred *cred)
  1121	{
  1122		struct file *f = alloc_empty_file_internal(flags, cred);
  1123		if (!IS_ERR(f)) {
  1124			int error;
  1125	
  1126			f->f_path = *path;
  1127			error = do_dentry_open(f, inode, NULL);
  1128			if (error) {
  1129				fput(f);
  1130				f = ERR_PTR(error);
  1131			} else {
> 1132				fsnotify_open(file);
  1133			}
  1134		}
  1135		return f;
  1136	}
  1137	EXPORT_SYMBOL(open_with_fake_path);
  1138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
