Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A726299
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903404; cv=none; b=Gg3XyI4VYZLj3tFxTQMQgkDtwml19IRZpqUSDgiPVhmIEa2k7b+gLjO6AQ1IvxLp6LDEIBc12oV7ViE87VKMdPgZfAItg6SeIDJag/7Hn0qknWknTJOodtt4cro1s4NDBD00buOKizvbeyev1VfSdr7cC1CEu+9Hi58x3uQlH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903404; c=relaxed/simple;
	bh=uMML6ec3WmHv9okqwuPpxIqMoqT8H8EfqXxHEheKGeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7qNwqXQLJ4r4+xtDtr5YEpeOLZ50UEPM0m8AVHTlOcUs7+G1C/uJO7SG18oOTyPbm+Y+BGblIzIlUD06Or907GMCE1z+zUrxzf3pX7f8JoMXlxdG0kmFaMypgpU4Gc90Df4CfnRxDdtSfM8WY5ACt71GmC4ujySLxv4NcMhAEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1vcBkEO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1vcBkEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765903402; x=1797439402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uMML6ec3WmHv9okqwuPpxIqMoqT8H8EfqXxHEheKGeg=;
  b=V1vcBkEOvpVasAcDg76O8Eq94fOlkzpBEZXtUqQEYuRkRz2BWaL3T/dC
   TMMZT/kag2iVmko+z5q7GQD9mYvDRm0TlV8MGR3mcOGyb4Np2sty+At1A
   UbYDjMOMt8Up5vUcpP1cirKzA82RrIBJFkWxo5iZXHZTt1KdBAflolsW/
   NCJEgpLMxEveHZtG/iX28GzQeRH9p7tXYccga409Kcz6tBr/sAyDB1Fck
   vJOi9mWvxqLWWv0QFPhsVvJzgm0fuSiXxO8PHdapmZEoACeEHdMpHtalX
   6574pdbviITpIhYpC/h/BbKQ3a3X80UlzL9ccB/3Q+6a9KFLcFLOLs+kS
   Q==;
X-CSE-ConnectionGUID: 9s/PoYDLQY6i2FRN+q5HiQ==
X-CSE-MsgGUID: DmEZLTnTQwyI+ESqsjok/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67765158"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67765158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:43:12 -0800
X-CSE-ConnectionGUID: 5kRMAeRKQaG96KBA1wBQSg==
X-CSE-MsgGUID: sSF5HCuBRRiMwVoRwViy/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202553520"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 08:43:12 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVY8h-000000003Zo-1Img;
	Tue, 16 Dec 2025 16:43:09 +0000
Date: Wed, 17 Dec 2025 00:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/dovec_consolidate 11/13] kernel/sysctl.c:1290:5:
 error: conflicting types for 'proc_doulongvec_minmax_conv'; have 'int(const
 struct ctl_table *, int,  void *, size_t *, loff_t *, long unsigned int,
  long unsigned int)' {aka 'int(const struct ctl_table *, int,  void *, long
 unsign...
Message-ID: <202512170004.BLzkC55m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/dovec_consolidate
head:   9134ddd35af0dce7b5ee8b8cfc248acac95eb422
commit: 3fc1abf74ebe19e822604a73790cd9612f309882 [11/13] sysctl: Replace do_proc_doulongvec with a type-generic macro
config: loongarch-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251217/202512170004.BLzkC55m-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170004.BLzkC55m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170004.BLzkC55m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:1290:5: error: conflicting types for 'proc_doulongvec_minmax_conv'; have 'int(const struct ctl_table *, int,  void *, size_t *, loff_t *, long unsigned int,  long unsigned int)' {aka 'int(const struct ctl_table *, int,  void *, long unsigned int *, long long int *, long unsigned int,  long unsigned int)'}
    1290 | int proc_doulongvec_minmax_conv(const struct ctl_table *table, int dir,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sysctl.c:6:
   include/linux/sysctl.h:104:5: note: previous declaration of 'proc_doulongvec_minmax_conv' with type 'int(const struct ctl_table *, int,  void *, size_t *, loff_t *, int (*)(bool *, ulong *, ulong *, int,  const struct ctl_table *))' {aka 'int(const struct ctl_table *, int,  void *, long unsigned int *, long long int *, int (*)(_Bool *, long unsigned int *, long unsigned int *, int,  const struct ctl_table *))'}
     104 | int proc_doulongvec_minmax_conv(const struct ctl_table *table, int dir,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/time/jiffies.c: In function 'sysctl_u2k_ulong_conv_ms':
>> kernel/time/jiffies.c:298:54: error: 'sysctl_msecs_to_jiffies' undeclared (first use in this function); did you mean '_msecs_to_jiffies'?
     298 |         return proc_ulong_u2k_conv_uop(u_ptr, k_ptr, sysctl_msecs_to_jiffies);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                      _msecs_to_jiffies
   kernel/time/jiffies.c:298:54: note: each undeclared identifier is reported only once for each function it appears in
   kernel/time/jiffies.c: In function 'sysctl_k2u_ulong_conv_ms':
>> kernel/time/jiffies.c:303:54: error: 'sysctl_jiffies_to_msecs' undeclared (first use in this function); did you mean 'jiffies_to_msecs'?
     303 |         return proc_ulong_k2u_conv_kop(u_ptr, k_ptr, sysctl_jiffies_to_msecs);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                      jiffies_to_msecs


vim +1290 kernel/sysctl.c

f461d2dcd511c0 Christoph Hellwig 2020-04-24  1289  
4639faaa607f3b Joel Granados     2025-10-14 @1290  int proc_doulongvec_minmax_conv(const struct ctl_table *table, int dir,
4639faaa607f3b Joel Granados     2025-10-14  1291  				void *buffer, size_t *lenp, loff_t *ppos,
4639faaa607f3b Joel Granados     2025-10-14  1292  				unsigned long convmul, unsigned long convdiv)
af91322ef3f29a Dave Young        2009-09-22  1293  {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  1294  	return -ENOSYS;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  1295  }
f461d2dcd511c0 Christoph Hellwig 2020-04-24  1296  

:::::: The code at line 1290 was first introduced by commit
:::::: 4639faaa607f3bed85f2cdde686a88453c99ef06 sysctl: Move proc_doulongvec_ms_jiffies_minmax to kernel/time/jiffies.c

:::::: TO: Joel Granados <joel.granados@kernel.org>
:::::: CC: Joel Granados <joel.granados@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
