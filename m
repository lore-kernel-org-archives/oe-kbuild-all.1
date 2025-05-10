Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E8223716
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746886885; cv=none; b=Nbk81R3AgcYImwaPSLg+nHBSarRNnokFMJtech4hYWkLxaGFkDXAsz2F5A0/paYkB9SFK+DiMJy3etdnluSC3jLlCGZ7vVf5BL0bZe80/HzuduBD5k+WNRkRALn0Ws0iX0YEVKKHVNLssZR1AyFbP0TgKzXnk2tAKoLnpfbcSYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746886885; c=relaxed/simple;
	bh=NdGbMw7hyeQfgD4hhK2+xyrbE6g4Ob8lkjY4YPY5tqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPOL2Bbd7Crc2d60xOTvtNobh4lkthNYFHyaTOXjZQ/NfxU37hoouxzM8xM885UNq6L8jwHb7UdGvOcavkVWKJLYGxgQteogP1pWYXIjtNJ8KQMRyuH0q6Q0iaNEilOCYd+/ZQotr0nyyZKmO1bcC0RAodqhxYE9vhSmTdQWBQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dt50zKsR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dt50zKsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746886884; x=1778422884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdGbMw7hyeQfgD4hhK2+xyrbE6g4Ob8lkjY4YPY5tqk=;
  b=Dt50zKsRbkqUz6cX/nMl9GdcLDu+G1aZyFAMp7la87r2001ar1maZ2vt
   XcTb++p6Itcti1qrgOTumd4I+qhc9LxEc/IQPcEXRldo3yuc7PEWB4ek/
   vz59NK6scSbwChjA6I1c07VakXFVjRnupz2iMcz/TPnw62bHCVB183e4d
   PYVeyOIfAICR1Jm3P541lewPzZjddCaX0x+emyqujxT2uwJlX2k6ChXXx
   Ah5khdiGJuTuibYd60M7es7LEed74uQDR9v/TI14nfgJk6oJ56Y4+W7vS
   EpxEst8jHaCi0u1f11AfBIZeLN3dwVll80gDSzVVcKsde1Ohyd+gskyPg
   A==;
X-CSE-ConnectionGUID: 4chsXW3GSJGuC+s6EcAgRg==
X-CSE-MsgGUID: XCAN1ydqS8iZDaeGDHs8FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="59370305"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="59370305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 07:21:23 -0700
X-CSE-ConnectionGUID: SXCioM3cTqODe5yjKbEYJA==
X-CSE-MsgGUID: 5/jLtMHwQSS27imM7B8A4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="137275037"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 May 2025 07:21:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDl4p-000D87-2J;
	Sat, 10 May 2025 14:21:19 +0000
Date: Sat, 10 May 2025 22:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] kernel/bpf/bpf_relay.c:330:49:
 warning: 'sscanf' may overflow; destination buffer in argument 7 has size 4,
 but the corresponding specifier may require size 5
Message-ID: <202505102233.CX4eLzMK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a79e0786f3fa90fd521f198ac6ccf6b11dbf67c2
commit: 8b1242a39a8033c7a691ebd59091c17fbb456f4e [0/94] anolis: bpf: Add relayfs support for bpf
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250510/202505102233.CX4eLzMK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505102233.CX4eLzMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505102233.CX4eLzMK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_relay.c:330:49: warning: 'sscanf' may overflow; destination buffer in argument 7 has size 4, but the corresponding specifier may require size 5 [-Wfortify-source]
     330 |                      dir_name, file_name, &bufnum, bsize_str, percpu);
         |                                                               ^
   1 warning generated.


vim +/sscanf +330 kernel/bpf/bpf_relay.c

   320	
   321	static int handle_create(const char *buf)
   322	{
   323		char dir_name[NAME_MAX], file_name[NAME_MAX], bsize_str[20], percpu[4];
   324		unsigned long bufnum, bufsize;
   325		static unsigned char global_flag;
   326		unsigned char *is_global;
   327		int ret;
   328	
   329		ret = sscanf(buf, " create %s %s bufnum %lu bufsize %s percpu %4s",
 > 330			     dir_name, file_name, &bufnum, bsize_str, percpu);
   331		if (ret != 5) {
   332			pr_info("bpf-relay: create fail, get args failed\n");
   333			return -EINVAL;
   334		}
   335	
   336		/* parse arguments */
   337		bufsize = (unsigned long)memparse(bsize_str, NULL);
   338	
   339		/* by passing a valid pointer as private_data for relay channel,
   340		 * we mark the channel as global, see create_buf_file_handler()
   341		 */
   342		is_global = NULL;
   343		if (strcmp(percpu, "off") == 0)
   344			is_global = &global_flag;
   345	
   346		ret = relay_array_usable_id(dir_name, file_name);
   347		if (ret < 0) {
   348			pr_info("bpf-relay: create fail, no id left\n");
   349			return -ENOMEM;
   350		}
   351	
   352		/* create common relay chan according to args */
   353		return bpf_relay_create(dir_name, file_name, bufnum, bufsize,
   354					is_global, ret);
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
