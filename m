Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D595667
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgmqlwwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697906897; x=1729442897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FwGwl+kckgSY6D5HEDLa1Qw/o0vY5JRVUi238L6PMHU=;
  b=mgmqlwwInFcxdC5O98a+iqYsiZhFkC/lTSZQZXB2ynQkkVWaAxSEsxMg
   3TeVOQ2lOEqR8LpvA/Wnj1cYDzVjEZjRSGuNCrqQrz9f6Kv8IfkL2NCJI
   RDbS2nx7u1kT1Bil8XDwJVdkKfff8G39VZ19NNcGIN/kP23ZSHnxiu+oI
   3EotJueg3JmIMOK91CK/dhDaCOLsjNgtonClqzv25hU+w1BjXgEs7HOXT
   QLc3VH9E3hbxXJeHLVyokAg2PDZtHPgAVGCfYoekVXL4393GsVo75KHmA
   V7NmuS2V1zDFgu0seSyr0bF+jXbPCxxE9lJ8Y7bZ5sRiBQxXSJicPCAVu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="365984998"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="365984998"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 09:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1004886639"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="1004886639"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2023 09:48:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quF93-00052M-0c;
	Sat, 21 Oct 2023 16:48:13 +0000
Date: Sun, 22 Oct 2023 00:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/5] exportfs: make ->encode_fh() a mandatory method for
 NFS export
Message-ID: <202310220009.dfnFPdDB-lkp@intel.com>
References: <20231018100000.2453965-4-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018100000.2453965-4-amir73il@gmail.com>

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on trondmy-nfs/linux-next xiang-erofs/dev-test xiang-erofs/dev tytso-ext4/dev kleikamp-shaggy/jfs-next cifs/for-next v6.6-rc6]
[cannot apply to xiang-erofs/fixes jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev mszeredi-fuse/for-next linus/master next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fanotify-limit-reporting-of-event-with-non-decodeable-file-handles/20231018-180124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20231018100000.2453965-4-amir73il%40gmail.com
patch subject: [PATCH 3/5] exportfs: make ->encode_fh() a mandatory method for NFS export
config: parisc-randconfig-002-20231021 (https://download.01.org/0day-ci/archive/20231022/202310220009.dfnFPdDB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220009.dfnFPdDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220009.dfnFPdDB-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: fs/ext4/super.o: in function `.L4276':
>> (.rodata+0xc9c): undefined reference to `generic_encode_ino32_fh'
   hppa-linux-ld: fs/erofs/super.o: in function `.L333':
   (.rodata+0x224): undefined reference to `generic_encode_ino32_fh'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
