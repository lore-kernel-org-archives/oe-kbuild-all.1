Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A983EEAD7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844662; cv=none; b=nw6gAP3TmzELKOZu+4LGGEiwQoDe/NCR6weW7y7LimHkknmIZkyFXfhnnfR1lGjtnvSdTjAhJZPOPTe7a4WMlEv2/wxgl2siUl5VGmUigNZDQ9+Aaw5EZhgp2lLywEVi7MRi0FHgmoGaMrWNolqDaho5+Z4e2VAX6Nr8S0/COes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844662; c=relaxed/simple;
	bh=ujKHgYvowFNF3V1eYGLoXRRJLArl2LErVpcl8wyd6Ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bzEkzK8whVw4UkQ5iIEEGvWbgxWZXyUEZ6pYJasq9w4Sq+s4fP/WD80rUO4BT9r167/cMHBrVho4v6/bBKSXTnEVLlPtk0KKcn43/i9mqSz1ONn99RFgPOTe/GsH+A91Xa2v79rCIwFv8dGHBYDlMAqwMUVStajG+rw1ucUD8cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDoOgb9+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDoOgb9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787844651; x=1819380651;
  h=date:from:to:cc:subject:message-id;
  bh=ujKHgYvowFNF3V1eYGLoXRRJLArl2LErVpcl8wyd6Ak=;
  b=XDoOgb9+iaf8Y14E8Vn/HXOsEQITdPwKTmxCasl9XqoFtiwlxkVm7dPT
   MVua0TBSc8nCKNQ9wMVriy5syme3M3a6pNFJuVVtRIjGX+5vHLIxJ/gGa
   PjQDJgxGE59nM9H1KWeGEMUJBZEEf3flOB1dzJCfonp3WCeUQHXDD3NJi
   6AaRPGjK9TeqfsD4FMcUtuPmVb5zcOiHTPhJ2FQ2Wog6v+oeaHqaGgDyV
   IJocA55N4XJ3QIwub6wjgoSYsxYKA5LhLkYwaQjimPL/Rf6zx7oab7lIr
   syUuwvGLq+VKdnWvndEtC08sETCHrfFaRfd7o+oIJSu5IoG3x6Uy58c10
   w==;
X-CSE-ConnectionGUID: AIntGk5LSEelTy7w0wlIqw==
X-CSE-MsgGUID: 1VE1w7ZMRTKsWGaDngLwbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87291418"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="87291418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 08:30:47 -0700
X-CSE-ConnectionGUID: LQtfDhweRqyDHFo3ggWyRg==
X-CSE-MsgGUID: u+8el9dmQfCwRJi8P7OeLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="272137447"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Aug 2026 08:30:46 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzc3v-000000009eR-3PEF;
	Thu, 27 Aug 2026 15:30:43 +0000
Date: Thu, 27 Aug 2026 23:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Ruben Wauters <rubenru09@aol.com>
Subject: [ksinyuk:drm-tip 6/12] amdgpu_dm_connector_test.c:undefined
 reference to `parse_hdmi_amd_vsdb'
Message-ID: <202608272312.xpie6XDa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ksinyuk/linux.git drm-tip
head:   e3e05bddbe9fea67639d2a3551e7cf2d473b804c
commit: 6fa42e05f7e63d41ade0e59fa5d94ca8028f7887 [6/12] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260827/202608272312.xpie6XDa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608272312.xpie6XDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608272312.xpie6XDa-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_cea_ext':
>> amdgpu_dm_connector_test.c:(.text+0x8cfe): undefined reference to `parse_hdmi_amd_vsdb'
   /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_extensions':
   amdgpu_dm_connector_test.c:(.text+0x91c8): undefined reference to `parse_hdmi_amd_vsdb'
   /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_null_edid':
   amdgpu_dm_connector_test.c:(.text+0x95ca): undefined reference to `parse_hdmi_amd_vsdb'
   /usr/lib/gcc/x86_64-linux-gnu/14/crtbegin.o: in function `deregister_tm_clones':
   crtstuff.c:(.text+0x7): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
   /usr/lib/gcc/x86_64-linux-gnu/14/crtbegin.o: in function `register_tm_clones':
   crtstuff.c:(.text+0x38): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
