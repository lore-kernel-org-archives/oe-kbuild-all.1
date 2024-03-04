Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F01378
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 01:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709515745; cv=fail; b=b9G5i8MPibMbn8bkYyrqtdDFYz2Jo095dt+LslHKrw8ARGA+HVtves8NGxx9j+zLoSOo8kKdM+l8pn3BWFxkEA+IvP9j63x/CgKX7tURqbS1THFwE1kDlT2iFdBkWTAeh0nrfcBKKHMn/SqL8+RfV/m/h5dLCdqo9shcN6PSHNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709515745; c=relaxed/simple;
	bh=ZF4dpa0pdAi6SN2u1udM8jOb5jcOqS1wOFHkFNvlMDo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BK8hqIfgWJSqevM1sOShvo4HFGQIyO6+a/bceZoNR+N+0e2n60Rt0a6Y0qKwmO409QPAhCrGgb3SsoTrwLYUNzAQQt+TRZ7xKGWAm0Pt4QDVs83FEzkOOtHLzIZ1H06Az5dZRwnTbJxV9ld+bjQ4ZoF7T7nz3PTf7ULqtFdTenk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGbEIZLA; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGbEIZLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709515743; x=1741051743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZF4dpa0pdAi6SN2u1udM8jOb5jcOqS1wOFHkFNvlMDo=;
  b=oGbEIZLA7Rm6oguprRfgkSlwYYPmo/jbiZwEKGjzUYU93zNXIZ7b104U
   eNLhOiuhVDGGoH5to8lCIXjYLxGkedFh9zrTd3kgJSi7Dz12tj91APT+6
   yuBBoGFltFrGpRkicihVCokCQ+k6FSahewF+FIEje5IKdtfwASTA2GxuM
   y0t5sJgUN2iTQdD/0Dih3Vas8L1TUvBrKBas8ar3kr9RFQPpxcEHldIM2
   nvMKAzCWn8LjlrtpqBcxbalteWETHozodFzlDpoMCZOcDbdp745fbTfZD
   ccklSANh6efhw6Ox7NlWsLwbmmZp0rx0DWK4xHg7Fs1OBaHcczecAVpHX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7809265"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7809265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8962623"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Mar 2024 17:29:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 17:29:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 17:29:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 3 Mar 2024 17:29:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 3 Mar 2024 17:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADNUwnBfbQBxIUWDms2e5mHhigPefyh4TNUc0AjGHg4TnpHyzfMiosTENrlcHsT97smpUYaDDlSItFKVceEzOiBMY1kFMxkbXWDIX8o1nNM4aFEKDn/+xrS0kl/8GxhNprOru8yEcAtTlvFg5b+rOvwNJL3iE45RoiXYy6+UAdQQ8vFrmHS47CV/y9pHiRduWFgQAzjKMUXSmScGhPTFod90ZDE0iGb4e5wnHV9tKuzgjWTILskaaiXOLUe0r1y0UsiF5TAG26u/7xta4Ls+HaMNxSS1HtrjX/kUAMTJlElVxd2rz3hyR0PAXOoXUPXyZ5J6tLp1orEo+2keGSYJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXeE73KqpzXHX1Vp7GJq3GKOwMYxi26eFMymwAzJzKA=;
 b=bzpr/gJobjYHo2kZRqI0Q4/5JRychT6SvUWmXiJU/h7nFseB9ra5Yh9CXZIpk3n7or87QkX7NYnLNhpA0NiyT7MfrCfgXvTPSG4kPRTBpkKp1pT+4Bbn0jEBJlv5CUrhsv5ZzdywWx6DcLqrXKLHHX9pZCUwDus1iGN7b4ULT8vNhpKSaw9xAJglcOi+5F5hvBZLXZwy0TDJqDQnF4cj4hHK4Bie2rJaf3wslVsg+/7hZaY8Wi//bNd6xy5v3AB3jgGk4bWuROjbvYaf6ACxRGNwPCWS+8vAOG1RYkvuyYHBgFxo2cR1f0fQ664k+50twdPvn/cSR4Y7mVwjWlqlhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.21; Mon, 4 Mar
 2024 01:28:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%5]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 01:28:58 +0000
Date: Mon, 4 Mar 2024 09:22:08 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: [morimoto:card2-trigger-order-2023-02-28 33/33] dtbs_check:
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml:30:10:
 [warning] too many spaces before colon (colons)
