Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD7157E61
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523311; cv=none; b=m8CaDHstdUAo2m9R7jk9+8+PF562uN6uzVEXyuoP0rSm6aEgtvF1xLpzouJJbgiiZj+40WAjb5CZIiLfzoVwa7IAQwq3AtgFRHAbxq2MJOXlROGNuNhKb0D4G2qrB28OFr/R6ZEVZ9i6MwuHJdYlAP2UoiPrJTebLUdoFdtCXSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523311; c=relaxed/simple;
	bh=A+/8YxcPzSoCxTOJFhYiClqYFPCjuOsQg0XviX0lO7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7cXPMoPgfndKvPnGwPzUmUlplGfxGSWKxfyBgzwOGI5ZXst+xLcsIJeAwd/zavpZxNUnNlKeyhOJ9tPEi/6PIgK91N1y9XD4lnaXIxis/tsz/kHWx6oe1DbotuYaXsbkzGojVqmvm9Hy1mv3M/1LFTI/Q/+/lYHdqs3xKRBl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRR6jKz6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRR6jKz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720523307; x=1752059307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A+/8YxcPzSoCxTOJFhYiClqYFPCjuOsQg0XviX0lO7Y=;
  b=HRR6jKz6K7Jxznz2oVcyERQbdLxkE0UKFv0zKHxtRV5yfwkzBAK3RINe
   hfd68QMuDI3KFAdkVrepF4itFoBfE9RHMh2yFxWbidDZR4nvIvBdZwTzj
   PAEpgXDVLXgItwzwGDBDzTjbkXuq1GKyV4YEOm3ZGd4OIop0/K/epKOyi
   WbHst/Ug2j0XQ1ok1ejoYE3sni7YPZbnL9Wvm2RX1C4ipn3tB/rjFe/PW
   4M7XL1trcoZpx0b1R2Kwb2oM3wV6lUTxhIDyrtPTnWuK89bnnezBk6qEH
   TAdEuktQDG3PC6oZcE+2I1j0UHKagJSbf8W1jMQOpiZHGxXpayufq1rDy
   w==;
X-CSE-ConnectionGUID: VF0nJSfVQUG537valm8Vqg==
X-CSE-MsgGUID: dOexGRXzSbWMpOPDQLfDxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35306016"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="35306016"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 04:08:26 -0700
X-CSE-ConnectionGUID: LDkfVEGYS3C1XkS7oT9E1g==
X-CSE-MsgGUID: Wi69r0zNRnmb/ddh1/j7zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="52148299"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jul 2024 04:08:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR8hq-000WbC-00;
	Tue, 09 Jul 2024 11:08:22 +0000
Date: Tue, 9 Jul 2024 19:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7425/10451] WARNING: modpost: vmlinux: section
 mismatch in reference: devlink_port_rel_cleanup_cb+0x16 (section: .text) ->
 .L0  (section: .init.text)
