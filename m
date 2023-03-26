Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C73C3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679852809; x=1711388809;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C3B6L6OwmzFn//iSb6QGhQ1p0hPtMwH4bE+o4huTFhw=;
  b=Gu3LE2lfzwniFr9UKrmxFu6VWCN2mZC18CXixsJEweH1lRKeWSwd/VfZ
   ajzozyBdgJGvZBa7KvN1suTrt4qPrTEb5aTsm9bi5RWZKqx8w/EqfxhvI
   HpHFD6xlgbjJIuENjWT49Q2nMLjjx+kWuf/udCQ8HpgOziK/tRCgwg5A5
   iAQD1a3KDnsB+w0ssSFLKXTpjDPai/fo28Oaye5QszieZS+MpXzwwBuDI
   46/8AR1/+q3tOdZyNLVdBW8i2RiBpTkt1Z7L/4alTtd2ABFGVa2ybgvvs
   SqAq4WVw/T5jvGPR2vPxGjZnEGmNdyFIpYWFQfhyMEhQ/hkINo9nq7CO8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="342512232"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="342512232"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 10:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="794055121"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="794055121"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2023 10:46:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgUS7-000HHP-0g;
	Sun, 26 Mar 2023 17:46:47 +0000
Date: Mon, 27 Mar 2023 01:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+130 bytes kernel size regression] [i386-tinyconfig]
 [36eb71cc79] sched/eevdf: Better handle mixed slice length
Message-ID: <642084d9.A88XlXcop3mjMZbI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +130 bytes kernel size regression due to commit:

commit: 36eb71cc79c920eea0712a515d7903aca567717e (sched/eevdf: Better handle mixed slice length)
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a8a4ac3a: sched: Merge latency_offset into slice
36eb71cc: sched/eevdf: Better handle mixed slice length

+-----------------------+----------+----------+-------+
|        symbol         | a8a4ac3a | 36eb71cc | delta |
+-----------------------+----------+----------+-------+
| nm.t.place_entity     | 179      | 298      | 119   |
| nm.t.avg_vruntime_add | 0        | 91       | 91    |
| nm.t.avg_vruntime_sub | 0        | 89       | 89    |
| bzImage               | 502176   | 502240   | 64    |
| nm.t.__dequeue_entity | 381      | 350      | -31   |
| nm.t.__enqueue_entity | 192      | 138      | -54   |
| nm.T.reweight_task    | 281      | 197      | -84   |
+-----------------------+----------+----------+-------+



Thanks

