Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B2810A0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720668942; cv=fail; b=Je5cy90GXUPqYzYZ8NTKly1uenRgq3vB5LVix1cbKcGpt0F6ypS0HgnMqVoMFeSWHQFU7z3hNB5akn9ejyT5vRgE0abA4ouYhRtOcfKI1656jVT3p8+kUQcH5Hg4niOsfhqMpnG+JUNL3DrMjwAG1WJLsKPMhdy/XIuibX63HlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720668942; c=relaxed/simple;
	bh=W3Y+H39FS7pLGgA78m0hjkHy8oPCYQ2UIaXYEqwgkSg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ld+CmFP/3K3mGUvIN550fQ6QDFpXmTw6rRlSUtXwenyLtXB5+tM1tz/FtKwjHKmatq4dA2F2eRSSMK4Zh6jU+j0qWk3FUxL5ykJT5w3pyjWBqp9Nou/7Ft0Ip4hRr6qB5y++jEEHGVh4AUKHTCoAWMQqWtU4m19XNMkh1ekIVfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxmS9FYo; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxmS9FYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720668940; x=1752204940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W3Y+H39FS7pLGgA78m0hjkHy8oPCYQ2UIaXYEqwgkSg=;
  b=RxmS9FYo9nIbe1D66gz1a1DljjyZ5aZr3u1h2ZPCSsenQXN4NFJU8sTh
   +t/vrbwKknOgAnU/t/87eRG5SmvRbiFcfwFFxnJkpiiiIkjS0bi/wa3Y7
   w72bV/ey23JE/Vdvy6UCyc7Sv3MBOc1D36SCQAf/Ov956avmKjevLjKSD
   zFib6iblAnu+2XgBvpK27YTkDqWMgixPuNQwvabtFIZER821Bqlz+7azq
   S7WT6dSMU2zAIu1CK5SobfN30nR+gA0AUzjM1u2Mgi0sISVnhiDiAAwLk
   JXJunQlxNVAMxXKJjsRQYwR0OSHtr9zJet8aGYwE0KibDuEY+85oyu0a6
   g==;
X-CSE-ConnectionGUID: /CeqoGpVQi2l0nPn9iiWYQ==
X-CSE-MsgGUID: UMxpDTQ+SAmW//v+gO04Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17844368"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17844368"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:35:40 -0700
X-CSE-ConnectionGUID: UjI9JySHSHuUa0rLOHOqww==
X-CSE-MsgGUID: CSHxrdGSQsWxN7HJyF1SEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48859951"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:35:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:35:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:35:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:35:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9FJUe7u7hlYIEug+K4jaVjBksbSh2DYqmkNoza+Ya851s9d7981K4Y0XqS9nckfDLumzFMJavpwgNxlCvhZzYVVylyXpICXGhH3kXme2PvtOTKD+tiHjWvyzgt4ubWYGOn6XBvRvmz7+cOqceUywHCKjyvssx4XcciOEmuIntkAMswChj1/lK3PNGA3D2c7okz+PqqccT9b0uEfUcQBJp3esB5aa5PoadZbZwUzERLh4YjUBMury5QsW1rOntIylzaiNJpSCv9pZgrpc4CRCAyDRXBC3wf7D/i6yQpfIMbPVbRq+36KJaV+6Q3U97yARg9VDQLskk3jXeLjYxVpRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK8HNsxM5iErONpKHu8tPbzilNiKnpovDbDKXahXms4=;
 b=FEqatJcB1Y7MYPpmy9yjbX/n5913OBmZIf3DtyoYMPLjNuwWwnN/RZ25Cw5azVuRZU9YnVxf4DTJDz4zMITzqzIvDtjyAV1F8FKuG4nZLpOPD3fAnzmg8X4o+nB5h4x+wNiPwU4yXxMADcvNPHo0GHNx7BEqtKjCKUWFPTtklP+uTjbya2qf86U7ZA08XAKATGwJPpysTgOqXmQL9FNhLXTFpPenRt+H5jLv2MtB0C0KFWyM7H5pYAP/fEtBS/wVe0lS8PrI7tUFYa97ojKTyCovVwy0jPw/SdXP6xpTKWiB6G4a0zywp1vejZ55d6WRLuvJf0ZZwtJEpOGjN108kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:35:36 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:35:36 +0000
