Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374F51FA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677861501; x=1709397501;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YBHy8QeJMIEGb9eHAR9qA3cWRlm4UpTSMap6fWTCBQk=;
  b=DUSrdBMFPrmejoPtSzRllikpAypKjMZAXdaGJ/JcBfBRzucBBuUAUlEj
   CubA7CFQjUA9SaZa5IZf44wrKr3TH6MsVHvXY/RrLOULOvuVWH3/PK7fT
   4KjC5m+7WkGX6cE3ywcLpUw5FK7SPadFjW24y3F0Zbq0Qcca0SLM8BOgp
   WmuYsFV2HFBrV8cv19d8iPPg5PR9IOrEqfr3A5wxvldxGjWb3KL8PCGrw
   HniOqvosdcEUyZyiWy1J5Q6eKlTe+RT4hfSBHaShxd2pOISSEmm/K+bf9
   esYp4DBxnbyLm0nSIPPURnzZ4OnsKbPgcJ0NY3zzLRcWoBrtsLwqGCwO5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="335113307"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="335113307"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 08:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739550999"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="739550999"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Mar 2023 08:38:19 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY8QE-0001Y8-1L;
	Fri, 03 Mar 2023 16:38:18 +0000
Date: Sat, 04 Mar 2023 00:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Parth Shah <parth@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+94 bytes kernel size regression] [i386-tinyconfig]
 [778dd8ecf5] sched: Allow sched_{get,set}attr to change latency_nice of the task
Message-ID: <64022268.CI+pXRlS66JcLbqq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +94 bytes kernel size regression due to commit:

commit: 778dd8ecf510717a4da3c7729f9c926eb23eaeef (sched: Allow sched_{get,set}attr to change latency_nice of the task)
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf


Details as below (size data is obtained by `nm --size-sort vmlinux`):

84fd80a2: sched/core: Propagate parent task's latency requirements to the child task
778dd8ec: sched: Allow sched_{get,set}attr to change latency_nice of the task

+-------------------------------+----------+----------+-------+
|            symbol             | 84fd80a2 | 778dd8ec | delta |
+-------------------------------+----------+----------+-------+
| bzImage                       | 501472   | 501536   | 64    |
| nm.t.__sched_setscheduler     | 994      | 1043     | 49    |
| nm.T.__ia32_sys_sched_setattr | 383      | 407      | 24    |
| nm.T.__ia32_sys_sched_getattr | 191      | 212      | 21    |
+-------------------------------+----------+----------+-------+



Thanks