Message-ID: <202403010750.AulDCY96-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: f07f4285-51e6-47f5-4ea1-08dc3bea7608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VpGK1T+FK+OrqlIFC4i7/mRvvFIuaxj1mFgloMkIf69tbPun8MGme14O8Tl5dg6973mMshBIZ+Sk6FdfI0jI6E6F5BR+9o5IozduMY5fCi51n1XMrCskJOVFyMQyBn0UA5+sbKR8Qe86vUAFQC7da4Q5mpM5ANHrxX36I2ZWaZUyyCcOm7TQ4/+wIa2Npjxd05JbqE3nk4GPPtBIFv3tinduSyd2rXG50+hTf1xVoFoLB8iyM00zR3xLnmA/ozBP5fxPPMnWEaUVOXL4+DvpiEAjlwBbxyY6O7KxAoo39iRlfDOPb99wxZHtwVppPbmp6EineFmVs2VKesGLbpFA/7XzhSztikNaKYhuRlVh+l0drsMneHnaBzOS/cEZwQwYwF+u2Qt/cwg3EEfAdHxKLgoL/zJ0RM3iEDpfUA/iPPa+JAG4CHaLtjvJ/truPUkDvcZ/z4/ndSn6RBNtTZhpbgCHXZ0tnC+sxisN2Wv77U2t2jdRGdNzEWFE8U0R2JsIIHCdmQvZtKato4h0KXblpuXiz2byoxyqnkDha5jaXHbK8mARoIDrhkCTvkoVV9Uh9z28RKLqgTkz7+Far0hfLjZOBNaR2oaaqRiknmx3I+0ak9sL58FhpegjDyZ4+VX6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KVqOmIoeWM1ssIkAresUR5dxXkb4LkmfgKLO9Tmr6pwlXePZdU3lNgm/SW71?=
 =?us-ascii?Q?bCqp4ZFqzWGmTiXH1PlYyEs1lGHK/KjbZnCGFEj0EW7WNIpDzF+cPYyOWuvf?=
 =?us-ascii?Q?5M2JcscyI7ApWc/7mMJ/0RcANAI1v7vN4wNpidtw5sPdnwZVdZfOQ7SWkTMj?=
 =?us-ascii?Q?ofn0/2SYJzxp/jaMk7g12t9UPVUo61EjhAXHF0u2LIo+WEjntQlWfh92Oqyz?=
 =?us-ascii?Q?wp4KgZqb4/IGoK9elBw547QFtl+DaVICze0AqT3epaD5LL/vWF6viCHYT7Jf?=
 =?us-ascii?Q?/CDn/+cAqp/xLji7tme6GdWN+qj3NJdGI1DcDA2Z4wHGOg1rj0Ep7N5g7P2y?=
 =?us-ascii?Q?hI4QoE06nfzDCLyDoZD7Un7d/n2xeSBk8L3Q3Vx/51bH/KkLOYTZzffMlDa2?=
 =?us-ascii?Q?1jrw/44uID4p/tN6hePD0B1emAM/+XpV+4sTGCjMdCtbUGVrIrymNnVowiyI?=
 =?us-ascii?Q?IH7DmchtyQph7KlbncpRQ8fJNkXOF6TEqP6YLiznl7pNZg07aAH6X9Fsz8Iq?=
 =?us-ascii?Q?P/2skfXaOqKYqfnSGR+QkGcrLPgEiSprY/aGAPM5PId2GEWRcw6Jafk2rUrR?=
 =?us-ascii?Q?hKmtIDTkAp8WOHCVK8V5ulf+hSLhRIlqoolor/ZYZHEJmu4nF07sBlE9sAVx?=
 =?us-ascii?Q?cfrknhlAY/UvZ2eqTSfx/ESE4gkQbg2Rf1e+1xG4+He8shbnp+HUbf5oNrqD?=
 =?us-ascii?Q?s7myZzbDUTeHTIMU5XAf0t8B3eAMQlWH7ZigXK2eEZih2D04ViXjAOhy0IFf?=
 =?us-ascii?Q?O7TS52uRXpsCPWWcRlw4N+ALvRSxTj3EQqySfqGDTQRur+fGoJPOmhUO6Ljn?=
 =?us-ascii?Q?8VdaQIHwA4CKjZ2EJcRz1s4scG7seJI7zxTxdzaPddEfVSWJEUwttrLn8pIV?=
 =?us-ascii?Q?jFcs7DSbEjleWh+uOiyHdnTN6qQvYjQUdWSdRYGe4pfgEVpyuNySinI/40Ru?=
 =?us-ascii?Q?h9YEL6BZ6DqafCPqQfhnPl88dwPQI0D1yjZQrV1fCR6T7MG2Yqqlwh74hfxg?=
 =?us-ascii?Q?5rVKs7SXy5VpcQAJGGqtiMInfRWV01WkIfMc75KFURWSXpicFVEYk9ccBLUP?=
 =?us-ascii?Q?a4V+fRbEtsgH4p50Ra4ps9ZCjblOWdWRW/+yB2CRiEhyDU1+bjwM2sOxaUWT?=
 =?us-ascii?Q?CA53Mfi5dfZNJm2xvmARE7ebOCxt1TNbEU4QhjYgMII8Hf4fMrHG3er2kuiH?=
 =?us-ascii?Q?X+5qq3PXP1J/+rn9Nqrux767zKUJg/6rkFMCO9I6IGQz7BEfV6AULyrai+ze?=
 =?us-ascii?Q?KoYWaXHIzOJhN9ZnPxZpKiDxCZ+hmrO8uNr7oV0gNssmHE7gcRtu4ebGNSHo?=
 =?us-ascii?Q?AiVRlyrnve8GDDystppE2IDfvmRVNkTj/kv3kq9dV+s2tkAumSokkeuFdrDy?=
 =?us-ascii?Q?hjpG1YVTAysTUCPA43eKA7RdsiyQaw0PoAbKL8ZIzVRz5CxKb6y5FEfWZtBI?=
 =?us-ascii?Q?AL9cmmB19Ki0yUh9Mbfu7FcERcpOwWvAP+kFTXYThZWH22ZN/khaUx7Jy5PK?=
 =?us-ascii?Q?DD//GdwOl10RBvYNvWBxjNxCmZHTP2MC+TsllT6f+91hNqvErevcRpMK4Dsf?=
 =?us-ascii?Q?n84KQUgD09uvN9r+F+Qu/pMPCRsYWnJNbjOESkIZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f07f4285-51e6-47f5-4ea1-08dc3bea7608
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 01:28:58.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaC/veOkSlsRXOI4CoufwrbSbD6sXlQ+GKV+V3zxKx17T3hoz9LAanwIoskWwFeEsPNTbW7ImICDXPRD2NCSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
X-OriginatorOrg: intel.com

