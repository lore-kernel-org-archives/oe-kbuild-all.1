Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471EEEB21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jan 2023 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673995499; x=1705531499;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=33TNzBYTxE/CAesvgJUPsAAkGv0sqTqP+kd9ymCvifw=;
  b=ZNTLoy2LFQ4Ldo7dR/H1qIeRvcTLC0qk6I/PGkj9LxYcBu2W4QtCkk82
   u5OHcwSlf2yrSQHOtixHjksjZGUDaLs3ZuRk0yItZuIOGIswjk41f5usk
   F9zMZoGr0dpOLs9D8iXoyJla/wjlMmTqfQeOo2bU4yn82UNzJREGkpdNg
   MHFS4INYllKp+36/qhkV8qDrqQazUXAul+7vNEsuqj8k+k7JNTPrCq+Vs
   GVm80fnMvnTnU3GsXZ5BA1F9/ajHqj3j7x1fFZdJPH9n+227gfkYJNPud
   fZ0wQZPTyLA/Bt1MP/t/RLj6qkR0fLARsGJ1g/7BpjwbxRS8MalCyZwFm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352084035"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="352084035"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 14:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="748201981"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="748201981"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2023 14:44:57 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHuhM-0001SC-2n;
	Tue, 17 Jan 2023 22:44:56 +0000
Date: Wed, 18 Jan 2023 06:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+72 bytes kernel size regression] [i386-tinyconfig]
 [68c6c15638] perf/core: Introduce perf_prepare_header()
Message-ID: <63c724af.S2rfxmBCxO8oPa7B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +72 bytes kernel size regression due to commit:

commit: 68c6c15638eb6627c506b798cd42ea3fe235219b (perf/core: Introduce perf_prepare_header())
https://git.kernel.org/cgit/linux/kernel/git/namhyung/linux-perf.git perf/prepare-sample-v3


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a5b83450: perf/core: Do not pass header for sample id init
68c6c156: perf/core: Introduce perf_prepare_header()

+---------------------------------+----------+----------+-------+
|             symbol              | a5b83450 | 68c6c156 | delta |
+---------------------------------+----------+----------+-------+
| bzImage                         | 496480   | 496544   | 64    |
| nm.T.perf_prepare_header        | 0        | 53       | 53    |
| nm.T.intel_pmu_drain_bts_buffer | 490      | 511      | 21    |
| nm.t.perf_sample_data_size      | 0        | 15       | 15    |
| nm.T.perf_event_output_backward | 78       | 93       | 15    |
| nm.T.perf_event_output_forward  | 78       | 93       | 15    |
| nm.T.perf_event_output          | 84       | 97       | 13    |
| nm.T.perf_prepare_sample        | 1513     | 1453     | -60   |
+---------------------------------+----------+----------+-------+



Thanks

