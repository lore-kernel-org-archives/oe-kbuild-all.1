Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8ECA66
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695510132; x=1727046132;
  h=date:from:to:cc:subject:message-id;
  bh=DrFXWDtELSEQsGQqK0pv/66FOtuMbaE2ImgolzHooK0=;
  b=djBOJAyNobyPU+tjjE5wZ0CzOl0fvdn295N4ZIEx1T0EztZXYB8XB52v
   /FP40ha9kI7e+S1vtww/myr7leOp8LwOpf/Gtje4MFGTwTuNhe/Km6S5x
   baCsGekvsK8rS8uPqOaYhyETuypjiN2P/XmazrJqcG8ZpBTUW3ORkcEn2
   jtCws35ihtPMLQJl7ywz7gXrAeKo2i1qxE9rWlGcGibeAFbILWkP9T8+I
   irT4R69fwrdAC1rPdUi9AjrYoQ8M7uaeZWjgcp3gzafOtevdP0gXGvgYW
   0pPcRFIjsniP+4yYR1J/RLUN+aTSp1CVdtz6D/aNOj9w8+Se1oDxddbIJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="378335385"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="378335385"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 16:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="994937522"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="994937522"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2023 16:02:09 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkBdX-0002xt-0v;
	Sat, 23 Sep 2023 23:02:07 +0000
Date: Sun, 24 Sep 2023 07:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+131 bytes kernel size regression] [i386-tinyconfig]
 [8dc9e02aed] lib: add light-weight queuing mechanism.
Message-ID: <20230923230115.mLjtR%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +131 bytes kernel size regression due to commit:

commit: 8dc9e02aed76918ff6cacf4825ff987ebd95af2b (lib: add light-weight queuing mechanism.)
git://git.kernel.org/cgit/linux/kernel/git/cel/linux nfsd4-encoder-overhaul


Details as below (size data is obtained by `nm --size-sort vmlinux`):

360c76a3: llist: add llist_del_first_this()
8dc9e02a: lib: add light-weight queuing mechanism.

+----------------------+----------+----------+-------+
|        symbol        | 360c76a3 | 8dc9e02a | delta |
+----------------------+----------+----------+-------+
| bzImage              | 522176   | 522336   | 160   |
| nm.T.lwq_dequeue_all | 0        | 66       | 66    |
| nm.T.__lwq_dequeue   | 0        | 65       | 65    |
+----------------------+----------+----------+-------+



Thanks

