Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A77A71B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 22:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709504664; cv=none; b=CfXX00X8YFPkCFuCWZA9U/8SJ7E5NZ55UNE/malphpgUxj5L6VTPhFJ6Jw/HTWC53f9HbiiJwCKuNKubVSZ5ITIXcqbmn6Lb291QMNrRGLGJ8S55au4wVqALE3zYS9GUWE+O0FwlLhPdorKEmxzmE5zNmEn++JIpausJjYyOXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709504664; c=relaxed/simple;
	bh=2I/cmWt03WU1Cy7zgaN9mlf+Cvh5D0OKUAXgGVRowmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLPpYi5wKWLqZPLwiGxcjA3d/MTG7ekVhQYBL2a12gyQ5Wu5Bh+EpSeHxHuJvrPUbM1oT048QcaAWk/SshszweFbHxo9UWcPHxpBJjQRe+MXFn4hIH6j0vHBN67G2Z/xgX+4Vky4dlB9y38eGAbSicrJIgWJ9/SQW6LZTC4+VOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8oAmtAD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8oAmtAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709504662; x=1741040662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2I/cmWt03WU1Cy7zgaN9mlf+Cvh5D0OKUAXgGVRowmM=;
  b=b8oAmtADSCgg6a2F9nISGpoH6aF7gvR95DRjKoIbnROG2oHeKfGsjh82
   pgwNOShrdsVg1d5Jzm0ujp328QmI30rt3CaPwg65JDPnVu05/62NolO24
   9ISwxzWLkpLM9gok6qGwNOKCioHDTx3ocUZ58V16F6+pP2Cqnkfwqex8q
   DNTETGjzzh1A8lhPWPG1Sd5wPMPcIr7kWG1hPQZSjo2mopa1zy9pNDsnk
   b/n/RhU7+z6o7l7cN6uvfY89gFxUHte//zi+IHQq20Ff1v0/oqe6U9k9k
   /L+AmgpzIUaomqKFtHbu0nFUtDuqC3r2aSEAQlM7zD3TEpodVHdsWur/G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="29407118"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="29407118"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 14:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9362647"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2024 14:24:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rguFj-00029K-2n;
	Sun, 03 Mar 2024 22:24:15 +0000
Date: Mon, 4 Mar 2024 06:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:notmuch-cover.1708709155.git.john@groves.net 9/23]
 drivers/dax/bus.c:1442:16: error: implicit declaration of function
 '_copy_from_iter_flushcache'
Message-ID: <202403040643.xYfu3h07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux notmuch-cover.1708709155.git.john@groves.net
head:   c8318dd2a63c230e5e731bc14750a466d7891ddc
commit: b1dbe325e1e88d07cf2f245da33393842ff842bc [9/23] dev_dax_iomap: Add CONFIG_DEV_DAX_IOMAP kernel build parameter
config: i386-randconfig-r052-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040643.xYfu3h07-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040643.xYfu3h07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040643.xYfu3h07-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dax/bus.c: In function '__dev_dax_direct_access':
   drivers/dax/bus.c:1396:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1396 |                 *kaddr = (void *)virt_addr;
         |                          ^
   drivers/dax/bus.c: In function 'dev_dax_recovery_write':
>> drivers/dax/bus.c:1442:16: error: implicit declaration of function '_copy_from_iter_flushcache' [-Werror=implicit-function-declaration]
    1442 |         return _copy_from_iter_flushcache(addr, bytes, i);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:1437:16: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1437 |         size_t len, off;
         |                ^~~
   cc1: some warnings being treated as errors


vim +/_copy_from_iter_flushcache +1442 drivers/dax/bus.c

2e58e20034e6b0 John Groves 2024-02-23  1433  
2e58e20034e6b0 John Groves 2024-02-23  1434  static size_t dev_dax_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
2e58e20034e6b0 John Groves 2024-02-23  1435  		void *addr, size_t bytes, struct iov_iter *i)
2e58e20034e6b0 John Groves 2024-02-23  1436  {
2e58e20034e6b0 John Groves 2024-02-23  1437  	size_t len, off;
2e58e20034e6b0 John Groves 2024-02-23  1438  
2e58e20034e6b0 John Groves 2024-02-23  1439  	off = offset_in_page(addr);
2e58e20034e6b0 John Groves 2024-02-23  1440  	len = PFN_PHYS(PFN_UP(off + bytes));
2e58e20034e6b0 John Groves 2024-02-23  1441  
2e58e20034e6b0 John Groves 2024-02-23 @1442  	return _copy_from_iter_flushcache(addr, bytes, i);
2e58e20034e6b0 John Groves 2024-02-23  1443  }
2e58e20034e6b0 John Groves 2024-02-23  1444  

:::::: The code at line 1442 was first introduced by commit
:::::: 2e58e20034e6b0d8e6f04e6002c6f684dd1a35bd dev_dax_iomap: Add dax_operations for use by fs-dax on devdax

:::::: TO: John Groves <John@Groves.net>
:::::: CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
