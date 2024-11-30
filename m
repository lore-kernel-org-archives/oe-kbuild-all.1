Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5786113212A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 04:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732940040; cv=none; b=D8PP8KkqrC658j90Ch4M3gTxFaAvmrfVSxyPM7GUnNZyAw4EKCCUluyPfgp02ffzgNO6y4USlmsV410eFpdINZA5CPCQqZTAu69GvqmvFC+sVlRmlPkmeI+7d4P/tRc4pq+h+egvPDkJoiSWpjJ7mBhvRXJFzGQddpQft3LkUc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732940040; c=relaxed/simple;
	bh=1I1k5aJytMS0aZUg4j5oBcukbkz9lVY/+Cuplahv85U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFK9elWbRGP3RtMyEZTdMUw9qBxGYEOOFcLgMGa8Jfij8NP3pikiyK2gCCsgMAmq3kXbhIJc/qLl6hS4/IjTTYM60xq13eVcqYyprTW+0FC5WHp5z/t8+aDeCCW5c7OZNqpK6mkyNgvTdZKabmTlMGc4dhYI5wWfwxFLA3Tzrgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XO+9Ir0K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XO+9Ir0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732940039; x=1764476039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1I1k5aJytMS0aZUg4j5oBcukbkz9lVY/+Cuplahv85U=;
  b=XO+9Ir0K/dKRyru1uPo+Uumk0H2FxU/OV8MdeQwS4zxNHmS/xhsnB38+
   YrpTwdtv6NWN6JoxZbgI/mbsqKq7YUs5zPQ6gHX+oYqs3EeDNK9f4n/Qw
   B6Z94rAHcBbEVLmfrHY86RIUgmlHKACDYAM1tmh2wPRLfUQlrekxGhasJ
   gaR9dhey+DSLJnYyS+N7B1dBv2lahxUwfgKn9+Qk8MUcct6yn4hXAWpD2
   6NtvpWBKzElXj6Q4inluRD3IPNFTumjHZONSP3cWXAKOAuvI+Lf2pgEOS
   A8RPCv9XuVuH/lDO9ZpREwStpW/CgdK7te51l8dGH16xM4nyjKNipiTcI
   g==;
X-CSE-ConnectionGUID: t+R0NsqRTbqXVfT2UXLfWA==
X-CSE-MsgGUID: Oq5LPVnkRjeXa7wlqNuK1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33027496"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="33027496"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 20:13:58 -0800
X-CSE-ConnectionGUID: E89+XNgGRiyQyZ71qaYFlw==
X-CSE-MsgGUID: HpgKkZpHSben92UVGuGdCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92942845"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2024 20:13:56 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHEri-00004p-0q;
	Sat, 30 Nov 2024 04:13:54 +0000
Date: Sat, 30 Nov 2024 12:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/110-smc 1/33] lib/vsprintf.c:1781:30: sparse:
 sparse: cast to restricted __le32
Message-ID: <202411301233.VHorC7K9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   7206767c881874e25142cc6e862aa43778c051a2
commit: bea1d9ad0018702aa49d2b0fed873201d749753b [1/33] lib/vsprintf: Add support for generic FOURCCs by extending %p4cc
config: nios2-randconfig-r111-20241118 (https://download.01.org/0day-ci/archive/20241130/202411301233.VHorC7K9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411301233.VHorC7K9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301233.VHorC7K9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/vsprintf.c:1781:30: sparse: sparse: cast to restricted __le32
>> lib/vsprintf.c:1784:30: sparse: sparse: cast to restricted __be32
>> lib/vsprintf.c:1784:30: sparse: sparse: cast to restricted __be32
>> lib/vsprintf.c:1784:30: sparse: sparse: cast to restricted __be32
>> lib/vsprintf.c:1784:30: sparse: sparse: cast to restricted __be32
>> lib/vsprintf.c:1784:30: sparse: sparse: cast to restricted __be32
>> lib/vsprintf.c:1784:30: sparse: sparse: cast to restricted __be32

vim +1781 lib/vsprintf.c

  1755	
  1756	static noinline_for_stack
  1757	char *fourcc_string(char *buf, char *end, const u32 *fourcc,
  1758			    struct printf_spec spec, const char *fmt)
  1759	{
  1760		char output[sizeof("0123 little-endian (0x01234567)")];
  1761		char *p = output;
  1762		unsigned int i;
  1763		bool pix_fmt = false;
  1764		u32 orig, val;
  1765	
  1766		if (fmt[1] != 'c')
  1767			return error_string(buf, end, "(%p4?)", spec);
  1768	
  1769		if (check_pointer(&buf, end, fourcc, spec))
  1770			return buf;
  1771	
  1772		orig = get_unaligned(fourcc);
  1773		switch (fmt[2]) {
  1774		case 'h':
  1775			val = orig;
  1776			break;
  1777		case 'r':
  1778			val = orig = swab32(orig);
  1779			break;
  1780		case 'l':
> 1781			val = orig = le32_to_cpu(orig);
  1782			break;
  1783		case 'b':
> 1784			val = orig = be32_to_cpu(orig);
  1785			break;
  1786		case 'c':
  1787			/* Pixel formats are printed LSB-first */
  1788			val = swab32(orig & ~BIT(31));
  1789			pix_fmt = true;
  1790			break;
  1791		default:
  1792			return error_string(buf, end, "(%p4?)", spec);
  1793		}
  1794	
  1795		for (i = 0; i < sizeof(u32); i++) {
  1796			unsigned char c = val >> ((3 - i) * 8);
  1797	
  1798			/* Print non-control ASCII characters as-is, dot otherwise */
  1799			*p++ = isascii(c) && isprint(c) ? c : '.';
  1800		}
  1801	
  1802		if (pix_fmt) {
  1803			*p++ = ' ';
  1804			strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
  1805			p += strlen(p);
  1806		}
  1807	
  1808		*p++ = ' ';
  1809		*p++ = '(';
  1810		p = special_hex_number(p, output + sizeof(output) - 2, orig, sizeof(u32));
  1811		*p++ = ')';
  1812		*p = '\0';
  1813	
  1814		return string(buf, end, output, spec);
  1815	}
  1816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
