Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475AF4EB2D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707487170; cv=none; b=P0xs8GUWipM1aG7TeBRnmEgLCklIPRRGOGxbNA1nB2G/KaQTECkjl7q8QNyl/c6TxfLE65UBgl+Vb5k5DXA4rfTGbFng4k9jTtncNcW2qRU6q9kCCHE/JTN+0n9ccBMAApjE8l+g56lLcwuudsQfGLU0+n6AoUTq+YJ7hGBU+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707487170; c=relaxed/simple;
	bh=e2JDzWGy5fSu9qkan/Do90eoPuKcjhlHO5voHznD34g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mb12z7M2Bbqh4ZPg44ivfdEvJHYEZ+OmHxRbLb5zyhKLRZ4iG1c5XyBvny23aCS565VFC1cHj5VR3H3DwpmMW9L8UdO2sRkigY14XhlN39JLiYuMEmqqUAEXrPeo9fU1XUuW5S+OEWy/Gjl6rQF6LNkKhZEq8vGG7+ttYSTzih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FP3T2Xki; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FP3T2Xki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707487168; x=1739023168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e2JDzWGy5fSu9qkan/Do90eoPuKcjhlHO5voHznD34g=;
  b=FP3T2XkiyhR1FOTxdlRx4vfvTa0mrnhvsEyfylaQNudMUpNtj4gcHdVH
   96f2ayB1mkWL/ntwbj2VB5MoDuM5NTVV42DG5FFr3SX6wVxB8n2FNzI89
   ZgjK1mvBQOfmbtc1BwIUuyJ0EH3SItUxXDC6dCwZyD78w8dRTv18lJ7oA
   /WcGfvrvkqpf5OU3YSJLLTTPVYS79E5sFXgbIztofCljLlf1VPOcJfPpM
   hQOgVZmzRegDEVD+k0bpvd4XAzKKGUX21OHnD0tReiyyAqWcG1pDMUuUn
   RzaB2brHjiGV4gRkcT4a3+yP7q2C2xzwSVcoiEceBxNiXTrBUI3lm6KM/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12807222"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12807222"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="25174742"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2024 05:59:26 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYRPY-0004lM-11;
	Fri, 09 Feb 2024 13:59:24 +0000
Date: Fri, 9 Feb 2024 21:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Jeffery <djeffery@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] scsi mid layer support for async command submit
Message-ID: <202402092103.31yODJsf-lkp@intel.com>
References: <20240207184100.18066-6-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207184100.18066-6-djeffery@redhat.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.8-rc3]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next next-20240209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Jeffery/minimal-async-shutdown-infrastructure/20240208-024535
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240207184100.18066-6-djeffery%40redhat.com
patch subject: [RFC PATCH 5/6] scsi mid layer support for async command submit
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240209/202402092103.31yODJsf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402092103.31yODJsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402092103.31yODJsf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_lib.c:286: warning: Function parameter or struct member 'const_args' not described in 'scsi_execute_cmd'
>> drivers/scsi/scsi_lib.c:286: warning: Excess function parameter 'args' description in 'scsi_execute_cmd'


vim +286 drivers/scsi/scsi_lib.c

   267	
   268	/**
   269	 * scsi_execute_cmd - insert request and wait for the result
   270	 * @sdev:	scsi_device
   271	 * @cmd:	scsi command
   272	 * @opf:	block layer request cmd_flags
   273	 * @buffer:	data buffer
   274	 * @bufflen:	len of buffer
   275	 * @timeout:	request timeout in HZ
   276	 * @retries:	number of times to retry request
   277	 * @args:	Optional args. See struct definition for field descriptions
   278	 *
   279	 * Returns the scsi_cmnd result field if a command was executed, or a negative
   280	 * Linux error code if we didn't get that far.
   281	 */
   282	int scsi_execute_cmd(struct scsi_device *sdev, const unsigned char *cmd,
   283			     blk_opf_t opf, void *buffer, unsigned int bufflen,
   284			     int timeout, int retries,
   285			     const struct scsi_exec_args *const_args)
 > 286	{
   287		struct scsi_exec_args args;
   288		int ret;
   289		struct request *req;
   290	
   291		if (!const_args)
   292			memset(&args, 0, sizeof(struct scsi_exec_args));
   293		else
   294			args = *const_args;
   295	
   296		args.buffer = buffer;
   297		args.bufflen = bufflen;
   298	
   299		req = scsi_execute_init(sdev, cmd, opf, timeout, retries, &args);
   300	
   301		if (IS_ERR(req))
   302			return PTR_ERR(req);
   303	
   304		/*
   305		 * head injection *required* here otherwise quiesce won't work
   306		 */
   307		blk_execute_rq(req, true);
   308	
   309		ret = scsi_execute_uninit(req, &args);
   310	
   311		blk_mq_free_request(req);
   312	
   313		return ret;
   314	}
   315	EXPORT_SYMBOL(scsi_execute_cmd);
   316	
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
