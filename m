Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2EF1119
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbfohPYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697419538; x=1728955538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oj8idGQALYpqf/lffARlNe5R3UhPNu3likrBpuTvw/A=;
  b=RbfohPYlCUCX48NTsSjLkqZLevaT5mEJG8erMY3XvTaNhcK2VVv4QTu5
   1tTj8KnYY1pP3869gr70AsudsaMFcJ2WGl0hC6ITgjb9RcHkHhvDzw3E0
   b31Btd5wAcH3Gnawi8J5aAoVQQ8JHCBy0r0781Rn6dv6dUpiDvnWxyQev
   pikyjmzXuB9FyFqVhZdez7D3a1iJXJ4W/4Ii5oigrWWsjg92x8mwVaqlA
   LZN7Ly05737+a9ajQxTQWkMT+KGbA24o8MG98+NW2f2WqTClbuFlRQVPC
   jxk8Lyg8jS5t5jUXxXdJcTYPU3mbGAtTw5eoa9Wz8KPZ9JMoQip/UYP6Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370501931"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370501931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825811578"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825811578"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 18:25:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsCMQ-000803-18;
	Mon, 16 Oct 2023 01:25:34 +0000
Date: Mon, 16 Oct 2023 09:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 148/206] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310160939.LLuzbBMK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2mxjFLdzmtdQdn7N"
Content-Disposition: inline


--2mxjFLdzmtdQdn7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: eec526acb066b8b1237ad30153aede16ef04f69d [148/206] ASoC: macaudio: Start speaker sense capture support
reproduce:

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160939.LLuzbBMK-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#104: FILE: sound/soc/apple/macaudio.c:988:
+^I{ "PCM2 RX", NULL, "Speaker Sense Capture" },^I$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--2mxjFLdzmtdQdn7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce:
        scripts/checkpatch.pl 0001-ASoC-macaudio-Start-speaker-sense-capture-support.patch

--2mxjFLdzmtdQdn7N--
