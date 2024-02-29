Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF607E572
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709221593; cv=none; b=rW8Kt4zbElmsBR8DRws39FmCbNOWBwZgL3Ykv/Ass1YPQ2ENYvflZgnoKZFV119J95wWoM23TE6aM2sGde+ju8HW4WVyqwa97xNu1qCTsq74SjAC44tjVzujlBThvfLTeIpcWBb159i+JjKPioHfyr/l80J1e47JEDj1Cm6H+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709221593; c=relaxed/simple;
	bh=eFh9Yc7xzNxj9npfei8leDBtwiEXO3625A8R/tDGFWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4Dwk3DpQsCwR61VIQWwTiGpFbF4QdEQ4LApdlYitG+IFMAOelppCWP55HwKNu8VRclv6NqmD3KFHdpwwV7nCekoC2FZ7WsDSUdYqJ8K+IGSHUJFEA4sE7Thu4wbBlIrUgzbfJ/JZ06nGQcYd7auiUNFS+q89kNLDEg0UGW4da4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0m/38Ns; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0m/38Ns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709221591; x=1740757591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFh9Yc7xzNxj9npfei8leDBtwiEXO3625A8R/tDGFWw=;
  b=K0m/38NsRtyC56WPLnfToLxqlq1eB09KFUymhWi9nASpkFE1dViX1YwC
   RRfP/TBufhoiruonnvLwXOHB4s44rT+XJlehGkGG9fMzVAxoTGTdDQANn
   fPmKROdoVGlIC1pZjC2bLZfgLYYNl2LggGCFH/EXqBTenoBDPngrsPRdl
   bHGGZLaoS85Qv211UEtDZiOl6canCNuyElJfnPP3kTvsd4ifE2cqqiYR/
   KQP008jZ6hD9WXHtmNW76OLB76qARgyPi1WBSeyzuF1lOjLVu1Tm7d0cQ
   jiKrHeb1M2WbMtJBKxf20uXYBt+BEw23bUVd7lYezu/arn0f/MQ/ociwD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3623086"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3623086"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7770425"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Feb 2024 07:46:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfic6-000D2d-10;
	Thu, 29 Feb 2024 15:46:26 +0000
Date: Thu, 29 Feb 2024 23:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] include/linux/rcupdate.h:371:9:
 error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
