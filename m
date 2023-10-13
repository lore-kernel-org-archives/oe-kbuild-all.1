Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B43EA6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 02:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCNlePGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697165151; x=1728701151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=50Od1I9NNb/HTgrfRlXxscDjc6YrV8Rf9cYhHkDhHZw=;
  b=kCNlePGm6xjX/yhhMR8PXS5jFOuQJ+qkNfDG9YHydhGnyLGAh5e/IGhj
   Klw1e7EDc/LgnYA5ZO6drYVkuNp/1X6TiIHjur98JBGrRWC2bxURfgKpw
   0QQC90/mRcecso/ycTWGMpcEU1KsidFlxNdtBkuUrUORwZh8325J2E880
   WMPt0hhACfW74CaTuwFRW1Iz6FmS9CGag7aL0li/5kP09sFeeSS0G8yYi
   iKyuGf3QbhACNIBjpGTfQ5gq5ivHnqrLBt9KsOS+mrqPU/WLZZmWqguZL
   F3cA43P0tW5/kR2Y5fOHFbUrtO8ncLR+aSr9WRWzETc2sGl/Ol7/hO/uU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449279504"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="449279504"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 19:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783965721"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783965721"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 19:41:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr87V-0004FF-1S;
	Fri, 13 Oct 2023 02:41:45 +0000
Date: Fri, 13 Oct 2023 10:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 04/10] x86/resctrl: Add comments on RFTYPE flags
 hierarchy
Message-ID: <202310131002.oQRx2Rgc-lkp@intel.com>
References: <20231010233335.998475-5-babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010233335.998475-5-babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-resctrl-Add-multiple-tasks-to-the-resctrl-group-at-once/20231011-073704
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231010233335.998475-5-babu.moger%40amd.com
patch subject: [PATCH v12 04/10] x86/resctrl: Add comments on RFTYPE flags hierarchy
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131002.oQRx2Rgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131002.oQRx2Rgc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/arch/x86/resctrl.rst:373: WARNING: Line block ends without a blank line.
>> Documentation/arch/x86/resctrl.rst:377: WARNING: Unexpected indentation.
>> Documentation/arch/x86/resctrl.rst:387: WARNING: Unexpected section title.

vim +373 Documentation/arch/x86/resctrl.rst

   353	
   354	"mon_data":
   355		This contains a set of files organized by L3 domain and by
   356		RDT event. E.g. on a system with two L3 domains there will
   357		be subdirectories "mon_L3_00" and "mon_L3_01".	Each of these
   358		directories have one file per event (e.g. "llc_occupancy",
   359		"mbm_total_bytes", and "mbm_local_bytes"). In a MON group these
   360		files provide a read out of the current value of the event for
   361		all tasks in the group. In CTRL_MON groups these files provide
   362		the sum for all tasks in the CTRL_MON group and all tasks in
   363		MON groups. Please see example section for more details on usage.
   364	
   365	RESCTRL filesystem implementation notes
   366	=======================================
   367	RESCTRL filesystem has two main components
   368		a. info
   369		b. base
   370	
   371	/sys/fs/resctrl/
   372		|
 > 373		--> info (Top level directory named "info". Contains files that
   374		|	  provide details on control and monitoring resources)
   375		|
   376		--> base (Root directory associated with default resource group
 > 377			  as well as directories created by user for MON and CTRL
   378			  groups. Contains files to interact with MON and CTRL
   379			  groups)
   380	
   381		Note: resctrl uses flags for files, not for directories.
   382		      Directories are created based on the resource type. Added
   383		      directories below for better understanding. The RFTYPE flags
   384		      are defined in arch/x86/kernel/cpu/resctrl/internal.h.
   385	
   386		info directory structure
 > 387		---------------------------------------------------------------
   388		--> RFTYPE_INFO
   389		    Directory: info
   390		--> RFTYPE_TOP (Files in top level of info directory)
   391		    File: last_cmd_status
   392	
   393		--> RFTYPE_MON (Files for all monitoring resources)
   394		    Directory: L3_MON
   395		        Files: mon_features, num_rmids
   396	
   397			--> RFTYPE_RES_CACHE (Files for cache monitoring resources)
   398			    Directory: L3_MON
   399			        Files: max_threshold_occupancy,
   400			               mbm_total_bytes_config,
   401			               mbm_local_bytes_config
   402	
   403		--> RFTYPE_CTRL (Files for all control resources)
   404		    Directories: L2, L3, MB, SMBA, L2CODE, L2DATA, L3CODE, L3DATA
   405		           File: num_closids
   406	
   407			--> RFTYPE_RES_CACHE (Files for cache control resources)
   408			    Directories: L2, L3, L2CODE, L2DATA, L3CODE, L3DATA
   409			          Files: bit_usage, cbm_mask, min_cbm_bits,
   410			                 shareable_bits
   411	
   412			--> RFTYPE_RES_MB (Files for memory control resources)
   413			    Directories: MB, SMBA
   414			          Files: bandwidth_gran, delay_linear,
   415			                 min_bandwidth, thread_throttle_mode
   416	
   417		base directory structure
   418		---------------------------------------------------------------
   419		--> RFTYPE_BASE (Files common for both MON and CTRL groups)
   420		    Files: cpus, cpus_list, tasks
   421	
   422			--> RFTYPE_CTRL (Files for CTRL group)
   423			    Files: mode, schemata, size
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
