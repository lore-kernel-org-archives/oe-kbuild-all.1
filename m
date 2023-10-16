Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BCE136D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJGhIojO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697419544; x=1728955544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+29RUgOjwpAMCXQ53ExEth5NCSSXA/bi9MgKzAOkYk=;
  b=GJGhIojOibp1abs7dbOqizcCYerUmqRnDxBBHb03R1PeXGdlkKEMoagb
   +KPs+/xNoByDveCxIYzVu2s3+C0RvWF0p+nfA3tNaIXchl4QOz2PI6ci9
   ZGL+8lKy/oJjF2cBsofqmqk9lVstq1b+4xMTHspA4g/xVs9fh/VBqSYKN
   UNO0o+fqtas8avC2cY26gN88Mm42YwaiVd0/PtfpUuRxKNPtkb1GapnfC
   VOxD7vpttkyz9svZRJj75VbCvK1b10xbpJ/TF90RXOesujefHv0FM3PR+
   Rf+xK+vGi/cqSFltPqESChhJopQUi+Na7kGvFzPou1GCpY6yLsOJVbp2K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370501937"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370501937"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825811582"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825811582"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 18:25:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsCMQ-00080D-1N;
	Mon, 16 Oct 2023 01:25:34 +0000
Date: Mon, 16 Oct 2023 09:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 146/206] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310160928.WFXPCAsk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="axUcPkkovvm4MOvw"
Content-Disposition: inline


--axUcPkkovvm4MOvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: ae723e076e0a0e0b091931365ef94785e10cc7d1 [146/206] ASoC: apple: mca: Support FEs being clock consumers
reproduce:

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160928.WFXPCAsk-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#95: FILE: sound/soc/apple/mca.c:392:
+		int port = mca_fe_get_port(substream);
+		writel_relaxed(port + 6 + 1,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--axUcPkkovvm4MOvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce:
        scripts/checkpatch.pl 0001-ASoC-apple-mca-Support-FEs-being-clock-consumers.patch

--axUcPkkovvm4MOvw--
