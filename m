Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3CBD0D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 03:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675739791; x=1707275791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hyGkyclUKPRGLMHHtkS6zKtSCrno8NaSDmImJgJCaZY=;
  b=Z8qNgS1b+Hb0PNMW5+cUbu7RzEgHRLx7mPD3W7GCc3BiqOeEKdH8S3Nt
   ZGkdNefiKOLDpbg9oks/3yokAdKY0bJo7blFgqhxcb1U/xyuJ4BHvzj7A
   YjJu9PmLPSQFgoHQ/najTndAVn+CmyOnr5R+CciFyxxHUIu9yyRLH1sjA
   QZr6E1d2m7pb/26rsujwqR9PesKhZmErFaSRCf8THCX0JACNS7nhylf3h
   OE6emYCZ52xwKIG1h6Ug83/1zx7LoCibvGFPnAWytv99U9tsmktjhd4Qu
   Fk3Zf2G5UaCUJRm1BZItt6jSnIsmLrNOIkqfofHhZrZdTlyS3f2SJgYZ/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331525896"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="331525896"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 19:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="995580100"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="995580100"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2023 19:16:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPET6-0002zq-2M;
	Tue, 07 Feb 2023 03:16:28 +0000
Date: Tue, 7 Feb 2023 11:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [linux-next:master 9327/10565]
 drivers/powercap/idle_inject.c:130:40-42: WARNING !A || A && B is equivalent
 to !A || B
Message-ID: <202302071107.cFKQxtEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   129af770823407ee115a56c69a04b440fd2fbe61
commit: acbc661032b8aa0e8359ac77074769ade34a176c [9327/10565] powercap: idle_inject: Add update callback
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230207/202302071107.cFKQxtEz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cocci warnings: (new ones prefixed by >>)
>> drivers/powercap/idle_inject.c:130:40-42: WARNING !A || A && B is equivalent to !A || B

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
