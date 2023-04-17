Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A719110B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 01:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681693708; x=1713229708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kIzVrKCFe+60hRvxAFocAdPGl7YVIzJg+ePWK3/oiY4=;
  b=iDNi+Ip1nxeM/+BMaSrZr9vi9ZUNloK7Ofv6TM3KKklJtKzEoYj3pTZy
   U4BXqE25CtaLQ8jV5mR/ReGOPNf84Ku/KbdXDZFBthodFzUxB30jPQViq
   l29WzDTUC6mesKwni/dgjRMSk4KfU7EUXnoAdKpqJZeziPdTeTR5mJfNq
   31XMZazApwmevK4XzgIlU7oNLaTbRooRYQ5mMMBB1kG0EQVx+URcgrjfw
   pJ7eNZsasWycHjuLdgjYfS0q1KsXgLFyyDah8Z71NWSTTq57GpaPJXnw+
   CVZXQUaNUD/Bo3yeek4i7Y1EdCo1LK8dbDM6fjjRbnssEjpPonZ2JHIue
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="328939255"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="328939255"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 18:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="667943217"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="667943217"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Apr 2023 18:08:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poDM0-000bxn-1F;
	Mon, 17 Apr 2023 01:08:24 +0000
Date: Mon, 17 Apr 2023 09:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH/RFC] VFS: LOOKUP_MOUNTPOINT should used cached info
 whenever possible.
Message-ID: <202304170850.Rq25PWLS-lkp@intel.com>
References: <168168683217.24821.6260957092725278201@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168168683217.24821.6260957092725278201@noble.neil.brown.name>

Hi NeilBrown,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on viro-vfs/for-next]
[also build test WARNING on vfs-idmapping/for-next linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-LOOKUP_MOUNTPOINT-should-used-cached-info-whenever-possible/20230417-071435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
patch link:    https://lore.kernel.org/r/168168683217.24821.6260957092725278201%40noble.neil.brown.name
patch subject: [PATCH/RFC] VFS: LOOKUP_MOUNTPOINT should used cached info whenever possible.
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230417/202304170850.Rq25PWLS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7084d22d194837a61c41fb56ab65999c32b143bd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review NeilBrown/VFS-LOOKUP_MOUNTPOINT-should-used-cached-info-whenever-possible/20230417-071435
        git checkout 7084d22d194837a61c41fb56ab65999c32b143bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170850.Rq25PWLS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namei.c:501:5: warning: no previous prototype for 'inode_permission_mp' [-Wmissing-prototypes]
     501 | int inode_permission_mp(struct mnt_idmap *idmap,
         |     ^~~~~~~~~~~~~~~~~~~
--
   fs/namei.c:503: warning: Function parameter or member 'mp' not described in 'inode_permission_mp'
>> fs/namei.c:503: warning: expecting prototype for inode_permission(). Prototype was for inode_permission_mp() instead
   fs/namei.c:675: warning: Function parameter or member 'mnt' not described in 'path_connected'
   fs/namei.c:675: warning: Function parameter or member 'dentry' not described in 'path_connected'
   fs/namei.c:1124: warning: Function parameter or member 'inode' not described in 'may_follow_link'


vim +/inode_permission_mp +501 fs/namei.c

   488	
   489	/**
   490	 * inode_permission - Check for access rights to a given inode
   491	 * @idmap:	idmap of the mount the inode was found from
   492	 * @inode:	Inode to check permission on
   493	 * @mask:	Right to check for (%MAY_READ, %MAY_WRITE, %MAY_EXEC)
   494	 *
   495	 * Check for read/write/execute permissions on an inode.  We use fs[ug]id for
   496	 * this, letting us set arbitrary permissions for filesystem access without
   497	 * changing the "normal" UIDs which are used for other things.
   498	 *
   499	 * When checking for MAY_APPEND, MAY_WRITE must also be set in @mask.
   500	 */
 > 501	int inode_permission_mp(struct mnt_idmap *idmap,
   502				struct inode *inode, int mask, bool mp)
 > 503	{
   504		int retval;
   505	
   506		retval = sb_permission(inode->i_sb, inode, mask);
   507		if (retval)
   508			return retval;
   509	
   510		if (unlikely(mask & MAY_WRITE)) {
   511			/*
   512			 * Nobody gets write access to an immutable file.
   513			 */
   514			if (IS_IMMUTABLE(inode))
   515				return -EPERM;
   516	
   517			/*
   518			 * Updating mtime will likely cause i_uid and i_gid to be
   519			 * written back improperly if their true value is unknown
   520			 * to the vfs.
   521			 */
   522			if (HAS_UNMAPPED_ID(idmap, inode))
   523				return -EACCES;
   524		}
   525	
   526		if (mp)
   527			/* We are looking for a mountpoint and so don't
   528			 * want to interact with the filesystem at all, just
   529			 * the dcache and icache.
   530			 */
   531			retval = generic_permission(idmap, inode, mask);
   532		else
   533			retval = do_inode_permission(idmap, inode, mask);
   534		if (retval)
   535			return retval;
   536	
   537		retval = devcgroup_inode_permission(inode, mask);
   538		if (retval)
   539			return retval;
   540	
   541		return security_inode_permission(inode, mask);
   542	}
   543	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
