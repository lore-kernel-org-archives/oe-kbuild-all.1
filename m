Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86720335C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 04:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715403478; cv=none; b=EdFhJjlr4yMXj9hrO2GVoNsyGut2kqvrEq8EbX6vQN3m2td4B8WVuE6kT1FspPr8hdETGt2y5EegZCZjtS5zAEjBt6qVhPLwbd8wliy5wtjcsWXqBBu6scTvjHhaNPJLVcBm+FsUtrQLKapIDSwCxdor+VNopMemCmoE5BOeIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715403478; c=relaxed/simple;
	bh=hVt0eqiZTFRUNLEMtX6GwCbIvRoSTu8inOyjbYUf0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrDjuRWdd7CnVQAKKIrTdEEI83Kb1Gth9ESp+MBfTmw5uZJeVH9Nd0qSE8iMDiR74EQXsvUtitL969kSnN9pZRF851hJrmC6P3BScV4Dbr/XbAjx4JNZIlNebyj7ZF7TbJ6SfWVicpIqrxiVBPMmnYHwIj3I6Cuw4ZFXPAgk6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UA8iCzaU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UA8iCzaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715403475; x=1746939475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hVt0eqiZTFRUNLEMtX6GwCbIvRoSTu8inOyjbYUf0Ps=;
  b=UA8iCzaU6xoDNUFBR5t4z3PJZa99otQ9xuy46umGKim4FwFm6jA032tU
   PdgSNvKvwu12g7hPf7DwlBDtcY7//h8FIF/fEyMJ+5I1FvOYgczZmOh3R
   3E7xqBc1bKLYZumnLtdrpEz8uEFwXaincM3IkP/MAT1GjQAPMctTAlvrF
   sPnK0a776t74bZit8IORQXkgN1E6kbYy6ZdyuOTitQUaV6bbcG3kG9/G4
   g6Oavf7HNpmB+KlhDBBCBv62aAVMb0jbDJCcEPndao6WJn0DgEfy2mJ67
   eFfiOyIhSJS/xmOt1xV+GpOPsjw4HRr0NrIVOvNAImDJF6P7xV1d5Kp66
   g==;
X-CSE-ConnectionGUID: ntMV6gi8R9SryVDYAy/MwA==
X-CSE-MsgGUID: SoyR8cH1QbyfNgO1sXgzeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11625408"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="11625408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 21:57:54 -0700
X-CSE-ConnectionGUID: K/0gUddQR5uu3/rX4CZ7IA==
X-CSE-MsgGUID: vXzMADPfTeOoyREqd4TZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="34501367"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 21:57:47 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5eno-0006xH-37;
	Sat, 11 May 2024 04:57:44 +0000
Date: Sat, 11 May 2024 12:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Bland <mbland@motorola.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Zi Shen Lim <zlim.lnx@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxwell Bland <mbland@motorola.com>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shaoqin Huang <shahuang@redhat.com>,
	Ryo Takakura <takakura@valinux.co.jp>,
	James Morse <james.morse@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v5 1/2] mm: allow dynamic vmalloc range restrictions