Message-ID: <202407091849.4HyNYQIj-lkp@intel.com>
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
commit: e576342789f1e76ada9fed44f891f5fce83579e9 [7425/10451] mm/damon/core=
: implement DAMON context commit function
config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/arc=
hive/20240709/202407091849.4HyNYQIj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240709/202407091849.4HyNYQIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091849.4HyNYQIj-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x126 =
(section: .text) -> root_data_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x142 =
(section: .text) -> root_mount_data (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x156 =
(section: .text) -> .L21 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x15a =
(section: .text) -> .L22 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x164 =
(section: .text) -> .L22 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x16c =
(section: .text) -> .L25 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x170 =
(section: .text) -> .L22 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x17a =
(section: .text) -> __setup_readonly (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x182 =
(section: .text) -> .L26 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x18a =
(section: .text) -> .L26 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x194 =
(section: .text) -> rootwait_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x1a4 =
(section: .text) -> __setup_readwrite (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x1b2 =
(section: .text) -> __setup_readonly (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x1b6 =
(section: .text) -> .L27 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x1c6 =
(section: .text) -> .L30 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x1f6 =
(section: .text) -> root_delay_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x20c =
(section: .text) -> root_delay_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x228 =
(section: .text) -> do_mount_root (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x232 =
(section: .text) -> .L51 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x29c =
(section: .text) -> .L26 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x2c8 =
(section: .text) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x2ce =
(section: .text) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x2da =
(section: .text) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x2e6 =
(section: .text) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x2f2 =
(section: .text) -> .L58 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x302 =
(section: .text) -> .L61 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x314 =
(section: .text) -> __setup_readonly (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x324 =
(section: .text) -> .L59 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x352 =
(section: .text) -> rootwait_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x360 =
(section: .text) -> .L62 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x368 =
(section: .text) -> __setup_root_data_setup (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x3a8 =
(section: .text) -> rootwait_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fanout_add+0x3ac =
(section: .text) -> rootwait_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x3a =
(section: .text) -> .L63 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x54 =
(section: .text) -> .L69 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x58 =
(section: .text) -> .L69 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x66 =
(section: .text) -> .L64 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0xc6 =
(section: .text) -> .L71 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0xd0 =
(section: .text) -> .L77 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0xda =
(section: .text) -> .L77 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x108=
 (section: .text) -> .L76 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x128=
 (section: .text) -> .L73 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x13e=
 (section: .text) -> init_rootfs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x148=
 (section: .text) -> init_rootfs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x154=
 (section: .text) -> init_rootfs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x16a=
 (section: .text) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x170=
 (section: .text) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x186=
 (section: .text) -> mount_root_generic (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x19e=
 (section: .text) -> mount_root_generic (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x1c6=
 (section: .text) -> mount_root_generic (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x1de=
 (section: .text) -> .L104 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x1e8=
 (section: .text) -> .L117 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x21a=
 (section: .text) -> .L129 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x228=
 (section: .text) -> .L107 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x230=
 (section: .text) -> .L108 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x23e=
 (section: .text) -> .L109 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x24c=
 (section: .text) -> .L110 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x2a6=
 (section: .text) -> .L120 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x2be=
 (section: .text) -> .L111 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x340=
 (section: .text) -> .L112 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x362=
 (section: .text) -> .L130 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x36c=
 (section: .text) -> .L113 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x396=
 (section: .text) -> .L69 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x3aa=
 (section: .text) -> .L106 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x3b8=
 (section: .text) -> .L113 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x3c8=
 (section: .text) -> .L116 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x408=
 (section: .text) -> .L131 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x42e=
 (section: .text) -> .L118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x45e=
 (section: .text) -> .L131 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x4e0=
 (section: .text) -> .L113 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x4fc=
 (section: .text) -> .L69 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x508=
 (section: .text) -> .L108 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x512=
 (section: .text) -> .L133 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x520=
 (section: .text) -> prepare_namespace (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x530=
 (section: .text) -> .L133 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x538=
 (section: .text) -> .L133 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x592=
 (section: .text) -> .L135 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x5c6=
 (section: .text) -> .L138 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x602=
 (section: .text) -> .L147 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x616=
 (section: .text) -> .L138 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x624=
 (section: .text) -> .L148 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x66c=
 (section: .text) -> .L149 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x6aa=
 (section: .text) -> .L149 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x6c8=
 (section: .text) -> .L150 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x6d2=
 (section: .text) -> .L150 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x700=
 (section: .text) -> .L151 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x736=
 (section: .text) -> .L135 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x752=
 (section: .text) -> .L152 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x756=
 (section: .text) -> .L153 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x7aa=
 (section: .text) -> .L182 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x7ae=
 (section: .text) -> .L155 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x7b6=
 (section: .text) -> .L158 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x7e4=
 (section: .text) -> .L129 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x7fc=
 (section: .text) -> .L129 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x822=
 (section: .text) -> .L150 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x828=
 (section: .text) -> .L157 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x870=
 (section: .text) -> .L182 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpacket_rcv+0x87a=
 (section: .text) -> error (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: packet_diag_dump+=
0x2c (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_reload+0x=
128 (section: .text) -> vfs_caches_init_early (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_r=
el_cleanup_cb+0x16 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_rel_=
cleanup_cb+0x1c (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_por=
t_attrs_put+0x18 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x2c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x4a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x64 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x6a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x6e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x74 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x92 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0xae (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0xcc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0xd8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0xee (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0xf0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0xf4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x112 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x12e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x14a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x160 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x184 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x18c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x1a6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x1c2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x1c4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x1e0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x1fe (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x21c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_a=
ttrs_put+0x224 (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_f=
n_caps_fill+0x2e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x36 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x4a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x50 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x5e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x68 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x76 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x80 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x92 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x9c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xa6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xaa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xb8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xc0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xc6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xd0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xd6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0xe6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x102 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x108 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x10e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x118 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x11e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x128 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x12e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x136 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x13c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x144 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x152 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x16e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x178 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x182 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x188 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x190 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_c=
aps_fill+0x194 (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_l=
inecard_set+0xc (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_f=
unction_validate+0x26 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x2c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x32 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x38 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x42 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x66 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x6c (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x74 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x7a (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x84 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x8c (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x92 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x9c (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xa2 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xa8 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xb2 (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xba (section: .text) -> mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xc0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xd0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xe4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xe8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0xf6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x10c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x10e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x112 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x120 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x12a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x12c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x130 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x13e (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x144 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x146 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x14a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x158 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x170 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x172 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x176 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x184 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x18a (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x18c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x190 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x19e (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1b4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1b6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1ba (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1be (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1ca (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1e0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1e2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1e6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1f4 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1fa (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x1fc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x200 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x20e (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x214 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x216 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x21a (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x228 (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_validate+0x22e (section: .text) -> get_pte_virt_fixmap (section: .init=
=2Etext)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devl=
ink_set+0x8 (section: .text) -> get_pte_virt_fixmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devl=
ink_set+0xe (section: .text) -> get_pte_virt_fixmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devl=
ink_set+0x1e (section: .text) -> get_pte_virt_fixmap (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_d=
evlink_set+0x2c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devl=
ink_set+0x32 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devl=
ink_set+0x36 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devl=
ink_set+0x3a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devl=
ink_set+0x54 (section: .text) -> get_pte_virt_fixmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x6 (section: .text) -> get_pte_virt_fixmap (section: .ini=
t.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port=
_phys_port_name_get+0x1e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x22 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x28 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x44 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x4a (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x4e (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x5e (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x6c (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x72 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x82 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x9a (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xa0 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xa4 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xb4 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xc6 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xcc (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xdc (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xe0 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xe8 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xee (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0xf2 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x102 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x114 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x11a (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x12a (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x12e (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x136 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x140 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x148 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x15e (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x168 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x17c (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x188 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x18c (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x19a (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1a4 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1aa (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1b0 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1bc (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1ce (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1d2 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1de (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1e2 (section: .text) -> paging_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ph=
ys_port_name_get+0x1e6 (section: .text) -> paging_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_i=
nit+0xe (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_f=
ini+0xa (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_a=
ttrs_set+0xc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0x40 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0x58 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0x6a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0x74 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0x8e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0x94 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0x9c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_set+0xa0 (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_a=
ttrs_pci_pf_set+0xc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_pf_set+0x26 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_pf_set+0x34 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_pf_set+0x5a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_pf_set+0x62 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_pf_set+0x66 (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_a=
ttrs_pci_vf_set+0x10 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_vf_set+0x2a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_vf_set+0x38 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_vf_set+0x5e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_vf_set+0x66 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_vf_set+0x6a (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_a=
ttrs_pci_sf_set+0xc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_sf_set+0x26 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_sf_set+0x36 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_sf_set+0x60 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_sf_set+0x68 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attr=
s_pci_sf_set+0x6c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x3a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x3e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x6c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x7e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x84 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x8c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0xaa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0xd8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0xea (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0xf4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x104 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x116 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x11c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x12a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x138 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x13e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x15c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x162 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x170 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x176 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x17e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x186 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1a0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1bc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1c6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1ca (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1e8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1f2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1f8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x1fc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x200 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x20e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x218 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x21c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x220 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x22e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
unction_attrs_put+0x236 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x40 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x70 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x7c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0xa0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0xbc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0xe6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0xec (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0xf4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0xfa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x100 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x118 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x120 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x148 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x158 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x160 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x168 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x172 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x178 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x19c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x1bc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x1d2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x1ec (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x200 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x206 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x22e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x23e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x246 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x260 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x274 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x278 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x282 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_f=
ill+0x286 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dump_one+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dump_one+0x40 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dump_one+0x56 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dump_one+0x6a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dump_one+0x72 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dump_one+0x7a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dump_one+0x8a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x4e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x86 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x9c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0xba (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0xc8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0xd0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0xf8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x11a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x14a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x150 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x162 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x168 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_noti=
fy+0x170 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_ports_not=
ify+0x32 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_ports_not=
ify+0x36 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_ports_not=
ify+0x50 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_ports_not=
ify+0x5e (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_f=
unction_set+0x3a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x44 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x48 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x70 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x7c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x86 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x8c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0xa0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0xaa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0xba (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0xc0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0xea (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0xf0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x104 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x10a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x11e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x124 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x13a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x142 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x152 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x158 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x16a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x170 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x180 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1a4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1ac (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1be (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1c6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1ca (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1d4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1e6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1f2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x1f8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x202 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x204 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x208 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x222 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x246 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x256 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x266 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x26e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x27e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_func=
tion_set+0x284 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x28 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x2e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x58 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x60 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x66 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x6a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0xa6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0xae (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0xe8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x11c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x120 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x130 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x134 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x150 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x154 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x158 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x15c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x168 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x16c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x18c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x192 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x1b6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x1be (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x1c0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x1c4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x1c8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_registe=
r_with_ops+0x1cc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x14 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x18 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x22 (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x28 (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x5a (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x82 (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x88 (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devl_port_unregis=
ter+0x8c (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x26 (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x32 (section: .text) -> misc_mem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x36 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x70 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x92 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0xa6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0xba (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0xc0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0xd2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0xea (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0xf2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0xf4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x100 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x120 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x128 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x15a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x17c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x19a (section: .text) -> execmem_arch_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1a0 (section: .text) -> execmem_arch_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1c2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1c6 (section: .text) -> execmem_arch_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1de (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1e0 (section: .text) -> execmem_arch_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1e4 (section: .text) -> execmem_arch_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1ec (section: .text) -> cbo_get_block_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1ee (section: .text) -> cbo_get_block_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1f2 (section: .text) -> cbo_get_block_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x1fc (section: .text) -> cbo_get_block_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x200 (section: .text) -> cbo_get_block_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x212 (section: .text) -> cbo_get_block_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x216 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_ty=
pe_set+0x21a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_type=
_clear+0x1a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_rel_=
notify_cb+0x16 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_type=
_ib_set+0x5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_ports_not=
ify_register+0xa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_ports_not=
ify_unregister+0xa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_doit+0x42 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dumpit+0x8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_g=
et_dumpit+0xc (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
et_doit+0x3e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
et_doit+0x56 (section: .text) -> .L0  (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_por=
t_split_doit+0x4c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0x50 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0x7e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0x82 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0x94 (section: .text) -> get_pte_virt_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0x9c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0xae (section: .text) -> get_pte_virt_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_s=
plit_doit+0xba (section: .text) -> alloc_pte_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_u=
nsplit_doit+0xa (section: .text) -> alloc_pte_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x3c (section: .text) -> alloc_pte_fixmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x4a (section: .text) -> alloc_pte_fixmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x52 (section: .text) -> alloc_pte_fixmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x68 (section: .text) -> early_mem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x80 (section: .text) -> early_mem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x98 (section: .text) -> alloc_pte_fixmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0xf6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x11a (section: .text) -> early_mem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x122 (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x128 (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x13c (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x152 (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x156 (section: .text) -> early_mem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x166 (section: .text) -> early_mem (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x168 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x16c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x182 (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x18a (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_n=
ew_doit+0x190 (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_d=
el_doit+0xc (section: .text) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x14 (section: .text) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x1c (section: .text) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x20 (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x24 (section: .text) -> get_pte_virt_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x36 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x5c (section: .text) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x66 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x6e (section: .text) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x80 (section: .text) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x8a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x92 (section: .text) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_netd=
evice_event+0x9a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x1c (section: .text) -> alloc_pte_late (section: .init.te=
xt)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x22 (section: .text) -> create_pgd_mapping (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x28 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x3e (section: .text) -> execmem_arch_setup (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x42 (section: .text) -> execmem_arch_setup (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x4a (section: .text) -> create_pgd_mapping (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x4c (section: .text) -> cbo_get_block_size (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x50 (section: .text) -> cbo_get_block_size (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x5a (section: .text) -> cbo_get_block_size (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x5e (section: .text) -> cbo_get_block_size (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x70 (section: .text) -> create_pgd_mapping (section: .ini=
t.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_ph=
ys_port_name_get+0x76 (section: .text) -> alloc_pte_late (section: .init.te=
xt)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_sw=
itch_id_get+0x4 (section: .text) -> create_pgd_mapping (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_compat_sw=
itch_id_get+0xc (section: .text) -> create_pgd_mapping (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x92=
 (section: .text) -> riscv_kvm_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0xe2=
 (section: .text) -> riscv_kvm_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0xfa=
 (section: .text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zihintpause2=
p0_zmmul1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x10=
2 (section: .text) -> $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihint=
pause2p0_zmmul1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x10=
8 (section: .text) -> riscv_kvm_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x11=
6 (section: .text) -> riscv_kvm_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x15=
0 (section: .text) -> .L2 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x17=
8 (section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x17=
c (section: .text) -> .L4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x18=
2 (section: .text) -> $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihint=
pause2p0_zmmul1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x18=
8 (section: .text) -> riscv_kvm_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x1b=
8 (section: .text) -> .L5 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x1c=
a (section: .text) -> .L6 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x1c=
c (section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x1d=
2 (section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x1d=
6 (section: .text) -> riscv_kvm_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x20=
4 (section: .text) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atrtr_create+0x20=
8 (section: .text) -> .L9 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_sum_skb+0x2=
8 (section: .text) -> .L15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_sum_skb+0x3=
8 (section: .text) -> .L8 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_sum_skb+0xb=
8 (section: .text) -> .L11 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_sum_skb+0x1=
16 (section: .text) -> .L1=021 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_sum_skb+0x1=
5a (section: .text) -> .L10 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x4b2 =
(section: .text) -> riscv_kvm_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x4b8 =
(section: .text) -> riscv_kvm_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x4d4 =
(section: .text) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x4ea =
(section: .text) -> riscv_kvm_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x530 =
(section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x566 =
(section: .text) -> .LBB98 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x592 =
(section: .text) -> .LBE98 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x5b6 =
(section: .text) -> .LBE98 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x5ca =
(section: .text) -> .LBB98 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x5e4 =
(section: .text) -> .LBB99 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x5e8 =
(section: .text) -> .LBB99 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atif_ioctl+0x5f6 =
(section: .text) -> .LBE99 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x24 =
(section: .text) -> .LBB67 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x2a =
(section: .text) -> .LBE67 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x36 =
(section: .text) -> .LBB69 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x3e =
(section: .text) -> .LBE69 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x4c =
(section: .text) -> .LBB71 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x74 =
(section: .text) -> .LBE71 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x76 =
(section: .text) -> .LBB74 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x80 =
(section: .text) -> .LBE74 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0x9e =
(section: .text) -> .LBB76 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_ioctl+0xae =
(section: .text) -> .LBE76 (section: .init.text)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
