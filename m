Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA0423B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675586595; x=1707122595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kH+MpvMcWccwOBLIJicsl7PR+Jxg+nFMxA6N2q5Eu7Y=;
  b=lP7x3mkRXnBk65/QchaA74REZuH8QDtWzXmAE48R8L6Hta2uPGpyUzVd
   mqzkyt3bi4xiSrv6ZoGutlkSWOpUGBtAHrSB8Fc/mZTXYWKGHX0LNMB1N
   vByPBibXj2LeBBJo6E507QPOLQ/EKx7M6+UOnFQBSKGP7vZntv48ZDZBP
   /sVsEHDKHLlj5mZ9IHUnMU/elVeSFqKIRSbWMCusK4rnei4EzedAGZOIc
   atbQyMSG0Kl5L4F48BmeanK7faQ+LTnh1fwqnQlCPHXULGDxYLcoYiDy5
   ZA+9DV9BJ8MZczcZ/JdQ5n54Gphw+PYKigzn7fpRcc8gX3bcUW3WWJP/5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393626720"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393626720"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 00:43:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="840058808"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="840058808"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 00:43:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOacE-0001sS-08;
	Sun, 05 Feb 2023 08:43:14 +0000
Date: Sun, 5 Feb 2023 16:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v9 05/16] ipe: add userspace interface
Message-ID: <202302051649.TJllIo95-lkp@intel.com>
References: <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe-block/for-next lwn/docs-next linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20230131-070059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/1675119451-23180-6-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v9 05/16] ipe: add userspace interface
config: sparc64-randconfig-s033-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051649.TJllIo95-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/b469e8114a5e6f4e91f55acb934873bb4d898eb1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fan-Wu/security-add-ipe-lsm/20230131-070059
        git checkout b469e8114a5e6f4e91f55acb934873bb4d898eb1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash security/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> security/ipe/policy_fs.c:281:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ipe_policy **addr @@     got struct ipe_policy [noderef] __rcu **[assigned] addr @@
   security/ipe/policy_fs.c:281:33: sparse:     expected struct ipe_policy **addr
   security/ipe/policy_fs.c:281:33: sparse:     got struct ipe_policy [noderef] __rcu **[assigned] addr

vim +281 security/ipe/policy_fs.c

   245	
   246	/**
   247	 * update_policy - Write handler for "ipe/policies/$name/update".
   248	 * @f: Supplies a file structure representing the securityfs node.
   249	 * @data: Supplies a buffer passed to the write syscall.
   250	 * @len: Supplies the length of @data.
   251	 * @offset: unused.
   252	 *
   253	 * On success this updates the policy represented by $name,
   254	 * in-place.
   255	 *
   256	 * Return:
   257	 * * >0	- Success, Length of buffer written
   258	 * * <0	- Error
   259	 */
   260	static ssize_t update_policy(struct file *f, const char __user *data,
   261				     size_t len, loff_t *offset)
   262	{
   263		int rc = 0;
   264		char *copy = NULL;
   265		struct inode *ino = NULL;
   266		struct ipe_policy *new = NULL;
   267		struct ipe_policy __rcu **addr = NULL;
   268	
   269		if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
   270			return -EPERM;
   271	
   272		copy = memdup_user(data, len);
   273		if (IS_ERR(copy)) {
   274			rc = PTR_ERR(copy);
   275			goto err;
   276		}
   277	
   278		ino = d_inode(f->f_path.dentry->d_parent);
   279		inode_lock(ino);
   280		addr = find_policy(f);
 > 281		new = ipe_update_policy(addr, NULL, 0, copy, len);
   282		inode_unlock(ino);
   283		synchronize_rcu();
   284		if (IS_ERR(new)) {
   285			rc = PTR_ERR(new);
   286			goto err;
   287		}
   288	
   289		kfree(copy);
   290		return len;
   291	err:
   292		kfree(copy);
   293		return rc;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
