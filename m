Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1E311712
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720440823; cv=none; b=nR/MQv7URJ7mJ5zemPIBdKXlCGZYx+YISOYdjmSLDGl4VL+xh3LtIIT7C1a+1NNv4W8b1wCbOMIMkLOQz4Z3KoPFH5qyQwjhy9HgkHepRuI7tufAmIG3wFbRj66hCb5+k10IFRBr0tSB0zC8MG+sE7YUUJwByRkJR0nFiQ3KVaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720440823; c=relaxed/simple;
	bh=ySO44tGSF7hho2H1C0UVfrfG0z34acN8wi2B7C7yNOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tfx/WIQsLtT8zFNiVZ/4Gwp/ScQjTJd90Izz7He0OURntsqrtDP9e3qIabHU9aI2Fj8+bTy53/Tcnk09SC33n9bC7QpS43k8S+c1sUgnFQp+ApRol/tJ/M8fLLaA2AL1B/pwnBOkfLP4uj6oa9LzW+qGsjGXNu1jP9TbVJ58nbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/sZucTy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/sZucTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720440821; x=1751976821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ySO44tGSF7hho2H1C0UVfrfG0z34acN8wi2B7C7yNOw=;
  b=a/sZucTyLCRhsM7ZOIuW8sTWcggSAuYFoRAx7YCoS1aFYWUjmJ7+oXKl
   FezMVuq/k4/jvT9KLN42gtSUsXttPTrp673CKp3ad2OvQM09XXm3vMRIY
   s/FLR7rCh5ZP3Pw5rZL4Aeq4T9PLTniU47ITWadVD2hfojuxnByX3zh+0
   RNf/vWQUk2T5ECsgHf8OooPpsctcDMf4rR7VNnEpXDk39eS1SEIg+c6PQ
   ES6N0UvIQ+9WbQCWn+dYAQMtLbwVzbtPoWQH+hz+NC3yMvwMkt1NW5GJJ
   MN5K4GIi77wAfMbVxWXH6+AS5vD2ZfVjJLOhuK+jY5ABPuztSRTze7XdV
   w==;
X-CSE-ConnectionGUID: HAyUlB+5TUGTskS5lKfJlw==
X-CSE-MsgGUID: HC8+Q9WGTXWgcb+J7P0PJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28241926"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="28241926"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 05:13:40 -0700
X-CSE-ConnectionGUID: MBC3LYRrTEi0DQhUPMXwSg==
X-CSE-MsgGUID: g+Gi74c3SEKOvGJBMFKWJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="52084221"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jul 2024 05:13:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQnFP-000Vj0-1r;
	Mon, 08 Jul 2024 12:13:35 +0000
Date: Mon, 8 Jul 2024 20:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10178/10451] WARNING: modpost: vmlinux: section
 mismatch in reference: jhash+0x14 (section: .text) -> .L0  (section:
 .init.text)
