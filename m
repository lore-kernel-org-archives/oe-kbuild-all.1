Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3151D15687D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741405224; cv=none; b=Q3vO9F8TQsOjrK5UAzsZlT8g6412yhWuDZ3FpsgiYbnybq1cASKax5kEV9lVb7bSX7Et3EH3n5gqtAOf8Q4cZiQADJTMIErAFxk/NlzOBzGcxZiKZ6Xrlyx0Hu0GGPQuBClfIOf/hJGNfo4U0jb/kOIyyuAsZmxOT2SsBCBy/LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741405224; c=relaxed/simple;
	bh=+x+p9cDdtjV97/c18rH81OKrqtnzU0ZhRgUaUdF/EGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cmpTtwd3l5ZVvPArRG+PX6CZrcF/Y6gsAXkxeGOGd8E8MY4jMrbQRj9vDpD79EEBWi/h80mWlX2jW9ojGT1tjK8bqbp/MeQ8QDWmhi3kuNR8TXLKmIAzwJRGVw5dwxPfBwOEb4TGCoXqLrk0AvAleipCe33AMO+3jFDNnCWpdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfTxrxHZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfTxrxHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741405222; x=1772941222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+x+p9cDdtjV97/c18rH81OKrqtnzU0ZhRgUaUdF/EGs=;
  b=NfTxrxHZ3eiOZOKveYBUuFWMMhtrNnfQudMFgVflwsXuKbwCFkh4Z8HF
   dS2hENC27oCa3/BjQJJRIBGFIq7fK18K16Z/ID0PY8Dkt76559ZGIILx5
   wkKTDEZOm1MDjuMJRJ4c+r0r73Amoje8dBScsZLExPM+aRYQWtva1jaq2
   s7Wl00lxjYb0pDiMPH0jg3OxEldIArqIQLqhWIZO4p6QqqLvNm462Pule
   ItF7rmbEsTj1yiFp3I/+rhsojjn0m67msATJ1KAByHfZ4SeJdm6jHIS+c
   TTAYL9RIRWFlnWK7QQx1zM1KmE04pFOJs9RiM00FBXFdN5ZG1msa6ljFP
   Q==;
X-CSE-ConnectionGUID: LcnLoQUoSpC5RXOQb7QNQA==
X-CSE-MsgGUID: lBnOzwVjQquQsCa1OUKHlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42587474"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42587474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 19:40:22 -0800
X-CSE-ConnectionGUID: hDMypYxzQhqMYXERTfT2Dg==
X-CSE-MsgGUID: WbvPy0YGSXOzfSeaqvR9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120397256"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2025 19:40:21 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tql2r-0001Qw-2O;
	Sat, 08 Mar 2025 03:40:14 +0000
Date: Sat, 8 Mar 2025 11:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6391/9634] include/linux/ucopysize.h:47:25:
 error: call to '__bad_copy_to' declared with attribute error: copy
 destination size is too small
Message-ID: <202503081120.jyUyb28m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 808aac63e2bdf9bae08485e072bf3d317a18acbf [6391/9634] uaccess: Introduce ucopysize.h
config: i386-buildonly-randconfig-001-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081120.jyUyb28m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081120.jyUyb28m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081120.jyUyb28m-lkp@intel.com/

Note: the linux-next/master HEAD 0a2f889128969dab41861b6e40111aa03dc57014 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:10,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from drivers/misc/ntsync.c:11:
   In function 'check_copy_size',
       inlined from 'copy_from_user' at include/linux/uaccess.h:207:7,
       inlined from 'setup_wait' at drivers/misc/ntsync.c:890:6:
>> include/linux/ucopysize.h:47:25: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
      47 |                         __bad_copy_to();
         |                         ^~~~~~~~~~~~~~~


vim +/__bad_copy_to +47 include/linux/ucopysize.h

    36	
    37	static __always_inline __must_check bool
    38	check_copy_size(const void *addr, size_t bytes, bool is_source)
    39	{
    40		int sz = __builtin_object_size(addr, 0);
    41		if (unlikely(sz >= 0 && sz < bytes)) {
    42			if (!__builtin_constant_p(bytes))
    43				copy_overflow(sz, bytes);
    44			else if (is_source)
    45				__bad_copy_from();
    46			else
  > 47				__bad_copy_to();
    48			return false;
    49		}
    50		if (WARN_ON_ONCE(bytes > INT_MAX))
    51			return false;
    52		check_object_size(addr, bytes, is_source);
    53		return true;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
