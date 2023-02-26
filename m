Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D4386
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 03:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677382490; x=1708918490;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5aX9VAOAcaobk9qic4m9tTjzblQBzGskR1R4V/L+rVU=;
  b=Un64vt1s80TvRcqlw/eeHLPCbIn7Zkw5Nn6bVqU2zxm/naIfqIfIorO5
   6GOzSfzsv2ay3S8ezIiHdkX3L/2q+pRDplgJVqRPAfa7dfOkDHILbxDKU
   p69nCtRCf9iOgBwTwPMY05eDZ7V/uqt59o0eQJ7ecD6szNjFEpPVsiyY9
   5dWK2Ktv1J86cojqv1wh7H+Bujywq77mO+O0+UVTiiumZe55SBV8Uxep2
   NAv+98K2QDor/ukEhcRhij4xAMo+HcU/IuSeStG/H3HVoXap6o2besrvB
   BSkWDmlQT020expdWOyx5q76g8Td74FIvKtS81buANH/4rzsY2hVOM7no
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="313352895"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="313352895"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 19:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="782862291"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="782862291"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2023 19:34:48 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW7oF-0003Xp-2H;
	Sun, 26 Feb 2023 03:34:47 +0000
Date: Sun, 26 Feb 2023 11:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+96 bytes kernel size regression] [i386-tinyconfig]
 [b8e22c1e7d] lib/find: add find_next_and_andnot_bit()
Message-ID: <63fad32a.wBZcZhLAs5EK4ATX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +96 bytes kernel size regression due to commit:

commit: b8e22c1e7d16705c19a7986e28f055c6f204887f (lib/find: add find_next_and_andnot_bit())
https://github.com/norov/linux bitmap_test


Details as below (size data is obtained by `nm --size-sort vmlinux`):

7d9bdf8f: sched/topology: simplify usage of sched_numa_hop_mask()
b8e22c1e: lib/find: add find_next_and_andnot_bit()

+--------------------------------+----------+----------+-------+
|             symbol             | 7d9bdf8f | b8e22c1e | delta |
+--------------------------------+----------+----------+-------+
| bzImage                        | 500288   | 500416   | 128   |
| nm.T._find_next_and_andnot_bit | 0        | 96       | 96    |
+--------------------------------+----------+----------+-------+



Thanks

