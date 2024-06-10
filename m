Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4D335A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718023048; cv=fail; b=R/1CwEqLil42pQ2ka0kKKCQuwpnMGN14UUCX3wYGWVbmfk8V+JkBdvZlydC9QBzRBzh4PBJcB5TYaKAZcDLRtZUZhRdInerDXLBoluZyel0QCvmiUzlGT8Cr2zINsRRZQPPO2EqdHEGHaHXU3AUB1928LilzQhcgS3ebidrwJ6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718023048; c=relaxed/simple;
	bh=7fh1+jZ8+JbfuJZ5BEsffSawRdRiRZfDUkVB2e71K7g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LJA3SKmwabKFtYTgaE8mV3JVyPHQQ1N1wipXE/vNTzezbwEykNrSj5rkowcyq5hw7aBpKzMxjnXwBDAVRfv+xsLuRmSmGpXMPk3BxA2lcluHITvfZVskZdyJ+qQKoEDo9H+n73b58tKjEHsNT8Pr6Ax/l/c9j9mkA3sCZYDcOfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/STby5+; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/STby5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718023047; x=1749559047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fh1+jZ8+JbfuJZ5BEsffSawRdRiRZfDUkVB2e71K7g=;
  b=l/STby5+7HtTgzRhvqDpyd5876AwVPzVoRY1nOdL+BHPuby+ELMvAhCV
   15rwFrozlYUhpxnJ0vXZATRof2luBYvzxph7vgaDOa0f7baDrclXYe/me
   k25yg94tlujfowJrNvjG/nmC2D2cO/X2xRJdsSJ98yW+yHgE76/LNxZ+O
   mP8qyhdVN1+LQuPs3z3WuzSxIIs9uoVVnPK+sFWMfuxC4yRVrWbbsBX6f
   /LQr1h02HbE+WffmTa5gjylh33kR6WFx1kNrGBPY54YunNan3WNSDI+70
   fIXYi9hHyN0l5waMO9ZnOaNURZhGiQ24Q6QjGnDWQ/x5WIJVsTFVvrQ7h
   Q==;
X-CSE-ConnectionGUID: ZlKT10GXRwmz0Fei+Be6aw==
X-CSE-MsgGUID: HbReSTxMQXqwPM6LH8hnLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26091993"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="26091993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 05:37:26 -0700
X-CSE-ConnectionGUID: PWFAt6vVShe0r5+otDCHJA==
X-CSE-MsgGUID: gZcv5iB9Ro6GgxyIM/mXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43488796"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jun 2024 05:37:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 05:37:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 05:37:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 05:37:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 05:37:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBdTLq1muts3J86knybf01zsELByYs67TLKHajCbqu0uVIWpFJVICls2GvOHZ4gTFtxtwlKCXRXcC9eZzNmaPC+GPPPjAJCWeCiHXl3vBKb+E5dTPRa9o5A19b9qHiNhvM0gbAfItfgTHA2jDL2u7LvfTd6WEu+zbYRymwDVIhWZyn8inqKzDVhd7DREp7Ix6RaqqpXunQJetgLa3FilPWqknCI0OrjLd/k1ci59MR/BlmJtRAOhJQ39MoBoN7lggljkt7zjjBACB3tlKHthCwQbyENX3EvrEod3DUEK+GpbTehrNPiMn8CB5Wyn3Vz/EiFPsqa+9FFWSw4AJSpfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m/MLVluWXxLUvEpRepc0zaq7lEDv0u+W4j9CaU3geQ=;
 b=b54YcMxmPo40feo1M1KfxFOxgLpeVmi/nqzNBAImIg+4S2yd4m7GrA/L1dOd0eQZggvgmQ860Ao3p2SkjoQDt8pljwxMtpwPSkVaHubRYZlLIptiFxcLUFHUqR2TxjZ+mtDKLInDHq0QuCjRuYF4T352CPoCqyrEPJOFFZROyUm7DCoXB8W2XHrEJ9bWwjCNavulesj3BejLPFIM7Oh90IDCQzY2bV/8Kxmx0xnSYRJUtWjxw/p3wniJ5xpqXToNB2SXAO2xIzKdsZVLDdUNlulhnnUMhCGnY88Z9wSYRFNSm5KqOdXvlFMo3q+5VaEKn1y1wTTkeWiTqVhJIYaqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:37:22 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 12:37:22 +0000
