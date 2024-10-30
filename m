Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62541BD9E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 23:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730332307; cv=none; b=BqIVW/pi4vGKv6UagD57ussEPtHEBRxL5hSeFelMThTNgWMWugXlrWwhBp3xUdXSdkNUr/WxmRahZPA3GC4lkoodPM5U4mZaYUVDTJMlmQBkYXTB1nWBPqjQdziYn8bGum9qyjcPVGFlNh3DV1SVxPbukTJuWuFBEvFdDiHMS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730332307; c=relaxed/simple;
	bh=cpH3d9pvQcPTlS83WK07EOwSLSEhqg9QEwmgjnTU8wM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vg78qijQ12sKCNrMb7aciwxOel9I5KS3B30GRJqohdrIKD0zVgE7PqQGbFGZnvEe6GKpr/pLm1wBYemDH36fF6EnxNizdi8UtZlLfHSa+3D+0vvC4Nsqtj8GIRXz64C2XWkOe5JU6QwXAxWp0YrxLkznReRmSPgPmYQC1vFqLP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESSmOx9g; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESSmOx9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730332305; x=1761868305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cpH3d9pvQcPTlS83WK07EOwSLSEhqg9QEwmgjnTU8wM=;
  b=ESSmOx9gplzCUbmmz38mrUW49TzPoDgthgOOH1xOXHXdhqf5qdTxE7a/
   SGIJKtvM5YaJFaiWN4vXYFHT83NOjtsWTUWCc47B1FDx6NkWn7CWjfl/v
   a1fD2nUYHgd5oQ43S2TjNZzqdLdfGTLNN44v15wxo/x/eeL7U3TdRL1yH
   uKZDl3EVg7fuZwTxwzK5tnJ5mmVTpwAlt2UwoaWFMWJbeCAbYXV6ZynSG
   kNa+BmP7MfM7Be84QcsUN+ECEAuM70xkRDR+dEzz/xFeXwvTDGMUkonDh
   cYEQIUh9XAh4uzwvs107uli5nJi0403uXfLeAkvnOe6xwNcJEjZ4uDZ5l
   g==;
X-CSE-ConnectionGUID: K01BBTuRShCL5dPhbXS5hw==
X-CSE-MsgGUID: AsJW8rBWSkiTo0ak89Crig==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29915417"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29915417"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 16:51:43 -0700
X-CSE-ConnectionGUID: KfgWzFjoTvSUJlkHMhpdEQ==
X-CSE-MsgGUID: j8FzgdbdSfed156GBtvjSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82386624"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Oct 2024 16:51:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6ITT-000fR6-1Q;
	Wed, 30 Oct 2024 23:51:39 +0000
Date: Thu, 31 Oct 2024 07:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 6030/8186] ld.lld: error: Function Import: link
 error: linking module flags 'Code Model': IDs have conflicting values in
 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(syscall.o at 907452)'
Message-ID: <202410310724.GQ8vfezf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
commit: ba512b00e5efbf7e19cfb7fa9f66ce82669b7077 [6030/8186] bpf: Add uptr support in the map_value of the task local storage.
config: riscv-randconfig-r054-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310724.GQ8vfezf-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310724.GQ8vfezf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310724.GQ8vfezf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(trace.o at 905532)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(skbuff.o at 1022952)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(protocol.o at 1040832)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(slub.o at 912492)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(filter.o at 1024032)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(syscall.o at 907452)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(tcp.o at 1030272)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(segment.o at 938232)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(memcontrol.o at 912672)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(super.o at 937872)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(core.o at 909972)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(target_core_transport.o at 995712)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(af_packet.o at 1035312)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(file.o at 937632)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(data.o at 938112)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(blk-mq.o at 947052)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(ring_buffer.o at 905472)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(namei.o at 913632)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(node.o at 938172)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 895392)' and 'vmlinux.a(page_alloc.o at 912312)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
