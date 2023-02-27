Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89179EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677523401; x=1709059401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubiSdRg19oMzfzjRnhw9sb6OEKoH87xTHHVWWRm+OwI=;
  b=kDcNSHlwccXahOrSv1VEAVP0OJ5g366HVwMK5zrnZCEaX9aeGAp4X5MH
   K063UEckGTmguRBhQZY4qX9yWX8HejPKM1hh/90JJ98J5cuO8rmBHJJeD
   oysc20zUsQ6m/YpP7y1e2hzdQr6W1izN9jCLQ2S4FWmnjScTzr6BDoY1Q
   65RdBRN36uyjfsfxV/aTkMgqhwkI+k96hiHislUtArQidRIjFpnX17l4b
   LpNaxoUR7ujCi5OYO96QPvOMl9DgbMvF+51ma4aAnncXUXD6Sv59sQ01V
   52nn30SpTWfGItUTLhBZu5AjAD/acQvBBb2se0IiCpmMoydOck7Q0+zNn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398712998"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="398712998"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 10:42:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="742676010"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="742676010"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Feb 2023 10:42:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWiSb-0004gJ-2P;
	Mon, 27 Feb 2023 18:42:53 +0000
Date: Tue, 28 Feb 2023 02:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 176/440]
 arch/x86/virt/vmx/tdx/tdx.c:1253:28: error: 'tdx_keyid_start' undeclared;
 did you mean 'tdx_guest_keyid_start'?
Message-ID: <202302280214.vQrKYTWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   6960696b1b5b8d8074bf2724321ff73782e42e6c
commit: e3d6d84f411a27e0899c391294b601b20455a81f [176/440] x86/cpu: Add helper functions to allocate/free TDX private host key id
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280214.vQrKYTWG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/e3d6d84f411a27e0899c391294b601b20455a81f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout e3d6d84f411a27e0899c391294b601b20455a81f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280214.vQrKYTWG-lkp@intel.com/

Note: the intel-tdx/kvm-upstream-workaround HEAD 6960696b1b5b8d8074bf2724321ff73782e42e6c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/x86/virt/vmx/tdx/tdx.c: In function 'init_tdx_module':
>> arch/x86/virt/vmx/tdx/tdx.c:1253:28: error: 'tdx_keyid_start' undeclared (first use in this function); did you mean 'tdx_guest_keyid_start'?
    1253 |         tdx_global_keyid = tdx_keyid_start;
         |                            ^~~~~~~~~~~~~~~
         |                            tdx_guest_keyid_start
   arch/x86/virt/vmx/tdx/tdx.c:1253:28: note: each undeclared identifier is reported only once for each function it appears in


