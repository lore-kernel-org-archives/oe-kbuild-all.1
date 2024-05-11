Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B613802
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 05:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715404070; cv=none; b=fymUlxJfuj7MPUAD754yFYmkHFDmcVYsDE3fNLPIZ7Hc3D9W5vUeWwxgNqeJB4KcZw6aOlx9Ys+LPykKE085riayt89XySmyMmoBX0J64tdzHqCI6MW9Tsco44xvGloQsoraIUpTs819fv2cJj09ao+S1PzyVTUybYEBchtcLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715404070; c=relaxed/simple;
	bh=amTME4wA2EDLVi77e7nzXNkcMMCjWbaxbVpUJaP+/Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+QKSZuqL6wTiaYXSHwDOGP7Nu3ZAmi+Oo1yTym6hyntLKO7Qvwmnn899EC5vbThBpLlKVzzlWDnjnLdFVjusRIIvIjxNIJXPY+Bn3c615xjpdPU/xCVvtgXiKxUAA4KvX0uPgaSViO7f48+7JttcLKOWwnDpsB3bLGgJUKP+Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQBuWj+c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQBuWj+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715404069; x=1746940069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amTME4wA2EDLVi77e7nzXNkcMMCjWbaxbVpUJaP+/Kg=;
  b=kQBuWj+cvLJfEW/C77B4aD41q8VcErsRF9Tx1ks17wGs8tIWcAjqSRS/
   9WLE0Tpv35KFyMbkdVo6fq8zwO2z56o4YuMHI3Ydpcz3G6xgEh2xkSLlD
   z5TdCZeAALcIFqzojQBpZyPkA7oY1VMad470Z02Pz5fQLbgsnv/Eu6MVF
   JKWJ47dKkSpyEojDqr+s7YzlTiJLy++6i2YIT9IoKmXPvtRdJKSNoe1CF
   RW30/ZJ6inoIHxL86xygdGmy/S19WqcpGOGK/UIJIt5xUP+nekkUiBjPU
   F6MgUtFJScwTETqNLthyx4+m/b9zcOEcInxOPQM6AA4k+2tWU5FpAEYad
   Q==;
X-CSE-ConnectionGUID: ZkV8kzUDSoyV7AwAEtiurw==
X-CSE-MsgGUID: ZCMrC4xuQbCCSD/3cEOKAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22804983"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="22804983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 22:07:48 -0700
X-CSE-ConnectionGUID: JkbDYI4oRcyeMgHRdmnzqQ==
X-CSE-MsgGUID: TSOTTQcZSoGtKoraC5svGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="29835653"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 May 2024 22:07:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5exV-0006xZ-0Q;
	Sat, 11 May 2024 05:07:45 +0000
Date: Sat, 11 May 2024 13:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6] usb-storage: Optimize scan delay more precisely
Message-ID: <202405111221.V3mZJri3-lkp@intel.com>
References: <20240510100341.51999-1-Norihiko.Hama@alpsalpine.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510100341.51999-1-Norihiko.Hama@alpsalpine.com>

Hi Norihiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.9-rc7 next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Norihiko-Hama/usb-storage-Optimize-scan-delay-more-precisely/20240510-175902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240510100341.51999-1-Norihiko.Hama%40alpsalpine.com
patch subject: [PATCH v6] usb-storage: Optimize scan delay more precisely
config: x86_64-buildonly-randconfig-002-20240511 (https://download.01.org/0day-ci/archive/20240511/202405111221.V3mZJri3-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111221.V3mZJri3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111221.V3mZJri3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/storage/usb.c:86: warning: Function parameter or struct member 'suffix' not described in 'parse_delay_str'
>> drivers/usb/storage/usb.c:126: warning: Function parameter or struct member 'suffix' not described in 'format_delay_ms'


vim +86 drivers/usb/storage/usb.c

    71	
    72	/**
    73	 * parse_delay_str - parse an unsigned decimal integer delay
    74	 * @str: String to parse.
    75	 * @ndecimals: Number of decimal to scale up.
    76	 * @val: Where to store the parsed value.
    77	 *
    78	 * Parse an unsigned decimal value in @str, optionally end with @suffix.
    79	 * Stores the parsed value in @val just as it is if @str ends with @suffix.
    80	 * Otherwise store the value scale up by 10^(@ndecimal).
    81	 *
    82	 * Returns 0 on success, a negative error code otherwise.
    83	 */
    84	static int parse_delay_str(const char *str, int ndecimals, const char *suffix,
    85				unsigned int *val)
  > 86	{
    87		int n, n2, l;
    88		char buf[16];
    89	
    90		l = strlen(suffix);
    91		n = strlen(str);
    92		if (n > 0 && str[n - 1] == '\n')
    93			--n;
    94		if (n >= l && !strncmp(&str[n - l], suffix, l)) {
    95			n -= l;
    96			n2 = 0;
    97		} else
    98			n2 = ndecimals;
    99	
   100		if (n + n2 > sizeof(buf) - 1)
   101			return -EINVAL;
   102	
   103		memcpy(buf, str, n);
   104		while (n2-- > 0)
   105			buf[n++] = '0';
   106		buf[n] = 0;
   107	
   108		return kstrtouint(buf, 10, val);
   109	}
   110	
   111	/**
   112	 * format_delay_ms - format an integer value into a delay string
   113	 * @val: The integer value to format, scaled by 10^(@ndecimals).
   114	 * @ndecimals: Number of decimal to scale down.
   115	 * @str: Where to store the formatted string.
   116	 * @size: The size of buffer for @str.
   117	 *
   118	 * Format an integer value in @val scale down by 10^(@ndecimals) without @suffix
   119	 * if @val is divisible by 10^(@ndecimals).
   120	 * Otherwise format a value in @val just as it is with @suffix
   121	 *
   122	 * Returns the number of characters written into @str.
   123	 */
   124	static int format_delay_ms(unsigned int val, int ndecimals, const char *suffix,
   125				char *str, int size)
 > 126	{
   127		u64 delay_ms = val;
   128		unsigned int rem = do_div(delay_ms, int_pow(10, ndecimals));
   129		int ret;
   130	
   131		if (rem)
   132			ret = scnprintf(str, size, "%u%s\n", val, suffix);
   133		else
   134			ret = scnprintf(str, size, "%u\n", (unsigned int)delay_ms);
   135		return ret;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
