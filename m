Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F357B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 02:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677465498; x=1709001498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+AI37mSBn6bMXpeaDBkxu3wQBSF9eANFiR8dsqeF9w=;
  b=i4/ziOkQ+gM4kUo7CbN9U1PmSzPWzYgkZDtxSuFv84GZDNnrWOb5wwle
   Rg9///2UMeDFurZI7lP3nDh2f3C5RZSLZlYFDqWlBLe3FeQphzxdrJqgO
   CjrjER12UsM2K5cqDO1hJGVzjCrbuoaF92Ae6LoY4IB41FwKv7G3wmmHW
   LAd3bq0WB2hPa5zV/1xGgSK4ZNOiY8tU/bMzU0CL5i48p8fJ4YaV10a2/
   rC7w3wIFD3QDRgBQZ0ltMk8hwFHlxTcFrHu+s0yEaPhbltDOzvFPcFDzF
   xGrUyQ/h7Tm346qJc03n7hsI5KZizyfW+4K36ktyoSrke/5NorGEvDLne
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="317565627"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="317565627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 18:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="705967504"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="705967504"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Feb 2023 18:38:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWTP5-00041v-3A;
	Mon, 27 Feb 2023 02:38:15 +0000
Date: Mon, 27 Feb 2023 10:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/110-smc 1/21] lib/vsprintf.c:1779:30: sparse:
 sparse: cast to restricted __le32
Message-ID: <202302271000.e6GYyLfO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   5ae10a7e031c3e261c2f80d41b8d8b55cdb2b087
commit: 22a5b325ff3e2126488e6001d307030f71018c2f [1/21] lib/vsprintf: Add support for generic FOURCCs by extending %p4cc
config: s390-randconfig-s052-20230226 (https://download.01.org/0day-ci/archive/20230227/202302271000.e6GYyLfO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/AsahiLinux/linux/commit/22a5b325ff3e2126488e6001d307030f71018c2f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/110-smc
        git checkout 22a5b325ff3e2126488e6001d307030f71018c2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271000.e6GYyLfO-lkp@intel.com/

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
https://github.com/intel/lkp-tests
