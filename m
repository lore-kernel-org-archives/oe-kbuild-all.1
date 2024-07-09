Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5858A18562D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720562138; cv=none; b=C4uhW72udpWnNl9TnRg+zmjcE8qCNr/nyPU8mLOQmn3V9sYFtuJJnq49IVpU+872WzBlhfDmecQQf7Au1uzl0v4rA9cHsDOG65Py4PaUiinCE83SiVaWSiuYsWhbT5sU0/zp+XVnJm/RS+p+lqapiFf0hEC7OCSMybqof5yO1WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720562138; c=relaxed/simple;
	bh=L0lhplatAQbv+2Ob/qRuLLIxaI931dmbN+f10kVLhNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/gn4ufk1yYXfU9Qg+/rtABDlOoCJ7zSZbpQQWWy4PipMBZ5/YVA6tAPEstqDmbEaksyIL6rF8epqXLXyXIxUW/R2ux3tgTwu/ykbTElT4fgPVRKODMWdGT6x7lcC4W+3xIPRQ61E/44KHPLAYYmfac14+7Voo7jjy2/cijlErY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CovLeDE4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CovLeDE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720562137; x=1752098137;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L0lhplatAQbv+2Ob/qRuLLIxaI931dmbN+f10kVLhNk=;
  b=CovLeDE4867U6VzMDzfcayXKzczl8Y+j2FLJfoxQ/zvdIorGUcUjbK4L
   urAjwlMIyxiORUy190yzbGpNwoxhuZaFfOvkPRPsbw1KdHOBFDdCmbBUl
   IlQaPqzsLHMJIXWlfU9V+5fR6gTiiBR+KkGFD7ql45k8EO1PH11jbo1Ut
   nkVT6zGp52FQAIGvjkIoVUGc3Oj6g3oC39IKpApx5goTEcNQXh03c7dnt
   EwI9tQs6uPyyOzOOx9pgfVZ2hPhdj6i99HNdXpTxklSnlP/Ntq8GpM4iC
   TAW52SFNV8oEQrfN26aCI9wNxf4v00EoHJKni3eUXJ8iaIXNts+Ms8Bcn
   Q==;
X-CSE-ConnectionGUID: hvqC6lqOS3SSFmE6QJlxdA==
X-CSE-MsgGUID: PfKKRZwXQKuYYiWA5ooEeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17801357"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="17801357"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 14:55:36 -0700
X-CSE-ConnectionGUID: mptCcq2/QJC+oUyfgWQmBA==
X-CSE-MsgGUID: vhW15I00TAalfKTyFnJGlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="48084677"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jul 2024 14:55:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRIo7-000X9I-0p;
	Tue, 09 Jul 2024 21:55:31 +0000
Date: Wed, 10 Jul 2024 05:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [linux-next:master 9094/10451] WARNING: modpost: vmlinux: section
 mismatch in reference: remove_device+0x4e (section: .text) -> .L604
 (section: .init.text)
