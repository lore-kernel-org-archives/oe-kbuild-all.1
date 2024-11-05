Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E30EAD2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828578; cv=none; b=jfFqufHhtaffpiEK6/CI9iPTDe80Spqb3Jf9LGe/agEW6dTimXeKdVUirWgJlQjwn3B9STKHm0tiJWmsrdJAN4VhstkFLWpAzk2N9mMC9q6IZgBdOu5jqQc6A4SK7llSBTtw7U2gpC9biUqA6N2VgOx9qaVHWhRu2XPpo300dWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828578; c=relaxed/simple;
	bh=3CCZ/Nz3v7uzJ1fP/pqCuVtCbES1VD29pWbFAww1mF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJHwBrd9EZMhOfWMuP46ho0CslegJpCzgbBj4pIqghzwC/E5bb4EumqKXkgpelj/WRZK/dZtv9CRvXjH3OCHpGbSq0RcbvL+9ZYgtJEwP8KceQYHx/X0zEOYEd907J+Ug1//wqrRkhBtqHXy7dZgpTbRVn9yZ9sPlTR6yvhA1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfO/Wphr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfO/Wphr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730828576; x=1762364576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CCZ/Nz3v7uzJ1fP/pqCuVtCbES1VD29pWbFAww1mF8=;
  b=TfO/WphrCEKpV4J2dafiX+jJli0FgbiWO04bJy9cDcmlmPDtDegsGnEL
   c20D3j919dlqTSTQyS78Py3D1X/iFw5p/6sjF+8wo5ubZNCMHjXfoDmJZ
   1h+SHbbvYLrXHTj09SvQHYVOGUBivWeC4N6oGtIvDPvMDy8DSkuAe+e9b
   sXgN+FzvwSxO4DGGWY50QG5fsN77fBy7Eh73PuEZRZJ+ySH9zpH53VKKc
   UHV9+uzYC6etzvfd4zP6NPfXbYAuFixMxirDQ0WMvkBYMDgtzbnmaYemw
   dRP9UDoLLvqSYn0MwH3AbHtK13uqCLgqng2fo4j88sWaWCXp46+pC0xpc
   Q==;
X-CSE-ConnectionGUID: 5x0ZXfgeQIW4fmI00s0AgA==
X-CSE-MsgGUID: MXI+AP5SSJ60JLWL+t8IxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30700337"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30700337"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 09:42:42 -0800
X-CSE-ConnectionGUID: wnqV3LPsTQ2cP25x9ZYTjA==
X-CSE-MsgGUID: WL0IzIwERd2osChtKXLwww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="121588907"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2024 09:42:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8NZd-000mIf-2x;
	Tue, 05 Nov 2024 17:42:37 +0000
Date: Wed, 6 Nov 2024 01:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_resctrl.c:566: warning: Function parameter or
 member 'cols' not described in 'rmid_transform'
Message-ID: <202411060122.PBQDO81j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5e5fe4767eb1c2cdaeeddcd731adf35da6453c12
commit: 75008419705983d9d2027127568111f88a26a67c [1231/1231] arm64/mpam: Remap reqpartid,pmg to rmid and intpartid to closid
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241106/202411060122.PBQDO81j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060122.PBQDO81j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060122.PBQDO81j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_resctrl.c:178:1: warning: conflicting types for 'mpam_get_raw_resctrl_resource' due to enum/integer mismatch; have 'struct raw_resctrl_resource *(enum resctrl_resource_level)' [-Wenum-int-mismatch]
     178 | mpam_get_raw_resctrl_resource(enum resctrl_resource_level level)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/mpam/mpam_resctrl.c:47:
   arch/arm64/kernel/mpam/mpam_internal.h:192:1: note: previous declaration of 'mpam_get_raw_resctrl_resource' with type 'struct raw_resctrl_resource *(u32)' {aka 'struct raw_resctrl_resource *(unsigned int)'}
     192 | mpam_get_raw_resctrl_resource(u32 level);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:521:5: warning: no previous prototype for 'closid_bitmap_init' [-Wmissing-prototypes]
     521 | int closid_bitmap_init(void)
         |     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:1306:5: warning: no previous prototype for 'cpus_ctrl_write' [-Wmissing-prototypes]
    1306 | int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c:1403:5: warning: no previous prototype for 'cpus_mon_write' [-Wmissing-prototypes]
    1403 | int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
         |     ^~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_resctrl.c: In function 'rdt_last_cmd_printf':
   arch/arm64/kernel/mpam/mpam_resctrl.c:1583:9: warning: function 'rdt_last_cmd_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1583 |         seq_buf_vprintf(&last_cmd_status, fmt, ap);
         |         ^~~~~~~~~~~~~~~
>> arch/arm64/kernel/mpam/mpam_resctrl.c:566: warning: Function parameter or member 'cols' not described in 'rmid_transform'


vim +566 arch/arm64/kernel/mpam/mpam_resctrl.c

   549	
   550	/**
   551	 * struct rmid_transform - Matrix for transforming rmid to partid and pmg
   552	 * @rows:           Number of bits for remap_body[:] bitmap
   553	 * @clos:           Number of bitmaps
   554	 * @nr_usage:       Number rmid we have
   555	 * @stride:         Step stride from transforming rmid to partid and pmg
   556	 * @remap_body:     Storing bitmaps' entry and itself
   557	 * @remap_enabled:  Does remap_body init done
   558	 */
   559	struct rmid_transform {
   560		u32 rows;
   561		u32 cols;
   562		u32 nr_usage;
   563		int stride;
   564		unsigned long **remap_body;
   565		bool remap_enabled;
 > 566	};
   567	static struct rmid_transform rmid_remap_matrix;
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
