Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214E14F70
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762575501; cv=fail; b=NQbzc1k35PAm+0SO6AMvAnxsATjedxm1x+vI7R8/AyXxagTcM5AMOYGEViiKy/joKGaU53dgxMJjs/O04vb/M1XZ9l+fkd9oum5BFWxpzCxek8MwwTH82SUr55NQwYuOFIqKns4gNO6k0nn0kRM2XYTS5yDXSjeaicT2DA4k67w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762575501; c=relaxed/simple;
	bh=RpT+rf+Rc6I3lrofRl1WdCT5ONoFAWNOvIlNWHk52ys=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=o/9c2IIgRLhP8uqmXpB75NFwAD2nxI+H1ilIbydOQBPfz7dw5HmZfzUD7qlF6AwFhptXRUy8c8CnjBvSGtxd96AMJUDhouCaSvcQw0n6SuJNFwroIivTCm0JmVZ4M5ikBC+pW7oE0DJaGVDKMrcJq2fqHZKR7+QrRJ0hgmYK91U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJv5tzf5; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJv5tzf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762575499; x=1794111499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpT+rf+Rc6I3lrofRl1WdCT5ONoFAWNOvIlNWHk52ys=;
  b=TJv5tzf5wsRiK9TK6mypl+XXyo/TlBuw6lBDvye5B3jpUKoo4DR/cMvc
   7pjybg92FdoXEhm3TIJvVN+E8yminmeqx3SUqHGQksfgniL4fdhhAeIBU
   qI1tVSSiyOXK4mO2c2VWy5zJxVYeeNVWAq8kTZgsOJ6vH3aOhdJbBcKIx
   7RYjjvFW178MUk6ymd/KnEFQEkBEMT1xrdqBdj55U0Gqahv5hPkKd3GWe
   3XNio01om2VwLaTl/7MPN35YtcqihxdhgxjtNfUDH9sDKxm7kPJMjYaKT
   pYZvLuO2cftUjwMawMBd2IDGxfmH+hP2EuWDmz3sb/JaeHeGILvRVVlF6
   w==;
X-CSE-ConnectionGUID: 5rnNWBE+QiKzH6vhK3TQtw==
X-CSE-MsgGUID: NqSuJoHtQZyAjXUko8bWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87353467"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="87353467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 20:18:19 -0800
X-CSE-ConnectionGUID: bGvjE7v1Tkem8C/C7pLTuw==
X-CSE-MsgGUID: 5WtIWsIwQAiEUAp+QicVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="193382905"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 20:18:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 20:18:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 20:18:18 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 20:18:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7RSRQXW2hT1oBUNROY6t0hrdAbNSf9Q9UfWMCdx9iNE5tFbxxDCAvPI1KRzNzqtTSjIyhBah2ZoFQcaNmdZcnf+qgZUcKSHdd5HbcNBHPwP0+Hwu0ylbA54Pbc2lRUbpVOBdY2KUPqCmQMF7DWmEjFR4mq3Ok26Pyv0J9tujm7GYqk8qhcKd3dBqg0cC9M2Bz3VQOz9Vv0Dbu0d4p9FZXL6YQzFhxbVSHCc3g7Be76OjSRRtFRV4hUtL2HS0LXb95AFtYh/dAvWRKz6+AqvZ0Xa3XJelnpHCEiJGCR18XF0LkUhjVmEGaWIiHJn1wTuGn0BmPo7m4ToqGQtdZPEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDh7SWZdeHnkjQbTp2glAV/vOJvDL+9v9/6gVT5SSYo=;
 b=J2yDOHciTPqGkLQbpa2YOyVPZYwoHPE6Yh5G43FwUwVNGySh5o8QELt6PKlhxk/06MEgu2G44xnVN8daX7boasWd8/ddSidIq2xoasRQD6ZTAEEsoptdbOEiwj22FDwu4+pCqX7mD1xkIOowmqnb14SKFFaYzRUxBmZHqcdNC1+5mwD2z/ynjsJM4OyMuv+as6CagKLvXqaM3XYvhzREPGkRcsV9h68lxkGbMnppBhdc+X8Ao4IKp7ONxNz2gm9ExRjU6yv3Diyw2sQ1DsDvxAaui4BkuloKP5VsKmszhVYrpRWBLqExfXki3430uutEG/x/ULRAxF48iuU6FRRLxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 04:18:16 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9275.015; Sat, 8 Nov 2025
 04:18:16 +0000
