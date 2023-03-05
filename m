Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9EAD2FB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 05:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677995119; x=1709531119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCxirpsb6tmyoMGaf+zJdoO+FAAkTli6WPQ26TPllJY=;
  b=BwqLu5yuWjBNfBTfO4Vdfnyf46VEbeEjAR6nqWv0LkdwOy8PO8RtQWpr
   ueDlCZeK/YqHaCT2eCz8/Sa/HFmbSqewTJAWLdoyT6WlmXwj6yDks/JZS
   m9RDwQsqhawix1DTS1B6yUSydxGs1C4xnY/J39GZvJtmeoRBiI/kdDYGp
   uCiQgVjTZlDZpw2JTRbSjk7Ya018antdMWP7BZAQP/Vb0tjYP7h416IKa
   MWH0gSo91H3MZ7Rhl0hO2nIqof509xo3ZHH6vuT/xdWM5Vf0Xrf4pOkJC
   6eSirnzmr5KV99lmLq0hkL8uqosPs7aewcnhgfX5HeCzcwzmoVcIMFFMp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="400171193"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="400171193"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 21:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="799660055"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="799660055"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2023 21:45:17 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYhBM-0002ZS-2a;
	Sun, 05 Mar 2023 05:45:16 +0000
Date: Sun, 5 Mar 2023 13:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [linux-stable-rc:queue/5.10 300/330] include/acpi/actypes.h:522:42:
 warning: 'strncpy' specified bound 4 equals destination size
Message-ID: <202303051310.7nA4tSbc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   c8a5f3ce86b16886e76926a1207fb2c7a72f6558
commit: d089a451cb1f32ac565b74c1fbcd77eb82f5cdbf [300/330] ACPI: Don't build ACPICA with '-Os'
config: ia64-randconfig-r035-20230305 (https://download.01.org/0day-ci/archive/20230305/202303051310.7nA4tSbc-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=d089a451cb1f32ac565b74c1fbcd77eb82f5cdbf
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout d089a451cb1f32ac565b74c1fbcd77eb82f5cdbf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/acpica/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303051310.7nA4tSbc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/acpi/acpi.h:24,
                    from drivers/acpi/acpica/tbfind.c:10:
   drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
>> include/acpi/actypes.h:522:42: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
     522 | #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
         |                                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/tbfind.c:59:9: note: in expansion of macro 'ACPI_COPY_NAMESEG'
      59 |         ACPI_COPY_NAMESEG(header.signature, signature);
         |         ^~~~~~~~~~~~~~~~~
--
   In file included from include/acpi/acpi.h:24,
                    from drivers/acpi/acpica/utstring.c:8:
   drivers/acpi/acpica/utstring.c: In function 'acpi_ut_repair_name':
>> include/acpi/actypes.h:522:42: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
     522 | #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
         |                                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/utstring.c:148:9: note: in expansion of macro 'ACPI_COPY_NAMESEG'
     148 |         ACPI_COPY_NAMESEG(&original_name, name);
         |         ^~~~~~~~~~~~~~~~~


vim +/strncpy +522 include/acpi/actypes.h

ff60027174cf94 Bob Moore 2012-10-31  516  
50df4d8b0f6e19 Bob Moore 2008-12-31  517  #ifndef ACPI_MISALIGNMENT_NOT_SUPPORTED
5599fb69355d7a Bob Moore 2019-04-08  518  #define ACPI_COMPARE_NAMESEG(a,b)       (*ACPI_CAST_PTR (u32, (a)) == *ACPI_CAST_PTR (u32, (b)))
a3ce7a8e0dd9ba Bob Moore 2019-04-08  519  #define ACPI_COPY_NAMESEG(dest,src)     (*ACPI_CAST_PTR (u32, (dest)) = *ACPI_CAST_PTR (u32, (src)))
50df4d8b0f6e19 Bob Moore 2008-12-31  520  #else
3278675567dfb9 Bob Moore 2019-04-08  521  #define ACPI_COMPARE_NAMESEG(a,b)       (!strncmp (ACPI_CAST_PTR (char, (a)), ACPI_CAST_PTR (char, (b)), ACPI_NAMESEG_SIZE))
3278675567dfb9 Bob Moore 2019-04-08 @522  #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
50df4d8b0f6e19 Bob Moore 2008-12-31  523  #endif
50df4d8b0f6e19 Bob Moore 2008-12-31  524  

:::::: The code at line 522 was first introduced by commit
:::::: 3278675567dfb901d831d46849c386a4f932905e ACPICA: Rename nameseg length macro/define for clarity

:::::: TO: Bob Moore <robert.moore@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
