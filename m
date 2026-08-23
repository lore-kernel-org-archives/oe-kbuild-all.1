Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECB533E345
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488000; cv=fail; b=VzsEl/X117/dCXGpGiVY+NK8fwR4ZM/zOhEZO3f8r2PnD2lpoePCWRiG7sJjqU+r7zBmwg+NeBqBxFj9AmpWGOEdExyV9502tBPaKsurapHG9JKNf5gMIazTfVLCuxUzsDDrCIar7sndoEcCRhyNYGKC1r1d19FTGCxYv6/PpXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488000; c=relaxed/simple;
	bh=D/ig/BADxvL5CICnSR3niVIz67a/Y+PTqET9R1Jrv4Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dQLHKmyIBAzq4F+hYScf9vx8oM2rqoUqu6ks2auvVerg3yJfgLKrAyQWcbmYOaQq5ACox1zXk9/lO6i/K8diJFrlTS23KG0xKN91zBIxqSzZDUsbR6PDZY73Kd9yXa5gBvd7fhhFtg9zCuUp+wr3ueP2gtlYldiK7wu5racXuyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDggz5lQ; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDggz5lQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487997; x=1819023997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/ig/BADxvL5CICnSR3niVIz67a/Y+PTqET9R1Jrv4Y=;
  b=DDggz5lQ12PJnCZHVgdGQpAC3E2BzMOdNC2mbVqJFQ7ZUkKMGM7G2wlQ
   3IiSbLunyYGlfO0kHrcCCaJWvHYFY8nAbvhJTEkJk9C8JPBv9pw6GTPKD
   OBtrC3U3b/o/2FUFhafvdJGPuB7erseczlVNMcHdj5prOaCjzd30lOthf
   CgV4mVSd4r+pF73NU/0EMADASwbDw6rg5Rsy01RRGQ8DiBT4+YI3Z2t09
   lQcPHgFecn9wKsRAe9NBArQ/KUd9REF9srji/9HtZzPJ0jBvPIlHbRfoS
   KxDjJz62WsHPyZJ5XG3vBi1UESrYe9jSmuZvkvwylmDNDlZG/fiQRnPcO
   w==;
X-CSE-ConnectionGUID: a56g+WAkS0ixA+ggzUgGvw==
X-CSE-MsgGUID: zP9r0upGRVGPhELb9OZsoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87076700"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87076700"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:26:35 -0700
X-CSE-ConnectionGUID: 5iTLE+vYRYqeV3vcWrQUFg==
X-CSE-MsgGUID: BGfeqWQvTneu9TXpDApxfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="270966255"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:26:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:26:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:26:34 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAeIwWF0pPy/6Idodf94qYkIx2pwI8+xc+cvj0WpoL8gmoTpMw6FNHdF4kqy2Tamud5ZaXgITiDwtEl4AeEMrXDsulvJ42LdnLRcA7yAXr6yGmCNReP80yep6Tspy0c+pahd5Q4QxqS8Uk9aM5R1yNWoNzJkXfLgfgQtPIUr7R9DK+KGujjNKT8nQnO0WuiG2oRYNDTFSepS30cT/T/wtn1R0SoIHrUrz4AfSGo1Bh2LgcKhvGZLBsUPfcwsY/5HSfmuZvZUV0U+NQL8HMM6CXH8gGXBs0ub9gVEafjYn9dAugtqSkcc50ZLO84wQ1brjtLWnYtz+3LlbmxiGbDKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7tTEoPMLHdD5QNYx/gs3MJjfyN6w9rNXhNSLpV4UQI=;
 b=kxLrBCffDDEy/kKFPvwSVS1SA9BsFS6pKMVIi8EGIbKEOEsoE40NuLhH7Em762vCWBiVxrUO+yWD6Uki47+IHP7ox+pyNaoHDIG1H5SCzSfM84d/9cgMQlNCemNRjdhHRrbEM1G5iRPzbe83wEcM8c0QqqKqKz5BZjpIr4msy3XPxZ44jxJl/DmK6+R5Yjal4eb2RNfFKjh+ExZMFnZZunQXe4W7gU0/3tfP8aUxPTiIWEQDSci+Ie3Uqdpn0Zo7WX4MXn7qvU9e2+FmywAAdKv5Aejq7G+HuT5j87iEYdYTUGx336sjOVjQqfwfxwTVDZAx38iUODtSAtTcyLJ38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:26:32 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:26:32 +0000
Date: Sun, 23 Aug 2026 20:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jimc:scratchpad-v10 13/24] kernel/locking/lockdep.c:71:33: error:
 too many arguments provided to function-like macro invocation
