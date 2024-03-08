Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD4A23769
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709939888; cv=none; b=a7My6kyqeomsr/LcbVTPI9DEDIXXkMUJd/A7oFgQAoUEQO0A4Sd5zMozryowXdqxOgct+ZAbt15i+AxZ8Nj6pXeFnhG39CmOH3AipOcHyIMXeopH+nit3U5QqbiytDKSx7rqmUtWgxk+jftKzqnt2J3T4wTOWmDP7Y2Efw72GIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709939888; c=relaxed/simple;
	bh=WaaQCE4B33To2RFdzwmjOYnDRutydpBC+IBadqDWSdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubGFJF+aAkpYgHHanz7yaYn84/lANf0gWIJ6qA9SLvhcDE3vCWThvoIAoqTQ4BOvRRLTfIFiFMTYm1YcCYZTjySLekctYw71aSism2hJDqkWgtlj/CXdPIj9RqA1Mltmpj1pC6v4kgjKJ5ogHB7bejmdQ2K9ZAGcnTN3e1ykGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJgNGEWU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJgNGEWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709939887; x=1741475887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaaQCE4B33To2RFdzwmjOYnDRutydpBC+IBadqDWSdg=;
  b=XJgNGEWUuM4OqQew+aG5fxecPso4BkpoFJpY4ZWx67jMDSxtlGXEX+9N
   Dh1qVeOjDFKHs62QivOGbEIoX8R8nFElGHV/eZ06fBtI1jZgz/M6szSBo
   E7Jatzk/9Y0QcCUZKMYewjX0zwAoBDo3wJsSbuxlXZi4b68Q3qYG5l9yz
   nehYQ7g3lRtBzMkiGChv3Rn6d3kzQ2OefRAFJbxZBLZWf4uzoOqGEVJoR
   b9ZgsJ/C0T73WTIb7kkI+ysqyvYucpVDlpT74y7DTxJ9QZNFv2a+IQh7j
   u9PqLS1CLIkNVYRZOqNeUljxYEWYJzIhlqHANM5MaqBSO7aHb46IVfRJ8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="15404938"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15404938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 15:18:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="11002821"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2024 15:18:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rijTW-0006mt-0V;
	Fri, 08 Mar 2024 23:18:02 +0000
Date: Sat, 9 Mar 2024 07:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 12610/12944] arch/mips/ralink/timer.c:136:34:
 error: array type has incomplete element type 'struct of_device_id'
Message-ID: <202403090727.nLhljNp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 5804be0618486f8979208e323188e44f8013a6a3 [12610/12944] MIPS: ralink: Remove unused of_gpio.h
config: mips-randconfig-r021-20220112 (https://download.01.org/0day-ci/archive/20240309/202403090727.nLhljNp6-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090727.nLhljNp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090727.nLhljNp6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/mips/ralink/timer.c:136:34: error: array type has incomplete element type 'struct of_device_id'
     136 | static const struct of_device_id rt_timer_match[] = {
         |                                  ^~~~~~~~~~~~~~
>> arch/mips/ralink/timer.c:136:34: warning: 'rt_timer_match' defined but not used [-Wunused-variable]


vim +136 arch/mips/ralink/timer.c

80ecbd245791fe John Crispin 2013-08-08  135  
80ecbd245791fe John Crispin 2013-08-08 @136  static const struct of_device_id rt_timer_match[] = {
80ecbd245791fe John Crispin 2013-08-08  137  	{ .compatible = "ralink,rt2880-timer" },
80ecbd245791fe John Crispin 2013-08-08  138  	{},
80ecbd245791fe John Crispin 2013-08-08  139  };
80ecbd245791fe John Crispin 2013-08-08  140  

:::::: The code at line 136 was first introduced by commit
:::::: 80ecbd245791fec5da4baa88c7273ec7f9ae7782 MIPS: ralink: Add support for periodic timer irq

:::::: TO: John Crispin <blogic@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
