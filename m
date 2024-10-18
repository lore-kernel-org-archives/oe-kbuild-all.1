Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984B820E31F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729226228; cv=none; b=l48egjsSGd6Bc6Ty9Ru6rOvvIV53sRYFOvuDuUYzUvhdSpUpduOVt19peXSefNVDhcLY1sr11vfI8p/7J36LweBKfoqQLS/riXuGZ5IGtq9Rm94SJDu4V8Wp6AU5Fe+Z+O7u11X5FVfTnygZs38nDEAGK3m4F1BcGNKflkMdvRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729226228; c=relaxed/simple;
	bh=Rp1BZbTYvhfiOWTq9lO+cJqGeFRRrnODErbErr43OAg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JeYlr0DBEKO4Iaiwmc9LWcgUOn18tR8hPpom1TDHgBTR9p/EjG/iO2aWHnFV5ecJGT1i265dHgdsgzoGYdGDhu3ouCzAqc6KcwCcs2vSI+7get2nXkybeYrT0wRfi2iP5Rgtx3WnLTFlfvydlQvhwx8HkbAdbpBq9/trk8Uybxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5nR5iVR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5nR5iVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729226226; x=1760762226;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Rp1BZbTYvhfiOWTq9lO+cJqGeFRRrnODErbErr43OAg=;
  b=Y5nR5iVRIk23+ZFVPkliDC+zOuX+GVdUCuvGSFrfWsnbMnHdnbFduU65
   6Puy6p5SS/gbPt69ctgTm9/qRJeSTCfg6q1daVkXgMG2zRjyXlodHUe/4
   uoLjmQo4NZ2aM6dv2Fyg7goqI1hHTqHXY4uFvRWeSBJiUM4ZoPa2gxE1z
   UnYQKDIZF2CBg5TLyDDnrUvo3+v66FipbL/oFUuZ9UukH/1WWB0xhS4+V
   WrXxjSIv+GeKVbnkahNlCx65k69SqreWDZ20m1f5sQ2AquolFf988dt2R
   hVC3dR6C0nlYP9RayYvLwzybHSF1oeS118q6uoDd8oWhIpgoCp8UGMNAz
   Q==;
X-CSE-ConnectionGUID: SZXdtgHGQuiBHFY2DIQcsQ==
X-CSE-MsgGUID: dMiV9klsTMisfM63d4+SKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28209047"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="28209047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 21:37:06 -0700
X-CSE-ConnectionGUID: 57hj7KJTQOq0+wQ+OViBXA==
X-CSE-MsgGUID: mubLnLAkRwyXRsh5x/kGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78903171"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2024 21:37:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1ejW-000NGp-1F;
	Fri, 18 Oct 2024 04:37:02 +0000
Date: Fri, 18 Oct 2024 12:36:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 47/107] ds90ub953.c:undefined reference to
 `devm_clk_hw_register'
Message-ID: <202410181215.kMYQykfS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: d1a221d48b45bc73a80c3e86a028dfe60f8a34b2 [47/107] media: i2c: add DS90UB953 driver
config: x86_64-buildonly-randconfig-001-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181215.kMYQykfS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181215.kMYQykfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181215.kMYQykfS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ub913_probe':
   ds90ub913.c:(.text+0x114d40c): undefined reference to `__clk_get_name'
   ld: ds90ub913.c:(.text+0x114d428): undefined reference to `devm_clk_hw_register_fixed_factor'
   ld: ds90ub913.c:(.text+0x114d482): undefined reference to `of_clk_hw_simple_get'
   ld: ds90ub913.c:(.text+0x114d48a): undefined reference to `devm_of_clk_add_hw_provider'
   ld: vmlinux.o: in function `ub953_register_clkout':
>> ds90ub953.c:(.text+0x114ff04): undefined reference to `devm_clk_hw_register'
>> ld: ds90ub953.c:(.text+0x114ff28): undefined reference to `of_clk_hw_simple_get'
>> ld: ds90ub953.c:(.text+0x114ff30): undefined reference to `devm_of_clk_add_hw_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
