Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601112BE8C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706723624; cv=none; b=eslt+VtydVvpEi46ReLLtbx+Yby0tf1ObPCHJIwwDvWWH5BXD32KsNL7GwU1jQawKiOUeinF2vQLQ4aWQaL67BHg+t53+0P1W7UtYs/fi2Ss3M3WXwvvRFxqkczaewMzTUwKCoubAGDvvf3lS3GQ/6eOHJUAUX2JAGRld2bMXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706723624; c=relaxed/simple;
	bh=WwfiEaFylW6P3AB2GpoAp+jdKzKCLM6zIZV7F/QLI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvMPjF6lGxEHY9V7fgEKuPohS97iFntOeJhCbGMFzB3UWDbZUmY1W+GZVlSLVw1FRwclDVLAeOcxQpMx6lnetQ6K7yTsoZFEKB8Z+cmQ0wFzCU4vGtTnYYGPdHxeV2m1P47JJygSCl2JxFWU3e3vSJrf4nAERS4Y0kWGPHX8JXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsY8mUDN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsY8mUDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706723622; x=1738259622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WwfiEaFylW6P3AB2GpoAp+jdKzKCLM6zIZV7F/QLI9c=;
  b=OsY8mUDNU/qLjpWi4i/w8Rb6YwpGWMebN9gE1WZvAF1zo+EwWBxIL+aW
   uedJBT8W913dvTgWmR04J/F7nkiBvhhOf7X74iT0VEay1u4NV/Sc/bdgR
   TLI7NgyVAJ4jmJYgJ7HBUa/osGTc9d2JYmYseYpADFLH7pml5FpXoCglR
   c+FYiwhBQkEsml656nrV2PrJJYAm87oZ9ix2QkdoAayUD2Zw5ceAWQ3mX
   62pfq3hl3ouyt2MWX2XYd7SjMVGL7vWxbq47d93IDHnoTrO8GBJ9nasHA
   sLUVlTGD2PWdff0tCn7AReKKzhnieJReyrxAfqwae2pm+B2PWXZuDmJpd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10313258"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10313258"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 09:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4167760"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2024 09:53:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVEmC-0001ra-2t;
	Wed, 31 Jan 2024 17:53:32 +0000
Date: Thu, 1 Feb 2024 01:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
	vgupta@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
	guoren@kernel.org, monstr@monstr.eu, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, dinguyen@kernel.org, chenhuacai@kernel.org,
	tsbogend@alpha.franken.de, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	mpe@ellerman.id.au, ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	chris@zankel.net, jcmvbkbc@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 30/46] of: reserved_mem: Add code to use unflattened DT
 for reserved_mem nodes
Message-ID: <202402010140.VrsPYn0W-lkp@intel.com>
References: <20240126235425.12233-31-quic_obabatun@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126235425.12233-31-quic_obabatun@quicinc.com>

Hi Oreoluwa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core vgupta-arc/for-curr powerpc/next powerpc/fixes jcmvbkbc-xtensa/xtensa-for-next linus/master v6.8-rc2 next-20240131]
[cannot apply to vgupta-arc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oreoluwa-Babatunde/of-reserved_mem-Change-the-order-that-reserved_mem-regions-are-stored/20240127-081735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240126235425.12233-31-quic_obabatun%40quicinc.com
patch subject: [PATCH 30/46] of: reserved_mem: Add code to use unflattened DT for reserved_mem nodes
config: i386-randconfig-141-20240128 (https://download.01.org/0day-ci/archive/20240201/202402010140.VrsPYn0W-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010140.VrsPYn0W-lkp@intel.com/

smatch warnings:
drivers/of/of_reserved_mem.c:111 dt_scan_reserved_mem_reg_nodes() warn: unsigned 'node' is never less than zero.

vim +/node +111 drivers/of/of_reserved_mem.c

    98	
    99	/*
   100	 * Save the reserved_mem reg nodes in the reserved_mem array
   101	 */
   102	static void __init dt_scan_reserved_mem_reg_nodes(void)
   103	{
   104		int t_len = (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32);
   105		struct device_node *node, *child;
   106		phys_addr_t base, size;
   107		const __be32 *prop;
   108		int len;
   109	
   110		node = of_find_node_by_path("/reserved-memory");
 > 111		if (node < 0) {
   112			pr_err("Reserved memory: Did not find reserved-memory node\n");
   113			return;
   114		}
   115	
   116		for_each_child_of_node(node, child) {
   117			const char *uname;
   118			struct reserved_mem *rmem;
   119	
   120			if (!of_device_is_available(child))
   121				continue;
   122	
   123			prop = of_get_property(child, "reg", &len);
   124			if (!prop) {
   125				rmem = of_reserved_mem_lookup(child);
   126				if (rmem)
   127					rmem->dev_node = child;
   128				continue;
   129			}
   130	
   131			uname = of_node_full_name(child);
   132			if (len && len % t_len != 0) {
   133				pr_err("Reserved memory: invalid reg property in '%s', skipping node.\n",
   134				       uname);
   135				continue;
   136			}
   137	
   138			base = dt_mem_next_cell(dt_root_addr_cells, &prop);
   139			size = dt_mem_next_cell(dt_root_size_cells, &prop);
   140	
   141			if (size)
   142				fdt_reserved_mem_save_node(child, uname, base, size);
   143		}
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
