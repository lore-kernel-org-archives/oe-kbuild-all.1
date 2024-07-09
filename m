Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360503A1DB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 03:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720497487; cv=none; b=MIFB3Sdp0zlOzpGKEY6gaG+ITVlVdnNXY38QE5l0AMHuANK0nLvDqulVyeeWKuUf0CXCz02YZRYf5gu4S+x8iTmR3Fhxnaw4IP1Tka28eRc/geNCiG2OguO1TLe8WzVKPmGte0MbyPeUz2rwRtAIX2eR6sE1qlTBz+Dq1TKCLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720497487; c=relaxed/simple;
	bh=0tQ7O1m9eh4y4ktpQxz42IV8X3++GjHOAsRLNXCqBvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gmsF5W6B4hK8fL9m9Ip1gZraSvZIvLELs9OojGAC0+bRr1+v3nwPHST+mGpwJ6tCAXQsPED1E5LRdzMrWV2uKWU9eOO3/9/7Ny7iWGE4qy/msvGYycPZyZ7QzBKT5EfAPnKGPFw0D+pPQmoNrUQUEkig2tZ06B2L7U+dj/RzNuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD/PyluS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD/PyluS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720497485; x=1752033485;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0tQ7O1m9eh4y4ktpQxz42IV8X3++GjHOAsRLNXCqBvo=;
  b=fD/PyluSx/37OXJFyfMjdrw2pbMTURwN31khDf+KXVz1M5YFoORBwkWk
   ABeK49vFyLWLu1Lr3b4/UFbvtNL49c+liqkeYZs3dPnI8IgdR11Ly8Ce1
   oKYyT9aEcRnq6dE7ytlkE98FVOaMUGIDpwS8JWnBcIzcHTR2/QkBrpF4W
   2l//gNibP3Y9tFWIxYVYSObcMrs1r9NJZxoZcB2DXcqr7wAsm+nsKDq6x
   0JMsAr2tu5ubgiCrsPpZqgy1XcsBk+WNh7svpKk8U1X8DwFhkqDfStUvy
   yDiJmDT/A8djVJ3/sLKSRH5AiL9KzyxQ5ALmBKC1nqJcF+nXaql5s/Xlc
   g==;
X-CSE-ConnectionGUID: JbO2EmBLTP+uIg78XvJx1w==
X-CSE-MsgGUID: zQO9baR1QNiAsuUrpfuP7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29124982"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="29124982"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 20:58:04 -0700
X-CSE-ConnectionGUID: XDkEz7fWRnK6lMXpWkzc4g==
X-CSE-MsgGUID: lIjxzrcZSh2kSFh7PzBHHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="47801622"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2024 20:58:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR1zM-000WIs-1i;
	Tue, 09 Jul 2024 03:58:00 +0000
Date: Tue, 9 Jul 2024 11:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7424/10451] WARNING: modpost: vmlinux: section
 mismatch in reference: svc_xprt_enqueue.part.0+0x38 (section: .text) ->
 .LBE1049 (section: .init.text)
