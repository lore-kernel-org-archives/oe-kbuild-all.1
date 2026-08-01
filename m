Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750122BEC34
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 00:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544297; cv=none; b=e+MQNa2AL81N7eQe6zcm7NwPMM1MtdUsj5pXMcOznznrFnob+b37fPp8k1ugXxJlWJ0q6Tlk4A/wAxHI8Razh3alYwzBs5h/WPV6NtzVPERKG8tVLGrcRLapcykOEPalJBjRX8Ped1cSBCNX2viONB/bPzLyRkkntJGrCVDLtnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544297; c=relaxed/simple;
	bh=OXFun7oM8DrQYs7KaSva4xf5sTOSe9vcZB+2z4RrQJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PUVwGnf7HwCf1MakqaWHCEoLSYtEIwK1LiiZ7SO18v95sLEUS8p2iG+ZtRfDrh7BRj9XZLifl95+bLlEldY020Cj7j9LbeLlHID2oe+eTtcIVFm41ZRZ6IwV0TmjeqnjLWfjlA8baYCcufVFu98tvLFouRWkJmPi299VjDOyQmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCxOeV1B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCxOeV1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785544295; x=1817080295;
  h=date:from:to:cc:subject:message-id;
  bh=OXFun7oM8DrQYs7KaSva4xf5sTOSe9vcZB+2z4RrQJA=;
  b=GCxOeV1BPunFRaJlLW8skcUpT7jmg66b4oDQ57RCiowRur+2KOuLprM+
   jR/cPySmpVY2HNp/j6i64CmOgZyaiBnbOD1lfivIvgB+PS8uBFUkXB0Gu
   J4zVrR/VN7y6wbJNummrmRjRoaDucV90KLlgPSB1q2q2J20Qo2Qkm7ixY
   S8f69da1/VvF7/v05ItWC7xgnd1uGjH6pG3GEMguOKmGD7GMrYRngXknw
   A9jAd06bepARg13G3gT6gW3iwxUEjanfRCPZV5wWt/AWtL/DkonK7Y0hN
   3B2jEz+GzQ53G/XfC7pxZKwMP5Sutog+iJQlNbIv1vKeRlrA6mswm6c9C
   w==;
X-CSE-ConnectionGUID: p6RHky4KS4G8lU6pnrIw9g==
X-CSE-MsgGUID: ef57FNBcTVqvHSyMOgNycg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86291844"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86291844"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 17:31:34 -0700
X-CSE-ConnectionGUID: wO4tlj/sTXWowryNQFiHZA==
X-CSE-MsgGUID: 8ConxhDnSnqjOXCmwmS8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="257343877"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2026 17:31:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpxdS-000000002UD-3KpN;
	Sat, 01 Aug 2026 00:31:30 +0000
Date: Sat, 01 Aug 2026 08:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [linux-next:master 10056/11507]
 security/apparmor/apparmorfs.c:1602:17: error: implicit declaration of
 function 'decompress_zstd'
