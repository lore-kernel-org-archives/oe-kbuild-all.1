Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8961D2F49
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693770612; x=1725306612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3GVfWhki++8lV9z2kUNz+uOxebjvZs6/ud+6+Ujkp8=;
  b=jdhvUoxXZOojS4dEbcW8xxcpaj8aOatASk04DGkpO85iWA8C4MOvUk3B
   h/NnTqoMNc5Hqcx3POGs302WpdIMOzemCldmvnpeOb0KZyjmYubcVXIdW
   B/NkTDlclwXupE/nexD7nMGxUjaEEeZd19DptLx2e94Okd1ExM9hWqEfH
   tK/8Tuv+qaN4QEP9e8vbQgAxq5LH9xGGYUyTe+hHrw6qZF6B0D94VBbl5
   GDraczAM41O/qVaBRm9pSWk29Zp+hJN4iOg1xAlp0h1dNzQZKjDmrJ7d8
   KO93w5gQJ8Dj9aM2HuaOvD78wtoO1grzPgZAhmtF6j5f0pySzK1iPACn0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="407473032"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="407473032"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 12:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="864122315"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="864122315"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Sep 2023 12:50:10 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qct6l-0003NZ-2e;
	Sun, 03 Sep 2023 19:50:07 +0000
Date: Mon, 4 Sep 2023 03:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/15] include/linux/asn1_decoder.h:18:29: error: unknown
 type name 'size_t'
Message-ID: <202309040347.SX9rRQmW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   1430ef1999191072a90921acf7cb2dc7f2ec2478
commit: 9e92ef1d4d322b277b0f9b87995c681dffdb7f95 [8/15] PCI/CMA: Validate Subject Alternative Name in certificates
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230904/202309040347.SX9rRQmW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309040347.SX9rRQmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309040347.SX9rRQmW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/cma-x509.c:19:
>> include/linux/asn1_decoder.h:18:29: error: unknown type name 'size_t'
      18 |                             size_t datalen);
         |                             ^~~~~~
   include/linux/asn1_decoder.h:12:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
      11 | #include <linux/asn1.h>
     +++ |+#include <stddef.h>
      12 | 
   drivers/pci/cma-x509.c: In function 'pci_cma_validate':
>> drivers/pci/cma-x509.c:106:15: error: implicit declaration of function 'asn1_ber_decoder' [-Werror=implicit-function-declaration]
     106 |         ret = asn1_ber_decoder(&cma_decoder, &ctx, leaf_cert->raw_san,
         |               ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/size_t +18 include/linux/asn1_decoder.h

42d5ec27f873c6 David Howells 2012-09-24  14  
42d5ec27f873c6 David Howells 2012-09-24  15  extern int asn1_ber_decoder(const struct asn1_decoder *decoder,
42d5ec27f873c6 David Howells 2012-09-24  16  			    void *context,
42d5ec27f873c6 David Howells 2012-09-24  17  			    const unsigned char *data,
42d5ec27f873c6 David Howells 2012-09-24 @18  			    size_t datalen);
42d5ec27f873c6 David Howells 2012-09-24  19  

:::::: The code at line 18 was first introduced by commit
:::::: 42d5ec27f873c654a68f7f865dcd7737513e9508 X.509: Add an ASN.1 decoder

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
