Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E82F33
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680866926; x=1712402926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=16LowvwisNsU9hX2F8UH0Z1BqRrjHc+lDLubdapsfHw=;
  b=Y00QyCY4nGd5TRHue3wiynbMTJf0qHtvNlwZ3HkuYEGKCkIZfMaGDw9E
   mPFyle4x7xkuRCcsnogPeK+NaLTv893FdMSF7jCw29+rPv9cyevOBip2M
   9vX+e+xD2bCkbNSET7/HIS6AhAshnkqGueVME5vCUvQsMb48BGyLNQ7Zh
   hcPD7UsPIQEDGZWnes4VwsH3LcBGlpYdpEW4yu6d95/ROjp3UFj8ngRcq
   lS3vy5jjAc6Y7zGsh8MrH1CQkd4v+H32q8EW5NW1xPRyHff8E4KIzOfyX
   6iIH+qpqj0ZefkRAQGNzHTTd7KiKBHl06lBuZVd53Yo7/eI4bz+SUIsay
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322612289"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="322612289"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 04:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637676751"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="637676751"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 04:28:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkkGo-000SRS-2g;
	Fri, 07 Apr 2023 11:28:42 +0000
Date: Fri, 7 Apr 2023 19:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 6155/8053] aperf.c:58:9: warning: 'ftime' is
 deprecated: Use gettimeofday or clock_gettime instead
Message-ID: <202304071936.PZOEIGPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   32bea3bac5ca484c6f7e302c8c96fc686f62e7b4
commit: 281b93e42e402a1c8368057b84861e1310e64fa3 [6155/8053] selftests/intel_pstate: fix build for ARCH=x86_64
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=281b93e42e402a1c8368057b84861e1310e64fa3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 281b93e42e402a1c8368057b84861e1310e64fa3
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071936.PZOEIGPk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   aperf.c: In function 'main':
>> aperf.c:58:9: warning: 'ftime' is deprecated: Use gettimeofday or clock_gettime instead [-Wdeprecated-declarations]
      58 |         ftime(&before);
         |         ^~~~~
   In file included from aperf.c:9:
   /usr/include/x86_64-linux-gnu/sys/timeb.h:29:12: note: declared here
      29 | extern int ftime (struct timeb *__timebuf)
         |            ^~~~~
   aperf.c:67:9: warning: 'ftime' is deprecated: Use gettimeofday or clock_gettime instead [-Wdeprecated-declarations]
      67 |         ftime(&after);
         |         ^~~~~
   In file included from aperf.c:9:
   /usr/include/x86_64-linux-gnu/sys/timeb.h:29:12: note: declared here
      29 | extern int ftime (struct timeb *__timebuf)
         |            ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
