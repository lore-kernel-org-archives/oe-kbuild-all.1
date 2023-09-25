Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920CE224F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 21:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695677575; x=1727213575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESADFklupkb/a+0xrhLZ15RH96lN8Sr7jKfrZrXJCq0=;
  b=Irq/TC5QvGd1J/QvVghKlzhehqc4kD0HU4/FCQJDgxs5pAxJSfjXe5Oe
   A7ZWVmOO9/tIg6CePPz5YhkEgoyHtnfYQWGtSrBrvr/LJ1FOS+d1WxAX/
   WKOlZb6yFZclIBedsE6WhCOuUU7YpqPs8zwkM+JHLvqBrT3KY8RUM2YGE
   71Zd8Tl1RytM/yCv/RplX6bDAxaKt7eSDovNN5YHxEPD8UwLgtNclsN7p
   R+VZ7kxWFlpp5Cb5xecctzyHskOGZLpdlO8kdjI5pv4+cH3DsPnlEt36l
   1f+RhaK7h4F6lpTg3AqEzO+aD6ecRuzjjUMdvz2I3aoNfP7+3Hb6Eve1h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385243128"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="385243128"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 14:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783679562"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="783679562"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 14:32:53 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qktCF-00022N-0k;
	Mon, 25 Sep 2023 21:32:51 +0000
Date: Tue, 26 Sep 2023 05:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/110-smc 1/23] lib/vsprintf.c:1779:30: sparse:
 sparse: cast to restricted __le32
Message-ID: <202309260543.Ml6zBSx6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   9a5dd94db698583243613e768d4b6162a7a6f084
commit: 1d391718368ba499b3aa0a74fe74ec8998c1c61b [1/23] lib/vsprintf: Add support for generic FOURCCs by extending %p4cc
config: i386-randconfig-061-20230925 (https://download.01.org/0day-ci/archive/20230926/202309260543.Ml6zBSx6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260543.Ml6zBSx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260543.Ml6zBSx6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/vsprintf.c:1779:30: sparse: sparse: cast to restricted __le32
>> lib/vsprintf.c:1782:30: sparse: sparse: cast to restricted __be32

vim +1779 lib/vsprintf.c

  1753	
  1754	static noinline_for_stack
  1755	char *fourcc_string(char *buf, char *end, const u32 *fourcc,
  1756			    struct printf_spec spec, const char *fmt)
  1757	{
  1758		char output[sizeof("0123 little-endian (0x01234567)")];
  1759		char *p = output;
  1760		unsigned int i;
  1761		bool pix_fmt = false;
  1762		u32 orig, val;
  1763	
  1764		if (fmt[1] != 'c')
  1765			return error_string(buf, end, "(%p4?)", spec);
  1766	
  1767		if (check_pointer(&buf, end, fourcc, spec))
  1768			return buf;
  1769	
  1770		orig = get_unaligned(fourcc);
  1771		switch (fmt[2]) {
  1772		case 'h':
  1773			val = orig;
  1774			break;
  1775		case 'r':
  1776			val = orig = swab32(orig);
  1777			break;
  1778		case 'l':
> 1779			val = orig = le32_to_cpu(orig);
  1780			break;
  1781		case 'b':
> 1782			val = orig = be32_to_cpu(orig);
  1783			break;
  1784		case 'c':
  1785			/* Pixel formats are printed LSB-first */
  1786			val = swab32(orig & ~BIT(31));
  1787			pix_fmt = true;
  1788			break;
  1789		default:
  1790			return error_string(buf, end, "(%p4?)", spec);
  1791		}
  1792	
  1793		for (i = 0; i < sizeof(u32); i++) {
  1794			unsigned char c = val >> ((3 - i) * 8);
  1795	
  1796			/* Print non-control ASCII characters as-is, dot otherwise */
  1797			*p++ = isascii(c) && isprint(c) ? c : '.';
  1798		}
  1799	
  1800		if (pix_fmt) {
  1801			*p++ = ' ';
  1802			strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
  1803			p += strlen(p);
  1804		}
  1805	
  1806		*p++ = ' ';
  1807		*p++ = '(';
  1808		p = special_hex_number(p, output + sizeof(output) - 2, orig, sizeof(u32));
  1809		*p++ = ')';
  1810		*p = '\0';
  1811	
  1812		return string(buf, end, output, spec);
  1813	}
  1814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
