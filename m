Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED483C0C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 03:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717211622; cv=none; b=AW8ce4/su+McOWvrXxsJqTDy/VbJd20YS6zWrRHROzVqLJV14j1/fUE+A19D+OeVB6kayNsxp/Be4GDWHAbnpUaaLn+LK4VL+Li/f/adkhI1eOF+w9Owxq+TNTiZdUzLMZeDLGpzkBg9+6Tk8pK4ghRPbt1OUSyY+44FxiEO2H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717211622; c=relaxed/simple;
	bh=6o78ys8bBaHjGzP5paAGkbyquzuL1Hg1dQwBgD+BKgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1E6piZTAVelBkS0nl2Lngb98c1FN/gfHlCVBAfPsfLnYmJvz6Bd2yE8plYbxJhDdEYz9sE0Yb6H4+xtjl4GDx5SoVzqhq6tTeBsjYDo4M/wLAYekLLBcDGPMBNuf9AC5EGmsOiI5NagKIwQWjRLjLT5CNjEh4s6OfBpHUCn+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoUIYTTx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoUIYTTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717211619; x=1748747619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6o78ys8bBaHjGzP5paAGkbyquzuL1Hg1dQwBgD+BKgI=;
  b=AoUIYTTxGhJ+bw5wVs+RdWPt5rrEWwMPPZJILnr6Vzd0iQv0vLM7z3Ks
   rNzeV2vuXZO7+/V5omkh2YzEOrvVk2YCeNA2u6Vm+INptYcnyTGtmjUOr
   +zba0NbLl7VyQHLENYroBCQa699KDLHtawI2uSBVRDMtkoV3h+dZI1xTs
   siWSS7b26DwOR8a+fMEeh9FO30n8GewBOBlUYfTryqaAl5ZHadThoeVJw
   4zEvPlPOKthbj2wirZgoOhSiC0EDZNY71mfaaYSgPoskEOpBXKFMZo0dr
   9OAgpMyLy4WATjKtThmj9y/F75mMHDelsH7FEEM+sWi2LMae3jwO5bgL8
   Q==;
X-CSE-ConnectionGUID: YuUvwKHITPeaOH6kCxQekw==
X-CSE-MsgGUID: SKa1rsOQReuDspUasdEdXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17598962"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="17598962"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 20:13:39 -0700
X-CSE-ConnectionGUID: ytq5/sulQ96fCGbxH0IXwg==
X-CSE-MsgGUID: 1KhfPMwaT36d0/lkg7VSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="40887765"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 20:13:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDFBX-000IFc-0o;
	Sat, 01 Jun 2024 03:13:35 +0000
Date: Sat, 1 Jun 2024 11:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 9/10] include/linux/cpumask_str.h:27:64: error:
 'nr_cpumask_bits' undeclared; did you mean 'cpumask_bits'?
Message-ID: <202406011006.3mGQuRBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   73e9e98494988c844af62ffb6dc7aa5512d87034
commit: 46b57212fb7c3b4e7bef861e73110c4aff516336 [9/10] cpumask_str.h
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240601/202406011006.3mGQuRBA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011006.3mGQuRBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011006.3mGQuRBA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/base/cpu.c:6:
   include/linux/cpumask_str.h: In function 'cpumask_parse_user':
>> include/linux/cpumask_str.h:27:64: error: 'nr_cpumask_bits' undeclared (first use in this function); did you mean 'cpumask_bits'?
      27 |         return bitmap_parse_user(buf, len, cpumask_bits(dstp), nr_cpumask_bits);
         |                                                                ^~~~~~~~~~~~~~~
         |                                                                cpumask_bits
   include/linux/cpumask_str.h:27:64: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/cpumask_str.h: In function 'cpumask_parselist_user':
   include/linux/cpumask_str.h:42:38: error: 'nr_cpumask_bits' undeclared (first use in this function); did you mean 'cpumask_bits'?
      42 |                                      nr_cpumask_bits);
         |                                      ^~~~~~~~~~~~~~~
         |                                      cpumask_bits
   include/linux/cpumask_str.h: In function 'cpumask_parse':
>> include/linux/cpumask_str.h:54:34: error: 'UINT_MAX' undeclared (first use in this function)
      54 |         return bitmap_parse(buf, UINT_MAX, cpumask_bits(dstp), nr_cpumask_bits);
         |                                  ^~~~~~~~
   include/linux/cpumask_str.h:7:1: note: 'UINT_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
       6 | #include <linux/bitmap-str.h>
     +++ |+#include <limits.h>
       7 | 
   include/linux/cpumask_str.h:54:64: error: 'nr_cpumask_bits' undeclared (first use in this function); did you mean 'cpumask_bits'?
      54 |         return bitmap_parse(buf, UINT_MAX, cpumask_bits(dstp), nr_cpumask_bits);
         |                                                                ^~~~~~~~~~~~~~~
         |                                                                cpumask_bits
   include/linux/cpumask_str.h: In function 'cpulist_parse':
   include/linux/cpumask_str.h:66:58: error: 'nr_cpumask_bits' undeclared (first use in this function); did you mean 'cpumask_bits'?
      66 |         return bitmap_parselist(buf, cpumask_bits(dstp), nr_cpumask_bits);
         |                                                          ^~~~~~~~~~~~~~~
         |                                                          cpumask_bits
   include/linux/cpumask_str.h: In function 'cpumap_print_to_pagebuf':
