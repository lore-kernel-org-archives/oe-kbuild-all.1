Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3692C1B9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712420624; cv=none; b=Ffi/g53CTfiHBMybalKwTUUtA5WqhFOS/MBW6dMfanpO/mrSqCO1AMRO3Ql3tYAHqhrjEE+g4LT3jqv17y3p/qpkOhEVUUZ+lzvExJFAOaHMWMvK3VbK5Jv51Gc/nF+K3mDH+Y/AmzkeS5diy92CAOPaRU9dziTQ+pxMsvUSlzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712420624; c=relaxed/simple;
	bh=vJBzgGrLuyEq62L8XGsL34tCVH2SCLa3GzE2YwtJGfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FDAnAnCGiG1JqDMSVySt4pTLtruGfeeX20RbDef9N8hgXTJjiv5+CcnOjrToTk/siOXZkPVC5VvdU5pAlhJYTSAdiBUOd/lvyg+jhlqUVL4sytAWW8QSXDkJwdk7cSy511X0kNiRAeVprpASFJOjy0XA95FD3y8N6QC+GMU8tc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4F6HZYD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4F6HZYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712420622; x=1743956622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJBzgGrLuyEq62L8XGsL34tCVH2SCLa3GzE2YwtJGfw=;
  b=A4F6HZYDbdOZfQsOgrVIxRHFArSSkKgN+inAEOIwEc0aLZwiEmpSbNGO
   oQ5Q5eGfY+OzoThXt5Y47jKyDX88H7hsaKW4wJ8G4wcgEZPAXREd0hl6g
   oPDNprmqpx7/JFcsyIclJkfnDRg6FnHT3ctsY1cNxNpx8LehEHGVozATu
   SYCtWBGeud2dTaNUNqfVfmCr2LA/a9dGwuc3eLsDlETY9Aa00xDYtKr+/
   7RUe9cPzm9tn8iBfvDNekfdwnu/InaFxfchKABW371LwUpojVoLV8rKN9
   vIL8qs5G1LX4IyR6BrWXPqcM/dWDpZqwucgbLn8ph96YPiPlgwxlxE5We
   A==;
X-CSE-ConnectionGUID: gqcP9v8aR663xzcXs37xjg==
X-CSE-MsgGUID: SDWN+nE4RSanWiEUsg0cvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="11533399"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="11533399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 09:23:41 -0700
X-CSE-ConnectionGUID: b04CX+GyTri11ch1n8G85Q==
X-CSE-MsgGUID: 1VwT0ulUQo66JtkCJbnf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="19575312"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2024 09:23:40 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt8pO-0003e8-0k;
	Sat, 06 Apr 2024 16:23:38 +0000
Date: Sun, 7 Apr 2024 00:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 105/105] arch/mips/mm/sc-debugfs.c:48:3: error:
 field designator 'read' does not refer to any field in type 'const struct
 file_operations'
Message-ID: <202404070005.7LT6TnQb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f5a71066e2fa8ca66dd137e17bac2e2090b3802d
commit: 941c541566a6784beff5ef54ed880c606e3a6225 [105/105] REMOVE ->read() and ->write()
config: mips-randconfig-r133-20240406 (https://download.01.org/0day-ci/archive/20240407/202404070005.7LT6TnQb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 233c030dcb18880d5f0a749573f11f96f35e76b8)
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404070005.7LT6TnQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070005.7LT6TnQb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/mm/sc-debugfs.c:48:3: error: field designator 'read' does not refer to any field in type 'const struct file_operations'
      48 |         .read = sc_prefetch_read,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/mm/sc-debugfs.c:49:3: error: field designator 'write' does not refer to any field in type 'const struct file_operations'
      49 |         .write = sc_prefetch_write,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +48 arch/mips/mm/sc-debugfs.c

d478b088a2f74f Paul Burton 2015-09-22  44  
d478b088a2f74f Paul Burton 2015-09-22  45  static const struct file_operations sc_prefetch_fops = {
d478b088a2f74f Paul Burton 2015-09-22  46  	.open = simple_open,
d478b088a2f74f Paul Burton 2015-09-22  47  	.llseek = default_llseek,
d478b088a2f74f Paul Burton 2015-09-22 @48  	.read = sc_prefetch_read,
d478b088a2f74f Paul Burton 2015-09-22 @49  	.write = sc_prefetch_write,
d478b088a2f74f Paul Burton 2015-09-22  50  };
d478b088a2f74f Paul Burton 2015-09-22  51  

:::::: The code at line 48 was first introduced by commit
:::::: d478b088a2f74fc8f34af7ceed86fa7640ca8610 MIPS: Allow L2 prefetch to be configured via debugfs

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