Message-ID: <202405111234.17zoTVX3-lkp@intel.com>
References: <ozcyvkcdqhxhlg3sjz3s4odt7ejiwx2cctgb7sdx6jbardui37@al6uvt4yx5nt>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ozcyvkcdqhxhlg3sjz3s4odt7ejiwx2cctgb7sdx6jbardui37@al6uvt4yx5nt>

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on ee5b455b0adae9ecafb38b174c648c48f2a3c1a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Bland/arm64-mm-code-and-data-allocation-partitioning/20240510-022822
base:   ee5b455b0adae9ecafb38b174c648c48f2a3c1a5
patch link:    https://lore.kernel.org/r/ozcyvkcdqhxhlg3sjz3s4odt7ejiwx2cctgb7sdx6jbardui37%40al6uvt4yx5nt
patch subject: [PATCH v5 1/2] mm: allow dynamic vmalloc range restrictions
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240511/202405111234.17zoTVX3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111234.17zoTVX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111234.17zoTVX3-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: net/8021q/vlan_dev.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/8021q/vlan.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/8021q/vlan_netlink.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/8021q/vlan.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/8021q/vlanproc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/8021q/vlan.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: net/sunrpc/xprt.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/socklib.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/xprtsock.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/sched.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_null.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_tls.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_unix.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/svc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/svcsock.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/svcauth.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/svcauth_unix.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/addr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/rpcb_clnt.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/timer.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/xdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/sunrpc_syms.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/cache.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/rpc_pipe.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/sysfs.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/svc_xprt.o: in function `arch_init_checked_vmap_ranges':
   include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/xprtmultipath.o: in function `arch_init_checked_vmap_ranges':
   include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/stats.o: in function `arch_init_checked_vmap_ranges':
   include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/sysctl.o: in function `arch_init_checked_vmap_ranges':
   net/sunrpc/sysctl.c:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/clnt.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: drivers/scsi/aic7xxx/aic7xxx_93cx6.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; drivers/scsi/aic7xxx/aic7xxx_core.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: drivers/scsi/aic7xxx/aic7xxx_pci.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; drivers/scsi/aic7xxx/aic7xxx_core.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: drivers/scsi/aic7xxx/aic7xxx_reg_print.o: in function `arch_init_checked_vmap_ranges':
   drivers/scsi/aic7xxx/aic7xxx_reg_print.c:137: multiple definition of `arch_init_checked_vmap_ranges'; drivers/scsi/aic7xxx/aic7xxx_core.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: drivers/scsi/aic7xxx/aic7xxx_osm.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; drivers/scsi/aic7xxx/aic7xxx_core.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: drivers/scsi/aic7xxx/aic7xxx_proc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; drivers/scsi/aic7xxx/aic7xxx_core.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: drivers/scsi/aic7xxx/aic7xxx_osm_pci.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; drivers/scsi/aic7xxx/aic7xxx_core.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: net/sunrpc/auth_gss/gss_generic_token.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/auth_gss.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_mech_switch.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/auth_gss.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/svcauth_gss.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/auth_gss.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_rpc_upcall.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/auth_gss.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_rpc_xdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/auth_gss.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/trace.o: in function `arch_init_checked_vmap_ranges':
   net/sunrpc/auth_gss/trace.c:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/auth_gss.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_seal.o: in function `arch_init_checked_vmap_ranges':
>> net/sunrpc/auth_gss/gss_krb5_seal.c:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_unseal.o: in function `arch_init_checked_vmap_ranges':
   net/sunrpc/auth_gss/gss_krb5_unseal.c:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_wrap.o: in function `arch_init_checked_vmap_ranges':
   include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_crypto.o: in function `arch_init_checked_vmap_ranges':
   include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: net/sunrpc/auth_gss/gss_krb5_keys.o: in function `arch_init_checked_vmap_ranges':
   include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; net/sunrpc/auth_gss/gss_krb5_mech.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: fs/reiserfs/do_balan.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/namei.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/inode.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/file.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/dir.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/fix_node.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/super.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/prints.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/objectid.o: in function `arch_init_checked_vmap_ranges':
   fs/reiserfs/objectid.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/lbalance.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/ibalance.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/stree.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/hashes.o: in function `arch_init_checked_vmap_ranges':
   fs/reiserfs/hashes.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/tail_conversion.o: in function `arch_init_checked_vmap_ranges':
   fs/reiserfs/tail_conversion.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/journal.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/resize.o: in function `arch_init_checked_vmap_ranges':
   fs/reiserfs/resize.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/item_ops.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/ioctl.o: in function `arch_init_checked_vmap_ranges':
   fs/reiserfs/ioctl.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/xattr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/reiserfs/lock.o: in function `arch_init_checked_vmap_ranges':
   fs/reiserfs/lock.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/reiserfs/bitmap.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: fs/nfs/dir.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/file.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/getroot.o: in function `arch_init_checked_vmap_ranges':
   fs/nfs/getroot.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/inode.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/super.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/io.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/direct.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/pagelist.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/read.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/symlink.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/unlink.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/write.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/namespace.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/mount_clnt.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/nfstrace.o: in function `arch_init_checked_vmap_ranges':
   fs/nfs/nfstrace.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/export.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/sysfs.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/fs_context.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/sysctl.o: in function `arch_init_checked_vmap_ranges':
   fs/nfs/sysctl.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/client.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: fs/nfs/proc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/nfs2super.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/nfs2xdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/nfs2super.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: fs/nfs/nfs3client.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/nfs3super.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/nfs3proc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/nfs3super.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/nfs/nfs3xdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfs/nfs3super.o:include/linux/vmalloc.h:137: first defined here
--
   alpha-linux-ld: fs/nfsd/nfssvc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/nfsctl.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/nfsfh.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/vfs.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/export.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/auth.o: in function `arch_init_checked_vmap_ranges':
   fs/nfsd/auth.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/lockd.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/nfscache.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/stats.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/filecache.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/nfs3proc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/nfs3xdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
   alpha-linux-ld: fs/nfsd/netlink.o: in function `arch_init_checked_vmap_ranges':
   fs/nfsd/netlink.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/nfsd/trace.o:fs/nfsd/trace.c:137: first defined here
--
   alpha-linux-ld: fs/lockd/clntproc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/clntxdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/host.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/svc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/svclock.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/svcshare.o: in function `arch_init_checked_vmap_ranges':
   fs/lockd/svcshare.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/svcproc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/svcsubs.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/mon.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/trace.o: in function `arch_init_checked_vmap_ranges':
   fs/lockd/trace.c:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/xdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/clnt4xdr.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/xdr4.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/svc4proc.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here
   alpha-linux-ld: fs/lockd/procfs.o: in function `arch_init_checked_vmap_ranges':
>> include/linux/vmalloc.h:137: multiple definition of `arch_init_checked_vmap_ranges'; fs/lockd/clntlock.o:include/linux/vmalloc.h:137: first defined here


vim +137 include/linux/vmalloc.h

   133	
   134	#ifndef arch_init_checked_vmap_ranges
   135	inline void __init arch_init_checked_vmap_ranges(void)
   136	{
 > 137	}
   138	#endif
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