Message-ID: <202402292356.x5P6XMHr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   582c6d188ec138d8ed9c6ef235bf5698d80d7d6b
commit: 582c6d188ec138d8ed9c6ef235bf5698d80d7d6b [1/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: i386-randconfig-012-20240229 (https://download.01.org/0day-ci/archive/20240229/202402292356.x5P6XMHr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292356.x5P6XMHr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292356.x5P6XMHr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:8,
                    from kernel/events/core.c:11:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:8,
                    from include/linux/debugfs.h:15,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c:24:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c:27:0:
   At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:199:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
    static const bool no_system_mem_limit;
                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
    static const bool debug_evictions; /* = false */
                      ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
    static const int sched_policy = KFD_SCHED_POLICY_HWS;
                     ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
                                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
                                   ^~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:8,
                    from include/linux/seq_file.h:11,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.c:24:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:33:0,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.c:24:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:199:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
    static const bool no_system_mem_limit;
                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:198:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
    static const bool debug_evictions; /* = false */
                      ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:197:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
    static const int sched_policy = KFD_SCHED_POLICY_HWS;
                     ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/vega12_smumgr.c:24:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
                                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
                                   ^~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/dma-fence.h:21,
                    from include/drm/gpu_scheduler.h:28,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:28,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/vega10_reg_init.c:23:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/vega10_reg_init.c:27:0:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:208:29: warning: 'FUSE_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE FUSE_BASE   = { { { { 0x00017400, 0, 0, 0, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:183:29: warning: 'UMC_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE UMC_BASE   = { { { { 0x00014000, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:178:29: warning: 'XDMA_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE XDMA_BASE   = { { { { 0x00003400, 0, 0, 0, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:153:29: warning: 'RSMU_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE RSMU_BASE   = { { { { 0x00012000, 0, 0, 0, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:128:29: warning: 'IOHC_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE IOHC_BASE   = { { { { 0x00010000, 0, 0, 0, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:123:29: warning: 'L2IMU_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE L2IMU_BASE   = { { { { 0x00007DC0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:118:29: warning: 'SYSTEMHUB_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE SYSTEMHUB_BASE  = { { { { 0x00000EA0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:113:29: warning: 'ISP_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE ISP_BASE   = { { { { 0x00018000, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:108:29: warning: 'DFX_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DFX_BASE   = { { { { 0x00000580, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:103:29: warning: 'DFX_DAP_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DFX_DAP_BASE  = { { { { 0x000005A0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:98:29: warning: 'DBGU_IO_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DBGU_IO_BASE  = { { { { 0x000001E0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:93:29: warning: 'DBGU_NBIO_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DBGU_NBIO_BASE  = { { { { 0x000001C0, 0, 0, 0, 0 } },
                                ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:88:29: warning: 'DBGU_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DBGU_BASE   = { { { { 0x00000180, 0x000001A0, 0, 0, 0 } },
                                ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:68:29: warning: 'MP2_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE MP2_BASE   = { { { { 0x00016000, 0, 0, 0, 0 } },
                                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:53:29: warning: 'DCN_BASE' defined but not used [-Wunused-const-variable=]
    static const struct IP_BASE DCN_BASE   = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0, 0 } },
                                ^~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/vega10_reg_init.c:23:0:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:199:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
    static const bool no_system_mem_limit;
                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
    static const bool debug_evictions; /* = false */
                      ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
    static const int sched_policy = KFD_SCHED_POLICY_HWS;
                     ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
                    from drivers/gpu/drm/amd/amdgpu/vega10_reg_init.c:23:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
                                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
                                   ^~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ptrace.h:6,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:26:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c: In function 'amdgpu_pmu_init':
   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:250:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret = 0;
         ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:28:0:
   At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:199:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
    static const bool no_system_mem_limit;
                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
    static const bool debug_evictions; /* = false */
                      ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
    static const int sched_policy = KFD_SCHED_POLICY_HWS;
                     ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:28:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
                                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
                                   ^~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:24:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c: In function 'vega10_get_pp_table_entry':
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:3200:6: warning: variable 'result' set but not used [-Wunused-but-set-variable]
     int result;
         ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:51:0:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_thermal.h:34:41: warning: 'SMU7ThermalPolicy' defined but not used [-Wunused-const-variable=]
    static const struct PP_TemperatureRange SMU7ThermalPolicy[] =
                                            ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:33:0,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/hwmgr.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:30:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:199:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
    static const bool no_system_mem_limit;
                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:198:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
    static const bool debug_evictions; /* = false */
                      ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:197:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
    static const int sched_policy = KFD_SCHED_POLICY_HWS;
                     ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/hwmgr.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
                                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
                                   ^~~~~~~~~~~
..


vim +371 include/linux/rcupdate.h

53ecfba259f54b6 Paul E. McKenney        2010-09-13  368  
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  369  #define __rcu_access_pointer(p, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  370  ({ \
7d0ae8086b82831 Paul E. McKenney        2015-03-03 @371  	typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  372) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  373  	((typeof(*p) __force __kernel *)(_________p1)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  374  })
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  375  #define __rcu_dereference_check(p, c, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  376  ({ \
ac59853c06993a4 Pranith Kumar           2014-11-13  377  	/* Dependency order vs. p above. */ \
506458efaf153c1 Will Deacon             2017-10-24  378  	typeof(*p) *________p1 = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa55 Paul E. McKenney        2015-06-18  379  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  380) 	rcu_check_sparse(p, space); \
ac59853c06993a4 Pranith Kumar           2014-11-13  381  	((typeof(*p) __force __kernel *)(________p1)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  382  })
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  383  #define __rcu_dereference_protected(p, c, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  384  ({ \
f78f5b90c4ffa55 Paul E. McKenney        2015-06-18  385  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  386) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  387  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  388  })
995f1405610bd84 Paul E. McKenney        2016-07-01  389  #define rcu_dereference_raw(p) \
995f1405610bd84 Paul E. McKenney        2016-07-01  390  ({ \
995f1405610bd84 Paul E. McKenney        2016-07-01  391  	/* Dependency order vs. p above. */ \
506458efaf153c1 Will Deacon             2017-10-24  392  	typeof(p) ________p1 = READ_ONCE(p); \
995f1405610bd84 Paul E. McKenney        2016-07-01  393  	((typeof(*p) __force __kernel *)(________p1)); \
995f1405610bd84 Paul E. McKenney        2016-07-01  394  })
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  395  

:::::: The code at line 371 was first introduced by commit
:::::: 7d0ae8086b828311250c6afdf800b568ac9bd693 rcu: Convert ACCESS_ONCE() to READ_ONCE() and WRITE_ONCE()

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