Message-ID: <202407100540.VWczFcnh-lkp@intel.com>
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
head:   82d01fe6ee52086035b201cfa1410a3b04384257
commit: cbdfb23849b330b0156760ee0d73348e020b8cdd [9094/10451] mm/zsmalloc: =
use a proper page type
config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/arc=
hive/20240710/202407100540.VWczFcnh-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240710/202407100540.VWczFcnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407100540.VWczFcnh-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0x6c (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0x7e (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0x88 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0x92 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0x9e (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0xb2 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0xc6 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_unconf_index=
_list+0x118 (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
xf8 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
xfe (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x18e (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x192 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x24e (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x252 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x272 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x276 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x294 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_conn_param+0=
x298 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_remote_oob_da=
ta+0xfc (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_remote_oob_da=
ta+0x100 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_commands+0xf=
6 (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_commands+0xf=
a (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_io_capability=
+0x12 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpa_expired_sync+=
0xe (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_long_term_ke=
ys+0x25c (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_long_term_ke=
ys+0x260 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_long_term_ke=
ys+0x266 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_long_term_ke=
ys+0x26a (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_long_term_ke=
ys+0x28e (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_long_term_ke=
ys+0x292 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x20e (=
section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x212 (=
section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x218 (=
section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x21c (=
section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x222 (=
section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x226 (=
section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features=
_info+0x30c (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features=
_info+0x324 (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features=
_info+0x328 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x24 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x3e (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x42 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x4a (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x4e (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x9c (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0xe0 (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x104 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x118 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x15e (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x198 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x19c (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x1a2 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+=
0x1a6 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_adv_patterns_=
monitor_rssi+0xcc (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_adv_patterns_=
monitor_rssi+0xd2 (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_adv_patterns_=
monitor_rssi+0xe4 (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_adv_patterns_=
monitor_rssi+0xe8 (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_adv_sync+0x34=
 (section: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_adv_sync+0xd6=
 (section: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adv_expire_sync+0=
x22 (section: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send_sync+0x=
90 (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0xa4 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0xa8 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0x222 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0x226 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0x22c (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0x230 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0x236 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0x23a (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_flags+=
0x23e (section: .text) -> __setup_str_strict_iomem (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: add_adv_complete.=
isra.0+0x48 (section: .text) -> __setup_str_reserve_setup (section: .init.r=
odata)
WARNING: modpost: vmlinux: section mismatch in reference: add_adv_complete.=
isra.0+0x4e (section: .text) -> __setup_strict_iomem (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: add_adv_complete.=
isra.0+0x58 (section: .text) -> __setup_reserve_setup (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: start_service_dis=
covery+0x16a (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: start_service_dis=
covery+0x16e (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: start_service_dis=
covery+0x23a (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: start_service_dis=
covery+0x23e (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_default_phy_c=
omplete+0x144 (section: .text) -> .L156 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x36 (section: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x3c (section: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x62 (section: .text) -> .L158 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x78 (section: .text) -> .L165 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x80 (section: .text) -> .L165 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x94 (section: .text) -> .L165 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0xb2 (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0xda (section: .text) -> .L158 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0xe2 (section: .text) -> .L158 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x132 (section: .text) -> .L434 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x13a (section: .text) -> .L439 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x13e (section: .text) -> .L441 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x146 (section: .text) -> .L437 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x15a (section: .text) -> .L437 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x15c (section: .text) -> .L440 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x160 (section: .text) -> .L440 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x178 (section: .text) -> .L601 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x17c (section: .text) -> .L434 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device_syn=
c+0x184 (section: .text) -> .L434 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send_start_c=
omplete+0x1e (section: .text) -> .L602 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send_start_c=
omplete+0x30 (section: .text) -> .L602 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send_start_c=
omplete+0xb6 (section: .text) -> .L603 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: remove_device+=
0x4e (section: .text) -> .L604 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x5=
2 (section: .text) -> .L605 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x9=
e (section: .text) -> .L613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0xb=
e (section: .text) -> .L608 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0xc=
e (section: .text) -> .L607 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x1=
18 (section: .text) -> .L610 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x1=
3c (section: .text) -> .L611 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x1=
62 (section: .text) -> .L612 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x1=
68 (section: .text) -> .L614 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x1=
74 (section: .text) -> .L612 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x1=
7c (section: .text) -> .L615 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x1=
be (section: .text) -> .L609 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x2=
22 (section: .text) -> .L613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x2=
3e (section: .text) -> .L613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x2=
86 (section: .text) -> .L1=025 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x2=
96 (section: .text) -> .L613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x2=
9c (section: .text) -> .L613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_device+0x2=
a2 (section: .text) -> .L613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pin_code_reply+0x=
2a4 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pin_code_reply+0x=
2a8 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_le_complete+0=
x8e (section: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_le_complete+0=
xa0 (section: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr_complet=
e+0x5c (section: .text) -> .LBB337 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr_complet=
e+0xc6 (section: .text) -> .LBE337 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x48 (section: .text) -> .LBB332 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0xa0 (section: .text) -> .LBE332 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0xae (section: .text) -> .LBB334 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0xb2 (section: .text) -> .LBE334 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x112 (section: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x11c (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x152 (section: .text) -> strict_iomem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x15c (section: .text) -> .LBE332 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x16a (section: .text) -> .LBE332 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x16c (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_advertising_c=
omplete+0x170 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_conn_info+0x2=
48 (section: .text) -> reserve_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_conn_info+0x2=
54 (section: .text) -> reserve_region_with_split (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_conn_info+0x2=
68 (section: .text) -> reserve_region_with_split (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_static_addres=
s+0x5a (section: .text) -> .LBB683 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_static_addres=
s+0x5c (section: .text) -> .LBE683 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_static_addres=
s+0x60 (section: .text) -> .LBE683 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x20 =
(section: .text) -> reserve_region_with_split (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x2e =
(section: .text) -> sysctl_init_bases (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x4a =
(section: .text) -> .LBB849 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x74 =
(section: .text) -> .LBE849 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0xe6 =
(section: .text) -> .LBB851 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x10c=
 (section: .text) -> .LBB853 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x15e=
 (section: .text) -> .LBB854 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x16a=
 (section: .text) -> .LBB856 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x180=
 (section: .text) -> .LBE856 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x19a=
 (section: .text) -> .LBE856 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x1b2=
 (section: .text) -> .LBE856 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_privacy+0x1de=
 (section: .text) -> .LBB851 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x24 (section: .text) -> .LBB861 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x5c (section: .text) -> .LBB866 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x72 (section: .text) -> .LBB868 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x7c (section: .text) -> .LBB869 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x9a (section: .text) -> .LBB868 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0xa4 (section: .text) -> .LBB869 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0xd0 (section: .text) -> .LBB871 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0xf4 (section: .text) -> .LBE871 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x10c (section: .text) -> .LBB881 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x16a (section: .text) -> .LBE881 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x1aa (section: .text) -> .LBB871 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x1c0 (section: .text) -> .LBB871 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x1d8 (section: .text) -> .LBB883 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x1f8 (section: .text) -> .LBE883 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x208 (section: .text) -> .LBE881 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x236 (section: .text) -> .LBE881 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x256 (section: .text) -> .LBE881 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr.part.0+=
0x26e (section: .text) -> .LBE881 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bredr+0x14 (s=
ection: .text) -> .LBB885 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device+0x3=
e (section: .text) -> .LBE885 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unpair_device+0x4=
8 (section: .text) -> .LBE885 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_link_keys+0x=
112 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_link_keys+0x=
116 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_link_keys+0x=
11c (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_link_keys+0x=
120 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_link_keys+0x=
230 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_link_keys+0x=
234 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_link_security=
+0x28 (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_link_security=
+0x3a (section: .text) -> iomem_init_inode (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0x2c (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0x32 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0x4c (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0x66 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0x7c (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0x92 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0xa0 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0xbc (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0xd2 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0xe4 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0xe6 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_setsocko=
pt+0xec (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_recvmsg+=
0x36 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_recvmsg+=
0x40 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_recvmsg+=
0x4a (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_recvmsg+=
0x72 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_recvmsg+=
0x80 (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_recvmsg+=
0xba (section: .text) -> signals_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_recvmsg+=
0xc8 (section: .text) -> signals_init (section: .init.text)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
