Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860EDAA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 19:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678478370; x=1710014370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O5VKM3HAyY2lRGwQPUcAK28xDD8oo4d3l6vY6CvO918=;
  b=m3cfEBZTdCF3kdrxmOZPZIHWNTwBNSn4GWx0Nmc3/MQagcbmAaRSThRJ
   lM/aU8e4H4fNWc+lxP8UDe++8DM786dDkG5/yYVQcErW9eYmXhQ+NNwl5
   ytFHampDdKl9eSe26owkR02yX0EhDUj5lMh+DW+vuRpvUyJZTRONIwF3e
   Hjl/dZ8B0U7/RyUm4KZQH8Jsp6apghDvNtF45FL04JhkHozDNoHumlar+
   /BW5atfwvTH94LPO+IqRQgGEDKe22t603X9L7UYZEMNP9bBYgq8B7O2uj
   TWgylvkp/qeerb4i3dPLKhxK8ZM1CfcVSQV7T6BdwUgvwLqmyMmhn+pc7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="316466271"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="316466271"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 11:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="680303683"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="680303683"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Mar 2023 11:59:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paitj-00044h-1L;
	Fri, 10 Mar 2023 19:59:27 +0000
Date: Sat, 11 Mar 2023 03:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Haberland <sth@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Jens Axboe <axboe@kernel.dk>
Subject: [linux-stable-rc:linux-5.10.y 9998/9999]
 drivers/s390/block/dasd_diag.c:656:23: error: initialization of 'int
 (*)(struct dasd_device *, __u8)' {aka 'int (*)(struct dasd_device *,
 unsigned char)'} from incompatible pointer type 'int (*)(struct dasd_device
 *, __u8,  __u8)' {aka 'int (*)(struct das...
Message-ID: <202303110346.7QRIyDbC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   420427e5b0dd499d0e1ba2ccbd30717bb5b36335
commit: 017c4beada3fd11694ad0a5211ddfa2be196a70e [9998/9999] s390/dasd: add missing discipline function
config: s390-buildonly-randconfig-r006-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110346.7QRIyDbC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=017c4beada3fd11694ad0a5211ddfa2be196a70e
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout 017c4beada3fd11694ad0a5211ddfa2be196a70e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/s390/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110346.7QRIyDbC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/block/dasd_diag.c:656:23: error: initialization of 'int (*)(struct dasd_device *, __u8)' {aka 'int (*)(struct dasd_device *, unsigned char)'} from incompatible pointer type 'int (*)(struct dasd_device *, __u8,  __u8)' {aka 'int (*)(struct dasd_device *, unsigned char,  unsigned char)'} [-Werror=incompatible-pointer-types]
     656 |         .pe_handler = dasd_diag_pe_handler,
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd_diag.c:656:23: note: (near initialization for 'dasd_diag_discipline.pe_handler')
   cc1: some warnings being treated as errors
--
>> drivers/s390/block/dasd_fba.c:818:23: error: initialization of 'int (*)(struct dasd_device *, __u8)' {aka 'int (*)(struct dasd_device *, unsigned char)'} from incompatible pointer type 'int (*)(struct dasd_device *, __u8,  __u8)' {aka 'int (*)(struct dasd_device *, unsigned char,  unsigned char)'} [-Werror=incompatible-pointer-types]
     818 |         .pe_handler = dasd_fba_pe_handler,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd_fba.c:818:23: note: (near initialization for 'dasd_fba_discipline.pe_handler')
   cc1: some warnings being treated as errors


vim +656 drivers/s390/block/dasd_diag.c

   650	
   651	static struct dasd_discipline dasd_diag_discipline = {
   652		.owner = THIS_MODULE,
   653		.name = "DIAG",
   654		.ebcname = "DIAG",
   655		.check_device = dasd_diag_check_device,
 > 656		.pe_handler = dasd_diag_pe_handler,
   657		.fill_geometry = dasd_diag_fill_geometry,
   658		.setup_blk_queue = dasd_diag_setup_blk_queue,
   659		.start_IO = dasd_start_diag,
   660		.term_IO = dasd_diag_term_IO,
   661		.handle_terminated_request = dasd_diag_handle_terminated_request,
   662		.erp_action = dasd_diag_erp_action,
   663		.erp_postaction = dasd_diag_erp_postaction,
   664		.build_cp = dasd_diag_build_cp,
   665		.free_cp = dasd_diag_free_cp,
   666		.dump_sense = dasd_diag_dump_sense,
   667		.fill_info = dasd_diag_fill_info,
   668	};
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
