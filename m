Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC362C028F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773803602; cv=none; b=s388y0m6yGXyZbIBKqm8xFm7Dd+ziX3CMhlgkB6jVTXAmTfdLR+9d5wUBMd+5crXko31BUL8s2cKbEU6A7Q7jZM9jHoQBxYBoWXyTOvr+oCmrHkfTGejfg96woqez6or4I0+5OX9f/A1uZIvL73dA2uqAdC9e2zlnT2+gx5zbYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773803602; c=relaxed/simple;
	bh=hHOEHqUwcZGxTVNb2X296byxZcxGvwHs2HmAW30Yt8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hb859Y4yPyfJAndB9uhSqTCVZ8JxnJYRVa5gW5sPKHhtXbc++wqmcsNzkHLFTcpYwEqpjcLXVhg+oBE1bP56lIa2eOGspxRnf+g+DskL+ynwjJ6zYF/8wddUcR9/1ULUXadfrxOhnWc0QWC6NYqlYZJPiM64AHsIYuiJL3CK8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkrK4vCS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkrK4vCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773803601; x=1805339601;
  h=date:from:to:cc:subject:message-id;
  bh=hHOEHqUwcZGxTVNb2X296byxZcxGvwHs2HmAW30Yt8Y=;
  b=mkrK4vCSDHDoF7LiRdSMXIZIqUqJDrwv+c2/KvI5TL/IhiG9JnGw7kNO
   pqIFXF4S9i1wMDzxMo2BaucZq2aA4daMFLDODKt0QTGbX0uFZZ72o71Yw
   DRM0/C5cWtcVsqVLELMIQX6yVjoXhtnxjxhMMcQ8eyWCSVZiDcoN7ax2u
   yOMFHGRD68VM7tgIF6KKsecYWCrucsjg8DqjPplFV4F460V3QX8T8qx6y
   t1ND7Ap15CGoJexrdLXK9u+RYP38gZOoTqmENYTKaXEIjMTxeRB+9+MMl
   x0W3l4RUoeErciCqj35qmKv0ank9XaiV6rxpx120n2/tBsNuLxMgdIFJJ
   g==;
X-CSE-ConnectionGUID: Yu52OKrFR2mBB3/ScW79XQ==
X-CSE-MsgGUID: OcxB+uyURjybApa5urOhJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74971353"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74971353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 20:13:18 -0700
X-CSE-ConnectionGUID: J3Q4bxocT62wCU8Rr5fMzQ==
X-CSE-MsgGUID: ZJGJFqGPS1yigd2zW8jWiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="218094385"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Mar 2026 20:13:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2hLN-000000002PP-3Dw2;
	Wed, 18 Mar 2026 03:13:13 +0000
Date: Wed, 18 Mar 2026 11:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [linux-next:master 6162/6828]
 drivers/gpu/drm/xe/xe_lrc.c:1921:40: error: format '%lx' expects argument of
 type 'long unsigned int', but argument 3 has type 'int'
Message-ID: <202603181152.94qXoLq4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 65fcf19cb36bf43c893c3444d5bd120006cb843d [6162/6828] drm/xe: Include running dword offset in default_lrc dumps
config: i386-randconfig-004-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181152.94qXoLq4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181152.94qXoLq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181152.94qXoLq4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_lrc.c: In function 'dump_mi_command':
>> drivers/gpu/drm/xe/xe_lrc.c:1921:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1921 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
         |                                    ~~~~^
         |                                        |
         |                                        long unsigned int
         |                                    %#5x
    1922 |                            dw - num_noop - start, inst_header, num_noop);
         |                            ~~~~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          int
   drivers/gpu/drm/xe/xe_lrc.c:1926:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1926 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_TOPOLOGY_FILTER\n",
         |                                    ~~~~^
         |                                        |
         |                                        long unsigned int
         |                                    %#5x
    1927 |                            dw - start, inst_header);
         |                            ~~~~~~~~~~   
         |                               |
         |                               int
   drivers/gpu/drm/xe/xe_lrc.c:1931:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1931 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_BATCH_BUFFER_END\n",
         |                                    ~~~~^
         |                                        |
         |                                        long unsigned int
         |                                    %#5x
    1932 |                            dw - start, inst_header);
         |                            ~~~~~~~~~~   
         |                               |
         |                               int
   drivers/gpu/drm/xe/xe_lrc.c:1946:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1946 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_IMM: %d regs\n",
         |                                    ~~~~^
         |                                        |
         |                                        long unsigned int
         |                                    %#5x
    1947 |                            dw - start, inst_header, (numdw - 1) / 2);
         |                            ~~~~~~~~~~   
         |                               |
         |                               int
   drivers/gpu/drm/xe/xe_lrc.c:1949:48: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1949 |                         drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010x\n",
         |                                            ~~~~^
         |                                                |
         |                                                long unsigned int
         |                                            %#5x
    1950 |                                    &dw[i] - start, dw[i], dw[i + 1]);
         |                                    ~~~~~~~~~~~~~~
         |                                           |
         |                                           int
   drivers/gpu/drm/xe/xe_lrc.c:1954:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1954 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
         |                                    ~~~~^
         |                                        |
         |                                        long unsigned int
         |                                    %#5x
    1955 |                            dw - start, inst_header,
         |                            ~~~~~~~~~~   
         |                               |
         |                               int
   drivers/gpu/drm/xe/xe_lrc.c:1959:48: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1959 |                         drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010llx\n",
         |                                            ~~~~^
         |                                                |
         |                                                long unsigned int
         |                                            %#5x
    1960 |                                    dw - start,
         |                                    ~~~~~~~~~~   
         |                                       |
         |                                       int
   drivers/gpu/drm/xe/xe_lrc.c:1963:48: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1963 |                         drm_printf(p, "LRC[%#5lx]  =  - %*ph (%s)\n",
         |                                            ~~~~^
         |                                                |
         |                                                long unsigned int
         |                                            %#5x
    1964 |                                    dw - start, (int)sizeof(u32) * (numdw - 1),
         |                                    ~~~~~~~~~~   
         |                                       |
         |                                       int
   drivers/gpu/drm/xe/xe_lrc.c:1969:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1969 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_FORCE_WAKEUP\n",
         |                                    ~~~~^
         |                                        |
         |                                        long unsigned int
         |                                    %#5x
    1970 |                            dw - start, inst_header);
         |                            ~~~~~~~~~~   
         |                               |
         |                               int
   drivers/gpu/drm/xe/xe_lrc.c:1974:40: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Werror=format=]
    1974 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] unknown MI opcode %#x, likely %d dwords\n",
         |                                    ~~~~^
         |                                        |
         |                                        long unsigned int
         |                                    %#5x
    1975 |                            dw - start, inst_header, opcode, numdw);
         |                            ~~~~~~~~~~   
         |                               |
         |                               int
   drivers/gpu/drm/xe/xe_lrc.c: In function 'dump_gfxpipe_command':


