Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDEED291
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZWyTkFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697912781; x=1729448781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKQ1UNa+223TIFs4zcBad7r5bFh6LbxPNkjlCwmtnLw=;
  b=XZWyTkFXE6uhJV/U3K1od6YPXcJnH3+d5aZaG8j13yz5nHjr29aE9KKx
   zndE1csFwch0yySA4CdPxqZu409wP9cKFBM0P/99SqsLZmwMlgqBWOwUU
   YDnpxbrwFrA38tpih8ke2GJYFSWj9kvq5119MAYNuyiQQ1cRfEfxVmoKc
   rSETyj8uVRWN4hZHXKzBssb5WaCBKqkZKuePBqFq6CswB0qBsHdZhIO+T
   WxW1tEikPHobSHuyOoUiSC6vGOWyJNfSCjRS3V5i8zdrpOMcoT3z5NHGo
   snqHbl/Wl0HqYhIjJl4ZnKQD621AGErlhuCy2NpT0ro3aeRHJWwS4bpRH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8209004"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="8209004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 11:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="823567477"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="823567477"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Oct 2023 11:26:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quGfx-00058X-1r;
	Sat, 21 Oct 2023 18:26:17 +0000
Date: Sun, 22 Oct 2023 02:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 158/209] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310220255.qmSrxi0P-lkp@intel.com>
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
commit: e879dc58895497b87d3cde28691d0b2a5be84b22 [158/209] ASoC: apple: mca: Support capture on multiples BEs
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220255.qmSrxi0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220255.qmSrxi0P-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#42: FILE: sound/soc/apple/mca.c:272:
+		int no = mca_dai_to_cluster(asoc_rtd_to_cpu(dpcm->be, 0))->no;
+		mask |= 1 << no;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
