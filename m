Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB56519309E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107492; cv=none; b=jieNOf5H+/pfWtLJEQAlhgcT8dOnNzkAku3p5O6j8egVPlVR7eTll5cY/w//gmSJBTyHRdYn3ESwr1OwQ4CHgdWeUt2VkhpbXKpTXAc31Ezr3Nn3O4PPPrbP5z9ErJGzrd3icCFhNJgrgNfWKD6PczcGahqvtdWux9Ov62nsafc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107492; c=relaxed/simple;
	bh=khRECiu9VCh8uj6Nc4UFr8QoTFkibs/IrvPwSaRyrIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qTSX/eyrKlBTerlkGHFhLejEmu1LjbE6yWX5+fUouXwjESr1PcOXQFd3HNVKc1xAxtgalr56RY31VcmnhIqgLWR0Z3R6uaLEtm6CwrDoMVpKqVORMxY5JFAuaSqFIJa/GWRHXSRE44wf2YhwN3BaFn8T6iiZfXaALwkpP4Ce62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfaVI4I7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfaVI4I7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730107490; x=1761643490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khRECiu9VCh8uj6Nc4UFr8QoTFkibs/IrvPwSaRyrIQ=;
  b=WfaVI4I7B24dpsYtchNIFSUW7FtGomW5AkuIxy/MwjnmswgYwfB8gAJO
   OwtmKUYbfNwd7+jE/gLzc3miZNNEBt9cQPIeytOn0PMhPYygr7zCxNiAr
   BbAeKJaKaYm8fQmMzFHzo1je+bqvsjKzNuMLVMqDj3Q6KEcb/C6flKPBu
   3zRmNi/7/ZMOy8mjqfyAGvT6IiolQJWtJ72ZIBhparIvwrHZZVaNa6PJX
   Hw+0gcXoLgj0gXhpLLidUuEovyvsbFOQam5oMIYuwRNW0p7IRhyciRl1c
   ASrHBghUXu5jwW/Q649e8kZEGnq4kgjNOoM2Gpk1gEBEUsGHwibhLb+Kw
   Q==;
X-CSE-ConnectionGUID: /fd63b/5Sxy4Ig8Rf4cCLA==
X-CSE-MsgGUID: k1tiw+Z+SKy06TaK4ROhAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47155689"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47155689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:24:50 -0700
X-CSE-ConnectionGUID: 4h3Rtc/MQ/au3UVFr6wFZg==
X-CSE-MsgGUID: iGKuhw2kS/eZC79QW4ivAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="85517621"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2024 02:24:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5LzS-000cG4-10;
	Mon, 28 Oct 2024 09:24:46 +0000
Date: Mon, 28 Oct 2024 17:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_5 21/26]
 include/linux/uprobes.h:127:33: error: field 'tramp_mutex' has incomplete
 type
Message-ID: <202410281748.AVepCEjw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_5
head:   748f02be1adc50c8aea1e580791e8085f8713c07
commit: 0ec2293dc6f5526b57f0f431643dbfbbddc5cd51 [21/26] uprobes: Add mapping for optimized uprobe trampolines
config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archive/20241028/202410281748.AVepCEjw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281748.AVepCEjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281748.AVepCEjw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:16,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/if.h:25,
                    from include/linux/mii.h:12,
                    from drivers/net/phy/swphy.c:13:
>> include/linux/uprobes.h:127:33: error: field 'tramp_mutex' has incomplete type
     127 |         struct mutex            tramp_mutex;
         |                                 ^~~~~~~~~~~


vim +/tramp_mutex +127 include/linux/uprobes.h

   123	
   124	struct uprobes_state {
   125		struct xol_area		*xol_area;
   126		struct hlist_head	tramp_head;
 > 127		struct mutex		tramp_mutex;
   128	};
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
