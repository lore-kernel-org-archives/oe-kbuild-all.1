Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7622F7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 01:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680053797; x=1711589797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CrKnf0P1mxA/GWpGqcTzGUUqeIzK/E/zYrhKozdcskQ=;
  b=FHbDGVVe68PYPqAfGafbKE2SqkNKkmnGDULkLQMubVNL2GBECYsPeo43
   IlgH7/duiFTIk5zY6HsksjaNIudLFLZjEFP7MqWNLEBHZSj26Nwh4hf2N
   jVbYj/D04zUJiwOZpwBKMV8AiTtgvem+oM55mTDgWKAYZanHHW3JgM9A4
   vTYTWuGOrFvFDysZobHLKJwKQS8slKzmB6IoWtS4rI8tPKFq6+a50to4F
   7XZlURw5rjSPgyDUKVA37mOJ6Q+gg5nBBBBPPmUcePwraPbjE4c/2Gvd3
   NYld6D/3RML3YZnWq5SID7ALgox8YV3q9+pHLiMd95bUTk2WQ8n6U8A3O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="427020230"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="427020230"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 18:36:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="753394808"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="753394808"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 18:36:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phKjk-000J3f-2o;
	Wed, 29 Mar 2023 01:36:28 +0000
Date: Wed, 29 Mar 2023 09:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/110-smc 1/21] lib/vsprintf.c:1779:30: sparse:
 sparse: cast to restricted __le32
Message-ID: <202303290920.3ZtfaQpH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   eb69bd05e1a21898f260c0db32a3c7b122b7153f
commit: 4e41318d85e8b7189160e927ff386ff6a7deea7e [1/21] lib/vsprintf: Add support for generic FOURCCs by extending %p4cc
config: m68k-randconfig-s042-20230326 (https://download.01.org/0day-ci/archive/20230329/202303290920.3ZtfaQpH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/AsahiLinux/linux/commit/4e41318d85e8b7189160e927ff386ff6a7deea7e
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/110-smc
        git checkout 4e41318d85e8b7189160e927ff386ff6a7deea7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290920.3ZtfaQpH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/vsprintf.c:1779:30: sparse: sparse: cast to restricted __le32
>> lib/vsprintf.c:1779:30: sparse: sparse: cast to restricted __le32
>> lib/vsprintf.c:1779:30: sparse: sparse: cast to restricted __le32
>> lib/vsprintf.c:1779:30: sparse: sparse: cast to restricted __le32
>> lib/vsprintf.c:1779:30: sparse: sparse: cast to restricted __le32
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
