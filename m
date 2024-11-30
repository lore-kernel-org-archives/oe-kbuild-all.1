Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AB542AA4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732983707; cv=none; b=RbRtPzlhQaeoqq/b6UwHYmQ/4ZI19mXIv+Ygal17ByEDZo76epal2oF3ijkkcSrgvZjDbzBK4N9aPYLWHxsmK+X4Ntj953od7IGMsBgQuqF3UumB/QKU0PKEojUrkkXe1/GxUzskjWbI3s3ftZZGF+HP8i4gJqG1RJ7PwNs4kAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732983707; c=relaxed/simple;
	bh=o5CvSq290kheCjnulbnIRpU1xb3T8NWlAD1lL7xsNjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iufD9DTOJ3rHPJpGM/STVMZzn7hAX1RzaERAnjzF78v0YeV/27/d98JZ5jPhimcGrCwXgUXGU6hy55LzNk1PkTVPBSpn4wTbreqZVDAp8v6a1Zan/Z6U6evdFD+UTTCOk2mDe87LJ7MB8rTOaX7KZ8Y/mE6s6awSOZHtN9AvTP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhIqK6A8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhIqK6A8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732983706; x=1764519706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5CvSq290kheCjnulbnIRpU1xb3T8NWlAD1lL7xsNjw=;
  b=lhIqK6A8ThJsAcyBkhwYkuqtuvc/OachBlT2kZyzuSGWK7akDFfthMzY
   D2G88MWLgEnE52xHwfxcUM59/AtbhDWvYUnauukg7CBYYQuhXQXPOdxO9
   SIpDexZ4dbvWuMO1nbyuG/1ENFsx9coq6bAlR93yhHFMxdN99j6PahWUF
   zzHQVdcf4lKhgo8KGBGbcbbOA6Q+j6kKibGpjVENnGFIiEW3ZoLENvs4R
   1rTZ5wZBhntJ9ty/8GXo4lbXYNXeAGS1gxZNPvn0gJ7a/F3n3Gr3NgFRT
   MfK53FOYfv3Z4S4+Mb9i8+1RchadOGEHhkGj5l0SIFZBSdu32HxvjopaG
   A==;
X-CSE-ConnectionGUID: 6jbBkgpoT5mdXCBouVn76Q==
X-CSE-MsgGUID: tnJEBmGYTsaBKeCPyRWPSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33121218"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33121218"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 08:21:45 -0800
X-CSE-ConnectionGUID: TRNoYBolS/ast1FYZ3Tg3w==
X-CSE-MsgGUID: GwtkDPT1TF2vY3A9K2XSOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="97825799"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2024 08:21:44 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHQDu-0000o3-2P;
	Sat, 30 Nov 2024 16:21:36 +0000
Date: Sun, 1 Dec 2024 00:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 28/31] net/rose/rose_subr.o: warning: objtool:
 rose_parse_national+0x2b3: can't find switch jump table
Message-ID: <202412010003.j1LalFPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   1295be6d1a5cb6a30132ee8b01c79018794d0c3e
commit: c5a8bf8bcd7fe8f90221ba108c20650617c16fa2 [28/31] x86: Use PIE codegen for the core kernel
config: x86_64-randconfig-075-20241004 (https://download.01.org/0day-ci/archive/20241201/202412010003.j1LalFPJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010003.j1LalFPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010003.j1LalFPJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rose/rose_subr.o: warning: objtool: rose_parse_national+0x2b3: can't find switch jump table
--
>> security/smack/smackfs.o: warning: objtool: smk_perm_from_str+0x91: can't find switch jump table
--
>> net/rds/bind.o: warning: objtool: jhash+0x1f1: can't find switch jump table
--
>> arch/x86/entry/entry_fred.o: warning: objtool: fred_hwexc.constprop.0+0x2b: can't find switch jump table
--
>> net/bluetooth/hci_event.o: warning: objtool: conn_set_key+0xbf: can't find switch jump table
--
>> net/lapb/lapb_in.o: warning: objtool: lapb_data_input+0x136: can't find switch jump table
--
>> net/openvswitch/flow.o: warning: objtool: get_ipv6_ext_hdrs.isra.0+0x141: can't find switch jump table
--
>> net/openvswitch/vport.o: warning: objtool: jhash+0x1f1: can't find switch jump table
--
>> drivers/media/dvb-frontends/rtl2832.o: warning: objtool: rtl2832_get_frontend+0x4cc: can't find switch jump table
--
>> drivers/media/dvb-frontends/af9013.o: warning: objtool: af9013_get_frontend+0x479: can't find switch jump table
--
>> drivers/media/dvb-frontends/af9033.o: warning: objtool: af9033_get_frontend+0x548: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
