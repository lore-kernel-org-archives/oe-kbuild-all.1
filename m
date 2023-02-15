Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52915AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 01:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676423249; x=1707959249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KM+BLHy9105soheBD8j/80OgjuS6rcRSjIvL0G1npIM=;
  b=BrMsvpfisvEzvegAaA1eag9tQW1wqteyrXseTxjBEQCC129892Cwu4vY
   fge0lzFPs0WnGyaf7kpMqkhjwUsMDIT046JK365B5DvyfOvvL/k6ysT/v
   g+O2QhpjVSErnWpe9pEdZVDtjxJZcmGiqou6ZIz8j41knfs6ENllA9+FL
   D5ba4rbKIccGN4GzkbDgSiSvXjQAX2e94EIPKEmi6XGy39SqKOsJERDOf
   iVmS1KLTrQQP8xlX2ZHkubkzSr+rTlEHLNE9y3SgjMbsSic5Id6xmaW+T
   GK/d5kdDobEXXMiFfNmayKwh0RHe9mOyDFTQyupczuu6klj4sxdocofuc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="358731861"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="358731861"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 17:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699756715"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="699756715"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 17:07:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS6Gc-0008tw-1h;
	Wed, 15 Feb 2023 01:07:26 +0000
Date: Wed, 15 Feb 2023 09:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-cifs 6/16] ERROR: modpost:
 "filemap_splice_read" [fs/cifs/cifs.ko] undefined!
Message-ID: <202302150900.QBzFAQZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-cifs
head:   88f921fbd55dd896385d04ccbf1f820c2b8cf921
commit: 93a7b7f1f49b3e6109b68ef88970af926ee20c49 [6/16] cifs: Implement splice_read to pass down ITER_BVEC not ITER_PIPE
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230215/202302150900.QBzFAQZ9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/93a7b7f1f49b3e6109b68ef88970af926ee20c49
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-cifs
        git checkout 93a7b7f1f49b3e6109b68ef88970af926ee20c49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150900.QBzFAQZ9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "filemap_splice_read" [fs/cifs/cifs.ko] undefined!
>> ERROR: modpost: "direct_splice_read" [fs/cifs/cifs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