Date: Sat, 8 Nov 2025 12:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-nvme:nvme-6.19 4/23] checkpatch: ERROR: switch and case
 should be at the same indent
Message-ID: <aQ7EgX5CiwOS/3Eo@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 851cb855-0837-4876-3110-08de1e7dd6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XF1KAaq5utvixJgVvG8aDiz7DHTTigXBy6B3nk5eCvamoDyK1JIhGqx+g7K5?=
 =?us-ascii?Q?VEC78aTZnJkYYiziMaQWocW104E0i3zA8X4FKuv1CDJwIFo7WKuSK1f6Keby?=
 =?us-ascii?Q?lqNQx50c4ayBbNsRbFwE24gYTxh9J4OD//rih+tpPeIkxRaKT0+nnpkCripF?=
 =?us-ascii?Q?h/S5S94lgDiRS+KFRjniG/lwHcmPTSQKmtxgiIe4nJ2jL1u+sUOui0Nhoc5l?=
 =?us-ascii?Q?8zgVQ7+Vd4RuIea2vXpCYFPBeWDFNetSinn9N6w/WpxZlevpiOPCxI7wwlcK?=
 =?us-ascii?Q?kMJwDrTCloGHByrhKsuKFKR5IDmLiAqH3+FhRoV4fDI+3lIK7KmNR81OtJdo?=
 =?us-ascii?Q?g2H6new2p4XIiveQxVDwVYh208aX4fRCjZKIWJHHabg6+Rd2ltGQ7vcmbhvG?=
 =?us-ascii?Q?3H5BXVLNCuvAbv7z6YbM/aSRucLSSlQe/9SDfYEzGWMgNbO+LSPc/mD8rDTn?=
 =?us-ascii?Q?O6Zu9fIOI6siXFcTI8zn8tFZ+vpotM8m2pjCh3m1NsuUZhkPo5IK75ynNWaN?=
 =?us-ascii?Q?oTlEaBzsrapTLzrPsn9TQaD39Fce188c76Zb71oUdwNd0Fw9SoA/c95H43VD?=
 =?us-ascii?Q?fHp/q1hfCE2fQcmV+jnd/MX7wa7oHWahnLVrD9tOxyoXP4IpZGJzvhuz7Zm3?=
 =?us-ascii?Q?rNRM+zTpvx6swNV4o1grJSa6ZFZrAfTwlVu3Nwj0xqxcLACc+eoMOvzVMutz?=
 =?us-ascii?Q?Ds/egK9boyVr6fYzcZWa67pcCW9SxgsS3zD8o0EIhmVfBcB5Hoyyl877JcPd?=
 =?us-ascii?Q?g6VfHC3zfx+pvwLZdvmqzHlieSLxtWSGDoNe7ygz//XrWokupFPt/suYuN/a?=
 =?us-ascii?Q?NKv4sbpTMo//keUe5hcblLOoRgHt7hdraHEZNaX16eLCi9+ppwECUkbUwBgi?=
 =?us-ascii?Q?5Meuwe+/tgLYSK4VFMwh+tgAxC5gkm2Wbe/kzLZKbzOFvu51BgMomvLa2VrJ?=
 =?us-ascii?Q?ajxkp46xPMxsBrFOqbJoHZuSH1X+kLMpmcGIGiJAUMGJFleQg43wb5Cbia2i?=
 =?us-ascii?Q?vIlr1nx9CgD3GdNROtFzq47nsgmUaEcy/agygvhalI50/jpWs7C9S/gIESeY?=
 =?us-ascii?Q?EAlcjonouuvwV1gM4mGYVXGKd3IZpfXqxlmZv0BEIE4gArKSosslT9n9huV7?=
 =?us-ascii?Q?Bq9SoLk0N5LpDO1v5Cm4sr7t1lXUs/zGliqWWm6+FQKAv85E6iXjB/nK3HTv?=
 =?us-ascii?Q?n9CIlEKOKazjZ9kq0yDMgdOYDOjRkp5OyfLv2TpuJyxfB/2sdBrEZ3eFMfm6?=
 =?us-ascii?Q?kUhsybgb/L/On0PP6hyuRp46yKvzcKlS/noB+LaoWUTefJ82DV/SGr+ObBVe?=
 =?us-ascii?Q?witTVZ/0/e4wyj7Rfiw+imDJipFMUBoXlWKYAMHS1NtNM/HEKREZ7Qe2LJLL?=
 =?us-ascii?Q?EJ76RDrukhWv28j8lnIky7Zze251DDi7WWapXIUJ47KDvr6K5yGiBtWdbnGg?=
 =?us-ascii?Q?naSJ8KcgWM7ckTxjdKk7HcfxXaA9lSE/iYV23uxRXM+gnLmJ5sLM+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smu8AbyCC/gQhhi6c2WQjTaEGjwU1GuLnGCCv7oT9iaexEqTjcXvHpTkQwNj?=
 =?us-ascii?Q?v+FRA/Xt1hGuRMNjR7DjO6mvP+QXz5lgN19a4n+3gjE2v9m0WGutf0EgpjT2?=
 =?us-ascii?Q?ryxhhQ3O42tSPleoeSJrcUQhHbG6b7Cx+Dmpo8avWBY4VAN5KAbUynedJ550?=
 =?us-ascii?Q?dMEgn99eTmn307TJl4z1IsKfSPiF1mB7QDbHTEDku8zqc62mzuFduUyyG3pd?=
 =?us-ascii?Q?a8Q8punQ+BRKBHN4znDksz/AlG1ZYttFAym4ppK/g79eSy1YKwN22/5IWNdg?=
 =?us-ascii?Q?XnDpd8higCyapP/r0NdufbA2X1oeroiGsCNjUV2QfNGnFH+exBN5RKdyNXc4?=
 =?us-ascii?Q?NQJJFu/LHZjozMV6UYASCP/JDCxiVQjtSyZuWU8OCdKBzTOfP7zsiLNbt+79?=
 =?us-ascii?Q?p+LhACgeVn3j7sdB98rTEvg3hwSrjc9QaU0HkZ3Mv+pNsKEY2f6Z2NpFEwah?=
 =?us-ascii?Q?VbS+Xlq6JOEIAJShwgTiRHvBVJ8TTQkdl/IEZKOVY00PiQFPj1/7vlR+FyRL?=
 =?us-ascii?Q?npAp4vL9pjvdX0h2uKZNqdIWFNfMq45iHHEuWPtxwEhg+oyenzxLt0E8BRjN?=
 =?us-ascii?Q?NrK71hnBmzfeabBIeYW8qyfM6LceRzYpPWwMMUH/x7XHrFsy+Og2Gf4PQSax?=
 =?us-ascii?Q?iudkrpdEh4cRv7lQvMqWKt9gHUCVNXjaqkEAi8X0D3S+TX8tKDH7pdQfjzUz?=
 =?us-ascii?Q?SJ3KvGGkVCD3lZMgWCbSFznwXFodJse6IcenQwowc6Hqh2/wkiDOyBNw/PlY?=
 =?us-ascii?Q?uWvSgZdBmB2QciOqDrAAKmtHQOC7ePyJWVKaZq9NaENbMF94+YbXIM+TfPiG?=
 =?us-ascii?Q?Z6qso+XQ5KUDIECNOI8PLejWzoO0Suqro2BKRzUIy9XLMf+P2gobf0mVWdHv?=
 =?us-ascii?Q?9+M5aPFlw3BjIcuiBDCQMtHQC0+xg0J1FiUzmL1qhtx7+C0cRYULAKjFfpSF?=
 =?us-ascii?Q?Kno1H38przn2CrY9qqUfnlsDyLG2CWeJdR6i4Zog3tJEYJTzHJOWcy3FtZAJ?=
 =?us-ascii?Q?bgyrXTRYb4xzfAFOMOsQMSIAwOLw8hucxsn/FBmvhcN45VcZInKpcWkLNiFi?=
 =?us-ascii?Q?wA4bx2Uy7W/fY7Oir617C1OrmXh9gzdeecZtg5SoSvbQ4hIkRdKO0XnDB3L5?=
 =?us-ascii?Q?eERX3HLu48OwlJue0zgJeEKmBp+JeC42q2TuS8QaN44t6jK3hxnzXFoWJddT?=
 =?us-ascii?Q?7rXZn2pDE+xGqlsAfI0PLWdlBk+VZWY4yy/wkFmzOu6FtdXXSLM/66saidNi?=
 =?us-ascii?Q?WU9y5s1Hmf25uhkDQsfBiBt+kMz0AdsKI2ch0rGD1o7yexyKqLbjqPDna+HM?=
 =?us-ascii?Q?XdG6c3cbWftApbzVpyZ66xxpz39KXUgLYVHj3alDGa7vNSourIW0mgPKfhGi?=
 =?us-ascii?Q?TwISE7oZSvbN+PwlvDCqmuOtVbPD/JP0ku6S5ohgSmRm8XcZ3SpJ5SEKzBAV?=
 =?us-ascii?Q?+iwERMUI9/FBYNsfCSd4iUjs/Ds+wm/QkwKhVeMUnHxPVKEqIip9LHpQ9l5v?=
 =?us-ascii?Q?NgqbBhn4546lnYoyIUOpBoYzEOsp1yjCXS74/Xk2Nqehge/Pdn4I71agtsjs?=
 =?us-ascii?Q?UPYlCCVXDr27aCRwNUN4Riobwuo7uP8/6EaTfVoz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 851cb855-0837-4876-3110-08de1e7dd6e5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:18:16.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/wVr8fvvB1F6+jjYsM8uXFr5FHPO3bqZ15qt/mBXKM1kkJZME10irtXy1hJDBTTecgtK8Y/+UnCDKIzyqhXJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   1c2ad96dbb33c75098b9c1b2a077d9434ecb9f02
commit: 8d9937531a4d3cb6d2d352c46dd807bfa52988b6 [4/23] nvme-keyring: add 'dhchap' key type
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511072211.KCkd764O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511072211.KCkd764O-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#76: FILE: drivers/nvme/common/keyring.c:297:
+ * Decode the DH-HMAC-CHAP key data passed in in @prep and

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#165: FILE: drivers/nvme/common/keyring.c:386:
+	switch (upayload->datalen) {
+	    case 32:
[...]
+	    case 48:
[...]
+	    case 64:
[...]
+	    default:

WARNING:TABSTOP: Statements should start on a tabstop
#166: FILE: drivers/nvme/common/keyring.c:387:
+	    case 32:

WARNING:TABSTOP: Statements should start on a tabstop
#169: FILE: drivers/nvme/common/keyring.c:390:
+	    case 48:

WARNING:TABSTOP: Statements should start on a tabstop
#172: FILE: drivers/nvme/common/keyring.c:393:
+	    case 64:

WARNING:TABSTOP: Statements should start on a tabstop
#175: FILE: drivers/nvme/common/keyring.c:396:
+	    default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

