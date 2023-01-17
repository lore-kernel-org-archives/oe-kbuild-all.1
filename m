Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20F3222
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jan 2023 22:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673995439; x=1705531439;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B92eHNIR4ADtkQ5vWC3IdZt8K7syGlMai9+7woiLXJE=;
  b=ah1haivXf93OqOwtSpEZ5ZRtB3NXUtEIB7G88JGwgsXFKBd6zXWc4zSH
   6F2Vg0cevqXirVnmfDQSzvBzk86uSXcVymww9QBcgzsS6ESHBeG7jsjhL
   dYJZsI8JSHGwunlnDi2gPunQY2dQDSYxY0rlJQwhvUXLMjOdYhUyQwX1/
   FHKPFW1byAZ7qeWDsb2YFxmYfXn8Ny0Q4tfL3+pOLwJ6sYE0mROey9DDm
   J7dOK4rhFOiS1JP3ZP9Lj4q43G2TTHr4F1eNuwbnc7osUsuwMW3054FY0
   eyddTl1MUmYEWsrw1UVnwLORO7zhQ3mCkpgAss+4Ja1kZYSgTcVoBzCSd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352083916"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="352083916"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 14:43:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="748201903"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="748201903"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2023 14:43:57 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHugO-0001S4-2X;
	Tue, 17 Jan 2023 22:43:56 +0000
Date: Wed, 18 Jan 2023 06:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+125 bytes kernel size regression] [i386-tinyconfig]
 [24e413d94c] perf/core: Add perf_sample_save_brstack() helper
Message-ID: <63c72495./RoyAGhqpz/8J9G0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +125 bytes kernel size regression due to commit:

commit: 24e413d94cd6092385439ccfc8a0e768bb7a47bc (perf/core: Add perf_sample_save_brstack() helper)
https://git.kernel.org/cgit/linux/kernel/git/namhyung/linux-perf.git perf/prepare-sample-v3


Details as below (size data is obtained by `nm --size-sort vmlinux`):

060d7602: perf/core: Add perf_sample_save_raw_data() helper
24e413d9: perf/core: Add perf_sample_save_brstack() helper

+--------------------------------------+----------+----------+-------+
|                symbol                | 060d7602 | 24e413d9 | delta |
+--------------------------------------+----------+----------+-------+
| bzImage                              | 496192   | 496384   | 192   |
| nm.t.perf_sample_save_brstack        | 0        | 58       | 58    |
| nm.t.handle_pmi_common               | 494      | 543      | 49    |
| nm.t.amd_pmu_v2_handle_irq           | 442      | 481      | 39    |
| nm.t.setup_pebs_adaptive_sample_data | 703      | 714      | 11    |
| nm.T.perf_output_sample              | 1594     | 1592     | -2    |
| nm.T.perf_prepare_sample             | 1334     | 1320     | -14   |
| nm.t.setup_pebs_fixed_sample_data    | 971      | 955      | -16   |
+--------------------------------------+----------+----------+-------+



Thanks