>> include/linux/cpumask_str.h:83:39: error: 'nr_cpu_ids' undeclared (first use in this function)
      83 |                                       nr_cpu_ids);
         |                                       ^~~~~~~~~~
   include/linux/cpumask_str.h: In function 'cpumap_print_bitmask_to_buf':
   include/linux/cpumask_str.h:107:36: error: 'nr_cpu_ids' undeclared (first use in this function)
     107 |                                    nr_cpu_ids, off, count) - 1;
         |                                    ^~~~~~~~~~
   include/linux/cpumask_str.h: In function 'cpumap_print_list_to_buf':
   include/linux/cpumask_str.h:129:36: error: 'nr_cpu_ids' undeclared (first use in this function)
     129 |                                    nr_cpu_ids, off, count) - 1;
         |                                    ^~~~~~~~~~
   include/linux/cpumask_str.h: In function 'cpumap_print_to_pagebuf':
>> include/linux/cpumask_str.h:84:1: warning: control reaches end of non-void function [-Wreturn-type]
      84 | }
         | ^


vim +27 include/linux/cpumask_str.h

    15	
    16	/**
    17	 * cpumask_parse_user - extract a cpumask from a user string
    18	 * @buf: the buffer to extract from
    19	 * @len: the length of the buffer
    20	 * @dstp: the cpumask to set.
    21	 *
    22	 * Return: -errno, or 0 for success.
    23	 */
    24	static inline int cpumask_parse_user(const char __user *buf, int len,
    25					     struct cpumask *dstp)
    26	{
  > 27		return bitmap_parse_user(buf, len, cpumask_bits(dstp), nr_cpumask_bits);
    28	}
    29	
    30	/**
    31	 * cpumask_parselist_user - extract a cpumask from a user string
    32	 * @buf: the buffer to extract from
    33	 * @len: the length of the buffer
    34	 * @dstp: the cpumask to set.
    35	 *
    36	 * Return: -errno, or 0 for success.
    37	 */
    38	static inline int cpumask_parselist_user(const char __user *buf, int len,
    39					     struct cpumask *dstp)
    40	{
    41		return bitmap_parselist_user(buf, len, cpumask_bits(dstp),
    42					     nr_cpumask_bits);
    43	}
    44	
    45	/**
    46	 * cpumask_parse - extract a cpumask from a string
    47	 * @buf: the buffer to extract from
    48	 * @dstp: the cpumask to set.
    49	 *
    50	 * Return: -errno, or 0 for success.
    51	 */
    52	static inline int cpumask_parse(const char *buf, struct cpumask *dstp)
    53	{
  > 54		return bitmap_parse(buf, UINT_MAX, cpumask_bits(dstp), nr_cpumask_bits);
    55	}
    56	
    57	/**
    58	 * cpulist_parse - extract a cpumask from a user string of ranges
    59	 * @buf: the buffer to extract from
    60	 * @dstp: the cpumask to set.
    61	 *
    62	 * Return: -errno, or 0 for success.
    63	 */
    64	static inline int cpulist_parse(const char *buf, struct cpumask *dstp)
    65	{
  > 66		return bitmap_parselist(buf, cpumask_bits(dstp), nr_cpumask_bits);
    67	}
    68	
    69	/**
    70	 * cpumap_print_to_pagebuf  - copies the cpumask into the buffer either
    71	 *	as comma-separated list of cpus or hex values of cpumask
    72	 * @list: indicates whether the cpumap must be list
    73	 * @mask: the cpumask to copy
    74	 * @buf: the buffer to copy into
    75	 *
    76	 * Return: the length of the (null-terminated) @buf string, zero if
    77	 * nothing is copied.
    78	 */
    79	static inline ssize_t
    80	cpumap_print_to_pagebuf(bool list, char *buf, const struct cpumask *mask)
    81	{
    82		return bitmap_print_to_pagebuf(list, buf, cpumask_bits(mask),
  > 83					      nr_cpu_ids);
  > 84	}
    85	
    86	/**
    87	 * cpumap_print_bitmask_to_buf  - copies the cpumask into the buffer as
    88	 *	hex values of cpumask
    89	 *
    90	 * @buf: the buffer to copy into
    91	 * @mask: the cpumask to copy
    92	 * @off: in the string from which we are copying, we copy to @buf
    93	 * @count: the maximum number of bytes to print
    94	 *
    95	 * The function prints the cpumask into the buffer as hex values of
    96	 * cpumask; Typically used by bin_attribute to export cpumask bitmask
    97	 * ABI.
    98	 *
    99	 * Return: the length of how many bytes have been copied, excluding
   100	 * terminating '\0'.
   101	 */
   102	static inline ssize_t
   103	cpumap_print_bitmask_to_buf(char *buf, const struct cpumask *mask,
   104			loff_t off, size_t count)
   105	{
   106		return bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
 > 107					   nr_cpu_ids, off, count) - 1;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
