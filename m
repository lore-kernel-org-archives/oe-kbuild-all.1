Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966E5C606
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 23:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710371298; cv=none; b=OHXRCyDuC0YDfUQpTZJugf1v1OSj+8lCWsdknt10O73BhxbW9SG2pIRm3Mo6SGdW6QA3y3OXBeIRLClEESRw+DAeGbTcbU/rEbsNBNJXV3WDm2o//p0INQd0Ob2jW2N1egWwM7hJFdLg6/3LOh9ZS04gMuT9ThLSD7XzZUdcLWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710371298; c=relaxed/simple;
	bh=AX1S3nbWgDbfh5LfO/lPTUCFtt7VoZVZlgo9BNIH9NE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGJUCFcGplOWgXn+yZU+jnJMfzCDzmDy0O94LgbdL236G/DYGBzb0FV9JrxvweHlWLbltt8A/z9G1hTt/JUG5dipRXT1d9po0nPRRUxoptXYBM3BKWmxY9yCUUdOWV5/Thr8owKB6J3Ca0cfZi77xhklrCYzvLIntkS9jk1vIJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9m844d7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9m844d7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710371295; x=1741907295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AX1S3nbWgDbfh5LfO/lPTUCFtt7VoZVZlgo9BNIH9NE=;
  b=f9m844d7dtlFweNeqn+yCRqe1NKbiQPvr1zepSF24C3QnOiDWw/p96Cv
   ZiMvAbUN3t5r1Y8wLo729hEi91aMQFBtijhtu9BNyMDJa75XDSnqleIoE
   qCInEq/cj/C6U/K8/haVwERydNSl3lSKacQsNnN6xSve1Q9Hht4jFeJar
   DXFczLGqzIIZqMjyY857DO6A1TTSbMDBFGQROY1Qo9+hrHqp7GqIDVo47
   c/0o6QsPLhTWxzVyFUl42i+BsL8AlhccKV9zEV4sPpJW62ZXPXgOFLvQy
   zhYIPYdpAwx4GRuQflsTIgyVUkvF4hw13H3gWYiJak54Soc5RP21MAfdy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5016153"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5016153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="11981178"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2024 16:08:06 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkXhc-000CqZ-0y;
	Wed, 13 Mar 2024 23:08:04 +0000
Date: Thu, 14 Mar 2024 07:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/scsi/lpfc/lpfc_attr.c:466:11: error: comparison of unsigned
 expression >= 0 is always true
