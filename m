Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0871172C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0438IOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699944772; x=1731480772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fx27CGjo3Jc2ahPnPnLskc113YZ6f38vCsg/I+Fv2HE=;
  b=k0438IOGD0EEV1xf/50jeL1NVgUf2uRvvImmwmS7rudgmXil1+eEjShq
   kELnwfHKCaJIrleyO7BEO1+BSBJ7pGsWyuGk3QpqM4t0qbe6JzndwlW6n
   zDqrkzkIX9Iv+baF/4anpSPHKP8yCDb6Y7y/A2LxkgOXJXsouWZpo0gh3
   BBcFQUtTK6440vmFvNVMBaSpoHyy1QOnnIPR6x7OzKURF9K//fBcPVHQf
   RfL5rJMiJeKz0bkKULtBradZuQDWGWzbmHLUwaMFJn/fC/81sa/t9IGre
   PwOiyqSEXoLF4tJdu62Dv5wwGlJ4WVsP5xh0fqmMI6D/A5G/Mf7ONAstE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9236989"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="9236989"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 22:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714480339"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="714480339"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Nov 2023 22:52:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2nI0-000Cy4-05;
	Tue, 14 Nov 2023 06:52:48 +0000
Date: Tue, 14 Nov 2023 14:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sforshee:fscaps-vfsid 14/17] security/commoncap.c:524: warning:
 Function parameter or member 'caps' not described in 'cap_convert_nscap'
Message-ID: <202311141452.vSqQHhTR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fscaps-vfsid
head:   4147292fec1dab43e2907743ac84fe7b6b8b7ab0
commit: 32148b459f0e553719947357b8512dccced52c44 [14/17] fs: use vfs interfaces for capabilities xattrs
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20231114/202311141452.vSqQHhTR-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311141452.vSqQHhTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311141452.vSqQHhTR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/commoncap.c:524: warning: Function parameter or member 'caps' not described in 'cap_convert_nscap'
>> security/commoncap.c:524: warning: Excess function parameter 'vfs_caps' description in 'cap_convert_nscap'


vim +524 security/commoncap.c

8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  503  
e65ce2a50cf6af Christian Brauner           2021-01-21  504  /**
e65ce2a50cf6af Christian Brauner           2021-01-21  505   * cap_convert_nscap - check vfs caps
e65ce2a50cf6af Christian Brauner           2021-01-21  506   *
39f60c1ccee72c Christian Brauner           2023-01-13  507   * @idmap:	idmap of the mount the inode was found from
e65ce2a50cf6af Christian Brauner           2021-01-21  508   * @dentry:	used to retrieve inode to check permissions on
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  509)  * @vfs_caps:	vfs caps which may be modified by this function
e65ce2a50cf6af Christian Brauner           2021-01-21  510   *
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  511)  * User requested a write of security.capability.  Check permissions, and if
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  512)  * needed, update the xattr to change from v2 to v3.
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  513   *
39f60c1ccee72c Christian Brauner           2023-01-13  514   * If the inode has been found through an idmapped mount the idmap of
39f60c1ccee72c Christian Brauner           2023-01-13  515   * the vfsmount must be passed through @idmap. This function will then
39f60c1ccee72c Christian Brauner           2023-01-13  516   * take care to map the inode according to @idmap before checking
e65ce2a50cf6af Christian Brauner           2021-01-21  517   * permissions. On non-idmapped mounts or if permission checking is to be
4432b507445acf Paul Moore                  2023-05-24  518   * performed on the raw inode simply pass @nop_mnt_idmap.
e65ce2a50cf6af Christian Brauner           2021-01-21  519   *
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  520)  * Return: On success, return 0; on error, return < 0.
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  521   */
39f60c1ccee72c Christian Brauner           2023-01-13  522  int cap_convert_nscap(struct mnt_idmap *idmap, struct dentry *dentry,
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  523) 		      struct vfs_caps *caps)
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08 @524  {
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  525  	struct inode *inode = d_backing_inode(dentry);
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  526  	struct user_namespace *task_ns = current_user_ns(),
3b0c2d3eaa83da Eric W. Biederman           2021-03-12  527  		*fs_ns = inode->i_sb->s_user_ns;
b7c9b6751242fe Christian Brauner           2022-10-20  528  	vfsuid_t vfsrootid;
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  529) 	__u32 revision;
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  530  
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  531) 	revision = sansflags(caps->magic_etc);
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  532) 	if (revision != VFS_CAP_REVISION_2 && revision != VFS_CAP_REVISION_3)
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  533  		return -EINVAL;
9452e93e6dae86 Christian Brauner           2023-01-13  534  	if (!capable_wrt_inode_uidgid(idmap, inode, CAP_SETFCAP))
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  535  		return -EPERM;
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  536) 	if (revision == VFS_CAP_REVISION_2 && (idmap == &nop_mnt_idmap))
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  537  		if (ns_capable(inode->i_sb->s_user_ns, CAP_SETFCAP))
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  538  			/* user is privileged, just write the v2 */
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  539) 			return 0;
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  540  
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  541) 	vfsrootid = rootid_from_vfs_caps(caps, task_ns);
b7c9b6751242fe Christian Brauner           2022-10-20  542  	if (!vfsuid_valid(vfsrootid))
b7c9b6751242fe Christian Brauner           2022-10-20  543  		return -EINVAL;
b7c9b6751242fe Christian Brauner           2022-10-20  544  
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  545) 	if (!vfsuid_has_fsmapping(idmap, fs_ns, vfsrootid))
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  546  		return -EINVAL;
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  547  
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  548) 	caps->rootid = vfsrootid;
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  549) 	caps->magic_etc = VFS_CAP_REVISION_3 |
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  550) 			  (caps->magic_etc & VFS_CAP_FLAGS_EFFECTIVE);
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  551  
32148b459f0e55 Seth Forshee (DigitalOcean  2023-10-11  552) 	return 0;
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  553  }
8db6c34f1dbc8e Serge E. Hallyn             2017-05-08  554  

:::::: The code at line 524 was first introduced by commit
:::::: 8db6c34f1dbc8e06aa016a9b829b06902c3e1340 Introduce v3 namespaced file capabilities

:::::: TO: Serge E. Hallyn <serge@hallyn.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