vim +1921 drivers/gpu/drm/xe/xe_lrc.c

  1902	
  1903	static int dump_mi_command(struct drm_printer *p,
  1904				   struct xe_gt *gt,
  1905				   u32 *start,
  1906				   u32 *dw,
  1907				   int remaining_dw)
  1908	{
  1909		u32 inst_header = *dw;
  1910		u32 numdw = instr_dw(inst_header);
  1911		u32 opcode = REG_FIELD_GET(MI_OPCODE, inst_header);
  1912		int num_noop;
  1913	
  1914		/* First check for commands that don't have/use a '# DW' field */
  1915		switch (inst_header & MI_OPCODE) {
  1916		case MI_NOOP:
  1917			num_noop = 1;
  1918			while (num_noop < remaining_dw &&
  1919			       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
  1920				num_noop++;
> 1921			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
  1922				   dw - num_noop - start, inst_header, num_noop);
  1923			return num_noop;
  1924	
  1925		case MI_TOPOLOGY_FILTER:
  1926			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_TOPOLOGY_FILTER\n",
  1927				   dw - start, inst_header);
  1928			return 1;
  1929	
  1930		case MI_BATCH_BUFFER_END:
  1931			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_BATCH_BUFFER_END\n",
  1932				   dw - start, inst_header);
  1933			/* Return 'remaining_dw' to consume the rest of the LRC */
  1934			return remaining_dw;
  1935		}
  1936	
  1937		/*
  1938		 * Any remaining commands include a # of dwords.  We should make sure
  1939		 * it doesn't exceed the remaining size of the LRC.
  1940		 */
  1941		if (xe_gt_WARN_ON(gt, numdw > remaining_dw))
  1942			numdw = remaining_dw;
  1943	
  1944		switch (inst_header & MI_OPCODE) {
  1945		case MI_LOAD_REGISTER_IMM:
  1946			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_IMM: %d regs\n",
  1947				   dw - start, inst_header, (numdw - 1) / 2);
  1948			for (int i = 1; i < numdw; i += 2)
  1949				drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010x\n",
  1950					   &dw[i] - start, dw[i], dw[i + 1]);
  1951			return numdw;
  1952	
  1953		case MI_LOAD_REGISTER_MEM & MI_OPCODE:
  1954			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_LOAD_REGISTER_MEM: %s%s\n",
  1955				   dw - start, inst_header,
  1956				   dw[0] & MI_LRI_LRM_CS_MMIO ? "CS_MMIO " : "",
  1957				   dw[0] & MI_LRM_USE_GGTT ? "USE_GGTT " : "");
  1958			if (numdw == 4)
  1959				drm_printf(p, "LRC[%#5lx]  =  - %#6x = %#010llx\n",
  1960					   dw - start,
  1961					   dw[1], ((u64)(dw[3]) << 32 | (u64)(dw[2])));
  1962			else
  1963				drm_printf(p, "LRC[%#5lx]  =  - %*ph (%s)\n",
  1964					   dw - start, (int)sizeof(u32) * (numdw - 1),
  1965					   dw + 1, numdw < 4 ? "truncated" : "malformed");
  1966			return numdw;
  1967	
  1968		case MI_FORCE_WAKEUP:
  1969			drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_FORCE_WAKEUP\n",
  1970				   dw - start, inst_header);
  1971			return numdw;
  1972	
  1973		default:
  1974			drm_printf(p, "LRC[%#5lx]  =  [%#010x] unknown MI opcode %#x, likely %d dwords\n",
  1975				   dw - start, inst_header, opcode, numdw);
  1976			return numdw;
  1977		}
  1978	}
  1979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