Message-ID: <202403140642.twwXxoqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   ef4270af264f76e609dfd098345acae7e024b403
commit: 16009a31ceb0b79b7bdefeaac575a3d1d7d9ca39 Update LPFC driver from 12.4 to 12.8
date:   2 years ago
config: x86_64-randconfig-072-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140642.twwXxoqk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140642.twwXxoqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140642.twwXxoqk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6:0,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:250,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/uuid.h:12,
                    from include/linux/mod_devicetable.h:13,
                    from include/linux/pci.h:27,
                    from drivers/scsi/lpfc/lpfc_attr.c:26:
   include/linux/instrumentation.h:8:0: error: "instrumentation_begin" redefined [-Werror]
    #define instrumentation_begin() ({     \
    
   In file included from include/linux/export.h:42:0,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/delay.h:22,
                    from drivers/scsi/lpfc/lpfc_attr.c:25:
   include/linux/compiler.h:139:0: note: this is the location of the previous definition
    #define instrumentation_begin() ({     \
    
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_cmf_info_store':
>> drivers/scsi/lpfc/lpfc_attr.c:466:11: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
      if (val >= LPFC_CFG_CONSERVE &&
              ^~
   In file included from drivers/scsi/lpfc/lpfc_attr.c:50:0:
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_enable_bbcr_set':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2725:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, 0, 1) && phba->sli_rev == LPFC_SLI_REV4) {
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_sli_mode_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:30:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:3671:1: note: in expansion of macro 'LPFC_ATTR'
    LPFC_ATTR(sli_mode, 0, 0, 3,
    ^~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_enable_npiv_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:37:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:3677:1: note: in expansion of macro 'LPFC_ATTR_R'
    LPFC_ATTR_R(enable_npiv, 1, 0, 1,
    ^~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_enable_fcp_priority_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:45:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:3684:1: note: in expansion of macro 'LPFC_ATTR_RW'
    LPFC_ATTR_RW(enable_fcp_priority, 0, 0, 1,
    ^~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_enable_fcp_priority_set':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2851:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:46:1: note: in expansion of macro 'lpfc_param_set'
    lpfc_param_set(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:3684:1: note: in expansion of macro 'LPFC_ATTR_RW'
    LPFC_ATTR_RW(enable_fcp_priority, 0, 0, 1,
    ^~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_enable_rrq_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:37:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:3694:1: note: in expansion of macro 'LPFC_ATTR_R'
    LPFC_ATTR_R(enable_rrq, 2, 0, 2,
    ^~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_suppress_link_up_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:37:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:3704:1: note: in expansion of macro 'LPFC_ATTR_R'
    LPFC_ATTR_R(suppress_link_up, LPFC_INITIALIZE_LINK, LPFC_INITIALIZE_LINK,
    ^~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_suppress_rsp_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:37:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:3985:1: note: in expansion of macro 'LPFC_ATTR_R'
    LPFC_ATTR_R(suppress_rsp, 1, 0, 1,
    ^~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_log_verbose_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2976:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:126:1: note: in expansion of macro 'lpfc_vport_param_init'
    lpfc_vport_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:4033:1: note: in expansion of macro 'LPFC_VPORT_ATTR_HEX_RW'
    LPFC_VPORT_ATTR_HEX_RW(log_verbose, 0x0, 0x0, 0xffffffff,
    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_log_verbose_set':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:3009:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:127:1: note: in expansion of macro 'lpfc_vport_param_set'
    lpfc_vport_param_set(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:4033:1: note: in expansion of macro 'LPFC_VPORT_ATTR_HEX_RW'
    LPFC_VPORT_ATTR_HEX_RW(log_verbose, 0x0, 0x0, 0xffffffff,
    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_enable_da_id_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2976:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:91:1: note: in expansion of macro 'lpfc_vport_param_init'
    lpfc_vport_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:4040:1: note: in expansion of macro 'LPFC_VPORT_ATTR_R'
    LPFC_VPORT_ATTR_R(enable_da_id, 1, 0, 1,
    ^~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_peer_port_login_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2976:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:91:1: note: in expansion of macro 'lpfc_vport_param_init'
    lpfc_vport_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:4185:1: note: in expansion of macro 'LPFC_VPORT_ATTR_R'
    LPFC_VPORT_ATTR_R(peer_port_login, 0, 0, 1,
    ^~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_scan_down_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2976:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:91:1: note: in expansion of macro 'lpfc_vport_param_init'
    lpfc_vport_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:4298:1: note: in expansion of macro 'LPFC_VPORT_ATTR_R'
    LPFC_VPORT_ATTR_R(scan_down, 1, 0, 1,
    ^~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_topology_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:30:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:4312:1: note: in expansion of macro 'LPFC_ATTR'
    LPFC_ATTR(topology, 0, 0, 6,
    ^~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_aer_support_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:30:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:4933:1: note: in expansion of macro 'LPFC_ATTR'
    LPFC_ATTR(aer_support, 1, 0, 1,
    ^~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_sriov_nr_virtfn_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:30:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5166:1: note: in expansion of macro 'LPFC_ATTR'
    LPFC_ATTR(sriov_nr_virtfn, LPFC_DEF_VFN_PER_PFN, 0, LPFC_MAX_VFN_PER_PFN,
    ^~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_use_adisc_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2976:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:107:1: note: in expansion of macro 'lpfc_vport_param_init'
    lpfc_vport_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5730:1: note: in expansion of macro 'LPFC_VPORT_ATTR_RW'
    LPFC_VPORT_ATTR_RW(use_adisc, 0, 0, 1,
    ^~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_use_adisc_set':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:3009:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:108:1: note: in expansion of macro 'lpfc_vport_param_set'
    lpfc_vport_param_set(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5730:1: note: in expansion of macro 'LPFC_VPORT_ATTR_RW'
    LPFC_VPORT_ATTR_RW(use_adisc, 0, 0, 1,
    ^~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_first_burst_size_init':
>> drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2976:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:107:1: note: in expansion of macro 'lpfc_vport_param_init'
    lpfc_vport_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5738:1: note: in expansion of macro 'LPFC_VPORT_ATTR_RW'
    LPFC_VPORT_ATTR_RW(first_burst_size, 0, 0, 65536,
    ^~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_first_burst_size_set':
   drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:3009:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:108:1: note: in expansion of macro 'lpfc_vport_param_set'
    lpfc_vport_param_set(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5738:1: note: in expansion of macro 'LPFC_VPORT_ATTR_RW'
    LPFC_VPORT_ATTR_RW(first_burst_size, 0, 0, 65536,
    ^~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_max_scsicmpl_time_init':
   drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2976:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:84:1: note: in expansion of macro 'lpfc_vport_param_init'
    lpfc_vport_param_init(name, defval, minval, maxval)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5774:1: note: in expansion of macro 'LPFC_VPORT_ATTR'
    LPFC_VPORT_ATTR(max_scsicmpl_time, 0, 0, 60000,
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_ack0_init':
   drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:37:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5810:1: note: in expansion of macro 'LPFC_ATTR_R'
    LPFC_ATTR_R(ack0, 0, 0, 1, "Enable ACK0 support");
    ^~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_xri_rebalancing_init':
   drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:37:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5816:1: note: in expansion of macro 'LPFC_ATTR_R'
    LPFC_ATTR_R(xri_rebalancing, 1, 0, 1, "Enable/Disable XRI rebalancing");
    ^~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_fcp_io_sched_init':
   drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:45:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5834:1: note: in expansion of macro 'LPFC_ATTR_RW'
    LPFC_ATTR_RW(fcp_io_sched, LPFC_FCP_SCHED_BY_CPU,
    ^~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_fcp_io_sched_set':
   drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2851:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:46:1: note: in expansion of macro 'lpfc_param_set'
    lpfc_param_set(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5834:1: note: in expansion of macro 'LPFC_ATTR_RW'
    LPFC_ATTR_RW(fcp_io_sched, LPFC_FCP_SCHED_BY_CPU,
    ^~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_ns_query_init':
   drivers/scsi/lpfc/lpfc.h:135:15: error: comparison of unsigned expression >= 0 is always true [-Werror=type-limits]
     ((uint)(val) >= (uint)(min) && (val) <= (max))
                  ^
   drivers/scsi/lpfc/lpfc_attr.c:2815:6: note: in expansion of macro 'lpfc_rangecheck'
     if (lpfc_rangecheck(val, minval, maxval)) {\
         ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.h:45:1: note: in expansion of macro 'lpfc_param_init'
    lpfc_param_init(name, defval, minval, maxval)\
    ^~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_attr.c:5847:1: note: in expansion of macro 'LPFC_ATTR_RW'
..


vim +466 drivers/scsi/lpfc/lpfc_attr.c

   359	
   360	static ssize_t
   361	lpfc_cmf_info_store(struct device *dev, struct device_attribute *attr,
   362			    const char *buf, size_t count)
   363	{
   364		struct Scsi_Host  *shost = class_to_shost(dev);
   365		struct lpfc_vport *vport = (struct lpfc_vport *)shost->hostdata;
   366		struct lpfc_hba   *phba = vport->phba;
   367		uint32_t payload[64];
   368		int len, status = 0;
   369		int flashit = 0;
   370		unsigned long val;
   371	
   372		/* fpin_warn        Simulates a Fabric detected warning
   373		 * fpin_alarm       Simulates a Fabric detected alarm
   374		 * alarm_sig        Forces an alarm signal detection
   375		 * warn_sig <cnt>   Forces cnt warning signal detections
   376		 * alarm_fpin       Forces an alarm FPIN detection
   377		 * warn_fpin        Forces cnt warning FPIN detections
   378		 * mode  <value>    Switches to off(0), managed (1) or monitor(2) mode
   379		 * scale <value>    Updates ACR scalar parameter (1 - 255)
   380		 * acr <value>      Updates ACR param  conserve(0) moderate(1) severe(2)
   381		 * BW <value>       Updates rxbw parameter (5% units, 1-20)
   382		 * minBurst <value> Updates acr_min_rxburst param (512k units, 0-32)
   383		 * minBW <value>    Updates acr_min_rxbw param (5% units, 1-20)
   384		 * maxBurst <value> Updates acr_max_rxburst param (512k units, 0-32)
   385		 * maxBW <value>    Updates acr_max_rxbw param (5% units, 1-20)
   386		 * wobjmt           Delete congestion params from flash
   387		 * rxmonitor        Dump rxmonitor table
   388		 * set_frequency    <val>   Sets signal frequency (10 sec default)
   389		 */
   390		if ((strncmp(buf, "fpin_warn", strlen("fpin_warn")) == 0)) {
   391			/* Simulate a FPIN warning from Fabric */
   392			payload[0] = cpu_to_be32(0x16000000);
   393			payload[1] = cpu_to_be32(0x00000014);
   394			payload[2] = cpu_to_be32(0x00020004);
   395			payload[3] = cpu_to_be32(0x0000000c);
   396			payload[4] = cpu_to_be32(0x00030000);
   397			payload[5] = cpu_to_be32(0x0000ea60);
   398			payload[6] = cpu_to_be32(0xf1000000);
   399			len = 28;
   400			lpfc_els_rcv_fpin(vport, payload, len);
   401		} else if ((strncmp(buf, "fpin_alarm", strlen("fpin_alarm")) == 0)) {
   402			/* Simulate a FPIN alarm from Fabric */
   403			payload[0] = cpu_to_be32(0x16000000);
   404			payload[1] = cpu_to_be32(0x00000014);
   405			payload[2] = cpu_to_be32(0x00020004);
   406			payload[3] = cpu_to_be32(0x0000000c);
   407			payload[4] = cpu_to_be32(0x00030000);
   408			payload[5] = cpu_to_be32(0x0000ea60);
   409			payload[6] = cpu_to_be32(0xf7000000);
   410			len = 28;
   411			lpfc_els_rcv_fpin(vport, payload, len);
   412		} else if ((strncmp(buf, "alarm_sig", strlen("alarm_sig")) == 0)) {
   413			atomic_inc(&phba->cgn_sync_alarm_cnt);
   414		} else if ((strncmp(buf, "warn_sig", strlen("warn_sig")) == 0)) {
   415			val = 0;
   416			status = kstrtoul(buf + 9, 0, &val);
   417			if (!status && val)
   418				atomic_set(&phba->cgn_sync_warn_cnt, (u32)val);
   419		} else if ((strncmp(buf, "alarm_fpin", strlen("alarm_fpin")) == 0)) {
   420			atomic_inc(&phba->cgn_sync_alarm_cnt);
   421		} else if ((strncmp(buf, "warn_fpin", strlen("warn_fpin")) == 0)) {
   422			atomic_inc(&phba->cgn_sync_warn_cnt);
   423		} else if ((strncmp(buf, "mode", strlen("mode")) == 0)) {
   424			val = 0;
   425			status = kstrtoul(buf + 5, 0, &val);
   426			if (status)
   427				return -EINVAL;
   428			switch (val) {
   429			case LPFC_CFG_OFF:
   430				lpfc_printf_log(phba, KERN_ERR, LOG_CGN_MGMT,
   431						"6326 Disable CMF\n");
   432				break;
   433			case LPFC_CFG_MANAGED:
   434				lpfc_printf_log(phba, KERN_ERR, LOG_CGN_MGMT,
   435						"6327 Enable CMF\n");
   436				break;
   437			case LPFC_CFG_MONITOR:
   438				lpfc_printf_log(phba, KERN_ERR, LOG_CGN_MGMT,
   439						"6328 Monitor CMF\n");
   440				break;
   441			default:
   442				lpfc_printf_log(phba, KERN_ERR, LOG_CGN_MGMT,
   443						"6329 Invalid CMF mode: %ld\n", val);
   444				return -EINVAL;
   445			}
   446			phba->cgn_p.cgn_param_mode = val;
   447			flashit = 1;
   448		} else if ((strncmp(buf, "scale", strlen("scale")) == 0)) {
   449			val = 0;
   450			status = kstrtoul(buf + 6, 0, &val);
   451			if (status)
   452				return -EINVAL;
   453			if (val >= LPFC_CFG_LOW_SCALE &&
   454			    val <= LPFC_CFG_HIGH_SCALE) {
   455				phba->cgn_p.cgn_param_acr_scale = val;
   456				flashit = 1;
   457				status = 0;
   458			} else {
   459				status = -EINVAL;
   460			}
   461		} else if ((strncmp(buf, "acr", strlen("acr")) == 0)) {
   462			val = 0;
   463			status = kstrtoul(buf + 4, 0, &val);
   464			if (status)
   465				return -EINVAL;
 > 466			if (val >= LPFC_CFG_CONSERVE &&
   467			    val <= LPFC_CFG_SEVERE) {
   468				phba->cgn_p.cgn_param_acr = val;
   469				flashit = 1;
   470				status = 0;
   471			} else {
   472				status = -EINVAL;
   473			}
   474		} else if ((strncmp(buf, "BW", strlen("BW")) == 0)) {
   475			val = 0;
   476			status = kstrtoul(buf + 3, 0, &val);
   477			if (status)
   478				return -EINVAL;
   479			phba->cgn_p.cgn_param_rxbw = val;
   480			flashit = 1;
   481		} else if ((strncmp(buf, "maxBurst", strlen("maxBurst")) == 0)) {
   482			val = 0;
   483			status = kstrtoul(buf + 9, 0, &val);
   484			if (status)
   485				return -EINVAL;
   486			phba->cgn_p.cgn_param_acr_max_rxburst = val;
   487			flashit = 1;
   488		} else if ((strncmp(buf, "maxBW", strlen("maxBW")) == 0)) {
   489			val = 0;
   490			status = kstrtoul(buf + 6, 0, &val);
   491			if (status)
   492				return -EINVAL;
   493			phba->cgn_p.cgn_param_acr_max_rxbw = val;
   494			flashit = 1;
   495		} else if ((strncmp(buf, "minBurst", strlen("minBurst")) == 0)) {
   496			val = 0;
   497			status = kstrtoul(buf + 9, 0, &val);
   498			if (status)
   499				return -EINVAL;
   500			phba->cgn_p.cgn_param_acr_min_rxburst = val;
   501			flashit = 1;
   502		} else if ((strncmp(buf, "minBW", strlen("minBW")) == 0)) {
   503			val = 0;
   504			status = kstrtoul(buf + 6, 0, &val);
   505			if (status)
   506				return -EINVAL;
   507			phba->cgn_p.cgn_param_acr_min_rxbw = val;
   508			flashit = 1;
   509		} else if ((strncmp(buf, "set_frequency",
   510			   strlen("set_frequency")) == 0)) {
   511			val = 0;
   512			status = kstrtoul(buf + 14, 0, &val);
   513			if (status)
   514				return -EINVAL;
   515			lpfc_acqe_cgn_frequency = val;
   516			lpfc_config_cgn_signal(phba);
   517		}  else if ((strncmp(buf, "wobjmt", strlen("wobjmt")) == 0)) {
   518			/* Delete the port.cfg store. */
   519			(void)lpfc_del_object(phba, (char *)LPFC_PORT_CFG_NAME);
   520		}  else if ((strncmp(buf, "rxmonitor", strlen("rxmonitor")) == 0)) {
   521			lpfc_cgn_dump_rxmonitor(phba);
   522		} else {
   523			return -EINVAL;
   524		}
   525	
   526		if (flashit) {
   527			if (phba->sli4_hba.pc_sli4_params.cmf) {
   528				/* Update FW flash with driver parameters */
   529				status = lpfc_write_object
   530					(phba, (char *)LPFC_PORT_CFG_NAME,
   531					(uint32_t *)&phba->cgn_p,
   532					sizeof(struct lpfc_cgn_param));
   533				if (status <= 0)
   534					status = -EACCES;
   535			}
   536		}
   537	
   538		if (status == 0)
   539			return strlen(buf);
   540		return status;
   541	}
   542	/**
   543	 * lpfc_drvr_version_show - Return the Emulex driver string with version number
   544	 * @dev: class unused variable.
   545	 * @attr: device attribute, not used.
   546	 * @buf: on return contains the module description text.
   547	 *
   548	 * Returns: size of formatted string.
   549	 **/
   550	static ssize_t
   551	lpfc_drvr_version_show(struct device *dev, struct device_attribute *attr,
   552			       char *buf)
   553	{
   554		return scnprintf(buf, PAGE_SIZE, LPFC_MODULE_DESC "\n");
   555	}
   556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
