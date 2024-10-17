Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF8A1D043D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729200898; cv=none; b=H6mBlVnvI2vGxeFiWa0Vz9qX7/nCvsp8FuK95TsQhqJzaoKMaDWCpNKSbEhfju/ULkLUOlejQSxFkdu3BE7ZSZ6rqiB1CJ+icRSR6YxQPj6qMByZfjV6/M1eauu48x+2YfLcAQwsJJqFVwEc9MEDZSC1GgtyW9kxKXY8nQ1Ofg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729200898; c=relaxed/simple;
	bh=NgTQJ0eaY4RkfuA6bZIBptzUzUc1XC/5hsRkdiKoQiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RMcFkE75Lwl8/nnEhKoP/XpEJlTshc67KuhvWUmHs3x5X4Yp0RKJ8OfTf7XEtS7Z0IspMJjvYfdzEveD7Y9nqRfumsgDZRk3EOaefYLKxiTog1VIe40MJRrJN4ZBC0HnJGzOs0Pxn5Ohev9+gxVPAUfygKG/VUx71nOfo5GQIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtfOIfTj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtfOIfTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729200893; x=1760736893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgTQJ0eaY4RkfuA6bZIBptzUzUc1XC/5hsRkdiKoQiE=;
  b=EtfOIfTjddhTMsFlXbDwSwE7L8vc++UsfGnfdCYyPcj6UgecabuMpSt/
   JqiMXGj/DK1OerZoqt10PZ9RpXxc3QVenEbThMMXy8r/iJVpU2fBFQjNq
   6k0X3DtwFKyUNX11TWj3izCqaegL4/Wh1L1/b3fqGrN0H3Z67txgfTyGV
   Yta4fP/MMQdktAgUiXxe73UmS//aQdlyZNa8T61IMdem3AOiFnXRJmHlC
   32HMFAd9Qd2voJqvo/HTFcOX6ont9/+zPoRLs89trfzNbLnEkJlYCYogj
   mQEIJ/wLJl2X8YkJetoANuJJ/xFmlYQrnAFclpyogr4nw5r238+BdamaJ
   w==;
X-CSE-ConnectionGUID: IN4j9/2LTTexaiBhpG1zQQ==
X-CSE-MsgGUID: muBNt0MPRJqAtStKmaqzdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39257439"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39257439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 14:34:52 -0700
X-CSE-ConnectionGUID: D5u3ivn6R0OzF9eQCJC3zA==
X-CSE-MsgGUID: B+qlr/OmSuKCyIAlhYJPMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="83755206"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Oct 2024 14:34:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Y8u-000My3-2b;
	Thu, 17 Oct 2024 21:34:48 +0000
Date: Fri, 18 Oct 2024 05:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 39/39] fs/afs/write.c:313:13: warning:
 'netfs_dump_sg' defined but not used
Message-ID: <202410180540.4u2ARzKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   9a23281066f1353d4e10d297b57c1755d5e67ede
commit: 9a23281066f1353d4e10d297b57c1755d5e67ede [39/39] afs: [DON'T MERGE] Implement trivial content crypto for testing purposes
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241018/202410180540.4u2ARzKa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180540.4u2ARzKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180540.4u2ARzKa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/write.c:313:13: warning: 'netfs_dump_sg' defined but not used [-Wunused-function]
     313 | static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
         |             ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/netfs_dump_sg +313 fs/afs/write.c

   312	
 > 313	static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
   314	{
   315		unsigned int i;
   316	
   317		for (i = 0; i < n_sg; i++) {
   318			void *p = kmap_local_page(sg_page(sg));
   319			unsigned int l = min_t(size_t, sg->length, 16);
   320	
   321			printk("%s[%x] %016lx %04x %04x %*phN\n",
   322			       prefix, i, sg->page_link, sg->offset, sg->length,
   323			       l, p + sg->offset);
   324			kunmap_local(p);
   325			sg++;
   326		}
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