Message-ID: <202608230104.rEFLxzxH-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::16) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5e7526-bf13-4642-342f-08df0111c3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: q35useC56G8z5YW5G5dg7hODTszY2l5ZLjgNzZeunkibEmuf/w8Oiu8ZWdGVFJixAt9t7e2MqR51pF1jbZiYVvjbMOuZGZplfNb4b78XFneaSb2KbDEdCxPo4bByTJpbdIkHq+yGHPI8t3YwntzSR8e1av7Wegw4LSzCqcohdb37O4b8aJtaKPnALIwYHObLHFh/M9lb+6igMrzvNGrYbH0pL11tQp52HUDcIzShEQRE6fKeoQownuWPpKr2UnDgPsE4sxMJGEZkaCd5Uq119uHSa1jBh0VW75YZABL9Mrh8WQxWQXf3BrkjV89KD/f7rF+RkqSYogVHSz2EJBzzH/U8ingxyWFf9CKXI4GcTCYmifwJ0RsZeam3TR4mmx+LPSi+RvX/I075p1xV2BRdZ3m2wP166oY3EIlZ6r6ecvNXtxEMRu1b3Ci9gpqnnoBX5HwaG/Ac26pX2iq+uHyNsXecfQ9L+ba8Xb94Y6DBRy8GGnrSsro6vt0Tf8ZocdUVFtwDi1ork03r8Zt2LcbcUQ0YqzA2FtlV0pnB5dTWVzfCeBE2GHbv+GWZEh4qoPObQ6ulPeHx0bsy8N6YgP32D46ZdwawsistQHokOgNw7iXI+ec/zJKpot7XvF19tJ5q592VoMqKSreKhoFX0N/8BQ8fynZFJRR5wVjUpra6fnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NBM4dWGTEE63HJjtaTimy6RmD26yRyw5Ue9f1O8tA++L4fhFNGJHI7zYXUwy?=
 =?us-ascii?Q?ow4lYt7YzvauARkcIenhaAp90cZ1h38iRn13Zjm/VCalUITuVpTspv/O38nk?=
 =?us-ascii?Q?/pCUhqj1VU6Ls5QIoTLefosS6RzD3pQoD2epJUyGOvB+dkWGnmp7w2svGd8n?=
 =?us-ascii?Q?dB4MY6/1V9llM17p3XD6BUsOoIzA3EbAt2tBDLjK53WNsQZXludunANVkmga?=
 =?us-ascii?Q?lDYC72nEpV41w7ob+GjHeC5Um7V4YA6ULl7i+oUaCzVZgCRqUjoV7Xnga1W0?=
 =?us-ascii?Q?YZM9mS8dctaMyW5ZaTJ2shT0EE/d1Vr0pZ/DBme8C3S6NsdxYf+XLBgZDAT1?=
 =?us-ascii?Q?cjgAPRPhgaE816Rnze5D467G9JJA0fKZJB05gFWe575PKwNA677m8Ae2bbKz?=
 =?us-ascii?Q?mQiDBhjYgZjOIwF2aAlEuw0sD5PJNaEDFC8ChIssloP8mb5lKiFqd5py15AH?=
 =?us-ascii?Q?UO3vedAHpEjvG8vK69+nxEiA0Pm8LCziMCPUTqO7TUgKQnPXTY29s/toSfFk?=
 =?us-ascii?Q?+ED++ubE4wKjLtXw344Oso8DMKDQFcfJ/5q6WwnsZBhm4Hz3C4o1+di7m4pR?=
 =?us-ascii?Q?zp7QAJ5JoEgRs8mGr3xyo309BCODs+8LOLS4do3oA4hQL21ItHnhjVEET644?=
 =?us-ascii?Q?mwceQ8+LlrJckRcGUOgn6yd8KfzUW1MSX1klw9ogsk2pB03nm7T04f6giFnm?=
 =?us-ascii?Q?oD2hmO3fhAW1ngyJYvckDcHdsEg+1MOLZFCTUuMHhR93OUy76kj6I+WwsXXN?=
 =?us-ascii?Q?ByEsKVXAvoFxH4lIP2DQJAh+SSz7X3tOUMiAMHisjLDpyV4/dG+i2QT6MSQW?=
 =?us-ascii?Q?POXTrXbcGifuAQXHJMelXX6ic2iTWbVvmeqbeGeY1EFQpIpMtshWA8acLJUA?=
 =?us-ascii?Q?W8iqQxcG0MqQnYBKG4zq8xuxjx7S7Abgh19AKT3g343QqQzajl8Y2mGm1TjP?=
 =?us-ascii?Q?n6/0wXZ6EPvNb6AP9S4ftVQ633xtVZMHIi/OZGDsfQCERYg8MaYsf4g+QiRv?=
 =?us-ascii?Q?42jm+kRRJpqVU5SDynjXqa/+PC0WN4kIKnb+y/+39RHLjB7Cv5n93AnSyUEb?=
 =?us-ascii?Q?0J5nJ5bIp2lEOnorxCXzBAadtBZuWp5g8N9JDPx7hncSzeqN6xHSBGZEJWvN?=
 =?us-ascii?Q?fmO87YHweCC4QdtJb3ja2YY6Z/rWUz4HbPNuFfMuLCZ29sl/lx8hDhQQTWo/?=
 =?us-ascii?Q?h8woEorMysNFNn66ngmkJyfPPoVN5cFe1zc5ZF4dxAZYsbVM1Zc/uE2bpnIr?=
 =?us-ascii?Q?2SRscbcwYQwWzJ7uVe67n6umBMUsEDt7x2FTKxu70w/ep9wIQ7kJlc2Lt0eI?=
 =?us-ascii?Q?BXXeAxbjKzt09f2MiPPROjIkkzhyAIaumU5yyWbJXijnqi6NBOtcYPT9n4I6?=
 =?us-ascii?Q?Rr36bGW2iTJes7SI9ESUQwP1e2RKmcXmh4OpiT3ys5S7Xqjx058JhDmp13b4?=
 =?us-ascii?Q?MxseNgJFGonylbrudFXUo8k7RoBQv6vtI/ELMtAerzljvkYZvIsnl3Ye19nk?=
 =?us-ascii?Q?0Teb5yC0Yn+X/tNAoj42FF95BOPyOfaf1XQSFz8uDxxzxEilSC8hDZfAXUqF?=
 =?us-ascii?Q?iQqQB1WHv3XnEuHjMFeaa/eQdtynq6xAKD57Ca+rmObb6x9Boot/AjY4tQqZ?=
 =?us-ascii?Q?q0I2yV5n+5ToC8TLFC4JkFCFj+jLIh/+1tqg8JqTZKdc4WL6IrDxr1fSgtlD?=
 =?us-ascii?Q?MjukrSaHXSgHILKW+u1VZazf35Nn9dfWQMNPCg0C7jH3Rnhz/f1lxqTmY/tF?=
 =?us-ascii?Q?3b4FgeNaTQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: fPSYR8m03Zzmy6k5VO3+ytHLMZFD4nXFizZKE720tcCiNSIoxdwBNakpVyXJPS684+c46ZRJU9UuWUJMsJc3M/lB3KWTWHI89+Hn5QEww/6Ry6Jqb/9JAjeftH3+qrXKIq/En3wB9LLOL7tcqJLVNAMfkReCcTlPKa2PZlxMOSU/vTr1H5vH51c/1mP8hZCVUc/GZNX0JuD9kmzsx094kVr0zYT8a2s+UkhSbiEHrCiq5bNT7gUYGlcCwalqKGTg8IsLb3JcpMepI3S0kvapnqApIbaFIX6VWg2ztITGY1jl5F8NyCzwWc0QAZoaEuM4PMyG0S1CViK8KTjgcAFOsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5e7526-bf13-4642-342f-08df0111c3f5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:26:32.4676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJ19B4f7/MqCTV/Hcd1rl/PDxKRyZF8bjzIK7cDjOotUU6bww5i/Z1z9QwUUTNj1/vjJ2tMzk9nF0oxoKKrYxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   a23fc077806416450fbeb0a5a534fd995e465430
