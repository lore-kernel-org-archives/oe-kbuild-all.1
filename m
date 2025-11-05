Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA8134D3B9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327165; cv=none; b=NsI3SHpX+YWciQ0QcIL3p5A/Ka/aAzzptnLhM0FBBJfsDTde5TTwDuJFGtUPAuh/YbYhF5i7IwrEP6s3ToTv0v6r6uC2qEIWkidMKBs4etlGvk5PdFA7rBx5gpWwn1bknnomFS328yk6UcZ/bZ7tptJgMhvP+qPURUduTZ/lMFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327165; c=relaxed/simple;
	bh=MxBXpKRz47M1me3YohbnlFUkR+1W8GsJgjTDB1A7NQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HubXOgC28acP+yNuBdBqSws91Sqadot4E8/9kEvoKNP3yGDtyzSMCaqW8RcHWUdPqVIGQ3CGgb6eoLYmRZ8dm6BuDJLSp+npGhA+Qv/VfS4ajW/Pa8gfwaGNt1afaouz5oAemsW08tKlbKv4FL0OqumczgaDTjGU+7Gf8SEw9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eScFVwwG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eScFVwwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762327164; x=1793863164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MxBXpKRz47M1me3YohbnlFUkR+1W8GsJgjTDB1A7NQY=;
  b=eScFVwwG0qDj4J/w5Qxbq59tN13qoR8Pkt2unmZjTpebTlFlcBRPK6Mf
   MWlmlIM3FgArjXL/Yev7uTUx+6Jdlz3ae3FN06KRxlKpQFoKlkvwxa6jv
   atYODEHpvaiuIVvXeAoYQbeVNiUDXYbC7dJibBdGykMH+96AUli2t/8VX
   At7hGdcaniX0etZeCn+K4v9q/X+QphARL2f3EngIBiey1CvFk4jAR+QTf
   2igv51LJ6CEunVqT+At14huqYbRoWsIwxxTxt9dhu9RpuTC/GDy7OMkcI
   hj3PvYxa19uXRMOz+jEEk5JpfI4GQp7b6rPmOrrpp1px5OnaN6th9V3iG
   A==;
X-CSE-ConnectionGUID: 3cJsvBSbSEyOO6qGvUgt5w==
X-CSE-MsgGUID: XZq0z0FmQUCBtcc+qpntgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81837369"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="81837369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:19:24 -0800
X-CSE-ConnectionGUID: bxwmB/IMSeqOxy6ffC7mpw==
X-CSE-MsgGUID: s4WIAQCpTVu5CPXWthfWwA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2025 23:19:22 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGXnT-000SFu-3D;
	Wed, 05 Nov 2025 07:19:14 +0000
Date: Wed, 5 Nov 2025 15:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: error: positional
 initialization of field in 'struct' declared with 'designated_init'
 attribute
Message-ID: <202511051535.4GWYbRuY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   407fcd15d423a8666513a85bb5f497dbe6fb1474
commit: a5c6c3431e4ff30a8abccdddaf2c0fa1e7707a77 [1/1] randstruct: gcc-plugin: Remove bogus void member
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251105/202511051535.4GWYbRuY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051535.4GWYbRuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051535.4GWYbRuY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/elfcore.h:11,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from drivers/net/ethernet/qlogic/qede/qede_main.c:7:
   include/linux/mmzone.h: In function 'movable_only_nodes':
   include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   drivers/net/ethernet/qlogic/qede/qede_main.c: At top level:
>> drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     202 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:9: note: (near initialization for 'qede_ll_ops')
   cc1: some warnings being treated as errors


vim +202 drivers/net/ethernet/qlogic/qede/qede_main.c

e712d52b9f2a8ec Yuval Mintz             2015-10-26  200  
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  201  static struct qed_eth_cb_ops qede_ll_ops = {
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26 @202  	{
e4917d46a6537c5 Chopra, Manish          2017-04-13  203  #ifdef CONFIG_RFS_ACCEL
e4917d46a6537c5 Chopra, Manish          2017-04-13  204  		.arfs_filter_op = qede_arfs_filter_op,
e4917d46a6537c5 Chopra, Manish          2017-04-13  205  #endif
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  206  		.link_update = qede_link_update,
ccc67ef50b9085b Tomer Tayar             2019-01-28  207  		.schedule_recovery_handler = qede_schedule_recovery_handler,
a8736ea83b80526 Igor Russkikh           2020-05-14  208  		.schedule_hw_err_handler = qede_schedule_hw_err_handler,
d25b859ccd614d2 Sudarsana Reddy Kalluru 2018-05-22  209  		.get_generic_tlv_data = qede_get_generic_tlv_data,
d25b859ccd614d2 Sudarsana Reddy Kalluru 2018-05-22  210  		.get_protocol_tlv_data = qede_get_eth_tlv_data,
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  211  	},
eff169608c25019 Yuval Mintz             2016-05-11  212  	.force_mac = qede_force_mac,
97379f15c21e7ae Chopra, Manish          2017-04-24  213  	.ports_update = qede_udp_ports_update,
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  214  };
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  215  

:::::: The code at line 202 was first introduced by commit
:::::: a2ec6172d29cf3aed92e9db40e83e36329db1dd5 qede: Add support for link

:::::: TO: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
