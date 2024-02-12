Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175343D542
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745455; cv=none; b=SaA+g2HS7gxIuY12zCUa0AIqlzINz1BLTo43afCd4uYmcj4HzMKHj40o5A2lch1yR4dL6K+yiKn2HQk6xGMYUiFysrIyh3z5eXNcpJzcXmOb9PaAfV77q7ftMq7kHswJ5W48itwsJuXsN+PJ+r7amI10IxQy5vCBow3Yxkg07sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745455; c=relaxed/simple;
	bh=44Hyalzv9oNfcQI4ezsj5GksGzqagasguIxf1shJfsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=peKvVjhu38SDpj5jBLoLFbIsGSr5L5VY2oNN6Ff5/5GqDkZhuC5ksC3kaIC9mIJovCt1A5WTMet+Ih7QxWbsqVH6AySb6IEx47e2IJDw+42qkmKDhMwqMufvCL/s6y04Um8SNpe/SEJznsI4S5ePJorqhrSQjFEBGOWvvVMv104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9DdlQKH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9DdlQKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707745453; x=1739281453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=44Hyalzv9oNfcQI4ezsj5GksGzqagasguIxf1shJfsA=;
  b=I9DdlQKHwWUJFlvyUgmc4SGuYfaNy4MhUAuhS6IDgP9O21MEaOgzZGmm
   VoRRFgg+DiTqdgOKmlbr/4kUJU2naAwN23YdaHbbds+uhvpwluErT/rfQ
   lileABzUaD6GwixPrITjUMcdGEY+My4Bl8fa28GnaedY5vUVmbizfbVU6
   BEu5nsXdvdT89YaEz32uuVCxD/KCLORiuDGagJd4fNAgAAhwZoylZPNR4
   Epw9LmpAzrDLoU9QaAtYN3aRPtqMAr48qW4urU+6lBCbyDoKl7WMcquwp
   F1Bfd5V0KgPnERjyPKo4o2ZrnSKK5bTofWy7+Rw54BTpBk11ojUCpyv5z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="4690267"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="4690267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 05:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2564531"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2024 05:44:10 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZWbQ-00079S-0D;
	Mon, 12 Feb 2024 13:44:08 +0000
Date: Mon, 12 Feb 2024 21:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 2/3] include/linux/fsnotify.h:386:2: error:
 call to undeclared function 'fsnotify_file'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202402122117.GXjTcFgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   36091a66bd764d918cf5fcc5797bc82b878a2bfe
commit: 73565ecb39b003c9e458e58abeca8bab87ea8ecf [2/3] fsnotify: optimize the case of no content event watchers
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240212/202402122117.GXjTcFgy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402122117.GXjTcFgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402122117.GXjTcFgy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:12:
>> include/linux/fsnotify.h:386:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     386 |         fsnotify_file(file, FS_ACCESS);
         |         ^
   include/linux/fsnotify.h:394:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     394 |         fsnotify_file(file, FS_MODIFY);
         |         ^
   include/linux/fsnotify.h:407:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |         fsnotify_file(file, mask);
         |         ^
   include/linux/fsnotify.h:418:2: error: call to undeclared function 'fsnotify_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     418 |         fsnotify_file(file, mask);
         |         ^
   4 errors generated.


vim +/fsnotify_file +386 include/linux/fsnotify.h

116b9731ad7614 Amir Goldstein 2019-05-26  380  
0eeca28300df11 Robert Love    2005-07-12  381  /*
0eeca28300df11 Robert Love    2005-07-12  382   * fsnotify_access - file was read
0eeca28300df11 Robert Love    2005-07-12  383   */
2a12a9d7814631 Eric Paris     2009-12-17  384  static inline void fsnotify_access(struct file *file)
0eeca28300df11 Robert Love    2005-07-12  385  {
eae36a2b8324c9 Amir Goldstein 2020-03-19 @386  	fsnotify_file(file, FS_ACCESS);
ecf081d1a73b07 Eric Paris     2009-12-17  387  }
0eeca28300df11 Robert Love    2005-07-12  388  

:::::: The code at line 386 was first introduced by commit
:::::: eae36a2b8324c9dd0a66b2ae32abd4a456e49c39 fsnotify: factor helpers fsnotify_dentry() and fsnotify_file()

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