commit: c64a3f08a0141ea44aaf52cb647a97400c5e1dd0 [13/24] locking/lockdep: Allocate list_entries from static bootstrap scratchrec pool
config: x86_64-randconfig-001-20260822 (https://download.01.org/0day-ci/archive/20260823/202608230104.rEFLxzxH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230104.rEFLxzxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230104.rEFLxzxH-lkp@intel.com/

Note: the jimc/scratchpad-v10 HEAD a23fc077806416450fbeb0a5a534fd995e465430 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/locking/lockdep.c:71:33: error: too many arguments provided to function-like macro invocation
      71 |                                SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                                      ^
   include/linux/scratchpad.h:360:9: note: macro 'SCRATCHREC_INIT_STATIC' defined here
     360 | #define SCRATCHREC_INIT_STATIC(name, _elem_size, _static_buf, _size_bytes, _min_order, _key) \
         |         ^
>> kernel/locking/lockdep.c:69:2: error: use of undeclared identifier 'SCRATCHREC_INIT_STATIC'
      69 |         SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +71 kernel/locking/lockdep.c

    66	
    67	DEFINE_STATIC_KEY_TRUE(lockdep_pool_key);
    68	static struct scratchrec lockdep_pool =
  > 69		SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
    70				       list_entries, sizeof(list_entries),
  > 71				       SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
    72	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
