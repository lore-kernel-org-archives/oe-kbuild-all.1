Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D317B503
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 23:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714433501; cv=none; b=cKMk18wguhQJz64fS3Ws+sQzywgi7VetX6fpO/RF3YPZ//rcScm+lJru8YwGY+MPPVHfP07E9HKrDUbpkp9N7i+wytDXitAYCXFlgrZ7V7TlETW2EKpncS1e/anQDqJ4T6ipzkW0C74ZFDiqBXDTi4AlQVpHWKA6Lg1DJ1Mdx44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714433501; c=relaxed/simple;
	bh=RYmZMVsgkRF6fQMtSTSI9Fyn0R9nuXVEuHVFzJ6xgt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BAfSjDBhxwLMnJGw8OWK2vp8CkLLcF0i1PdgkQknGCM1ktuc5d0ieOBh7PL70XaSNaQEdQuB/vSox+h++LAVcszbb4NR1iwV4k5fUXKZClStoSoziTrzZvwphfXyTOcQDkOeAcAT+XCUsmk7bNB27lBEQsBnjTG++parwduf5Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8vhwxos; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8vhwxos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714433500; x=1745969500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RYmZMVsgkRF6fQMtSTSI9Fyn0R9nuXVEuHVFzJ6xgt4=;
  b=Y8vhwxosveCUGsQUXW/MzmCNopUdEuSEuNuKvQAfEpI9+irAKVX5U+tB
   jk/ArfuxsibbUbWPSzNh+uouwAYd101/sfErBsgZ1Uppy7O1/F6UIrK/H
   MmbFnOZFfxoauUWaVRlvV7ycyPgWetaWEB2dhAf1HQB5+jusP6eVlLoS/
   Mfs4vQ4y8IvejOkdnmHoVx7uZSLCYdETQ9KtwGMrOlqe0WgVLWI9+CfsC
   6+qBNwD+Xb89/9HHf+Cie5DuZ4M9+a/qaWJRxUOsgJKzxF4I8w9Z56JFA
   qu+kDW3O3mgSqSibkUAwsQA+h+OrpywpQxz9QnFUVXRePGOQc+c1NaujD
   Q==;
X-CSE-ConnectionGUID: fkLmTdOzRcqTyiw+1uOaWA==
X-CSE-MsgGUID: aTX1JSSfRY+Hqzxj3hoC6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10241998"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="10241998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 16:31:39 -0700
X-CSE-ConnectionGUID: YWKN4lnjSieRS7m1ZS8HBg==
X-CSE-MsgGUID: +atg2V0jTG2InM4iIsXRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="63742613"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2024 16:31:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1aT9-0007WN-1Q;
	Mon, 29 Apr 2024 23:31:35 +0000
Date: Tue, 30 Apr 2024 07:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Michael Kelley <mhklinux@outlook.com>
Subject: [jdelvare-staging:dmi-for-next 2/2]
 drivers/firmware/dmi_scan.c:111:5: warning: format specifies type 'long' but
 the argument has type 'int'
Message-ID: <202404300723.xL4Fxpjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git dmi-for-next
head:   868577e6bfe18fb7afe030c15febe63885b5743b
commit: 868577e6bfe18fb7afe030c15febe63885b5743b [2/2] firmware: dmi: Stop decoding on broken entry
config: i386-randconfig-061-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300723.xL4Fxpjn-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300723.xL4Fxpjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300723.xL4Fxpjn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/dmi_scan.c:111:5: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     110 |                                 "Corrupted DMI table, offset %ld (only %d entries processed)\n",
         |                                                              ~~~
         |                                                              %d
     111 |                                 data - buf, i);
         |                                 ^~~~~~~~~~
   include/linux/printk.h:508:37: note: expanded from macro 'pr_warn'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +111 drivers/firmware/dmi_scan.c

    82	
    83	/*
    84	 *	We have to be cautious here. We have seen BIOSes with DMI pointers
    85	 *	pointing to completely the wrong place for example
    86	 */
    87	static void dmi_decode_table(u8 *buf,
    88				     void (*decode)(const struct dmi_header *, void *),
    89				     void *private_data)
    90	{
    91		u8 *data = buf;
    92		int i = 0;
    93	
    94		/*
    95		 * Stop when we have seen all the items the table claimed to have
    96		 * (SMBIOS < 3.0 only) OR we reach an end-of-table marker (SMBIOS
    97		 * >= 3.0 only) OR we run off the end of the table (should never
    98		 * happen but sometimes does on bogus implementations.)
    99		 */
   100		while ((!dmi_num || i < dmi_num) &&
   101		       (data - buf + sizeof(struct dmi_header)) <= dmi_len) {
   102			const struct dmi_header *dm = (const struct dmi_header *)data;
   103	
   104			/*
   105			 * If a short entry is found (less than 4 bytes), not only it
   106			 * is invalid, but we cannot reliably locate the next entry.
   107			 */
   108			if (dm->length < sizeof(struct dmi_header)) {
   109				pr_warn(FW_BUG
   110					"Corrupted DMI table, offset %ld (only %d entries processed)\n",
 > 111					data - buf, i);
   112				break;
   113			}
   114	
   115			/*
   116			 *  We want to know the total length (formatted area and
   117			 *  strings) before decoding to make sure we won't run off the
   118			 *  table in dmi_decode or dmi_string
   119			 */
   120			data += dm->length;
   121			while ((data - buf < dmi_len - 1) && (data[0] || data[1]))
   122				data++;
   123			if (data - buf < dmi_len - 1)
   124				decode(dm, private_data);
   125	
   126			data += 2;
   127			i++;
   128	
   129			/*
   130			 * 7.45 End-of-Table (Type 127) [SMBIOS reference spec v3.0.0]
   131			 * For tables behind a 64-bit entry point, we have no item
   132			 * count and no exact table length, so stop on end-of-table
   133			 * marker. For tables behind a 32-bit entry point, we have
   134			 * seen OEM structures behind the end-of-table marker on
   135			 * some systems, so don't trust it.
   136			 */
   137			if (!dmi_num && dm->type == DMI_ENTRY_END_OF_TABLE)
   138				break;
   139		}
   140	
   141		/* Trim DMI table length if needed */
   142		if (dmi_len > data - buf)
   143			dmi_len = data - buf;
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
