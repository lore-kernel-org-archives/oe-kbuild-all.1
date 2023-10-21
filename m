Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45143FBFF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEbClzed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697910140; x=1729446140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyMk4RxuS8LTSb52ZmDkbqUmfmYgO/ZLrowB/YeMIi4=;
  b=NEbClzedKUBulcKkVUG3ef2ZtLoLVeKGkaSPFR2AM0D8Xa8aE9erSzi2
   f00ZZhcvDWEEtabNNtcVewjEH9GzPYwMVjSa5ZGOHV32rGEtojI1p88Oc
   vKLnLG8npXvOx+lRKTb2PgLCpavKWQbDr8FLmGFunY0FTNe59LRrmRqeT
   GhecEietG8Bw4abPYQ5NsrDJJXQo9Wm8QVDw0Rn7Oqhj4PBNwi8+JXMQu
   5dLXBYwQLfgH1P8Uj07py2kqmV29MCka/dNMV9jTdkwby5LYaXH3df3Yn
   eXZDGHLZ4Mk3/Cgd6zyrQl07qFjvm/0ZQgXKW5aiqiZJnecS3XgUuxJPz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383849807"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="383849807"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 10:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="901418021"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="901418021"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2023 10:40:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quFzM-000568-0k;
	Sat, 21 Oct 2023 17:42:16 +0000
Date: Sun, 22 Oct 2023 01:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 146/209] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310220120.BX9xRVFS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: f55ad5cb2ef579a4302edbc2300afbc6c0eb89e8 [146/209] ASoC: apple: mca: Support FEs being clock consumers
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220120.BX9xRVFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220120.BX9xRVFS-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#95: FILE: sound/soc/apple/mca.c:392:
+		int port = mca_fe_get_port(substream);
+		writel_relaxed(port + 6 + 1,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
