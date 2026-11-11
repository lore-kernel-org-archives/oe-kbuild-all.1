Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794392341;
	b=CPMaQi77fiDhSr/Jbb40F9CICJP7aHkrf5ZaO/ApHvjGdqedwvVSaS/zz79R+zCdz/Hu
	 LxaFqaN8XA7pon3NmGysfEXOsEJ1QLxEM3ILHMGdB4tWpYvExazqUp1WytuMpTqbplwOx
	 xUaEGgNnBQxJWpHGANzwkhXIbCwyYGNYlunjjepPvUNoK0B5fyEGnoOCEWWvkenyV9bfY
	 PQr2g0zO45jNXhc2O4lx30ezPUpGQr6wUHMSPP9/cqbrLa3e913NLhd1gObmHPnB+aP3x
	 m2nCgATx7ath1eLwSelBt+xOItE2mqqFoa7VEXoBeBggQGKw2PnEwDlMm974zTlTUZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392341;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 Content-Type:Content-Disposition:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=fHL2al80Uxlz0FQmrjyqVXgxymKKd0iVOk3J9I1WBK0=;
	b=kBK9yRtgIIWutTx/Dc1qhOIDwWR15dp6j2431SzCR8EwWD79qoD2zvAeH0ZWjfKsV/Qk
	 PcM9efMnLhb+8emtbsjGepTsQidbowbBG1doWg0jZQhbbBhIQjoQpcEblDqti4gK1btGF
	 rT1nhjh6qhUO/hMDCIRtoxohcDK1IkSdGGDqbk4Er+qyjGaiiuOBzg0gAQw6ZVKxjFun5
	 CQIW+KVMQegGdT8K6RVg96+7UT4XsU5FM3W6P8jf9bbWC/eHJR8Vlqiq1HIIyZgQVzcHg
	 BC/YWiXZ2v4AuofqSz5tn5hYO78ubHbpkVOT0dUN4YC3eED/CXp0cnZlozTO7RufSiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cZ9Tz0rc;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E113606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 10:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E113606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cZ9Tz0rc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794392339; x=1825928339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OUe9qFvBpSMnqyzpWIZsF9waAdDLkP/RrmwjHQuHu74=;
  b=cZ9Tz0rc8dZynH5eCErSFdI2Q2YE7yjB2u7dhUrEBZBQGZI0mT1Y4E29
   8Wa9GMzE7GLFXA1rfV54c3bLD7dUqUTNQyxv4MQmpiOfl3pYVV5yjbK4y
   pS9Vz27ZCV6Aub3298KtmWKJ87yFnw3QaXisDfMM6zlGDKc1OxwuqcN8u
   asdVUz700OtQSpqGRK4iw2G2KpkKisrLMM73rY8ljlafGSKrHQlTwPzVS
   cael976iY3oKM1wCUF94udMOrjzF7EIyXXSMLh1tyzaMxLjTiPgT4R4+S
   KdsHLmfEmVv0/zhIoZmeh2/iBHw3Xs72cBRAMk/TOZDya3TgY+XZuXZiJ
   w==;