Date: Thu, 11 Jul 2024 11:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-1.0.x-imx 2975/11740]
 arch/arc/boot/dts/hsdk.dtb: gpu@90000: compatible:0: 'vivante,gc' is not one
 of ['fsl,imx6q-gpu', 'fsl,imx8-gpu', 'fsl,imx8-gpu-ss', 'fsl,imx8mm-gpu',
 'fsl,imx8mn-gpu', 'fsl,imx8mp-gpu', 'fsl,imx8mq-gpu', 'fsl,imx8qm-gpu',
 'fsl,imx8qxp-gpu', 'fsl,ls1028a-...
Message-ID: <Zo9TAJPXZyos9wAE@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6029:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 211de6bf-2d69-4a99-8959-08dca15a86f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kHR46NszA9gT/Bt3KhIx5xR1+rLWaNfm+xYdFhb5QHgmnX3sIo9ZyXwiuCF6?=
 =?us-ascii?Q?fY5M2Dey8w+a6lmm0X64GpXt1ePJgqNDtFR1CVneujgJx7ibE2TFU7ZwJoux?=
 =?us-ascii?Q?qUuU8lBmooSxWtYqBnGsBXA3/KPSCNDQovCEL1BP66DO1cvFpGcjY4CkcvdL?=
 =?us-ascii?Q?kr1yQW08fdU47KzG2TgNkGpeTvjzaqqE/y8t003QL217+O+/QocB086kiCbd?=
 =?us-ascii?Q?OZXWnbxrqTrzGdeiNbEsQJO7T9T7Wa4yCCmWIPpneoQ/C5a9j3KSNyWcnSCa?=
 =?us-ascii?Q?u1xP8gXicRxAtR2Rphslsv19KGVw51fjfUuRcqxUGLrWZcaUEjKj+4EhzdPk?=
 =?us-ascii?Q?YbMU6dG+EQHN6Lb8qm9k7qVdcINo0635e74yyz02ds+vBojwYqdRjqS5TQ0U?=
 =?us-ascii?Q?oLv0noxVMDa6t/so1DrXBM0krxKBt7wOfWRIUZMk3WW11F2G3QtuDepFNTL8?=
 =?us-ascii?Q?1t0C2lRe3W7EwS0qVUDTYO7bGSnXmr2Z4CaCEPLxOkKfbDaLNXyKqCgnj46c?=
 =?us-ascii?Q?sYDiyXZEb7MO7OpThh2zQpqFslBd9J39UQUJyBreBn4wTKnpBsk8jBYQgAU7?=
 =?us-ascii?Q?t9U6k+j9ui/nYjEwhE50E8KaihZXkyqG0FcE8a1WS9j+/IZzVa1+iuGPVsvM?=
 =?us-ascii?Q?/HhQZaPGfj6InpVv19RNJ9OMjNWS5nqB4pSZkngjtXOLtbkd8YIkhOcHh3ON?=
 =?us-ascii?Q?Z4Z/kwhLUZXWogzxu2JPuHF+wNNceTIKz9z8blIimX7cC1sUbPWSz4GfBRob?=
 =?us-ascii?Q?xzHdJdbhv5yF/2rYdDOXkE+nNrHS7UH4Hb/GaAN+wr7YYUMs9j+Hkkn9TDWX?=
 =?us-ascii?Q?E+69BZ4YkaPgGcxlbjGjYsJ1sgb/saDPcV71eF+0dMFpta7mShUbqHUF4vYC?=
 =?us-ascii?Q?YWbewMNF8xq+/8bcv5Go6OlDBKeTC+dwl/+FeIusijh6MZzyNEhds7Uny3am?=
 =?us-ascii?Q?uTV0cFkcPKkG4ktxXXIgab2875LhyY7Iz+4oe+k5nOWEU0OxeTqJhP1wR3PO?=
 =?us-ascii?Q?Pds6DTT/XhXA7TsWYae74qqSmGhJcyusj67uehtHghQBn5gWuI4Tts6GGaRj?=
 =?us-ascii?Q?3ZSe5x8wBOjitYXHH3S179Sl5tSM8k5miI+6/HtJVdybexJ4UPVg97Te+jzl?=
 =?us-ascii?Q?wjRifXUZnVG/tftJme7uJgg2z+2RR0bpqL6Jm5FVl3sorG+4klY1XJYbeJXN?=
 =?us-ascii?Q?On/9red0dByJFVmt0d2/KNvulf6b1A5IQ4i0EPbmcL2iZhBOIUBOxj0XeY01?=
 =?us-ascii?Q?kQWwviG6Afi8rqaDFb0pcOSCLmUM7RjmtP55gUxvo1yyeyvWZ6MQ5cRmo8w3?=
 =?us-ascii?Q?zxs9bfjeNdQ2vhnc68s4gcbTfLypvvTen89dptMaB++Ne1i/3ggzOgjFhXOE?=
 =?us-ascii?Q?EbeTZjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1A30/QWnnYVzvsI1txc8nvq4a75Wpc4P5hTuu4+Oyl4YcMqWPQbm0S4CLwzN?=
 =?us-ascii?Q?vubHAStfmlaf2+EzwS3NYDYEErohHoMaeMipK/ss7HuVbheHA/wcomd+SuK+?=
 =?us-ascii?Q?rW+C0frRl5n0Kqlj51mFMXfJgSvUhX58pgq17S76UcQnfECMaoUmI2HLkKxs?=
 =?us-ascii?Q?kIM7+GbJTpHzfS9N8F0QKej4MIWfnnNebXmBVrn7m0JFo/vzIy+d7TzudexI?=
 =?us-ascii?Q?wZ/os7iBdec/9Yqs8ghmx3Oq5QVoGVwDl0UXA0tAByeOovhZSoC5GokT+9Cq?=
 =?us-ascii?Q?8/hPRNY3ryOjjjCz7lUoPPQBW+897yuApsD7YNejqRq8CB0epomv2397774k?=
 =?us-ascii?Q?9QU6bweLPRx5qAaOUt8pA9QE1VfpB3pvPxsiRGQT4z0HtqhjpT3H7TBxCpBN?=
 =?us-ascii?Q?mprkqzGyRDAPPBLJddfxkECM3Hysa7Ov5aOA3TP103HQyHsxIGf/cC0JgHQ2?=
 =?us-ascii?Q?QWNLpuZxG9tBFmbA5rDQdPuGcvxtnfrsW2vkLTE0rZegzQZpQbgdOmaOQ4d8?=
 =?us-ascii?Q?hTVgVjV+2EWh03UmHm/tzu7ZQPN8mwDC3lwPRR8USorOFoKXMC4OqMLW+ggr?=
 =?us-ascii?Q?TnpAPWFegMrpaeBMW0SspG3qxiOXmOzZwbWwgKZ5/+Iadki6EXpICYGo2Nd+?=
 =?us-ascii?Q?WA8QzpwsaDeIFHSSaGMcZzMyJmxGjNfP4zHNZaIg4NWcdvr7sjKDFvHwGSFU?=
 =?us-ascii?Q?7a5YmZj8Dy1xvy02zPREGJtnAu83MBdJcroKqOBF2cQjQTHn7pSTTdPXUAKo?=
 =?us-ascii?Q?PeZjlc4c5rhJyAmiciWrpCojNHkzFZuj1FOFb/TRQ5vu5tf7wBIUunOJ4o6a?=
 =?us-ascii?Q?j5uhRR8e+GFlhQhiAn7e/S8iibVKQ6nL8gbtzIxjgVR6JUADJFOkD7YJKLkL?=
 =?us-ascii?Q?Epi7UeWDkWADwGz1TBUwj0WFgTth1WfM0R1666+LkBTzH9mjyIO/69XyB6DY?=
 =?us-ascii?Q?T/pBhYdzCJDjEa1gbmrd/aiSu3SWxg7Y1Djb+mcxdTMlw1lGH1IBlRIvPGSY?=
 =?us-ascii?Q?WHPMDOm46dBPqxHSO4M3Ug/qwENKOsZBd5hkVsoRvpbuI7O0qdvLmvx9tm0m?=
 =?us-ascii?Q?eXTfFaG2UQdFW5gnMBfxdiWQ4N4hLPemhaVTWnjPNvOWKwO2wCyItBFLhvLA?=
 =?us-ascii?Q?FPgdwptZ3vl3NjWm2M8gy9sM+QaRKbEkmuuoUUIajuV8P8SZQFTfEQ53Rcho?=
 =?us-ascii?Q?L+MlF14zo6rLCxZO2TF6oXAjqUi3U63sdp2lvnMSBboTKERKzAHaz2OEc5aM?=
 =?us-ascii?Q?HrTofHp+/5Fc8jOEoSPDz3N3cjOFuiPyJgrJtIZx19luX1vW9GDpGxARXCPi?=
 =?us-ascii?Q?BIjaKqzDmdBLlcaHVa5vmtrC+p0srkj61B8dwlu5TmVI84UWlJv6IcTIzGYR?=
 =?us-ascii?Q?789MycH4/dMqgI2Abot8uE2Cm3A3+KVFSWrJYioS/zlm+k0TD0pjRhGJ2+q2?=
 =?us-ascii?Q?3Inmt6rpFrxuItulys25pPYLeGqIu4pRM90E4nJT+0sMXirELSMy1NhntoPj?=
 =?us-ascii?Q?C60VQZxH0jQiBJ70V/+cUCpI7us6H/kMB53QwmHy+qkQ5ec+2/aE5uRikqfJ?=
 =?us-ascii?Q?wySQBe42BG/g/23205C6OMFsg9va14ln3gPux5ldbUCjtMMAHIITmD7/ev4p?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 211de6bf-2d69-4a99-8959-08dca15a86f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:35:36.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYw4FoPNdeMuVMZMBwBPtaJSuGhn99HQ2EVrgJBLOuF6jKDZifmwafCMsyj5fvL6k6LRBJt4/QON06GIWX/Brw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   13ed4e83694299049a3d4449fdb61471292ef19b
commit: 8b209e8532a11e93f1cf1af2324b3b478d28820b [2975/11740] LF-2784-1 dt-bindings: gpu: add gpu compatible
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110230.pGGBC0z0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110230.pGGBC0z0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110230.pGGBC0z0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/hsdk.dtb: /soc/core-clk@0: failed to match any schema with compatible: ['snps,hsdk-core-pll-clock']
   arch/arc/boot/dts/hsdk.dtb: serial@5000: Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@60000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@40000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/hsdk.dtb: mmc@a000: Unevaluated properties are not allowed ('dma-coherent', 'num-slots' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/hsdk.dtb: /soc/gpio@14b0: failed to match any schema with compatible: ['snps,creg-gpio-hsdk']
>> arch/arc/boot/dts/hsdk.dtb: gpu@90000: compatible:0: 'vivante,gc' is not one of ['fsl,imx6q-gpu', 'fsl,imx8-gpu', 'fsl,imx8-gpu-ss', 'fsl,imx8mm-gpu', 'fsl,imx8mn-gpu', 'fsl,imx8mp-gpu', 'fsl,imx8mq-gpu', 'fsl,imx8qm-gpu', 'fsl,imx8qxp-gpu', 'fsl,ls1028a-gpu']
   	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
>> arch/arc/boot/dts/hsdk.dtb: gpu@90000: compatible: ['vivante,gc'] is too short
   	from schema $id: http://devicetree.org/schemas/gpu/vivante,gc.yaml#
   arch/arc/boot/dts/hsdk.dtb: dmac@80000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#
   arch/arc/boot/dts/hsdk.dtb: dmac@80000: $nodename:0: 'dmac@80000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#
   arch/arc/boot/dts/hsdk.dtb: dmac@80000: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

