Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771396;
	b=jpYE+YsaUYaQtqOnlwwmAtcKJN2qUQxNOmp0UOsbH9xb2GP2LvYGrC33psVTXeDekIMY
	 mR9hlCqT7TxufAssJcBhT499Rpwzl6DXvg75TN9qBC+rW0D4otEMLG89CBJc6jqb+RMLn
	 jLtugpQpFbYRje/V3zUdogpQ4mONnDa+l1UF3ZSfReuEX1n6ZgFfvUbUCY91uL6D5/I1j
	 rYknsSXqY5ftOxMRVEXN/xFAin+vkIA5HQn6KGZ4ubhY7gGXOVROuWYuiq7fuDh47owG+
	 ZnS11AOZI3R2dIe0n/fEHYD4gCcvhIsevdaZWhHoXxudzG6Rpm2qJ9HL6UhyM3dKhdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771396;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LRiqcDYomwRNBIRfWyBfrX4ZC6v92zS0w8W/F0XryyQ=;
	b=mrOgCFALr3KDCXC3B0ePoeVyeJ+OCXoRumqXnQ1D2YEQAP7BRefgR6RgEc2t9BkMRj6z
	 jnSGEocP31Gh0DPg5jxY44XNcdZAG9y7ps5tM7O5fm9F1VhcKTn+OtAWi8HEizDGLYSKs
	 JMa5AMWKJZWTrbL/98ofJ2+dXAo0Jeb0UzQ1TFq2gzQ3Dq2RqzUNvv5EhRbNYr9HGZly7
	 Y5ObtECvpLxvZPKnpiyUP+b67aa3hiAInEbYKTYsOJHQz1oR0Whmyb0wITF+d9Ugvy80B
	 c6MBq4awSaQBymSqZWMQTdX5C4kxiFWwMjjfFWYShb8QQLM8XTJRWXmGdDXztxvlu9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZIVWemKq;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C501606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 16:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C501606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZIVWemKq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792771396; x=1824307396;
  h=date:from:to:cc:subject:message-id;
  bh=NMrR1aKJgjsfJoeSHYRkZNsWnaTGwcGAwveLiD67edw=;
  b=ZIVWemKq5rwMl0HPFEGj38qI27N1DyFoYWZSD1PwcAR7RL0LwD2kT9sm
   g+ZINRhfvw6lGh/VmKfVEYpwOIQzmRqF8yQt0pN9qLf+CXV4yBw+6lZ+l
   cOgFtpecx+dS0D/xRwIzHdkApUxysOkQRPde6MNmem6lI/b3+tW1bvDI1
   RO/RD1Shexmn6tz5578hyuJ56mYy164CaBoB53rmNS5RIya/GWty8JkXa
   dYe+DwfsCnP3fNaM815pZXDkqsIXBRLE+sPvU9e/hP4B6AOXlpwUU+VgL
   usd3Nt9uswfgvYqXd1DDT9hIha+e8PEdJKYVRYWEXVn4A8+E4D6G+5E3t
   g==;
X-CSE-ConnectionGUID: v93x7HO/S5y5kMNdS+LVmA==
X-CSE-MsgGUID: mNjYBRwDQqi7bmdvCDIl0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1414165"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1414165"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 09:03:15 -0700
X-CSE-ConnectionGUID: u95ukQGrSk+B1jZ0ugeReA==
X-CSE-MsgGUID: YTlqQar9Q92thhRqMCrmbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4173910"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2026 09:03:14 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKHjb-000000000e3-3qeX;
	Fri, 23 Oct 2026 16:03:11 +0000
Date: Fri, 23 Oct 2026 18:02:32 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandro Calo <alexandro.calo@nozominetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [linux-next:master 8048/19853] fs/ntfs3/dir.c:37
 ntfs_utf16_to_nls() warn: inconsistent indenting
Message-ID: <202610231732.hPkZWsKP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
commit: eff11b5a1eacea8d17fa50ad0b1c2ef405341f2c [8048/19853] fs/ntfs3: Fix OOB write if ret == buf_len in ntfs_utf16_to_nls()
config: x86_64-randconfig-2200-20261022 (https://download.01.org/0day-ci/archive/20261023/202610231732.hPkZWsKP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231732.hPkZWsKP-lkp@intel.com/

smatch warnings:
fs/ntfs3/dir.c:37 ntfs_utf16_to_nls() warn: inconsistent indenting

vim +37 fs/ntfs3/dir.c

    17	
    18	/* Convert little endian UTF-16 to NLS string. */
    19	int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
    20			      u8 *buf, int buf_len)
    21	{
    22		int ret, warn;
    23		u8 *op;
    24		struct nls_table *nls = sbi->options->nls;
    25	
    26		static_assert(sizeof(wchar_t) == sizeof(__le16));
    27	
    28		if (buf_len <= 0)
    29			return -EINVAL;
    30	
    31		buf_len -= 1;
    32	
    33		if (!nls) {
    34			/* UTF-16 -> UTF-8 */
    35			ret = utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
    36					      buf, buf_len);
  > 37	        if (ret >= buf_len) {
    38	            ret = buf_len-1;
    39	        }
    40			buf[ret] = '\0';
    41			return ret;
    42		}
    43	
    44		op = buf;
    45		warn = 0;
    46	
    47		while (len--) {
    48			u16 ec;
    49			int charlen;
    50			char dump[5];
    51	
    52			if (buf_len < NLS_MAX_CHARSET_SIZE) {
    53				ntfs_warn(sbi->sb,
    54					  "filename was truncated while converting.");
    55				break;
    56			}
    57	
    58			ec = le16_to_cpu(*name++);
    59			charlen = nls->uni2char(ec, op, buf_len);
    60	
    61			if (charlen > 0) {
    62				op += charlen;
    63				buf_len -= charlen;
    64				continue;
    65			}
    66	
    67			*op++ = '_';
    68			buf_len -= 1;
    69			if (warn)
    70				continue;
    71	
    72			warn = 1;
    73			hex_byte_pack(&dump[0], ec >> 8);
    74			hex_byte_pack(&dump[2], ec);
    75			dump[4] = 0;
    76	
    77			ntfs_err(sbi->sb, "failed to convert \"%s\" to %s", dump,
    78				 nls->charset);
    79		}
    80	
    81		*op = '\0';
    82		return op - buf;
    83	}
    84	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
