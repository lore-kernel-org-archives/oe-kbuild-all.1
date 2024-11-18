Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85319AD7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731938862; cv=none; b=T3NPf44ehpxBH6YjcNwyXBE1tMKSwAE2YWDYu7V74pgK4YH3Qz3Fanp7fGWXTNJzkQ86dC7tXOvDGVGpFLNtczzoCuKmaG1Gu0vqAJdRkkaYW9aTi3Fh10aH2PwLdEIBtLdwArDagwMAvGOUBQV/HRuG6u+HJCyE5eLQbbr1LK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731938862; c=relaxed/simple;
	bh=gjckx+TTX2pJQlwDO4w6jtP45mzpfFsun1oCBg00XwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+upVBzvKYPa65CdWCpnTPVYM4mOhp+K1LVN6NijNOCRfcIu8lpkmIfo0IZNVCqMSgEDKVKF5T2Pdd0/t75218yO2+edkvPI+SUKnplB8Okiya/WBO2+PSimWyVq00r1Emu7okT94YCVZFyZLZ3HKH3B+fI1J9oYWMQjScyudss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6astGKj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6astGKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731938862; x=1763474862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjckx+TTX2pJQlwDO4w6jtP45mzpfFsun1oCBg00XwA=;
  b=Z6astGKjvWa7dR/dgrdVgTnu/OjvEHPEJONLVnUIoahzM/3NlT5AKlCv
   fFewzpmM5hk3b0x1AZo3dT3dnpW4GflUUfmy2N96378ZUbyQste+pXimj
   ZdK4+rggcIr582XSDPx7g4emAZgS1ZPeJWpHOgPM5idfdyabAlwBkuw+s
   9feopRTpAOo8VHuQRUEnEz5dW9Ovyrx4vReItV0Ts+gDJHxl2Efj9IEOZ
   E8o0LQa3tsYGKT17/S1LiIRY4iXj7HU48mmCVQbslZ4C1e0l0WJsFzeEm
   M68Yk0rQjrUrew+qv0mVxhqntTjnj5Q1K0ga6NSF1s+hIDwu7gqmpwGqs
   A==;
X-CSE-ConnectionGUID: kxJ5m53OTRO9Vj6jQkN5fA==
X-CSE-MsgGUID: vQje1u5bTs6gB1H6XRQtmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32050107"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32050107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 06:06:39 -0800
X-CSE-ConnectionGUID: /4GZrlyLRX6JxD4rcLa9Bw==
X-CSE-MsgGUID: tQe3ssl2TL6pSo51yovRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89154594"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 06:06:37 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD2Oh-0002SL-01;
	Mon, 18 Nov 2024 14:06:35 +0000
Date: Mon, 18 Nov 2024 22:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/110-smc 1/33] lib/vsprintf.c:1781:30: sparse:
 sparse: cast to restricted __le32
Message-ID: <202411182102.vZhztC24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   0c434f34a84878276c20a52f36cf95eea749209b
commit: bea1d9ad0018702aa49d2b0fed873201d749753b [1/33] lib/vsprintf: Add support for generic FOURCCs by extending %p4cc
config: nios2-randconfig-r111-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182102.vZhztC24-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411182102.vZhztC24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182102.vZhztC24-lkp@intel.com/

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