Message-ID: <202608010834.9yIVzhG2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 1c5f27e845e84f58ed6bbe3e6bc12d6a013e74b5 [10056/11507] apparmor: Fix build failure when ZSTD_DECOMPRESS is not enabled
config: sparc-randconfig-002-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010834.9yIVzhG2-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010834.9yIVzhG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010834.9yIVzhG2-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/apparmor/apparmorfs.c: In function 'rawdata_open':
>> security/apparmor/apparmorfs.c:1602:17: error: implicit declaration of function 'decompress_zstd' [-Werror=implicit-function-declaration]
    1602 |         error = decompress_zstd(loaddata->data, loaddata->compressed_size,
         |                 ^~~~~~~~~~~~~~~
   At top level:
   security/apparmor/apparmorfs.c:1391:37: warning: 'seq_ns_compress_max_fops' defined but not used [-Wunused-const-variable=]
    1391 | static const struct file_operations seq_ns_ ##NAME ##_fops = {        \
         |                                     ^~~~~~~
   security/apparmor/apparmorfs.c:1470:1: note: in expansion of macro 'SEQ_NS_FOPS'
    1470 | SEQ_NS_FOPS(compress_max);
         | ^~~~~~~~~~~
   security/apparmor/apparmorfs.c:1391:37: warning: 'seq_ns_compress_min_fops' defined but not used [-Wunused-const-variable=]
    1391 | static const struct file_operations seq_ns_ ##NAME ##_fops = {        \
         |                                     ^~~~~~~
   security/apparmor/apparmorfs.c:1469:1: note: in expansion of macro 'SEQ_NS_FOPS'
    1469 | SEQ_NS_FOPS(compress_min);
         | ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/decompress_zstd +1602 security/apparmor/apparmorfs.c

5d5182cae40115 John Johansen 2017-05-09  1580  
5d5182cae40115 John Johansen 2017-05-09  1581  static int rawdata_open(struct inode *inode, struct file *file)
5d5182cae40115 John Johansen 2017-05-09  1582  {
63c16c3a760855 Chris Coulson 2019-01-23  1583  	int error;
63c16c3a760855 Chris Coulson 2019-01-23  1584  	struct aa_loaddata *loaddata;
63c16c3a760855 Chris Coulson 2019-01-23  1585  	struct rawdata_f_data *private;
63c16c3a760855 Chris Coulson 2019-01-23  1586  
92de220a7f3363 John Johansen 2020-06-30  1587  	if (!aa_current_policy_view_capable(NULL))
5ac8c355ae0013 John Johansen 2017-01-16  1588  		return -EACCES;
63c16c3a760855 Chris Coulson 2019-01-23  1589  
8e135b8aee5a06 John Johansen 2026-03-01  1590  	loaddata = get_loaddata_common_ref(inode->i_private);
63c16c3a760855 Chris Coulson 2019-01-23  1591  	if (!loaddata)
5d5182cae40115 John Johansen 2017-05-09  1592  		return -ENOENT;
5ac8c355ae0013 John Johansen 2017-01-16  1593  
63c16c3a760855 Chris Coulson 2019-01-23  1594  	private = rawdata_f_data_alloc(loaddata->size);
63c16c3a760855 Chris Coulson 2019-01-23  1595  	if (IS_ERR(private)) {
63c16c3a760855 Chris Coulson 2019-01-23  1596  		error = PTR_ERR(private);
63c16c3a760855 Chris Coulson 2019-01-23  1597  		goto fail_private_alloc;
63c16c3a760855 Chris Coulson 2019-01-23  1598  	}
63c16c3a760855 Chris Coulson 2019-01-23  1599  
63c16c3a760855 Chris Coulson 2019-01-23  1600  	private->loaddata = loaddata;
63c16c3a760855 Chris Coulson 2019-01-23  1601  
f4d6b94b40c966 Jon Tourville 2022-07-11 @1602  	error = decompress_zstd(loaddata->data, loaddata->compressed_size,
ad213bbbc0e3e2 John Johansen 2026-03-01  1603  				private->data, loaddata->size);
63c16c3a760855 Chris Coulson 2019-01-23  1604  	if (error)
63c16c3a760855 Chris Coulson 2019-01-23  1605  		goto fail_decompress;
63c16c3a760855 Chris Coulson 2019-01-23  1606  
63c16c3a760855 Chris Coulson 2019-01-23  1607  	file->private_data = private;
5ac8c355ae0013 John Johansen 2017-01-16  1608  	return 0;
63c16c3a760855 Chris Coulson 2019-01-23  1609  
63c16c3a760855 Chris Coulson 2019-01-23  1610  fail_decompress:
63c16c3a760855 Chris Coulson 2019-01-23  1611  	rawdata_f_data_free(private);
63c16c3a760855 Chris Coulson 2019-01-23  1612  	return error;
63c16c3a760855 Chris Coulson 2019-01-23  1613  
63c16c3a760855 Chris Coulson 2019-01-23  1614  fail_private_alloc:
a0b7091c4de45a John Johansen 2026-02-24  1615  	aa_put_i_loaddata(loaddata);
63c16c3a760855 Chris Coulson 2019-01-23  1616  	return error;
5ac8c355ae0013 John Johansen 2017-01-16  1617  }
5ac8c355ae0013 John Johansen 2017-01-16  1618  

:::::: The code at line 1602 was first introduced by commit
:::::: f4d6b94b40c966ddd9eeb0d451e8a02c595ec7e3 apparmor: use zstd compression for profile data

:::::: TO: Jon Tourville <jon.tourville@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
