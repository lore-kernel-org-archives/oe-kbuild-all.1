Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCA1A2C03
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159960; cv=none; b=cNhF050MXE6V749+PYCUZmQv4RDTRcJGP+9BOcaHrRWWiRl4MCeh+xl1rT6k/BN5UAI9We3kG2wTUqRo2WHjXo8l+LUbKru8GE/XcYKJi7HwdImmLOKYNak/NzH0CGS6/6cyQySMrS3sKDi4S3nZIdXPfE9TqsAtJHPk6v3HpFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159960; c=relaxed/simple;
	bh=NJNFc1o/SoFILbgArbLfuJ/GQ2iP/uqNjZsAfeuPTEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3/DkuYS+AoHPV77WfoRNBedK6fX7ZyCFsLa3xSvHA58Wms0iyL4H+UGhD1JWcaead453FHAz3gcxkf1tSXAyxLcGF2Dv0v5y2UbRqo1rgc3sCgTdN4XiH6Fi6/Moyur5i7aGQ1i8LXUzrcXTc3PL/goIwsvI8H2kFbQEN+hzxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGgl8GO5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGgl8GO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715159959; x=1746695959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJNFc1o/SoFILbgArbLfuJ/GQ2iP/uqNjZsAfeuPTEY=;
  b=SGgl8GO5kE7AHoIj3LEEPL5FyF1aNnMXN0Mp+waHm0C6rddfRNXsOCmL
   s/61Gr5NoEw8dgvzEnZ/d3ZOjHSrI5CdhVx7icIYgiQ6TkJ9UbboORQG/
   2xBjyFPaPdKcjz5iXuh0PXYaRONMBlnNs0/WgjOMcY6Qweql1vdM1Sw+R
   b2nFn0MQEdW/cVa5OgWx3XMMW4fy1fZjpPG+II7vF3x7s5EPnwZjr/+CT
   wg4fbreDLLf0DMLvlbm+xNMyhtZo6unMwkYJNc/iLw8l9trPHC2BoZMg5
   qUXCUeHOIfcBQHPLsCo4Bp6shEifeyKnv+beUig47GeGxFLt4cVSGeBL3
   A==;
X-CSE-ConnectionGUID: Xtac/se2TKOk8XdP3jYxKg==
X-CSE-MsgGUID: kqEk3ulsQMmoPea4n6WN4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11162833"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="11162833"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 02:19:19 -0700
X-CSE-ConnectionGUID: Zk1YPlBATfaqGAnKT+Dx+w==
X-CSE-MsgGUID: AHobKnJsTSCsxqlTB2nq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="29228358"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2024 02:19:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4dSE-0003Ck-0U;
	Wed, 08 May 2024 09:19:14 +0000
Date: Wed, 8 May 2024 17:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <apais@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kees Cook <keescook@chromium.org>,
	Vijay Nag <nagvijay@microsoft.com>
Subject: [linux-next:master 11772/12060] fs/coredump.c:67:27: warning:
 'core_file_note_size_min' defined but not used
Message-ID: <202405081723.DMgbeqcp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 13513eafc3ea08cdb70aebe56a7e43083302a809 [11772/12060] fs/coredump: Enable dynamic configuration of max file note size
config: mips-randconfig-r014-20220214 (https://download.01.org/0day-ci/archive/20240508/202405081723.DMgbeqcp-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081723.DMgbeqcp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081723.DMgbeqcp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/coredump.c:68:27: warning: 'core_file_note_size_max' defined but not used [-Wunused-const-variable=]
      68 | static const unsigned int core_file_note_size_max = CORE_FILE_NOTE_SIZE_MAX;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/coredump.c:67:27: warning: 'core_file_note_size_min' defined but not used [-Wunused-const-variable=]
      67 | static const unsigned int core_file_note_size_min = CORE_FILE_NOTE_SIZE_DEFAULT;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~


vim +/core_file_note_size_min +67 fs/coredump.c

    62	
    63	static int core_uses_pid;
    64	static unsigned int core_pipe_limit;
    65	static char core_pattern[CORENAME_MAX_SIZE] = "core";
    66	static int core_name_size = CORENAME_MAX_SIZE;
  > 67	static const unsigned int core_file_note_size_min = CORE_FILE_NOTE_SIZE_DEFAULT;
    68	static const unsigned int core_file_note_size_max = CORE_FILE_NOTE_SIZE_MAX;
    69	unsigned int core_file_note_size_limit = CORE_FILE_NOTE_SIZE_DEFAULT;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
