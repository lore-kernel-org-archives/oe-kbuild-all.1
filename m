Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C4D145A1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 00:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787963256; cv=none; b=AIq8dgQdlZ7/OBSf6GIOsku9Pd6rbrXzOCjWb+YaaKWmt8/GQlSXB/in9nf6lzEUcsUNb3ROInemHEPsFgCjNTJ6MVgLF2SFTE7Z0FsDHIsfu1XFmoSP0ecF7N4Mn9dBZkHMN4PH92vsPVZJSHI3uiUBIm9V/WpB/1U8XqwIcBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787963256; c=relaxed/simple;
	bh=7XpYGHXKNRVVse3d0xgnQiP9RtcuJCyUn1rUyAhrlLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MH1cFc0DNkd5mPG2g7MxtJJf4gt8Y9aB0R5zLJCwISq8Tb2IR/6reOjspeqqN/Q5IZNV9IH8wAK7O85vM/1VcZeaVmASJWbZ9tICVE/uNp5jzI4n5qwgstxwEiwJXbh9EerCtQ6/a4NbHnbMz2PZWR6RXoRvg/JIngmJpTPkxok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLbov1FM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLbov1FM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787963254; x=1819499254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XpYGHXKNRVVse3d0xgnQiP9RtcuJCyUn1rUyAhrlLI=;
  b=QLbov1FMLZZQD9yVRbFR21sl5R0v510H7McNKExESHudih7yf0QPFfwX
   8Ta5GQimTpkgKfymUvSmXQgLSeV1oQ1D/j5tEjamIraZPx10XmWx7YjGX
   CTF/JFuWPNWsezk7uHn25LUe29jI7k07QJKFxP3JMnCRlzurKsoROJ9WP
   39cbgPFzXO3uiQUYkfaCOGhVVnroYgPPEqc0xPWX+d9EDWlQ93PGwka7l
   3//fZ9SQyqgThZCk6fEQzKBkGrI5s2gFdFfZKbMrsL6EZbogziGQVXbnP
   QOraK0nOudsUhOcBI84x+P0qLALgkV/CeCZQGgUTwY3iO+76IKerSdKSf
   Q==;
X-CSE-ConnectionGUID: 1Wja7FhsS6uhbnlgC70Ktg==
X-CSE-MsgGUID: TlkP425eRQqhWkR95VTHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="114009202"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="114009202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 17:27:30 -0700
X-CSE-ConnectionGUID: LAyWnckRSOe8qgPr8O1C2g==
X-CSE-MsgGUID: hH4QI1+zRV6EdYyzLengxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="268342082"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Aug 2026 17:27:28 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x06us-00000000CAi-2PRW;
	Sat, 29 Aug 2026 00:27:26 +0000
Date: Sat, 29 Aug 2026 08:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Ruben Wauters <rubenru09@aol.com>
Subject: [ksinyuk:drm-tip 6/12]
 =?us-ascii?Q?amdgpu=5Fdm=5Fconnector=5Ftest.c:(.text.dm=5Ftest=5Fparse=5F?=
 =?us-ascii?Q?hdmi=5Famd=5Fvsdb=5Fno=5Fcea=5Fext+0x2e4):?= undefined
 reference to `parse_hdmi_amd_vsdb'
Message-ID: <202608290800.DDiDIVc8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ksinyuk/linux.git drm-tip
head:   e3e05bddbe9fea67639d2a3551e7cf2d473b804c
commit: 6fa42e05f7e63d41ade0e59fa5d94ca8028f7887 [6/12] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260829/202608290800.DDiDIVc8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290800.DDiDIVc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290800.DDiDIVc8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_cea_ext':
>> amdgpu_dm_connector_test.c:(.text.dm_test_parse_hdmi_amd_vsdb_no_cea_ext+0x2e4): undefined reference to `parse_hdmi_amd_vsdb'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_extensions':
>> amdgpu_dm_connector_test.c:(.text.dm_test_parse_hdmi_amd_vsdb_no_extensions+0x2a8): undefined reference to `parse_hdmi_amd_vsdb'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_null_edid':
>> amdgpu_dm_connector_test.c:(.text.dm_test_parse_hdmi_amd_vsdb_null_edid+0x1a8): undefined reference to `parse_hdmi_amd_vsdb'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
