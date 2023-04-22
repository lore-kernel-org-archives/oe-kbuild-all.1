Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE1B7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 01:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682127273; x=1713663273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HWXGljs9F/wv8C2cJNdmBIAZAjR0g/YFcnJtQVw5+RA=;
  b=UOzkVIyLLEazxHOzeYNdwwvqsW7osCIwl2XHscUWbgfeaVGOnv87x+UR
   KOcwhBxpwhd9rA+yacMroOlBhDn2LtjaNh4mPzMivqlejHTezhWL3D30F
   OikTrOUAjPawx0ueGQU0W8sPfUEjo3H7gAsjuHFPlY0w3U0apngMtIAr1
   w5ny9RxgLJ2/v6VMcbNT7KvkCdDVE7BGt2ZTqfY1C3YIF8NEuOB568vJC
   UEqAmULxIupoX1UKchhiHmx1u+J7xNsYqox73cEiqNSqAL2go4MSrh1Ko
   o2GqaTzt9VXP3aETJzuq0nhO2wsBhcmnAPWeJGNE1h3VJf4fPuWbzEMHq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330321008"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="330321008"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 18:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669887648"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="669887648"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Apr 2023 18:34:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq28z-000gzE-1J;
	Sat, 22 Apr 2023 01:34:29 +0000
Date: Sat, 22 Apr 2023 09:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:ctime 2/5] fs/overlayfs/util.c:1119:13: error: implicit
 declaration of function 'is_multigrain_ctime'; did you mean
 'is_multigrain_ts'?
Message-ID: <202304220939.yAViM39T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ctime
head:   54dd444fe05963240ab071845d5de2b1da6d7688
commit: f24a43a08ee5e1ae888e58bad45356f8c7985de4 [2/5] overlayfs: flag the ctime as QUERIED on multigrain timestamp when copying up
config: nios2-randconfig-r014-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220939.yAViM39T-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=f24a43a08ee5e1ae888e58bad45356f8c7985de4
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ctime
        git checkout f24a43a08ee5e1ae888e58bad45356f8c7985de4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash fs/overlayfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220939.yAViM39T-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/overlayfs/util.c: In function 'ovl_copyattr':
>> fs/overlayfs/util.c:1119:13: error: implicit declaration of function 'is_multigrain_ctime'; did you mean 'is_multigrain_ts'? [-Werror=implicit-function-declaration]
    1119 |         if (is_multigrain_ctime(realinode)) {
         |             ^~~~~~~~~~~~~~~~~~~
         |             is_multigrain_ts
   cc1: some warnings being treated as errors


vim +1119 fs/overlayfs/util.c

  1088	
  1089	/*
  1090	 * ovl_copyattr() - copy inode attributes from layer to ovl inode
  1091	 *
  1092	 * When overlay copies inode information from an upper or lower layer to the
  1093	 * relevant overlay inode it will apply the idmapping of the upper or lower
  1094	 * layer when doing so ensuring that the ovl inode ownership will correctly
  1095	 * reflect the ownership of the idmapped upper or lower layer. For example, an
  1096	 * idmapped upper or lower layer mapping id 1001 to id 1000 will take care to
  1097	 * map any lower or upper inode owned by id 1001 to id 1000. These mapping
  1098	 * helpers are nops when the relevant layer isn't idmapped.
  1099	 */
  1100	void ovl_copyattr(struct inode *inode)
  1101	{
  1102		struct path realpath;
  1103		struct inode *realinode;
  1104		struct mnt_idmap *real_idmap;
  1105		vfsuid_t vfsuid;
  1106		vfsgid_t vfsgid;
  1107	
  1108		ovl_i_path_real(inode, &realpath);
  1109		realinode = d_inode(realpath.dentry);
  1110		real_idmap = mnt_idmap(realpath.mnt);
  1111	
  1112		vfsuid = i_uid_into_vfsuid(real_idmap, realinode);
  1113		vfsgid = i_gid_into_vfsgid(real_idmap, realinode);
  1114	
  1115		inode->i_uid = vfsuid_into_kuid(vfsuid);
  1116		inode->i_gid = vfsgid_into_kgid(vfsgid);
  1117		inode->i_mode = realinode->i_mode;
  1118		inode->i_atime = realinode->i_atime;
> 1119		if (is_multigrain_ctime(realinode)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
