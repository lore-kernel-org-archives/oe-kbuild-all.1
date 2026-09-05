Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB0157487
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 01:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573287; cv=none; b=YrVGWJ+/CbL3O/XMXnD/zpTKrHfC5YJFicCMrCr+0d2toH6ZLlWH24bwxBucrdNzYX1du6wR8gibrnLtcp3Y80ZkOu/puHy0N3WieJ30PBMiglRKX5+zqVaJRwG+sDYr3RgE7vMSqJlVb/lwvuarCezXnxSWvCwgZ0KhDPkpIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573287; c=relaxed/simple;
	bh=6ECkFPzCQcSUHEu68kBjSqc+EBa/D1pDwugYkhl5PNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HEJsAcYe+uiYeRqJ6sSdH3ZmLDpIt1JrmV/eoP+E7AKDTzcffTRTHD9cQwS1VOGYvNC4qCXs//Q5oKw1zQZ7sYQ6JIPlQ91niJzQWwv8OhDl8RJuZ0WG0zKxFOhS3EQh1a0CxYdUEBpLdViZ4r1PAqN+wG1zttnqL4oqt3Z8M5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPD4NqWJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPD4NqWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788573286; x=1820109286;
  h=date:from:to:cc:subject:message-id;
  bh=6ECkFPzCQcSUHEu68kBjSqc+EBa/D1pDwugYkhl5PNI=;
  b=kPD4NqWJEQTgeaATANib+fN+AFPKJzMymE17cpM4G/7L9qGM+zYaEw2o
   PJ322n8bVA6XbJ7CmQeBGA4AkfXVyLqryu9oBNoEmYIUFkAeNnkmMQzqT
   m1haicPBNwwcCTjLUj7XDmSnTNGzIkEOl2En8hc3AM6tQkrWW8qdEatSU
   jHVUaKXe2i6kVxFMlPreJn8dHbE4sXUwpyntkoFsKSMgEwC+ouN5UZ9kp
   LjLV7MWxU62bW0CjOVLsVQhOQaRKwFAhdpqvWxmiSQeAq17laHrt7+vO3
   n+YCPymFALx9XnBBAMblWvawqRW43gkU2ZM1B8I9+rkmepPnHli7EU/Dm
   g==;
X-CSE-ConnectionGUID: xhu1uulwRryDt8KgY8KPWA==
X-CSE-MsgGUID: y0NoppYhRcOB9P/rrZ9qUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99409776"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99409776"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 18:54:46 -0700
X-CSE-ConnectionGUID: 4Orrl1Z3RsW/yWRcsPejVg==
X-CSE-MsgGUID: fMt8CnW5Tbi4pD9ghzBBmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270161077"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2026 18:54:44 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2fc9-00000000Abi-3TKL;
	Sat, 05 Sep 2026 01:54:41 +0000
Date: Sat, 05 Sep 2026 09:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-libstub-guid-conversion 4/4]
 drivers/firmware/efi/libstub/printk.c:81:43: error: unknown type name
 'efi_char_16_t'; did you mean 'efi_char16_t'?
Message-ID: <202609050928.2MOuUIOl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-libstub-guid-conversion
head:   5701341f80f05258b56124f47fdde4e10ca3e2aa
commit: 5701341f80f05258b56124f47fdde4e10ca3e2aa [4/4] efi/libstub: Factor out utf8-to-utf16 conversion from efi_puts()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260905/202609050928.2MOuUIOl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050928.2MOuUIOl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050928.2MOuUIOl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/printk.c:81:43: error: unknown type name 'efi_char_16_t'; did you mean 'efi_char16_t'?
      81 | size_t efi_utf8_to_utf16(const char *str, efi_char_16_t *buf, size_t lim)
         |                                           ^~~~~~~~~~~~~
         |                                           efi_char16_t
   drivers/firmware/efi/libstub/printk.c: In function 'efi_puts':
>> drivers/firmware/efi/libstub/printk.c:116:24: error: implicit declaration of function 'efi_utf8_to_utf16'; did you mean 'utf8_to_utf32'? [-Wimplicit-function-declaration]
     116 |                 str += efi_utf8_to_utf16(str, buf, ARRAY_SIZE(buf));
         |                        ^~~~~~~~~~~~~~~~~
         |                        utf8_to_utf32
   drivers/firmware/efi/libstub/printk.c: At top level:
