Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD7A41
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 05:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691386394; x=1722922394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wo/rv1cgpRAZMSC79nWxHp9M70Q2LsqyysVsYJ/OpGY=;
  b=EfAlBAAanC+UIeYbBpF4RsMKPYZFWYGb8ukVMJx5Te3Erld5MT/E8ccX
   TAwCRo4opk/Xyt2IeOltidsc1TML6DnsGswEHR9iU8MtMfpF3r2ZboF1t
   HzvQyIZYfQbrfzoGECmDLo91pNcrrnDBDDm8wOqVuHlXOTZoWwmxggwtT
   MhCCvSd75teHJasIiFS8CMX69ed4jdp5sLTJWgokK4/n1JcDMG++rH3pN
   15YlEqZwlOmkMiQsz1xNzvvKdnK6rUfxy2ArIykSJSedOojeddm2stl7n
   BV/ziYs6kXYWCoHGM0j8O0wW+FW15fu9M8pmVKrCAcEnBxmCUfjAheAsj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="456838717"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="456838717"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 22:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="904586062"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="904586062"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Aug 2023 22:32:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSsrC-0004Yt-0r;
	Mon, 07 Aug 2023 05:32:42 +0000
Date: Mon, 7 Aug 2023 13:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 1/18] lib/iov_iter.c:582:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202308071349.NFP7QACA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   672499b5bfaeda1769d9eab9c9a08f4c2b2e4bf5
commit: f008e454544ebdcf3742c4d4e3d06abe5868be00 [1/18] iov_iter: Add function to see if buffer is all zeros
config: powerpc-randconfig-r081-20230807 (https://download.01.org/0day-ci/archive/20230807/202308071349.NFP7QACA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308071349.NFP7QACA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308071349.NFP7QACA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *s @@     got void [noderef] __user *[assigned] base @@
   lib/iov_iter.c:582:9: sparse:     expected void const *s
   lib/iov_iter.c:582:9: sparse:     got void [noderef] __user *[assigned] base
>> lib/iov_iter.c:582:9: sparse: sparse: subtraction of different types can't work (different address spaces)
>> lib/iov_iter.c:582:9: sparse: sparse: subtraction of different types can't work (different address spaces)

vim +582 lib/iov_iter.c

   568	
   569	/**
   570	 * iov_iter_is_zero - Return true if the buffer is entirely zeroed
   571	 * @i: The iterator describing the buffer
   572	 * @count: Amount of buffer to scan
   573	 *
   574	 * Scans the specified amount of the supplied buffer and returns true if only
   575	 * zero bytes are found therein and false otherwise.
   576	 */
   577	bool iov_iter_is_zero(const struct iov_iter *i, size_t count)
   578	{
   579		struct iov_iter j = *i, *pj = &j;
   580		void *p;
   581	
 > 582		iterate_and_advance(pj, count, base, len, count,
   583				    ({ p = memchr_inv(base, 0, len); p ? p - base : len; }),
   584				    ({ p = memchr_inv(base, 0, len); p ? p - base : len; })
   585		)
   586	
   587		return !count;
   588	}
   589	EXPORT_SYMBOL(iov_iter_is_zero);
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
