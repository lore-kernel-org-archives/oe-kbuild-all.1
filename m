Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4FF510
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 05:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762061798; cv=none; b=TpOTCzT7eSAytJwzdnqZp1ZyHwGHBXIeTvCbn6ICmh/JXVc5iXHqBjPRrGl70e4UrjmMqMSz9Bj2Pft1jZA8q9lBlwdBmJdjIgP9Mk51cH4pckU/cWX6aFX8c9ZAQDzYqDxgPC6SW2rn+pbpWdQ0Ptr6oStUSjgZDiG7NTRL3k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762061798; c=relaxed/simple;
	bh=P4zSYz6qqEucl7ISwKBUzNynAg6PeT1LAtogaKcvv7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLrLNyxf37q9kgIkxPHqDBTgjLPLlkNnu089fuywCRozkXaMtOw2drZGHjNI8bZFnCjMy2RhnaJDhhQAXZWuFMh/oQdBmicF5Nh5ptfAb0Wz+AasqxG5eFSnBdU8uFeBl7TgoRhXb0HaUukCFTbtRrlCknEuy/YkOcrDjHDdkaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL0Gh5Xu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL0Gh5Xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762061796; x=1793597796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P4zSYz6qqEucl7ISwKBUzNynAg6PeT1LAtogaKcvv7Y=;
  b=BL0Gh5Xu3q9vQ/GSj1pROCzgmdX4OWMIZPrUknptK0huXVJElIDhjCVG
   eyd41nxVsdUVdB+AOMdtWLTuYZ3WKdsFoc85KVuwDU7qBYZc9+sTZcLS1
   vj+vZa555XLGXVIH7E5CrPjMBWwQdvGANhcznDxTV1QUNKY26l8F8GOe3
   pcRhD3nTOCghd7091Yr+K/cQTlrWbxDMshHz4fiE3XbqvnmB/j34q44Gc
   ArvJy6KDHy7+VDBwnz23eWPETLHx+OI03bteGj3tV+16t84YLK8okkdX5
   LjX1KL3W2/UGcgI6/ODFWP9WH8FSB3c6ZvwwE14ctIbKqyz7eMVvE8Txx
   A==;
X-CSE-ConnectionGUID: HUmeb85yQU2VXpP2aD3IuQ==
X-CSE-MsgGUID: IhJGQbopS0me/DIs9kfPAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="51743092"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="51743092"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 22:36:36 -0700
X-CSE-ConnectionGUID: PjCEx6rIRT+2XMU+NgASuQ==
X-CSE-MsgGUID: uvK4NMb6SzWEXbUOKrQcNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186459633"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2025 22:36:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFQlU-000P1g-1L;
	Sun, 02 Nov 2025 05:36:32 +0000
Date: Sun, 2 Nov 2025 13:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>
Subject: [akpm-mm:mm-nonmm-unstable 87/91] lib/base64.c:36:28: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202511021343.107utehN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   97751db460a7c6988b2ab988d9889d4309f9cc8c
commit: 5b693a7ad2acfa88e8ab0a047335ea4c94fecdb1 [87/91] lib/base64: optimize base64_decode() with reverse lookup tables
config: m68k-randconfig-r123-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021343.107utehN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/base64.c:36:28: sparse: sparse: Initializer entry defined twice
   lib/base64.c:36:28: sparse:   also defined here
   lib/base64.c:37:25: sparse: sparse: Initializer entry defined twice
   lib/base64.c:37:25: sparse:   also defined here

vim +36 lib/base64.c

    33	
    34	static const s8 base64_rev_maps[][256] = {
    35		[BASE64_STD] = BASE64_REV_INIT('+', '/'),
  > 36		[BASE64_URLSAFE] = BASE64_REV_INIT('-', '_'),
    37		[BASE64_IMAP] = BASE64_REV_INIT('+', ',')
    38	};
    39	/**
    40	 * base64_encode() - Base64-encode some binary data
    41	 * @src: the binary data to encode
    42	 * @srclen: the length of @src in bytes
    43	 * @dst: (output) the Base64-encoded string.  Not NUL-terminated.
    44	 * @padding: whether to append '=' padding characters
    45	 * @variant: which base64 variant to use
    46	 *
    47	 * Encodes data using the selected Base64 variant.
    48	 *
    49	 * Return: the length of the resulting Base64-encoded string in bytes.
    50	 */
    51	int base64_encode(const u8 *src, int srclen, char *dst, bool padding, enum base64_variant variant)
    52	{
    53		u32 ac = 0;
    54		int bits = 0;
    55		int i;
    56		char *cp = dst;
    57		const char *base64_table = base64_tables[variant];
    58	
    59		for (i = 0; i < srclen; i++) {
    60			ac = (ac << 8) | src[i];
    61			bits += 8;
    62			do {
    63				bits -= 6;
    64				*cp++ = base64_table[(ac >> bits) & 0x3f];
    65			} while (bits >= 6);
    66		}
    67		if (bits) {
    68			*cp++ = base64_table[(ac << (6 - bits)) & 0x3f];
    69			bits -= 6;
    70		}
    71		if (padding) {
    72			while (bits < 0) {
    73				*cp++ = '=';
    74				bits += 2;
    75			}
    76		}
    77		return cp - dst;
    78	}
    79	EXPORT_SYMBOL_GPL(base64_encode);
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
