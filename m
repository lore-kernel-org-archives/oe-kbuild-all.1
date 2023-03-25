Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084917F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679730416; x=1711266416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSGtsri+fvT1FxJgxUt6mGNofjsTjxe7si2b8vtmcac=;
  b=GGrlleMiKi1na+HMvhFhColGhcQupeEKlDTJUDWAniNFxww7i/6+U6Mk
   2vR/NhT2GzlZ5z62gXXwG07v1bW8CVxYP8VPoSGbIRAzpGIVq8lcBjwUM
   uSqNfOIubEL2eGo4HQWJv5/dDfX1dBRjZSco3jmau+ai6LVAEo15iy5jr
   /2M2+wTN2KkKoJMy3i2yRUIp1WJaKWEtz2MmHnQHYqn+KtFzN0IuYfPCy
   3Q9xBsMn8bTQ/uQGjyEGKNgqqUKwLB4T95YdSjiqts3zdty653iJ4Cwnl
   nRkJ50653iiigwKQVcRv64tdZqbIskrbuz16w7dnD2a2/GjppDtmOZ7B/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="342345109"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="342345109"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 00:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="660317363"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="660317363"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Mar 2023 00:46:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfyc1-000G55-1I;
	Sat, 25 Mar 2023 07:46:53 +0000
Date: Sat, 25 Mar 2023 15:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 58/328]
 arch/x86/virt/vmx/tdx/tdx.c:1251:28: error: 'tdx_keyid_start' undeclared;
 did you mean 'tdx_guest_keyid_start'?
Message-ID: <202303251535.IFwIN7mK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   694338d50183e3371330efb5291e044153c7c615
commit: 23c65eaa13ff53aa3fc47f1d9e2b610f055829b1 [58/328] x86/cpu: Add helper functions to allocate/free TDX private host key id
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230325/202303251535.IFwIN7mK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/23c65eaa13ff53aa3fc47f1d9e2b610f055829b1
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 23c65eaa13ff53aa3fc47f1d9e2b610f055829b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251535.IFwIN7mK-lkp@intel.com/

Note: the intel-tdx/kvm-upstream-workaround HEAD 694338d50183e3371330efb5291e044153c7c615 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/x86/virt/vmx/tdx/tdx.c: In function 'init_tdx_module':
>> arch/x86/virt/vmx/tdx/tdx.c:1251:28: error: 'tdx_keyid_start' undeclared (first use in this function); did you mean 'tdx_guest_keyid_start'?
    1251 |         tdx_global_keyid = tdx_keyid_start;
         |                            ^~~~~~~~~~~~~~~
         |                            tdx_guest_keyid_start
   arch/x86/virt/vmx/tdx/tdx.c:1251:28: note: each undeclared identifier is reported only once for each function it appears in


vim +1251 arch/x86/virt/vmx/tdx/tdx.c

  1186	
  1187	static int init_tdx_module(void)
  1188	{
  1189		static DECLARE_PADDED_STRUCT(tdsysinfo_struct, tdsysinfo,
  1190				TDSYSINFO_STRUCT_SIZE, TDSYSINFO_STRUCT_ALIGNMENT);
  1191		static struct cmr_info cmr_array[MAX_CMRS]
  1192				__aligned(CMR_INFO_ARRAY_ALIGNMENT);
  1193		struct tdsysinfo_struct *sysinfo = &PADDED_STRUCT(tdsysinfo);
  1194		struct tdmr_info_list tdmr_list;
  1195		int ret;
  1196	
  1197		ret = tdx_get_sysinfo(sysinfo, cmr_array);
  1198		if (ret)
  1199			return ret;
  1200	
  1201		/*
  1202		 * To keep things simple, assume that all TDX-protected memory
  1203		 * will come from the page allocator.  Make sure all pages in the
  1204		 * page allocator are TDX-usable memory.
  1205		 *
  1206		 * Build the list of "TDX-usable" memory regions which cover all
  1207		 * pages in the page allocator to guarantee that.  Do it while
  1208		 * holding mem_hotplug_lock read-lock as the memory hotplug code
  1209		 * path reads the @tdx_memlist to reject any new memory.
  1210		 */
  1211		get_online_mems();
  1212	
  1213		ret = build_tdx_memlist(&tdx_memlist);
  1214		if (ret)
  1215			goto out;
  1216	
  1217		/* Allocate enough space for constructing TDMRs */
  1218		ret = alloc_tdmr_list(&tdmr_list, sysinfo);
  1219		if (ret)
  1220			goto out_free_tdx_mem;
  1221	
  1222		/* Cover all TDX-usable memory regions in TDMRs */
  1223		ret = construct_tdmrs(&tdx_memlist, &tdmr_list, sysinfo);
  1224		if (ret)
  1225			goto out_free_tdmrs;
  1226	
  1227		/* Pass the TDMRs and the global KeyID to the TDX module */
  1228		ret = config_tdx_module(&tdmr_list, tdx_global_keyid);
  1229		if (ret)
  1230			goto out_free_pamts;
  1231	
  1232		/*
  1233		 * Hardware doesn't guarantee cache coherency across different
  1234		 * KeyIDs.  The kernel needs to flush PAMT's dirty cachelines
  1235		 * (associated with KeyID 0) before the TDX module can use the
  1236		 * global KeyID to access the PAMT.  Given PAMTs are potentially
  1237		 * large (~1/256th of system RAM), just use WBINVD on all cpus
  1238		 * to flush the cache.
  1239		 */
  1240		wbinvd_on_all_cpus();
  1241	
  1242		/* Config the key of global KeyID on all packages */
  1243		ret = config_global_keyid();
  1244		if (ret)
  1245			goto out_free_pamts;
  1246	
  1247		/*
  1248		 * Reserve the first TDX KeyID as global KeyID to protect
  1249		 * TDX module metadata.
  1250		 */
> 1251		tdx_global_keyid = tdx_keyid_start;
  1252	
  1253		/* Initialize TDMRs to complete the TDX module initialization */
  1254		ret = init_tdmrs(&tdmr_list);
  1255	
  1256	out_free_pamts:
  1257		if (ret) {
  1258			/*
  1259			 * Part of PAMT may already have been initialized by the
  1260			 * TDX module.  Flush cache before returning PAMT back
  1261			 * to the kernel.
  1262			 *
  1263			 * No need to worry about integrity checks here.  KeyID
  1264			 * 0 has integrity checking disabled.
  1265			 */
  1266			wbinvd_on_all_cpus();
  1267			tdmrs_free_pamt_all(&tdmr_list);
  1268		}
  1269		else
  1270			pr_info("%lu KBs allocated for PAMT.\n",
  1271					tdmrs_count_pamt_pages(&tdmr_list) * 4);
  1272	out_free_tdmrs:
  1273		/*
  1274		 * Free the space for the TDMRs no matter the initialization is
  1275		 * successful or not.  They are not needed anymore after the
  1276		 * module initialization.
  1277		 */
  1278		free_tdmr_list(&tdmr_list);
  1279	out_free_tdx_mem:
  1280		if (ret)
  1281			free_tdx_memlist(&tdx_memlist);
  1282	out:
  1283		/*
  1284		 * @tdx_memlist is written here and read at memory hotplug time.
  1285		 * Lock out memory hotplug code while building it.
  1286		 */
  1287		put_online_mems();
  1288	
  1289		return ret;
  1290	}
  1291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