vim +1253 arch/x86/virt/vmx/tdx/tdx.c

  1164	
  1165	static int init_tdx_module(void)
  1166	{
  1167		static DECLARE_PADDED_STRUCT(tdsysinfo_struct, tdsysinfo,
  1168				TDSYSINFO_STRUCT_SIZE, TDSYSINFO_STRUCT_ALIGNMENT);
  1169		static struct cmr_info cmr_array[MAX_CMRS]
  1170				__aligned(CMR_INFO_ARRAY_ALIGNMENT);
  1171		struct tdsysinfo_struct *sysinfo = &PADDED_STRUCT(tdsysinfo);
  1172		int ret;
  1173	
  1174		/*
  1175		 * TDX module global initialization.  All '0's are just
  1176		 * unused parameters.
  1177		 */
  1178		ret = seamcall(TDH_SYS_INIT, 0, 0, 0, 0, NULL, NULL);
  1179		if (ret)
  1180			return ret;
  1181	
  1182		/*
  1183		 * TDX module per-cpu initialization SEAMCALL must be done on
  1184		 * one cpu before any other SEAMCALLs can be made on that cpu,
  1185		 * including those involved in further steps to initialize the
  1186		 * TDX module.
  1187		 *
  1188		 * To make sure further SEAMCALLs can be done successfully w/o
  1189		 * having to consider preemption, disable CPU hotplug during
  1190		 * rest of module initialization and do per-cpu initialization
  1191		 * for all online cpus.
  1192		 */
  1193		cpus_read_lock();
  1194	
  1195		ret = module_lp_init_online_cpus();
  1196		if (ret)
  1197			goto out;
  1198	
  1199		ret = tdx_get_sysinfo(sysinfo, cmr_array);
  1200		if (ret)
  1201			goto out;
  1202	
  1203		/*
  1204		 * To keep things simple, assume that all TDX-protected memory
  1205		 * will come from the page allocator.  Make sure all pages in the
  1206		 * page allocator are TDX-usable memory.
  1207		 *
  1208		 * Build the list of "TDX-usable" memory regions which cover all
  1209		 * pages in the page allocator to guarantee that.  Do it while
  1210		 * holding mem_hotplug_lock read-lock as the memory hotplug code
  1211		 * path reads the @tdx_memlist to reject any new memory.
  1212		 */
  1213		get_online_mems();
  1214	
  1215		ret = build_tdx_memlist(&tdx_memlist);
  1216		if (ret)
  1217			goto out;
  1218	
  1219		/* Allocate enough space for constructing TDMRs */
  1220		ret = alloc_tdmr_list(&tdx_tdmr_list, sysinfo);
  1221		if (ret)
  1222			goto out_free_tdx_mem;
  1223	
  1224		/* Cover all TDX-usable memory regions in TDMRs */
  1225		ret = construct_tdmrs(&tdx_memlist, &tdx_tdmr_list, sysinfo);
  1226		if (ret)
  1227			goto out_free_tdmrs;
  1228	
  1229		/* Pass the TDMRs and the global KeyID to the TDX module */
  1230		ret = config_tdx_module(&tdx_tdmr_list, tdx_global_keyid);
  1231		if (ret)
  1232			goto out_free_pamts;
  1233	
  1234		/*
  1235		 * Hardware doesn't guarantee cache coherency across different
  1236		 * KeyIDs.  The kernel needs to flush PAMT's dirty cachelines
  1237		 * (associated with KeyID 0) before the TDX module can use the
  1238		 * global KeyID to access the PAMT.  Given PAMTs are potentially
  1239		 * large (~1/256th of system RAM), just use WBINVD on all cpus
  1240		 * to flush the cache.
  1241		 */
  1242		wbinvd_on_all_cpus();
  1243	
  1244		/* Config the key of global KeyID on all packages */
  1245		ret = config_global_keyid();
  1246		if (ret)
  1247			goto out_free_pamts;
  1248	
  1249		/*
  1250		 * Reserve the first TDX KeyID as global KeyID to protect
  1251		 * TDX module metadata.
  1252		 */
> 1253		tdx_global_keyid = tdx_keyid_start;
  1254	
  1255		/* Initialize TDMRs to complete the TDX module initialization */
  1256		ret = init_tdmrs(&tdx_tdmr_list);
  1257	
  1258	out_free_pamts:
  1259		if (ret) {
  1260			/*
  1261			 * Part of PAMT may already have been initialized by the
  1262			 * TDX module.  Flush cache before returning PAMT back
  1263			 * to the kernel.
  1264			 *
  1265			 * No need to worry about integrity checks here.  KeyID
  1266			 * 0 has integrity checking disabled.
  1267			 */
  1268			wbinvd_on_all_cpus();
  1269			tdmrs_free_pamt_all(&tdx_tdmr_list);
  1270		}
  1271		else
  1272			pr_info("%lu KBs allocated for PAMT.\n",
  1273					tdmrs_count_pamt_pages(&tdx_tdmr_list) * 4);
  1274	out_free_tdmrs:
  1275		if (ret)
  1276			free_tdmr_list(&tdx_tdmr_list);
  1277	out_free_tdx_mem:
  1278		if (ret)
  1279			free_tdx_memlist(&tdx_memlist);
  1280	out:
  1281		/*
  1282		 * @tdx_memlist is written here and read at memory hotplug time.
  1283		 * Lock out memory hotplug code while building it.
  1284		 */
  1285		put_online_mems();
  1286	
  1287		/*
  1288		 * Clear @cpu_tdx_mask if module initialization fails before
  1289		 * CPU hotplug is re-enabled.  tdx_cpu_online() uses it to check
  1290		 * whether the initialization has been successful or not.
  1291		 */
  1292		if (ret)
  1293			cpumask_clear(cpu_tdx_mask);
  1294		cpus_read_unlock();
  1295		return ret;
  1296	}
  1297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