Date: Mon, 10 Jun 2024 20:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip 3959/9999]
 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <Zmbze9xAcOfCKPEx@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c00a16-b9ae-4a76-bbe5-08dc894a12f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D3Cgl/Iq842Pa5ODIarn9c1VRnepHfTHZ++tyU6bU9b6eDqGrCxPxfoJT6H1?=
 =?us-ascii?Q?wClpwbMKV7ispIy0U+m0SO4pFwEy9pLjswg5SomV0yWTpcwxY++ayBCQpV45?=
 =?us-ascii?Q?7xjU9yNFNGE58vKkvj84qse+4uxsotU5vE9uoJfIomrgbApEE40PKEodtPGp?=
 =?us-ascii?Q?w08r2dYk7wEEkvDgL/VtZSPsBVo0K0V+ope+pOuGXrPpjkpa4iYhI4q9ocK0?=
 =?us-ascii?Q?qmXZK2OJ84q+zShgMsu8zKZEXd8WD14VZbjxbtKnRsaVoIV3G4BZJbaQS/jF?=
 =?us-ascii?Q?sLCGOZCJjlhawogiNd8gCDpJa3LO5uJDHnBPr15oG5A/r38tk3RTF4Z5sBLF?=
 =?us-ascii?Q?JPFdyy157yAhkQnoWbBtlNRG2734Wzw1b5FbzBGkpX2EAWJAencEZ8sN0A8B?=
 =?us-ascii?Q?/eslKb3gsuPhr58uu1uAqJcSIL1eeRS8AS/nFev5pf5A91pTSPXaoDjtDfkY?=
 =?us-ascii?Q?u0c5504Zqab3GowFlrM8T06s2W+tibqO6TlQZGz4LxeoFaeOcKZB0Qw3JqS1?=
 =?us-ascii?Q?pTMvlkkMJ9ZZ6aR7YW7opX2qryDgv4UujEQ/qNr+azJtGIWe1JSAg6amAcHq?=
 =?us-ascii?Q?HCTNwO0RcY2rb6OwOqqR8roEhxcMzVCxG23wqk7CgP0XDEGLSHTK+A0LqjcU?=
 =?us-ascii?Q?DZTRfGLYJ00bAVTnLcHIt7Kvvlf/2Xh3UwhFbe0YHEw9MV4UyN6q8mQiv2rI?=
 =?us-ascii?Q?vtnDsQ+yOm23hIQegk+4pbU5WC0YQLL1EiKlpvggb7LgyxTCxtyupnvPG97K?=
 =?us-ascii?Q?a2nDpbmn9CPYEx468MZSwWu7pUY2MHTU8Vc5SxAahXn1xGgp3IlH9+Ape2RZ?=
 =?us-ascii?Q?pGez6Rv2qMTRQr4S+l0iBrhS18zVUWbbjq9H1+kIg0dv7YiOuXc6iItGiIO7?=
 =?us-ascii?Q?uAZ4yFEsi4VTc5emGHM/E9t9IBlGpK8XkRxkDTGmupQaPScQ5nG6TRqNmU3E?=
 =?us-ascii?Q?LqeGoyGm9Ma3tv1cTZxzAzdTORB8OIpRnd1vJpRNMzBQ3rKZDiMgWLLkgibE?=
 =?us-ascii?Q?1KosQ8xc2NvF8sbWHZN2F4YMdYNp6VU1Hoa0v1o22hB9ySXIth61/cGE77vg?=
 =?us-ascii?Q?J8bmKETbw7uDNRU0GldyVp3yOgZ7rGKoOSzh2cjSwHl8cK9PR5hPrvUiqP+B?=
 =?us-ascii?Q?Dd1PIuQjX6jsoIsSNEWJpNT730emuFgmi6NTHHQu4JADz1J0AV8szlPPz+H7?=
 =?us-ascii?Q?+X4Cy6EM42iXC5u2fxa9RiCZJW7hlcCwEmgKBcRvikUqn8Tv86LAj8vxZgp2?=
 =?us-ascii?Q?SRT3NVi9c+kuddrD+djdIWJCO4SVxN0UmGDIZOnzPnfli2+RLQN8K3L+L8xa?=
 =?us-ascii?Q?z1XXDkFeVz/Su1mJRmN0JS7N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8RpJ1YhPmDix5Z6GaklQ3DS7wajUcRsrL8r17+PY77W5W//Hy1XDXpMZoB5n?=
 =?us-ascii?Q?SVQmCG8oeRTRY9meUWa961M72istRf5YlukSaLMOmFUhH8Wx1m2TMOGWzCBN?=
 =?us-ascii?Q?I3pAnVRPh85RcSExUSYo3zeH8eKoVUANHz2aSUKEMaPn4Ql85RAwY5SbdkuL?=
 =?us-ascii?Q?j/n2arg/aAhiuv6dGYbwxUO1xqDetMHcgTwOgXbQ7xmlgd5hmCYDb+Tv4mGJ?=
 =?us-ascii?Q?yXl+xT+7vgwiyUc3PcT9IuTMSQZYuj/CR6ulJMvGrBoG+ThIido1AumEopVF?=
 =?us-ascii?Q?ff8luYcu+7kYD1X5noLHiaXgNcTdm3EhL3b1xiaaYH7sPAXF/QZzxs2US+ID?=
 =?us-ascii?Q?ELHi0ASDiMxOrAyh205Yt9DapPxoT8TbvS5VlVWL+WAbeBfW7vdvaC/7+R1n?=
 =?us-ascii?Q?pXljIAwhc41nyXev4FkICVjM7VhocWAq5GmKQF/pej/pI28QhRfrjTdRsQa3?=
 =?us-ascii?Q?4rwXHNM30e3Nr24S3lMhibsM5wIZIvrQlZ7Tq7KIVSJMgwdWnDww/9gVU2se?=
 =?us-ascii?Q?D0bYOINpr8NLQ80y/X0wp3Z8VfXstZfZjXHRkLpUuOgT3+oKIeqUI1qsF7PR?=
 =?us-ascii?Q?CSGHxPX1TmDoR6TJlTzZsvxZJKIeVexIC4xRkt+VQDYnCfY3vzWFdg63Mmps?=
 =?us-ascii?Q?DeiTZM6tMvM/4I1xj6ma2w3KqLvKeqIpJUfdsaEVSUxQejCXdgkJ3ttyeZ3P?=
 =?us-ascii?Q?jQzfQx9OyQIcyhKvlNRxebCdesksW5ixH7Vp5E9H4ifgF1cV2YEQTYlszPNf?=
 =?us-ascii?Q?ULRjZqjHLElbJzEeBGLFkhhB3bhKcvkEw3oXf7uFUDImovd1VL9SrWkFL+sb?=
 =?us-ascii?Q?rveWrYHsIWiGGh816sADrTmj5QJ19gV4Z2R1FIGZoOEcGL5+BBnLgP4hk3sU?=
 =?us-ascii?Q?HLkV9jRXOLpY3JigssHmp1GErjBTlqiZ9tPOvdiXYY5OQrOMVxJUx8pRJ0XD?=
 =?us-ascii?Q?rExtx8ibbBd3D7g+6GxRzmPYkOu2tbY4ei/KdAfeQEhcSMnJAm4siDLdwrXd?=
 =?us-ascii?Q?LXmh2/FHx50nNL26KVSSYkVyj2E7fEXL5L2cdkFmM5BvCSHyjnNAOhJiC4mJ?=
 =?us-ascii?Q?WdXOuWRWvn0j/JGQxBnhaGKhbj9NPEkSlfbX82JQUsPLF8RcSUdxHSRZUaH4?=
 =?us-ascii?Q?/v+u3YcasYM8luJc9Jj/Vqeu7Gdf0Ey4QGBmWUNv52rxCZuMoENzH5ch+MQJ?=
 =?us-ascii?Q?CV+RrjqClJmjCWDjEHNcpNn0nOpVMvS0qmdPm/tpD3p5DEc5e3F2HJMJAf80?=
 =?us-ascii?Q?sHmigBYfnMuCcFSfS9EN44sA0VAFmW0l/nR/EIGIBmviYS2DPL6LFdlXVYS3?=
 =?us-ascii?Q?eXFBjnqb4RqDByzIKx1mmJk3DAGUI00Ldu64x2mOi15cM7qiuL57Ukwo7TC6?=
 =?us-ascii?Q?UxsmISluXEfc7otEJlwLibC5rAEfBj1NmN17aP1hZfgWEHpRa4mO+cozok7i?=
 =?us-ascii?Q?C+vusocY51HYbUCixSAcXcVderSeYpHHD+H0w+ve+Yx3+/cLQor4tlO8DfsZ?=
 =?us-ascii?Q?tINuF5IoROihF31iG3/9D7g2VTiknPNZ85dQ2hRRE/GLrYb+uBqG7fT2OLT+?=
 =?us-ascii?Q?YZb4weD7lwTbpIsu3LupOQ6PW6DtZQS4eq+Owt72qTIhDgv8KFbQsVAgegld?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c00a16-b9ae-4a76-bbe5-08dc894a12f4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 12:37:22.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdKYORVZ4plwWJKIka2DUeNS7tiamgQSCF3IrkjpM2DDXXnA84QpSXcckfyVuvaDWwlGShK78cVDiZKkmmnedA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: b99c0f465b6398b36ed3bef6fac8ad2078cd3bfc [3959/9999] arm64: dts: renesas: r8a774a1: Add PCIe EP nodes
:::::: branch date: 4 days ago
:::::: commit date: 3 years, 7 months ago
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101948.25usuOkE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101948.25usuOkE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406101948.25usuOkE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