Message-ID: <202407091146.N8o5lBgN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: e64a020fe3a8bb9287b46568b4baf71105c5b47e [7424/10451] mm/damon/core=
: implement DAMOS quota goals online commit function
config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/arc=
hive/20240709/202407091146.N8o5lBgN-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240709/202407091146.N8o5lBgN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091146.N8o5lBgN-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: hci_clear_adv_syn=
c+0x7e (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_clear_adv_syn=
c+0xb8 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_clear_adv_syn=
c+0xd8 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_clear_adv_syn=
c+0xfe (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_clear_adv_syn=
c+0x122 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_clear_adv_syn=
c+0x124 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adv_timeout_expir=
e+0x3a (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adv_timeout_expir=
e+0x70 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adv_timeout_expir=
e+0x82 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adv_timeout_expir=
e+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cmd_sync_queu=
e_once+0x20 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cmd_sync_queu=
e_once+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cmd_sync_queu=
e_once+0x62 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scan_disable_sync=
+0x16 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scan_disable_sync=
+0x1e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scan_disable_sync=
+0x40 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scan_disable_sync=
+0x44 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scan_disable_sync=
+0x46 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scan_disable_sync=
+0x74 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_write_scan_en=
able_sync+0x32 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_write_scan_en=
able_sync+0x38 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_write_scan_en=
able_sync+0x58 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_write_scan_en=
able_sync+0x8c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_fe=
atures_sync+0x28 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_fe=
atures_sync+0x2e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_fe=
atures_sync+0x4e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_fe=
atures_sync+0x80 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_dev_clas=
s_sync+0x2a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_dev_clas=
s_sync+0x30 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_dev_clas=
s_sync+0x50 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_dev_clas=
s_sync+0x84 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_na=
me_sync+0x2a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_na=
me_sync+0x30 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_na=
me_sync+0x50 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_local_na=
me_sync+0x84 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_buffer_s=
ize_sync+0x28 (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_read_buffer_s=
ize_sync+0x2e (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_ext_create=
_conn_sync+0x154 (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_ext_create=
_conn_sync+0x178 (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_ext_create=
_conn_sync+0x192 (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_set_ext_sc=
an_param_sync+0xfa (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_set_ext_sc=
an_param_sync+0x118 (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_set_ext_sc=
an_param_sync+0x11a (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_set_ext_sc=
an_param_sync+0x120 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_set_ext_sc=
an_param_sync+0x206 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_set_ext_sc=
an_param_sync+0x28e (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_init_sync+0x2=
30 (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rpc_call_rpcerr=
or+0x28 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_call_sync+0x8=
6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xs_local_connect+=
0x44 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_e=
vent_rpc_call_rpcerror+0x40 (section: .text) -> sched_rt_sysctl_init (secti=
on: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_e=
vent_rpc_call_rpcerror+0x54 (section: .text) -> sched_dl_sysctl_init (secti=
on: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_e=
vent_rpc_call_rpcerror+0xa6 (section: .text) -> sched_dl_sysctl_init (secti=
on: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_e=
vent_svc_replace_page_err+0x124 (section: .text) -> cpu_idle_nopoll_setup (=
section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_e=
vent_svc_replace_page_err+0x12e (section: .text) -> cpu_idle_nopoll_setup (=
section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_e=
vent_svc_replace_page_err+0x130 (section: .text) -> sched_rt_sysctl_init (s=
ection: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_svc_xp=
rt_enqueue+0x108 (section: .text) -> cpu_idle_poll_setup (section: .init.te=
xt)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_svc_xp=
rt_enqueue+0x124 (section: .text) -> cpu_idle_nopoll_setup (section: .init.=
text)
WARNING: modpost: vmlinux: section mismatch in reference: gssd_running+0x24=
 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssd_running+0x2a=
 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssd_running+0x4c=
 (section: .text) -> pm_debug_messages_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssd_running+0x58=
 (section: .text) -> pm_debug_messages_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssd_running+0x72=
 (section: .text) -> pm_debug_messages_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_get_sb_net+0x=
24 (section: .text) -> pm_debug_messages_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_get_sb_net+0x=
28 (section: .text) -> pm_debug_messages_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_put_sb_net+0x=
8c (section: .text) -> cpu_latency_qos_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_kill_sb+0x2a =
(section: .text) -> pm_debug_messages_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_kill_sb+0x2e =
(section: .text) -> pm_debug_messages_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_kill_sb+0x52 =
(section: .text) -> cpu_latency_qos_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_kill_sb+0x5c =
(section: .text) -> cpu_latency_qos_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_kill_sb+0x88 =
(section: .text) -> cpu_latency_qos_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_find_or_alloc=
_pipe_dir_object+0x34 (section: .text) -> pm_debug_messages_setup (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_find_or_alloc=
_pipe_dir_object+0x38 (section: .text) -> pm_debug_messages_setup (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_find_or_alloc=
_pipe_dir_object+0x5c (section: .text) -> cpu_latency_qos_init (section: .i=
nit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_find_or_alloc=
_pipe_dir_object+0x66 (section: .text) -> cpu_latency_qos_init (section: .i=
nit.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_op=
en+0xe (section: .text) -> .LBE1033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_op=
en+0x14 (section: .text) -> .LBE1033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_op=
en+0x22 (section: .text) -> .LBB1064 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_st=
op+0x6 (section: .text) -> pm_disk_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_st=
art+0x16 (section: .text) -> resume_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_st=
art+0x28 (section: .text) -> .LBE1034 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_st=
art+0x32 (section: .text) -> resume_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_sh=
ow+0xa (section: .text) -> .LBB1062 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_sh=
ow+0x24 (section: .text) -> .LBE1062 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_sh=
ow+0x2c (section: .text) -> .LBE1062 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_sh=
ow+0x42 (section: .text) -> .LBB1063 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_pool_stats_sh=
ow+0x4a (section: .text) -> .LBB1063 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x2=
2 (section: .text) -> pm_disk_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x2=
8 (section: .text) -> .LBE1035 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x3=
2 (section: .text) -> .LBB1050 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x4=
e (section: .text) -> .LBE1050 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x5=
c (section: .text) -> resume_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x7=
4 (section: .text) -> .LBE1036 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0xb=
8 (section: .text) -> .LBB1048 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0xc=
2 (section: .text) -> .LBB1048 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0xd=
4 (section: .text) -> .LBE1048 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0xe=
2 (section: .text) -> .LBE1048 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0xf=
c (section: .text) -> .LBE1048 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x1=
08 (section: .text) -> .LBB1049 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_free+0x1=
12 (section: .text) -> .LBE1035 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_enque=
ue.part.0+0x38 (section: .text) -> .LBE1049 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_handle_xprt+0=
x30 (section: .text) -> .LBB1946 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_handle_xprt+0=
x64 (section: .text) -> .LBE1946 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_handle_xprt+0=
xa2 (section: .text) -> .LBB1958 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_handle_xprt+0=
xae (section: .text) -> .LBE1958 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_handle_xprt+0=
x280 (section: .text) -> .LBE1958 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x264 (section: .text) -> .L183 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x266 (section: .text) -> .L182 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x2a0 (section: .text) -> .L183 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x2ee (section: .text) -> .L196 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x314 (section: .text) -> .L186 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x364 (section: .text) -> .L187 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x36c (section: .text) -> .L185 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x380 (section: .text) -> .L204 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x382 (section: .text) -> set_handle_irq (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x386 (section: .text) -> set_handle_irq (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x38e (section: .text) -> .L205 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssp_accept_sec_c=
ontext_upcall+0x3bc (section: .text) -> .L205 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: register_vlan_dev=
ice+0x11e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: register_vlan_dev=
ice+0x122 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_dev_open+0xe=
2 (section: .text) -> .LBB6636 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
44 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
62 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
68 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
6e (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
74 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
82 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
a0 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
be (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
c4 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
dc (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
e0 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
f2 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
10e (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
116 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
130 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
148 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
14c (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
160 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
166 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
186 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
18a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
18e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
1a4 (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_fill_info+0x=
1ac (section: .text) -> srcu_bootup_announce (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_verify_comb=
inations+0x18 (section: .text) -> .L2675 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_verify_comb=
inations+0x24 (section: .text) -> .L2676 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_verify_comb=
inations+0x2a (section: .text) -> .L2677 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x23=
2 (section: .text) -> .L283 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x24=
6 (section: .text) -> .L283 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x27=
2 (section: .text) -> .L284 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x27=
a (section: .text) -> .L284 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x4a=
6 (section: .text) -> .L285 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x4a=
a (section: .text) -> .L285 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x51=
c (section: .text) -> .L282 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x52=
4 (section: .text) -> .L282 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x52=
8 (section: .text) -> .L290 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x53=
2 (section: .text) -> .L290 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x58=
c (section: .text) -> .L291 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x59=
0 (section: .text) -> .L291 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x5f=
2 (section: .text) -> .L292 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x60=
0 (section: .text) -> .L292 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x62=
6 (section: .text) -> .L1=02109 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x62=
a (section: .text) -> .L1=02109 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x68=
e (section: .text) -> .L293 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x69=
e (section: .text) -> .L293 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x6f=
2 (section: .text) -> .L294 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_new_nm+0x6f=
a (section: .text) -> .L294 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_stop_ifa=
ce+0xce (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_register+0x=
266 (section: .text) -> .L605 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiphy_register+0x=
26a (section: .text) -> .L605 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_init_wde=
v+0x10 (section: .text) -> .L607 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_init_wde=
v+0x1e (section: .text) -> .L607 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nl80211_nan_del_f=
unc+0x108 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x90 (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x98 (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0xa0 (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0xae (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0xbe (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0xde (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0xe2 (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0xfe (section: .text) -> kexec_core_sysctl_init (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x110 (section: .text) -> kexec_core_sysctl_init (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x11a (section: .text) -> kexec_core_sysctl_init (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x11e (section: .text) -> kexec_core_sysctl_init (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x126 (section: .text) -> cgroup_disable (section: .init.t=
ext)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x17c (section: .text) -> kexec_core_sysctl_init (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x186 (section: .text) -> cgroup_disable (section: .init.t=
ext)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x192 (section: .text) -> cgroup_disable (section: .init.t=
ext)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x1d0 (section: .text) -> kexec_core_sysctl_init (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_dfs_chan=
nels_update_work+0x1d8 (section: .text) -> kexec_core_sysctl_init (section:=
 .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_start_ba=
ckground_radar_detection+0x36 (section: .text) -> kexec_core_sysctl_init (s=
ection: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_start_ba=
ckground_radar_detection+0x40 (section: .text) -> kexec_core_sysctl_init (s=
ection: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_start_ba=
ckground_radar_detection+0x50 (section: .text) -> cgroup_disable (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_start_ba=
ckground_radar_detection+0x62 (section: .text) -> cgroup_disable (section: =
=2Einit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_start_ba=
ckground_radar_detection+0x82 (section: .text) -> kexec_core_sysctl_init (s=
ection: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cfg80211_start_ba=
ckground_radar_detection+0xde (section: .text) -> kexec_core_sysctl_init (s=
ection: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __ieee80211_sta_j=
oin_ibss+0x364 (section: .text) -> .LBB6636 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_do_open=
+0x14c (section: .text) -> unbound_reg_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_do_open=
+0x150 (section: .text) -> bpf_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_do_open=
+0x314 (section: .text) -> unbound_reg_init (section: .init.text)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