Message-ID: <202407082037.ZhU1oute-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 10bff3eb82455ef2d276bf11f48765a1fe8ff3ad [10178/10451] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240708/202407082037.ZhU1oute-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407082037.ZhU1oute-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407082037.ZhU1oute-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: dns_query+0x26a (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dns_query+0x296 (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dns_query+0x2c0 (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_param_set_ra+0x74 (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_algo_register+0x3c (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_algo_register+0x9e (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_send_outstanding_bat_ogm_packet+0xd8 (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_send_outstanding_bat_ogm_packet+0xf2 (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x456 (section: .text) -> shmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x45a (section: .text) -> shmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x474 (section: .text) -> extfrag_debug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x478 (section: .text) -> extfrag_debug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x492 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x496 (section: .text) -> shmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x4be (section: .text) -> extfrag_debug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x4c2 (section: .text) -> shmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x4d0 (section: .text) -> shmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_iv_ogm_orig_update+0x4e6 (section: .text) -> shmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x50 (section: .text) -> .L1052 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x60 (section: .text) -> pcpu_free_alloc_info (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x88 (section: .text) -> .L1062 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x94 (section: .text) -> .L1054 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0xa8 (section: .text) -> .L1066 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0xe2 (section: .text) -> .L1067 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x106 (section: .text) -> .L1054 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x12c (section: .text) -> .L1068 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x138 (section: .text) -> .L1067 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x13e (section: .text) -> .L1068 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x156 (section: .text) -> .L1069 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x162 (section: .text) -> .L1069 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x186 (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x19c (section: .text) -> .L1067 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x1b6 (section: .text) -> .L1070 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x1ca (section: .text) -> .L1066 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x1e2 (section: .text) -> .L1067 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x1e8 (section: .text) -> .L1067 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x1fa (section: .text) -> .L1067 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_get_throughput+0x206 (section: .text) -> .L1071 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_start_timer+0x28 (section: .text) -> .L1072 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x22 (section: .text) -> .L1073 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x34 (section: .text) -> .L406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x6c (section: .text) -> .L1074 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0xf8 (section: .text) -> .L1140 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x100 (section: .text) -> .L1140 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x11e (section: .text) -> .L1076 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x14a (section: .text) -> .L1141 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x164 (section: .text) -> .L1141 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x192 (section: .text) -> .L1077 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1bc (section: .text) -> .L1078 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1cc (section: .text) -> .L1141 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1d2 (section: .text) -> .L1142 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1da (section: .text) -> .L1143 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1e4 (section: .text) -> .L1104 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1ec (section: .text) -> .L1082 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1ee (section: .text) -> .L1083 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x1f4 (section: .text) -> .L1084 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x21e (section: .text) -> .L1085 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x232 (section: .text) -> .L1076 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x236 (section: .text) -> .L1076 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x250 (section: .text) -> .L1086 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x25a (section: .text) -> .L1087 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x266 (section: .text) -> .L1087 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x282 (section: .text) -> .L1106 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x286 (section: .text) -> .L1143 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x296 (section: .text) -> .L1143 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x29a (section: .text) -> .L1088 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x2a6 (section: .text) -> .L1143 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x2b0 (section: .text) -> .L1108 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x2b8 (section: .text) -> .L1108 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x2c8 (section: .text) -> .L1081 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_periodic_work+0x2cc (section: .text) -> .L1086 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x20 (section: .text) -> .L1080 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x38 (section: .text) -> .L1079 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x48 (section: .text) -> .L1091 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x88 (section: .text) -> .L1092 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0xf6 (section: .text) -> .L1093 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x10e (section: .text) -> .L1109 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x11e (section: .text) -> .L1144 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x122 (section: .text) -> .L1094 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x178 (section: .text) -> .L1079 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x182 (section: .text) -> .L1079 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x18c (section: .text) -> .L1091 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_neigh_update+0x198 (section: .text) -> .L1091 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_throughput_metric_update+0x14 (section: .text) -> .L88 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_throughput_metric_update+0x22 (section: .text) -> .L1096 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_throughput_metric_update+0x34 (section: .text) -> .L1098 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_throughput_metric_update+0x44 (section: .text) -> .L1099 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_throughput_metric_update+0x48 (section: .text) -> .L1145 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0x32 (section: .text) -> .L1102 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0xa2 (section: .text) -> .L1103 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0xb6 (section: .text) -> .L402 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0xba (section: .text) -> .L1147 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0xca (section: .text) -> .L402 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0xce (section: .text) -> .L1147 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0xf2 (section: .text) -> .L1049 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0xf6 (section: .text) -> .L1148 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0x102 (section: .text) -> .L1049 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0x106 (section: .text) -> .L1148 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_iface_enable+0x120 (section: .text) -> .L406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_v_elp_packet_recv+0x16a (section: .text) -> .L407 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: jhash+0x14 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: jhash+0xb8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_gw_put.part.0+0x16 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_gw_put.part.0+0x1a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_gw_put.part.0+0x26 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_release+0x68 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_release+0x6e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_release+0x76 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x10 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x1e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x56 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x64 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x68 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x70 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0x86 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0xca (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0xce (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0xd8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0xe0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0xe2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0xea (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_del_backbone_claims+0xf6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0xe (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x16 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x6a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x72 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x7a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x86 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0xa8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0xac (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0xb0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0xb8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0xd2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x10a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x112 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x116 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x134 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x140 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x142 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x146 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x14a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x150 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x15c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x168 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_purge_backbone_gw+0x178 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x36 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x42 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x4a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x4e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x6c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x72 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x76 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x7a (section: .text) -> vfs_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x92 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0x9c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0xc8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0xd6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0xe8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0xec (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_loopdetect_report+0xf4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_claim_get_backbone_gw+0x28 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_claim_get_backbone_gw+0x30 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_claim_get_backbone_gw+0x56 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_bla_claim_get_backbone_gw+0x62 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xe (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x1c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x30 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x4e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x52 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x6e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x74 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x84 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x8e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xa2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xaa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xac (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xb2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xc0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xc8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xee (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xf2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_claim_hash_find+0xf6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0x34 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0x6a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0x7a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0x9c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xb8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xbc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xce (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xd8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xe2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xec (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xf4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xf6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_backbone_hash_find+0xfc (section: .text) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