tree:   https://github.com/morimoto/linux card2-trigger-order-2023-02-28
head:   7954e5e1bfde7e92159d3cc1922b94fbd5957915
commit: 7954e5e1bfde7e92159d3cc1922b94fbd5957915 [33/33] ASoC: audio-graph-port: add link-trigger-order
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403010750.AulDCY96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202403010750.AulDCY96-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml:30:10: [warning] too many spaces before colon (colons)
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml:31:10: [warning] too many spaces before colon (colons)
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml:34:9: [error] syntax error: could not find expected ':' (syntax)
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml:34:9: could not find expected ':'
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: ignoring, error parsing file

vim +30 Documentation/devicetree/bindings/sound/audio-graph-port.yaml

e52f3f29115204 Sameer Pujar       2020-11-16   13  
bbda859e02a4df Kuninori Morimoto  2023-01-23   14  definitions:
bbda859e02a4df Kuninori Morimoto  2023-01-23   15    port-base:
967dad97757057 Rob Herring        2023-09-28   16      allOf:
967dad97757057 Rob Herring        2023-09-28   17        - $ref: /schemas/graph.yaml#/$defs/port-base
967dad97757057 Rob Herring        2023-09-28   18        - $ref: /schemas/sound/dai-params.yaml#
e52f3f29115204 Sameer Pujar       2020-11-16   19      properties:
a2fabeaaf5e29d Kuninori Morimoto  2023-01-23   20        mclk-fs:
d9e909e219a843 Rob Herring        2023-03-17   21          $ref: simple-card.yaml#/definitions/mclk-fs
af29e51bee8223 Daniel Baluta      2023-11-28   22        playback-only:
af29e51bee8223 Daniel Baluta      2023-11-28   23          description: port connection used only for playback
af29e51bee8223 Daniel Baluta      2023-11-28   24          $ref: /schemas/types.yaml#/definitions/flag
af29e51bee8223 Daniel Baluta      2023-11-28   25        capture-only:
af29e51bee8223 Daniel Baluta      2023-11-28   26          description: port connection used only for capture
af29e51bee8223 Daniel Baluta      2023-11-28   27          $ref: /schemas/types.yaml#/definitions/flag
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   28        link-trigger-order:
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   29          description: indicates trigger order for both start/stop
7954e5e1bfde7e Kuninori Morimoto  2024-02-28  @30          0 : LINK
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   31          1 : COMPONENT
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   32          2 : DAI
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   33          for example <0 1 2> means LINK -> COMPONENT -> DAI
7954e5e1bfde7e Kuninori Morimoto  2024-02-28  @34          $ref: /schemas/types.yaml#/definitions/uint32-array
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   35        link-trigger-order-start:
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   36          description: indicates trigger order for start
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   37          $ref: /schemas/types.yaml#/definitions/uint32-array
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   38        link-trigger-order-stop:
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   39          description: indicates trigger order for stop
7954e5e1bfde7e Kuninori Morimoto  2024-02-28   40          $ref: /schemas/types.yaml#/definitions/uint32-array
b79b6220a75399 Sameer Pujar       2022-08-08   41  
bbda859e02a4df Kuninori Morimoto  2023-01-23   42    endpoint-base:
967dad97757057 Rob Herring        2023-09-28   43      allOf:
967dad97757057 Rob Herring        2023-09-28   44        - $ref: /schemas/graph.yaml#/$defs/endpoint-base
967dad97757057 Rob Herring        2023-09-28   45        - $ref: /schemas/sound/dai-params.yaml#
e52f3f29115204 Sameer Pujar       2020-11-16   46      properties:
e52f3f29115204 Sameer Pujar       2020-11-16   47        mclk-fs:
d9e909e219a843 Rob Herring        2023-03-17   48          $ref: simple-card.yaml#/definitions/mclk-fs
e52f3f29115204 Sameer Pujar       2020-11-16   49        frame-inversion:
e52f3f29115204 Sameer Pujar       2020-11-16   50          description: dai-link uses frame clock inversion
e52f3f29115204 Sameer Pujar       2020-11-16   51          $ref: /schemas/types.yaml#/definitions/flag
e52f3f29115204 Sameer Pujar       2020-11-16   52        bitclock-inversion:
e52f3f29115204 Sameer Pujar       2020-11-16   53          description: dai-link uses bit clock inversion
e52f3f29115204 Sameer Pujar       2020-11-16   54          $ref: /schemas/types.yaml#/definitions/flag
e52f3f29115204 Sameer Pujar       2020-11-16   55        frame-master:
e52f3f29115204 Sameer Pujar       2020-11-16   56          description: Indicates dai-link frame master.
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   57          oneOf:
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   58            - $ref: /schemas/types.yaml#/definitions/flag
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   59            - $ref: /schemas/types.yaml#/definitions/phandle
e52f3f29115204 Sameer Pujar       2020-11-16   60        bitclock-master:
e52f3f29115204 Sameer Pujar       2020-11-16   61          description: Indicates dai-link bit clock master
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   62          oneOf:
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   63            - $ref: /schemas/types.yaml#/definitions/flag
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   64            - $ref: /schemas/types.yaml#/definitions/phandle
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   65        clocks:
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   66          description: Indicates system clock
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   67          $ref: /schemas/types.yaml#/definitions/phandle
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   68        system-clock-frequency:
d9e909e219a843 Rob Herring        2023-03-17   69          $ref: simple-card.yaml#/definitions/system-clock-frequency
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   70        system-clock-direction-out:
d9e909e219a843 Rob Herring        2023-03-17   71          $ref: simple-card.yaml#/definitions/system-clock-direction-out
2f0be75c9ff935 Kuninori Morimoto  2023-01-23   72        system-clock-fixed:
d9e909e219a843 Rob Herring        2023-03-17   73          $ref: simple-card.yaml#/definitions/system-clock-fixed
9b3c847b5fa036 Kuninori Morimoto  2021-12-16   74  
e52f3f29115204 Sameer Pujar       2020-11-16   75        dai-format:
e52f3f29115204 Sameer Pujar       2020-11-16   76          description: audio format.
e52f3f29115204 Sameer Pujar       2020-11-16   77          items:
e52f3f29115204 Sameer Pujar       2020-11-16   78            enum:
e52f3f29115204 Sameer Pujar       2020-11-16   79              - i2s
e52f3f29115204 Sameer Pujar       2020-11-16   80              - right_j
e52f3f29115204 Sameer Pujar       2020-11-16   81              - left_j
e52f3f29115204 Sameer Pujar       2020-11-16   82              - dsp_a
e52f3f29115204 Sameer Pujar       2020-11-16   83              - dsp_b
e52f3f29115204 Sameer Pujar       2020-11-16   84              - ac97
e52f3f29115204 Sameer Pujar       2020-11-16   85              - pdm
e52f3f29115204 Sameer Pujar       2020-11-16   86              - msb
e52f3f29115204 Sameer Pujar       2020-11-16   87              - lsb
e52f3f29115204 Sameer Pujar       2020-11-16   88  
853110992cfefe Marek Vasut        2022-09-27   89        dai-tdm-slot-num:
853110992cfefe Marek Vasut        2022-09-27   90          description: Number of slots in use.
853110992cfefe Marek Vasut        2022-09-27   91          $ref: /schemas/types.yaml#/definitions/uint32
853110992cfefe Marek Vasut        2022-09-27   92        dai-tdm-slot-width:
853110992cfefe Marek Vasut        2022-09-27   93          description: Width in bits for each slot.
853110992cfefe Marek Vasut        2022-09-27   94          $ref: /schemas/types.yaml#/definitions/uint32
26e5366dd30569 Richard Fitzgerald 2022-02-28   95        dai-tdm-slot-width-map:
26e5366dd30569 Richard Fitzgerald 2022-02-28   96          description: Mapping of sample widths to slot widths. For hardware
26e5366dd30569 Richard Fitzgerald 2022-02-28   97            that cannot support a fixed slot width or a slot width always
26e5366dd30569 Richard Fitzgerald 2022-02-28   98            equal to sample width. A matrix of one or more 3-tuples.
26e5366dd30569 Richard Fitzgerald 2022-02-28   99          $ref: /schemas/types.yaml#/definitions/uint32-matrix
26e5366dd30569 Richard Fitzgerald 2022-02-28  100          items:
26e5366dd30569 Richard Fitzgerald 2022-02-28  101            items:
26e5366dd30569 Richard Fitzgerald 2022-02-28  102              -
26e5366dd30569 Richard Fitzgerald 2022-02-28  103                description: Sample width in bits
26e5366dd30569 Richard Fitzgerald 2022-02-28  104                minimum: 8
26e5366dd30569 Richard Fitzgerald 2022-02-28  105                maximum: 64
26e5366dd30569 Richard Fitzgerald 2022-02-28  106              -
26e5366dd30569 Richard Fitzgerald 2022-02-28  107                description: Slot width in bits
26e5366dd30569 Richard Fitzgerald 2022-02-28  108                minimum: 8
26e5366dd30569 Richard Fitzgerald 2022-02-28  109                maximum: 256
26e5366dd30569 Richard Fitzgerald 2022-02-28  110              -
26e5366dd30569 Richard Fitzgerald 2022-02-28  111                description: Slot count
26e5366dd30569 Richard Fitzgerald 2022-02-28  112                minimum: 1
26e5366dd30569 Richard Fitzgerald 2022-02-28  113                maximum: 64
26e5366dd30569 Richard Fitzgerald 2022-02-28  114  
6a7216db63c884 Kuninori Morimoto  2023-01-23  115    ports:
6a7216db63c884 Kuninori Morimoto  2023-01-23  116      $ref: "#/definitions/port-base"
6a7216db63c884 Kuninori Morimoto  2023-01-23  117      unevaluatedProperties: false
6a7216db63c884 Kuninori Morimoto  2023-01-23  118      patternProperties:
6a7216db63c884 Kuninori Morimoto  2023-01-23  119        "^port(@[0-9a-f]+)?$":
6a7216db63c884 Kuninori Morimoto  2023-01-23  120          $ref: "#/definitions/port-base"
6a7216db63c884 Kuninori Morimoto  2023-01-23  121          unevaluatedProperties: false
6a7216db63c884 Kuninori Morimoto  2023-01-23  122          patternProperties:
6a7216db63c884 Kuninori Morimoto  2023-01-23  123            "^endpoint(@[0-9a-f]+)?":
6a7216db63c884 Kuninori Morimoto  2023-01-23  124              $ref: "#/definitions/endpoint-base"
6a7216db63c884 Kuninori Morimoto  2023-01-23  125              unevaluatedProperties: false
6a7216db63c884 Kuninori Morimoto  2023-01-23  126  
bbda859e02a4df Kuninori Morimoto  2023-01-23  127  allOf:
bbda859e02a4df Kuninori Morimoto  2023-01-23  128    - $ref: "#/definitions/port-base"
bbda859e02a4df Kuninori Morimoto  2023-01-23  129  
bbda859e02a4df Kuninori Morimoto  2023-01-23  130  patternProperties:
bbda859e02a4df Kuninori Morimoto  2023-01-23  131    "^endpoint(@[0-9a-f]+)?":
bbda859e02a4df Kuninori Morimoto  2023-01-23  132      $ref: "#/definitions/endpoint-base"
bbda859e02a4df Kuninori Morimoto  2023-01-23  133      unevaluatedProperties: false
bbda859e02a4df Kuninori Morimoto  2023-01-23  134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

