Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB9266AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAJg2yar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697136426; x=1728672426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZe7nxo+TLno6+MTsLTq7tBThcRqOcVlz+5tS0Fr+hE=;
  b=bAJg2yarlobvff/Dh/5R5HBYXjZ8echQGRLxONvuRb9kuo9R5/Ofdx5b
   yOOaabQQX9lfZsPhXVq28+jkDvAOrkP1wDsJ/eJvlrIZrXJgqSffjXPL0
   ncjOLzfpO/fEKfADFI/q2qKdD0MQIWL6M1L4/jjt+1HHba7IPVzkB9I02
   7tgqJslXcFpXtNOXBRYe+QPqde4SZzqmEvMpyhKc7s95xK6L21bS1g7Fd
   6MOtJOaTbkssCqMslg2i5ymy/fJzEETikUuvn7ZKuPlgi7Im7TGI0xRdc
   con+B++GkgqxW/fqROS841ThnHj4AY3hT9Bqn1nBrQMzULLKEG2pOLLen
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382241391"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="382241391"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 11:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001619007"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001619007"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 11:47:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr0i6-0003kh-1R;
	Thu, 12 Oct 2023 18:47:02 +0000
Date: Fri, 13 Oct 2023 02:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 143/196] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310130222.I7GzV2BU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: badd17640c220bef169dfff827b7fb02d9bf65f9 [143/196] ASoC: macaudio: Tune DT parsing error messages
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130222.I7GzV2BU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130222.I7GzV2BU-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#127: FILE: sound/soc/apple/macaudio.c:373:
+^I^I^I/* $

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