>> drivers/firmware/efi/libstub/printk.c:27:5: warning: 'utf8_to_utf32' defined but not used [-Wunused-function]
      27 | u32 utf8_to_utf32(const u8 **s8)
         |     ^~~~~~~~~~~~~


vim +81 drivers/firmware/efi/libstub/printk.c

    25	
    26	static
  > 27	u32 utf8_to_utf32(const u8 **s8)
    28	{
    29		u32 c32;
    30		u8 c0, cx;
    31		size_t clen, i;
    32	
    33		c0 = cx = *(*s8)++;
    34		/*
    35		 * The position of the most-significant 0 bit gives us the length of
    36		 * a multi-octet encoding.
    37		 */
    38		for (clen = 0; cx & 0x80; ++clen)
    39			cx <<= 1;
    40		/*
    41		 * If the 0 bit is in position 8, this is a valid single-octet
    42		 * encoding. If the 0 bit is in position 7 or positions 1-3, the
    43		 * encoding is invalid.
    44		 * In either case, we just return the first octet.
    45		 */
    46		if (clen < 2 || clen > 4)
    47			return c0;
    48		/* Get the bits from the first octet. */
    49		c32 = cx >> clen--;
    50		for (i = 0; i < clen; ++i) {
    51			/* Trailing octets must have 10 in most significant bits. */
    52			cx = (*s8)[i] ^ 0x80;
    53			if (cx & 0xc0)
    54				return c0;
    55			c32 = (c32 << 6) | cx;
    56		}
    57		/*
    58		 * Check for validity:
    59		 * - The character must be in the Unicode range.
    60		 * - It must not be a surrogate.
    61		 * - It must be encoded using the correct number of octets.
    62		 */
    63		if (c32 > 0x10ffff ||
    64		    (c32 & 0xf800) == 0xd800 ||
    65		    clen != (c32 >= 0x80) + (c32 >= 0x800) + (c32 >= 0x10000))
    66			return c0;
    67		*s8 += clen;
    68		return c32;
    69	}
    70	
    71	/**
    72	 * efi_str_to_utf16 - Convert a UTF-8 string to UTF-16
    73	 * @str:	UTF-8 encoded string
    74	 * @buf:	The buffer to store the converted UTF-16
    75	 * @lim:	The size of the buffer in UTF-16 characters
    76	 *
    77	 * Converts as many UTF-8 characters as will fit into the buffer,
    78	 * and terminates it with a NULL wchar. Returns the number of bytes
    79	 * consumed from the input string.
    80	 */
  > 81	size_t efi_utf8_to_utf16(const char *str, efi_char_16_t *buf, size_t lim)
    82	{
    83		const u8 *s8 = (const u8 *)str;
    84		size_t pos = 0;
    85		u32 c32;
    86	
    87		while (*s8 && pos + 2 < lim) {
    88			if (*s8 == '\n')
    89				buf[pos++] = L'\r';
    90			c32 = utf8_to_utf32(&s8);
    91			if (c32 < 0x10000) {
    92				/* Characters in plane 0 use a single word. */
    93				buf[pos++] = c32;
    94			} else {
    95				/*
    96				 * Characters in other planes encode into a surrogate
    97				 * pair.
    98				 */
    99				buf[pos++] = (0xd800 - (0x10000 >> 10)) + (c32 >> 10);
   100				buf[pos++] = 0xdc00 + (c32 & 0x3ff);
   101			}
   102		}
   103		buf[pos] = L'\0';
   104		return s8 - str;
   105	}
   106	
   107	/**
   108	 * efi_puts() - Write a UTF-8 encoded string to the console
   109	 * @str:	UTF-8 encoded string
   110	 */
   111	void efi_puts(const char *str)
   112	{
   113		efi_char16_t buf[128];
   114	
   115		while (*str) {
 > 116			str += efi_utf8_to_utf16(str, buf, ARRAY_SIZE(buf));
   117			efi_char16_puts(buf);
   118		}
   119	}
   120	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
