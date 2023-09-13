Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA36037F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694630519; x=1726166519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/S5GZtLI3FbNV80cUuww8xTLd+UuHH/rb3UHmWDOvK4=;
  b=ZvucaqfRlmmV9d+VkQI2IF45K1qQrLdIzdhZjf30bx1HPmpFFE+j8aHP
   CKquGNyKq318iq2XPoyPYTD8AMEAyu0jEQTLcgWPlHEW4fG1zKpeHXtwE
   Ag8fpWdCg7203Z6f4NzJWWVE4eO418Hnv4e7wTJdpWQbDpXdQxBBOq1H2
   OxJVUC304xKI3a7WRdnJ55n+lr+yfFR5FK3OeZjfEm9kKt9JMq3uLQ2Mp
   /XJGxJIfnAk2dVzAPSSvuCevocJuS7RS385iBV3aXsQuhFTSxLmlF2eGN
   PgprLgU1k2bby+G/x5RRpFR0nLPly3ZnQ7OSSz73iBqlWOY4t9kUcLCM9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378673881"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="378673881"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 11:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="693954145"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="693954145"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 11:41:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgUoF-0000T5-0S;
	Wed, 13 Sep 2023 18:41:55 +0000
Date: Thu, 14 Sep 2023 02:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-cleanup 7/13] lib/iov_iter.c:17:10: fatal error:
 asm/mce.h: No such file or directory
Message-ID: <202309140214.E2rSMS7b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-cleanup
head:   bbca19708859dff75c7d28b9cb73f114497d6f60
commit: b6cd84d1413db6e972edf847ec0a5b2951d6886b [7/13] iov_iter: Make copy_from_iter() always handle MCE
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230914/202309140214.E2rSMS7b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140214.E2rSMS7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140214.E2rSMS7b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/iov_iter.c:17:10: fatal error: asm/mce.h: No such file or directory
      17 | #include <asm/mce.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +17 lib/iov_iter.c

  > 17	#include <asm/mce.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