X-CSE-ConnectionGUID: PS5byqlHQnKNewI3bBfWdg==
X-CSE-MsgGUID: MXCIOiaOTSaFeRy1gRmFsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3194884"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3194884"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 02:18:59 -0800
X-CSE-ConnectionGUID: 3dX8UPKOSn+mnlQIB+BBRw==
X-CSE-MsgGUID: iB8qZCUGRnOjyvyKQCSioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8717404"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 02:18:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:18:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 02:18:58 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:18:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUPEjnhHlwD+DJgxLnQ8Deymgd0QzzNKhlwl7rrFTs+jNUMVTtnJgMg9BSLWZ/F4DJex406DoP1i7IOFz6LSjBktgfh1UeBHmbsLDB8zC7t3+HotTmhDmfd0oswZB6R9C0e8oKqq1gW6ZjswXYsb6JZ3o49pe/g2ki6q0LVmbaAL6m42K94hr62pCgqbIlYPvpWhW8GQvQhf3Mfnulk74n1ne0mqpXBjcj4VHudZMJDJc1I4cqtv+8MjSOFO6UEp1E4fu2SolUC+nNDNS9BUxYZ1OVfrdJ6lbo4fysORKG2KRrNaCxxptyfbEOsqFVglL3LsF/0R4DZAabgZ92Zb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHL2al80Uxlz0FQmrjyqVXgxymKKd0iVOk3J9I1WBK0=;
 b=ZOofzJD7E0FuhGhl40yCZtOYlC3rZC8mcitkR4t3Za4wSDHoYOaasLwoVZjvGbxKYxWnPEDUcYi9AnZ+6RDceI8A525CwZBiqKqks2w/ictnGCrDqOhEMASDVwcUPMpAlelyHA3hPwkPgkgFQihy0jnBs00TbbnXq0RX0tnK9DYNqzgNNjifT5lkUKKLvDpnslZDMqt92bQt6XZSuubsIJmnwfgxkHn1KnQ1hERAZbr6p14tYgqoLiCl9m22v+Gtg4vtxyDQRxNnPxIfGLV5MLN7dAvXi6or7rEHVd2W3YZ5uwQK8tPEzwGES1i0SwZJd6vXOQUFiiNYkJSWIH4Jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB135732.namprd11.prod.outlook.com
 (2603:10b6:208:620::6) by DM4PR11MB7375.namprd11.prod.outlook.com
 (2603:10b6:8:101::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 10:18:55 +0000
Received: from IA3PR11MB135732.namprd11.prod.outlook.com
 ([fe80::3a42:74a5:4c6c:8d2]) by IA3PR11MB135732.namprd11.prod.outlook.com
 ([fe80::3a42:74a5:4c6c:8d2%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 10:18:54 +0000
Date: Wed, 11 Nov 2026 18:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android17-6.18 1/1] fuse_test.c:1400:9: warning:
 argument 1 null where non-null expected
Message-ID: <avRBBowJEko+YpLr@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To IA3PR11MB135732.namprd11.prod.outlook.com
 (2603:10b6:208:620::6)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB135732:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: fff5a23d-43df-4e9d-3edc-08df3fdd3083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|261009223327099003|261009221727099003|261009220027099003|261009221227099003|10067099003|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: b4GbKc7Ivjiq7GXrl4xn02UkYptC6qsU8O/35fRlmEokpOBUs0yq5hpMnf4Dqpk0SBOl43ec9HpjvXHk5yCMm0FOTMEIX5GkxXM3AS/ei2rMxstWCj/p1QjY3H7Fq/7MRNDgHvF1zXtzRuH1Msp3LLbXyyruiPx9wOAF/O4/SYW6ZBYiY+1NAVvidWV6achHyqmE36lTnxEkXtcdivofX2Tp07hTkbmSsTV6kprjILNeb2J1E/EVttEHRNWc6zddx0oOt1ZqKv1READAkHQDgrF8O+Ffg78sgFkDCEmrxYlBlAzK17rvNT2gPrfGDEOKYaGRC5WHJUgdJE8gxQGxuXBChVT9bpWyqVOOBTqNh9YHJBl1+EEx82fwUfXQtqLWYBkEyKaMS7oWJmoZXzFivjzafH0gfCGdcqkEOvjhMuaZx35tUlrhRB7Bx/cynFlLHS9vRAPOfE2DnShuWWfz08aen6wYvLQLBPpfRhrST99/H+H7QJxCOKP3EhKTzwb3BDpgbMElMPVTxDkkHiWHPhMPhNX4SPZA4/M22OVBF3jOYqyIhfY1+in/3q4NRtl3j8m6JG46HwgFJgo6U/M1icBIq0XAXFU9ZQPskllsU/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB135732.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(261009223327099003)(261009221727099003)(261009220027099003)(261009221227099003)(10067099003)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/uLJjqJUNW+ik3zf8mNtS+u0iygcIShWneOawwZekNso5Sq5hXn9qqB7YE8?=
 =?us-ascii?Q?ykmNfatcX/Hj2LFAL5+5+DbOnlZX0mijJ1wNKZrjDkksk1QgEvIIzRhUyne9?=
 =?us-ascii?Q?Vjn2sOKhObqGTwsxFFps/fp8WbNnMHx47NYXUmfNj+etQ11a2quBFAF3ya84?=
 =?us-ascii?Q?Psw3bOkkJhdyDZWZREhLrOsOsLjY5lgHus/hKa933KPWaHmK0p/SmL+nvCSs?=
 =?us-ascii?Q?I/s3GT3duT9H6VOalZgWwQTses720K1CU52uUw5TcCmR1ZpRWeNAfUeSO920?=
 =?us-ascii?Q?xkbh9n0OVjdNVY4xw+QUaNOtFAAmNaheeZsusCaEENftXmML488N5EUbiHCE?=
 =?us-ascii?Q?E9bdLk3essEmM5lu92pcb8D54zwnjWDC8KExOyxqP2NxlzXJkoMXNKSIvsj/?=
 =?us-ascii?Q?GkqNaQoBb5je7n2eJYN0vH1x/+g462Rj4UpmBY746/N11IBXPkOL5wNnlM9q?=
 =?us-ascii?Q?PDWKUlUHwOSNqObxZA/2HapcD+H7i3T1KXhY1A4Y3Pb5RGrVhWqaKxStgs2P?=
 =?us-ascii?Q?ww+yGwRHi5OF2hKPsp4VQgXEppG9XKzl/ye5OGSn++etvqtJXlQWcc5JvI/+?=
 =?us-ascii?Q?F9hf8AZfE49pzqdNRUBPaUzlwSgbrxe94bQPh7kgbDn01f27i22aT/qGitW5?=
 =?us-ascii?Q?RK/6gJcKrRL+sirKJIGz5GKxyhSB1k+dDqh3kyOFuus3v3Q6n8fU+WwBwHFJ?=
 =?us-ascii?Q?LFDw0dS9/G7yetBLGk8Uuy8QYb3UsufD9JvGTbyVJAn8JE+tE4Ya8WEb+kGw?=
 =?us-ascii?Q?Tos5GjV6J9k22WNsKSfzviNCP3Vgvo/Tqv/1plNvcyEnm3Xke+B87VQNg2Ub?=
 =?us-ascii?Q?YlVWd9CQsiqU5VXIdNFy7EsdgzS7uwgQro8oS8kO3UdtAfUhBHS5bG9z9XEz?=
 =?us-ascii?Q?IXUu0R9jgfMRCG58XFRFqtJyrAn8wrCdC/2MGjLLBTVPJwdi2qcrU4Y09jP8?=
 =?us-ascii?Q?xNeJ1PaxYSfGjPzuXvbfpMV+Z1F1AGcmLwzB1aj8NO7V5d9rIEoeu0Lcu8UK?=
 =?us-ascii?Q?LluA2ypzCpGKdW9VmjeZg3HEhmB6EFoiIXU0J0A9eV89EaWI8feU1XGGiOC7?=
 =?us-ascii?Q?LclDA652BgU982h1Mr1ppPW6g9Ue6k566DPfB6UbOYgpc8GC5AFyx1LQNHn/?=
 =?us-ascii?Q?8u/yCBx4DR9eTRWM31rw0bxmGJY9hOxeptEMGKelO6jKyel2zBLFo6r+bhHi?=
 =?us-ascii?Q?NBUKrPArful8H/fVHMWbfgVj+xS1ByUxKVWG4a0PACIbjVwkrW/6kL6HFMSq?=
 =?us-ascii?Q?fMGgHIvAHPXR9dTa1KAeRYp0cHFp5v+WiEXjaAX7oAAi7Fnk7Byor88axitH?=
 =?us-ascii?Q?XyRtlyPimCzNdpD/TSiphlnZDeYPnjDrM2bZo1j/EtHocv9asOSkXh6FO896?=
 =?us-ascii?Q?xLJfWKbZlgjmih1T7Ss9KbEpoLBqM+F9ZEAlPmMaOQDDBjWtL7PXBl15Y25k?=
 =?us-ascii?Q?FuulqqHKy74PznnybvTL89UsAEBw21YleFVHM0INgi+8dvGKTRqJfpkqvDEw?=
 =?us-ascii?Q?Fb5OVlUhrOa7HuY4yIFtGlPSQyISxQeJxFFqKwg2gydWNwGScVe4aNyITeSS?=
 =?us-ascii?Q?XLK7ENbF29PE9k8YgM3mJjFAInhBmNLU4RHm8tE+y2BJlDomXjUkxfiWj839?=
 =?us-ascii?Q?YKdEchSZWh5mo4qOzpFBmrC9frV4C3Bx1DokaNxCBQvPmjyla8qWG44NNyPa?=
 =?us-ascii?Q?QFPL3exJmKm2PcBMUWxhbaSvTJC2cgDiM1Q37DHYrofABLQYINgJMRp5yQeb?=
 =?us-ascii?Q?ZAVR2uBZ3w=3D=3D?=
X-Exchange-RoutingPolicyChecked: jLEoCm2hBR6dsHCHqx+JHZoR9v+tUtMJG6urY8HFCehjx+VAVSGI0rrzt9upkNbTc0+REiAdx76FVg8eZyqSfKzj2BuJLNmF8yU0/+rcm5fSpOfiSP5KYtYoPuDCFEfDMpKMqzaShEkI1C4THyQEpv4y0d55iSySoh7zbnVxdPqS83al6x22/iaMLNFsHcH5IjpOGjGsvL6rUFdqki6MLyq5XRSTse3h4ViUUSvUz/uqSawYGftZMtv7Cl3eHY92eGdyyylMasNlrguaI4LcnLs/7+VE5C5OvPx4nbMTbF8Nc0v/KnpqFkIqyprYkF5VG6928p3FFYSc90rTW+r7ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: fff5a23d-43df-4e9d-3edc-08df3fdd3083
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB135732.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:18:54.8507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLBiW5PvzN8aZ3IYLdeVAwZCbSkJ7Xz5lU4kfPKGh2DlP7sGudLCEBL0+c0KdrYeUbeZcs+GSMpgnPqiQSZlLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
X-OriginatorOrg: intel.com

Hi Paul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   00c8666046c244b6b8efdf905f8d438ee248f875
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [1/1] ANDROID: fuse-bpf: fuse-bpf v1.3
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261111/202611110550.Xq487xqj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110550.Xq487xqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611110550.Xq487xqj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fuse_test.c: In function 'readdir_perms_test':
>> fuse_test.c:1400:9: warning: argument 1 null where non-null expected [-Wnonnull]
    1400 |         closedir(dir);
         |         ^~~~~~~~~~~~~
   In file included from test_fuse.h:13,
                    from fuse_test.c:7:
   /usr/include/dirent.h:134:12: note: in a call to function 'closedir' declared 'nonnull'
     134 | extern int closedir (DIR *__dirp) __nonnull ((1));
         |            ^~~~~~~~
   fuse_test.c: In function 'inotify_test':
>> fuse_test.c:1455:9: warning: 'dir.s' may be used uninitialized [-Wmaybe-uninitialized]
    1455 |         free(dir.s);
         |         ^~~~~~~~~~~
   fuse_test.c:1429:18: note: 'dir.s' was declared here
    1429 |         struct s dir;
         |                  ^~~
   In file included from test_fuse.h:11:
   fuse_test.c: In function 'bpf_test_revalidate_handle_backing_fd':
>> fuse_test.c:1889:27: warning: 'read' writing 11 bytes into a region of size 9 overflows the destination [-Wstringop-overflow=]
    1889 |                 TESTEQUAL(read(dst_content_fd, content_buffer, strlen(content)),
   test_framework.h:137:56: note: in definition of macro '_CALL_TO'
     137 |                                   (_type) (long long) (a),              \
         |                                                        ^
   test_framework.h:153:25: note: in expansion of macro 'TESTOPERATOR'
     153 | #define TESTEQUAL(a, b) TESTOPERATOR(a, b, _eq)
         |                         ^~~~~~~~~~~~
   fuse_test.c:1889:17: note: in expansion of macro 'TESTEQUAL'
    1889 |                 TESTEQUAL(read(dst_content_fd, content_buffer, strlen(content)),
         |                 ^~~~~~~~~
   fuse_test.c:1874:22: note: destination object 'content_buffer' of size 9
    1874 |                 char content_buffer[9] = {0};
         |                      ^~~~~~~~~~~~~~
   In file included from ../../kselftest.h:55,
                    from test_framework.h:26:
   /usr/include/unistd.h:371:16: note: in a call to function 'read' declared with attribute 'access (write_only, 2, 3)'
     371 | extern ssize_t read (int __fd, void *__buf, size_t __nbytes) __wur
         |                ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

