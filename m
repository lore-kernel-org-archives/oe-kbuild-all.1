Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799C3905E7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285409; cv=none; b=fh2uOnDP31nXppuNNNEflWAEmWljaPmvu76jhSgMQYHrxds3UPY2XxEkpPd+8jCcuMqxrGGoBfXsgcynscQNAdDPpOS3003eLeO/pHeAXG3qx9wsg63IJXc7GROqNnD5Y7W09y3BvqLXjNpiAxCFEBCpSaGKqoxwg6VXNvNRvNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285409; c=relaxed/simple;
	bh=dElrt4xZt0+82C0F9I8Vnj3l7hmSpqwbAhsZpXGC1UE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gcRybE0GV0u25DDiI2UHiS5IygLDDZd5vqRrk3WDLYbOv+CwMiOgsbzSRj46IrcxzkQ6PqJTK8u9Tv+v86Tb7eLht9q/xcMc/Uyq+idH8W8u5qs4Hrop/bLIfFyrvCwHsnQsb03zmMQprM17d2ruuRwryLDoc2RgDYTQxZLCeqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYbXIZ/t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYbXIZ/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782285407; x=1813821407;
  h=date:from:to:cc:subject:message-id;
  bh=dElrt4xZt0+82C0F9I8Vnj3l7hmSpqwbAhsZpXGC1UE=;
  b=dYbXIZ/tvjQXG45pkFwUDnXKzy64MdiLcdS4BBBsj4kUDm1CfFt5FAUH
   oIBon+RIsiKyKWvWntQOmgmkxAW2wpsagfq8UUQYfIx6zbKA6EU7QO+q9
   n6Nq/g7r3Ph8HttbwOCvz+egIpyw/kxFxt6NpzJyFgDUIot++ClmNIgeP
   x9wRokXUVjGCSL/Qt3H5puFHdzFEJyHEAB7negiNQq1KNN1S42gipGMvr
   XDklF5N1NZJbki+o541oVtBuxwzfN8UsUGQEp/zRehsAsAz22bGCH+MUh
   qH8WC1Xo08CcLBkY4TSVcMWWvguQ4Mu5sfv+2ORI4uoSKe6N+Gg7kgu6S
   A==;
X-CSE-ConnectionGUID: YvQEu9xSRamyfF+gxJrFhQ==
X-CSE-MsgGUID: qbSbLw0gR7WEPeM+vUfeXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93398018"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="93398018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 00:16:47 -0700
X-CSE-ConnectionGUID: KbHi52ZfTgm0kT3LT3KCQQ==
X-CSE-MsgGUID: Gmi09htOT02HT2FCniSScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="287880956"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Jun 2026 00:16:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcHqh-000000003C3-0aF7;
	Wed, 24 Jun 2026 07:16:39 +0000
Date: Wed, 24 Jun 2026 15:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:djiang5/gmem-private-node 3/4]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:610:23: error: implicit
 declaration of function 'mpol_private_bind'
Message-ID: <202606241533.Psz26RzJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davejiang/linux.git djiang5/gmem-private-node
head:   d3d7a6f5d40881bb11ac8f9ab05421d80a884a9b
commit: af5f1af845c19fd7e4eb7d61567fc0b41044bd7f [3/4] KVM: guest_memfd: allow binding backing memory to a NUMA node at creation
config: x86_64-randconfig-071-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241533.Psz26RzJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241533.Psz26RzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241533.Psz26RzJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function '__kvm_gmem_create':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:610:23: error: implicit declaration of function 'mpol_private_bind' [-Wimplicit-function-declaration]
     610 |                 pol = mpol_private_bind(node);
         |                       ^~~~~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:610:21: error: assignment to 'struct mempolicy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     610 |                 pol = mpol_private_bind(node);
         |                     ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:615:23: error: implicit declaration of function 'mpol_set_shared_policy_all'; did you mean 'mpol_free_shared_policy'? [-Wimplicit-function-declaration]
     615 |                 err = mpol_set_shared_policy_all(&GMEM_I(inode)->policy, pol);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       mpol_free_shared_policy


vim +/mpol_private_bind +610 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   558	
   559	static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags, int node)
   560	{
   561		static const char *name = "[kvm-gmem]";
   562		struct gmem_file *f;
   563		struct inode *inode;
   564		struct file *file;
   565		int fd, err;
   566	
   567		fd = get_unused_fd_flags(0);
   568		if (fd < 0)
   569			return fd;
   570	
   571		f = kzalloc_obj(*f);
   572		if (!f) {
   573			err = -ENOMEM;
   574			goto err_fd;
   575		}
   576	
   577		/* __fput() will take care of fops_put(). */
   578		if (!fops_get(&kvm_gmem_fops)) {
   579			err = -ENOENT;
   580			goto err_gmem;
   581		}
   582	
   583		inode = anon_inode_make_secure_inode(kvm_gmem_mnt->mnt_sb, name, NULL);
   584		if (IS_ERR(inode)) {
   585			err = PTR_ERR(inode);
   586			goto err_fops;
   587		}
   588	
   589		inode->i_op = &kvm_gmem_iops;
   590		inode->i_mapping->a_ops = &kvm_gmem_aops;
   591		inode->i_mode |= S_IFREG;
   592		inode->i_size = size;
   593		mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
   594		mapping_set_inaccessible(inode->i_mapping);
   595		/* Unmovable mappings are supposed to be marked unevictable as well. */
   596		WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
   597	
   598		GMEM_I(inode)->flags = flags;
   599	
   600		if (IS_ENABLED(CONFIG_NUMA) && (flags & GUEST_MEMFD_FLAG_BIND_NODE)) {
   601			struct mempolicy *pol;
   602	
   603			/*
   604			 * Bind every folio (host- and guest-faulted) to @node by
   605			 * installing a private bind on the inode's shared policy.  The
   606			 * policy is inserted verbatim so an MPOL_F_PRIVATE node is not
   607			 * dropped, unlike the mbind() path which requires the node to
   608			 * opt into CAP_MEMPOLICY.
   609			 */
 > 610			pol = mpol_private_bind(node);
   611			if (IS_ERR(pol)) {
   612				err = PTR_ERR(pol);
   613				goto err_inode;
   614			}
 > 615			err = mpol_set_shared_policy_all(&GMEM_I(inode)->policy, pol);
   616			mpol_put(pol);
   617			if (err)
   618				goto err_inode;
   619		}
   620	
   621		file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
   622		if (IS_ERR(file)) {
   623			err = PTR_ERR(file);
   624			goto err_inode;
   625		}
   626	
   627		file->f_flags |= O_LARGEFILE;
   628		file->private_data = f;
   629	
   630		kvm_get_kvm(kvm);
   631		f->kvm = kvm;
   632		xa_init(&f->bindings);
   633		list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
   634	
   635		fd_install(fd, file);
   636		return fd;
   637	
   638	err_inode:
   639		iput(inode);
   640	err_fops:
   641		fops_put(&kvm_gmem_fops);
   642	err_gmem:
   643		kfree(f);
   644	err_fd:
   645		put_unused_fd(fd);
   646		return err;
   647	}
   648	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
