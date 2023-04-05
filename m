Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB079CC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680728910; x=1712264910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e9oIe8wuIenPs/rGU7UKuYN1mbWLQ+0XzMz9VLWQBHU=;
  b=kq5xljfqWiYim8y+z6VDZPT7rwCvkenHQz3EVdjX7rLHnLomRMA+uFQD
   D1iToiWg+KIg4oM0XVCh1THU5hLWvG/bhEQMB6NzPIbi+LDfaO0x5Yb2i
   aSHNZ/EhQQFm6FDzaTRCPt1YY9q8xwbPwTb814soMzgO5q3vo2VVdqncF
   lv7XaDnc1v7ng2MtSeyTKrPWDpHJMtGbolUwDqF1e0s1WTA1xCPNNfGYu
   CjN1eNlkhogOHvdH5O6cn3ElZmV2DEp2aCJqR3tSpvH9K809U/XxPdNft
   lRQc3rm/wefOf/q74JdYh5darorZp+ZV2NQu+aV72VTHzeUnxI5biwu/u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407657501"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="407657501"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 14:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="1016620274"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="1016620274"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2023 14:08:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkAMi-000Qns-1m;
	Wed, 05 Apr 2023 21:08:24 +0000
Date: Thu, 6 Apr 2023 05:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 7168/9999] aperf.c:58:9: warning: 'ftime' is
 deprecated: Use gettimeofday or clock_gettime instead
Message-ID: <202304060514.ELO1BqLI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ricardo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   387078f9030cf336cd9fef521540db75b61615e0
commit: b1619f0307762526949f95c878119ca80e32149d [7168/9999] selftests/intel_pstate: fix build for ARCH=x86_64
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b1619f0307762526949f95c878119ca80e32149d
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout b1619f0307762526949f95c878119ca80e32149d
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060514.ELO1BqLI-lkp@intel.com/

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
