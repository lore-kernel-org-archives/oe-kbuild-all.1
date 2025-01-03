Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223711FAC59
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735925270; cv=none; b=oxoE6CjQ/sEa0WBN+UxM15Bvu5dRF05C9BuDcJ4fpu5rgMkT0Em8BZ8K2kFQHWVRD+TRG8x/8bjejufVqluafc/IN7cTuODHv1qdkr9bb3s3G2Q80l3yGHxDlJuddQlm9391+bHasTvj6mYSCQFWNg0ziF2YLB/L1WjQXyArYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735925270; c=relaxed/simple;
	bh=2HL60j7pDALkkaehLftQNP4RV3TXCVWxoClBJvzRq7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MF71w3GD8vDcSZYA+dlBRsa93i3veVDH2A/poy+p+8JNrBkP7fEdYBB80k561vR8n9Ju/2hkEpyXggS9n+RDliM6h1w7ddSCoPlk35ZyzDs3+Zhg7RTqLpGLLh/xwFEreASkGS5pmT50WBCwzaJEGaDIk2OjeIhRPpgMU/Y5Bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiloByMo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiloByMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735925267; x=1767461267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HL60j7pDALkkaehLftQNP4RV3TXCVWxoClBJvzRq7Y=;
  b=eiloByMoU2F85+tF51KxKP9G7rzMNc6WJ4Lkqsgl1xHtrLZFCHLVlPj0
   5Ie4JlLZzaX9rfAeBHrjqORYKnjgA6dunHWZ6RCN1acherGX34GLpeX9q
   6f+XPHnRP4vSbpLIcL6hIW+MkQsUOrXUbJEaQ0dAxSC7N107F38kWcLBb
   fIoesQg/ja1eZcvjofkp0uXhnHfVWeEkxgY8qI/2DlTYIjD0Fvkcu0v0d
   UQ8IpE9mkMwp4hGvdiRV7ySH0LVwLurjoFnfGtt+3BEy03QuyKqw6v9TA
   4fi5WkJgy8p/OExFYbocgomfxq5RUSiOeAV9t4RKpsl6vjbDAz1M8BFJG
   A==;
X-CSE-ConnectionGUID: CeMVo/OIT7OZjpdbu9A/KQ==
X-CSE-MsgGUID: E7dmZOn4TDqYisjqyUU2MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39940478"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="39940478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 09:27:47 -0800
X-CSE-ConnectionGUID: DelapiTTSQKCPI6zSdntwg==
X-CSE-MsgGUID: LDw/KiWnQaCSSnScHi477w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101701612"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jan 2025 09:27:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTlSZ-000A5z-0c;
	Fri, 03 Jan 2025 17:27:43 +0000
Date: Sat, 4 Jan 2025 01:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tingwei Zhang <tingwei@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (VMware)" <rostedt@goodmis.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: drivers/hwtracing/stm/ftrace.c:38: warning: Function parameter or
 struct member 'export' not described in 'stm_ftrace_write'
Message-ID: <202501040153.N5GYtNcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tingwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 7b9749bd830848bca9179b0a16251ca3c36e82e6 stm class: ftrace: Change dependency to TRACING
date:   4 years, 3 months ago
config: csky-randconfig-r026-20230729 (https://download.01.org/0day-ci/archive/20250104/202501040153.N5GYtNcw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040153.N5GYtNcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040153.N5GYtNcw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/stm/ftrace.c:38: warning: Function parameter or struct member 'export' not described in 'stm_ftrace_write'


vim +38 drivers/hwtracing/stm/ftrace.c

262e1f6e39143c Chunyan Zhang 2016-11-21  30  
262e1f6e39143c Chunyan Zhang 2016-11-21  31  /**
262e1f6e39143c Chunyan Zhang 2016-11-21  32   * stm_ftrace_write() - write data to STM via 'stm_ftrace' source
262e1f6e39143c Chunyan Zhang 2016-11-21  33   * @buf:	buffer containing the data packet
262e1f6e39143c Chunyan Zhang 2016-11-21  34   * @len:	length of the data packet
262e1f6e39143c Chunyan Zhang 2016-11-21  35   */
262e1f6e39143c Chunyan Zhang 2016-11-21  36  static void notrace
a773d419275bf5 Felipe Balbi  2017-06-02  37  stm_ftrace_write(struct trace_export *export, const void *buf, unsigned int len)
262e1f6e39143c Chunyan Zhang 2016-11-21 @38  {
a773d419275bf5 Felipe Balbi  2017-06-02  39  	struct stm_ftrace *stm = container_of(export, struct stm_ftrace, ftrace);
a773d419275bf5 Felipe Balbi  2017-06-02  40  
a773d419275bf5 Felipe Balbi  2017-06-02  41  	stm_source_write(&stm->data, STM_FTRACE_CHAN, buf, len);
262e1f6e39143c Chunyan Zhang 2016-11-21  42  }
262e1f6e39143c Chunyan Zhang 2016-11-21  43  

:::::: The code at line 38 was first introduced by commit
:::::: 262e1f6e39143c2a0f559e2fb4a835069a7693a9 stm class: ftrace: Add ftrace-export-over-stm driver

:::::: TO: Chunyan Zhang <zhang.chunyan@linaro.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
