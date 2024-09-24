Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90698155325
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169152; cv=fail; b=hbkfeNkeNtaZBz2thQ+jCCzGRDzQVT8QT+/CAHxIwflA/YMcTKPxLPjF0yG2Yz7o58b12ODV6GVz0anbL0GQilQBm35PoaStDIdC2c7GVC4jmPS0zbrcTl4lZX235yv8eAizB237IsjO6PQj6LHaUqL5R0EV4/K6z2U2Ddi9HpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169152; c=relaxed/simple;
	bh=Ws08UadOzTfQp9/8z7O5FGa3qESrvyNYq2qsMKcSBBQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lXmVzRRyI+wPCFBHUf3VQFpgci4osaftKGHvRgbR/RatFBt8szIzhlbpFsmqvxKiWnDw/1fcNVI0HSEx9fCCsuQWsoRc93pfdogDgvtBeISoCZRPbn9417uQixdQ1ULtFagqUdA1B7KPb+dZg6niJ154Ps0EarA+7W9nyqDjVec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXiKY+5N; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXiKY+5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727169151; x=1758705151;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Ws08UadOzTfQp9/8z7O5FGa3qESrvyNYq2qsMKcSBBQ=;
  b=lXiKY+5N1jTGXB16ypGbHPpwCM4yHOCZzxqLTB3jlsvre7/46DQ9zYDo
   KqzvG2VOqJefUQken+8isIaoMQFcvrRS0Cm0Gzbu3cVTi6HBzKbtZP6WM
   g8q7UEsoZ4mumB8n1Pkj486zX3ni3EjB2mj7qZWcfFpnazYsHs43MoR+M
   49gfclKS/bcCFe/fQ1+FRK/kOPE1WFkzQGWmyQ4Ao4jv1/APGPHl1ohQg
   skUNxIPzRCSYseSZF5Z1JRKC5EGMdy8Lu+5apW5YhASaYasDAG2y2HMkz
   CQ1S1dC3Hdgcd/X/y0IOvb1ULiWWjmoiI5Xz7TjBuXHwGh9HuPk6rA2sf
   A==;
X-CSE-ConnectionGUID: 7TS8mvCHRqKjz7UBhSUVjw==
X-CSE-MsgGUID: i728TZ1zQLKECaQuu1hmqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43670400"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="43670400"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 02:12:30 -0700
X-CSE-ConnectionGUID: UvqL2xmMTYyrkmhINLi0pQ==
X-CSE-MsgGUID: Zd0d0/LzQJCooKZHRpqxFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71409250"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Sep 2024 02:12:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 02:12:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 02:12:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 02:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qz0LSWt4Y+GzQrPvt3zkjjgyR1z/VZv2S8Dq6iJBfhaC9fX0uQvrOide+86aJFeUATUmz6NjyO+mLCrZO5GgYzhRSril35Elr0Yzm9NARgb2XDPIBXHBsZ5qQusykINlNTH/X8wpYG/moZM4Tiehc6eFaYD2NFf1pIVjx7CiaLt7AwUHfTBlUdynyVwSYdt9wVnbbKzelF+Y+VXZY6kwMIGtdybpONbJmUAn1vUsuCm7KLWUGnx6mTdw71cHshbQZTb8JUtVU1GesF1ytqpcozOGBmSx8wtQCgPVOOS03uEmv4KlYytC9DkSK3fb8voSBQWsRI6HKrrdgxiuPX58NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbCs+wm+6C4YuXOf5L/CtwFWA1eiqWzYlOVBhx5tM9Y=;
 b=DSy3NqZSmwA7m16miaWRJ9m4QIWWUX2jUhPHzvbgaj0pzJGfF2U5HGayHMajOojR4zMVOFBNqOT/XO63j8coDozwDXNK7BOirOCcCaCk5zCIiwVx/bRQZ++iJNBiBnY4PUpzjY3gUFxwTaNLzkUhVA3y/RwJjWgwsJd/ks8V2ic105ciurPr8vCyq11ogyp/0CLvSlGvJP2OhMCBAWJgRV8z+00KheUOiG/ZcREyZz25l3l0YoYmGok4e5z7nP5F228AEt+Rpmh7lMTc5mSa/X3/gb6uQMpjUNfoezRBoOQcyoUSbNCrmbIdtBKSDrk6SmWUR4AqfkyXXwJcHZsv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB6980.namprd11.prod.outlook.com (2603:10b6:510:208::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 09:12:20 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 09:12:20 +0000
Date: Tue, 24 Sep 2024 17:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [frank-w-bpi-r2-4.14:6.11-rc 27/59]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:34.9-36.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <ZvKCbhplorV85Aqs@rli9-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 779c7854-0e0d-4c2e-2205-08dcdc78fe86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlFvSTBTMmRwQmg3QThPajUwZXRoNDJXbFJUM1pEcEg5eHJGT0tuR1VoZHlQ?=
 =?utf-8?B?Q1YyK2ExQXY0Zm82N0pMMWtKekRiemNQYzVpVk5NOVZEcjdvZml2WmFiVW10?=
 =?utf-8?B?bXNBa1BIdWFEcWN6OVh5cFNpQjVYSmFNWERvd0l5NEgrQlpyejZwS1o1Smg2?=
 =?utf-8?B?Wjgza21LVk5jM3ZJenAvb2g4QXErdE1jSWRmeFlwNnhZdjkybjFWVlJ0bVdl?=
 =?utf-8?B?eGc0UW9TWVl6c084UFJ3T041ZXhmVlFtZHVyTFFkYUx6NzRXN1ZmZGJoU056?=
 =?utf-8?B?K1M0ZnhybUZ6cGdjeEVPMk1HS0hYdlFmbmhHYWZyZTMyNStBMENPRGVlVEFu?=
 =?utf-8?B?d0RoME1WL1lmclNLeTJSMTZGNHVpNjZKVWU4VEsra2luaTFwaHBXUmFhMHBq?=
 =?utf-8?B?SzQ1ZHN2VFhCWFhRVTNiT1BEaVNYZUtJanRlaytQSmVZOFdNMXh6cnlvWUov?=
 =?utf-8?B?dGlnWE9aL3Zpc1ErVUJNM1hGTndXdUhZc2FDQzhmQy9QaDdKMEM1NW9hYkRQ?=
 =?utf-8?B?ck81aWFYNGVXdDBXVlNyTjY1RVFINHpoVldKWFNISklYVHJBZVdUZ0ZZMXFv?=
 =?utf-8?B?MEVnZ1NEMzBtd0NINkhCWUJzc3ZXR2JzemVLL0dPWFRteno2SW5Gc1BvcXRW?=
 =?utf-8?B?bGY0REVLZ3VRMk5ReWwzQk5udWZHZEdUdW0raEp5V2VibnZZdGRNa3B1MjE3?=
 =?utf-8?B?UjZ2ODFwS1B6cWI0QXZKVWtkUTNyaVNLRGQzZHNDOUpxZ05tVThpYkNTeU14?=
 =?utf-8?B?eURJdXE0YVN3RHFuVHJ1L1krNXJHaWdvam14UXl5cmUzVk83VncvZWwrVWxZ?=
 =?utf-8?B?RkQzSEFFYUhUZFJ6KytYM1BEQmpEclpHdzkyMkJ2MUQ1OGdBV0hTakVIUVU2?=
 =?utf-8?B?ZEQ3QnJpRHZlTFNtY1BHWER0L1d1OTl5bzZrU0crNEU0L0lQdWMyQlFJc3FU?=
 =?utf-8?B?bVNWaitFcVhTS2JEa1NhS2oyNjdtcnBYaDhYbllTU0hRMVlMYnBtS3NHenVs?=
 =?utf-8?B?UnN6VzRHaUQySGNRdVJrUEN1TXNRMEF3WXJvSTE1SklSVmhnV0RYY01WbFkx?=
 =?utf-8?B?Mmg3blcrSzh3Nk9TK2t4c2RFOERJb1FYckprYnlrRGlsVzRpdG5DNDk4Ynk0?=
 =?utf-8?B?b3BJMW1lazd5OEd6MjZTYVpiOExlQUQ4OEhuOTBIdkd0Z0lvWGcyTG9rdEJs?=
 =?utf-8?B?L1ZJa0RvajNpWG9PWkdHWDZ4MVZ2Sk54OE1vcjZRdFN0aUhFZFUyblk3dmIv?=
 =?utf-8?B?TCt3MmRIbEFwWVJKM3ZwNFBEd2ptUEJ3UWNkWkE1OXZpcXlpbmk4OWNxUlZK?=
 =?utf-8?B?OU9aYUpsSjkwYVFEdGlVeEJ5SlZ6c2VFU1ZTMUNMTjZsTFJuWUkzVXN6amUv?=
 =?utf-8?B?L1A3YWpYWjluci9sa21HTm1VbzZqRzhGSGRXakFHS0JEc0o5ZXUzMXJUVDZC?=
 =?utf-8?B?NU5JZ0VCd0VsYlpIWGNCVEM3d3dJd1hKbFB3aTBnZitZeUpock5rZ3BJYmFm?=
 =?utf-8?B?cW5EK1dyYUZDZFZvWUR2MndDNzcvaEVXSXgzRDhkM3pNaUlFRXlaWEROVlhH?=
 =?utf-8?B?dkxpNzE1Z3VZRHJ3ZnpuSllnZm41c1RFS2ZDRG9BRWFORW9aTVNsZUZvelMv?=
 =?utf-8?B?K0hoN1h5Q1c3ejlUYlBsVGhoWmIzQmV5bHNxdjBBVTBjLzQwQ3JkLzFMc2ZE?=
 =?utf-8?B?aWtYV1lNMnBHVmxxRUZ5OEEwRXozYlhnd0xWZ2tJUExQdTB2ODFJajZKUlk3?=
 =?utf-8?Q?2wGDNpNGd8kkfoyj2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVYQ2NWdUljZXU3cWJReTAxMGQ5aXpYQzRNdkVxZ2JucDI2anIvL20wZGRY?=
 =?utf-8?B?amNpM3pCMm9WemVFQTRyVEs0cVZqNERTbktPVzkyTURkUEp4Zy9JcHM3OGZI?=
 =?utf-8?B?RnhIRnV1Wi9mck04TzgwRXZnaVpJZ255R3VtcWtUeGZJSS8vK1ZQakQvQUJZ?=
 =?utf-8?B?amhUQVVFMWNudW1KSWlMZ3lta0QvK2kyaFErTGRPV3h3OHlXQUM0anlKbWhQ?=
 =?utf-8?B?T3hidVBBa0phazJOWTB0Z202RG53Ry8xWWlGMUlDSkJSOW5NSFF3OHZ3K0d6?=
 =?utf-8?B?TUNvUUtLVEFqeGJzQzRpdHpqSndhVVBnTURhVWk1dm0xTnVrWlh3YmRVYi9s?=
 =?utf-8?B?VjA0c21UVzVZeWRzM2JiOUVuVDlNdmJLd0JCZHZhQUMvTkxhck9KRXd1cVNx?=
 =?utf-8?B?QmQ0czZxUWtiSlR6RWpsWU8wWG5vYWlMZlRuSmxwdEpSbDFYOEVGNjNHVW9P?=
 =?utf-8?B?WnhDN1MzSVVLRDRtdmpodVlnRTlzMHh3MkxMYzNUT1I3cUNwVklQaDh1eVhE?=
 =?utf-8?B?Z1Rtd0RVMU53RzhQZ2pIZUtvcnJnMWM0RUlSRDExSnhwL0RMcytVTXdRWm52?=
 =?utf-8?B?cVluZHE5MFhudjN2Nk9RbkpQcVRLYW5meEFGNFZwejMwUUtUakVWa0lkbzdk?=
 =?utf-8?B?blpzOXh3My9iRm03eWVhR2lBQmZlVUxtUHM4WUdIdDRGNy9NWlhmNStHamVs?=
 =?utf-8?B?aGxIR2NOQjFnV09aZzJsb05PQ2w1Y25NL2pWc0RKL1NGSnc4NDIzMHVOWlNJ?=
 =?utf-8?B?blZqKzJVQ3l0bGJTNXBrTE4rbEUvY24waVlSUGl3SUxMV09Kd1BQKzc0bzB0?=
 =?utf-8?B?NmVnbS9zNjFZNGYrcnJuYmRtSURTVHRpbDhHay90UUFKYmlMckc4UDVRQmFu?=
 =?utf-8?B?eWJVczBQZnZkbjFNZUdBNTZ5a0ZvQXFiMGErNHZmZmxtNWlYQmRPdERQMUZY?=
 =?utf-8?B?dGFiZVBTNHpQVnRQTThmY2FieWczc3J4bGpabGtJSmhXQ0wzNURyNGVaeTY2?=
 =?utf-8?B?VytPemFUb2g3WHQ4YU1hNkNXV3ZJb0dTY0RDdjJUVzArU0FnbHQvNk95Z0RT?=
 =?utf-8?B?N1BJNDlVY3lrZUk2SVJKS25IdWs0bmZpK1VUSDl5U05zVk5DV1FwODNLb0NF?=
 =?utf-8?B?TE5ldDJNaVMxY0VzSlZ1UE5sYmVDWXdaMmpBNDNtQzhoRm1Hc05hcVFoYVBR?=
 =?utf-8?B?N2YrTzVLcFpiNm5EWVRHREtMRFF6M3pYc0g4SWZCUTJBY2Q0cUxqY2Znd1k3?=
 =?utf-8?B?WUlhSE55WW5MSmZoYXYyNmh2Nnc1WkhVcFhXYUdsZFI3MW44RkhveG1uR3Zn?=
 =?utf-8?B?RTJBdWhDY2J3Y2ZlZEhXamRMYXhBdnhaYlh3Q3lDcWtDcDRteHZudk04UmRU?=
 =?utf-8?B?eDNtWVFyZjh5TlU4UGtVZ0JoRnIweXZBa2lNSVU2QjA2N2RwUlFvV1FFL3hx?=
 =?utf-8?B?bEtDZUxsZVNmRzQzek9INmZRbWJPNW1kNTlSbGltb24xeUozN3Y3K1d0SlF0?=
 =?utf-8?B?RG84M3lrUGtmbWUyakQwUDlyclZzMXNIZEdyV1Q0cE5IczBKVitEQno5Q0pZ?=
 =?utf-8?B?V1BzMnJ2Vi83Q2ZsanhUakZiSlpUZ005Tzl2REUya1NVZUlvRzExVFZQWXpW?=
 =?utf-8?B?ejQrK2hqT0U4TklWRkVKclk5V0ZDbFBXKzNId0NTaEhiOUxBK3RFNGNkODQx?=
 =?utf-8?B?b3Q4blAvaDNnNHNyMHBqbHRtbmxjSTBZQkViRUdYa1BDWkJMTkhHRjhkTG5w?=
 =?utf-8?B?dUI0SS9paGlIWUp0L1JuclhqcFN1bkpPa3lFbmVsNlYvZnZzb3BneUUrVGFL?=
 =?utf-8?B?Um9ZdVYyVURlOWF1YjltcUprbHE2OVp4emtmc3dxUkJhSGhZbG5mU3AwWlYw?=
 =?utf-8?B?Nk9uVDNzeXFkQnhsZXFEYlcrclFnMWlEUm1GYi9qQUZaNEp0U0hUWEhpL1E5?=
 =?utf-8?B?a05WNFhPc24rdW1zc2hhbkdSUWVoZU00NEFDV01vUFlEUThNNTVaL0tQWlNF?=
 =?utf-8?B?TnVHdld4Y050M2p5REJzN1NOTzNnUml1eTRwNE5GdkM5SG92Q2tqYlpWT2dj?=
 =?utf-8?B?ZjNrTjRIMDNGNVBDVGpOQkJXZFloWjZKcUNscGdrZGhKTndaVTREOUR6OU1y?=
 =?utf-8?Q?DFsOypA2OUkxK1ucRcQs2nOOd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 779c7854-0e0d-4c2e-2205-08dcdc78fe86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 09:12:20.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tcc5B2qcGkfBaD0LLymKE9GPbcClAHW+0gOGbJAT8mF99oFqfX03x7q0468U6/MmSgrvrGlFvlTXIfS6SYo0CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6980
X-OriginatorOrg: intel.com

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   7ee01d7990ff12909d54321c2048d6e24e781855
commit: 40eb7fbb305626c704ae7893d5297903fc5297c6 [27/59] WIP: add BPi-R4
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-003-20240924 (https://download.01.org/0day-ci/archive/20240924/202409240632.AGvyErnY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240632.AGvyErnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409240632.AGvyErnY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:34.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +34 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

6c1d134a103f68 Rafał Miłecki 2024-01-08  11  
6c1d134a103f68 Rafał Miłecki 2024-01-08  12  / {
6c1d134a103f68 Rafał Miłecki 2024-01-08  13  	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
6c1d134a103f68 Rafał Miłecki 2024-01-08  14  	model = "Banana Pi BPI-R4";
6c1d134a103f68 Rafał Miłecki 2024-01-08  15  	chassis-type = "embedded";
40eb7fbb305626 Daniel Golle  2023-07-26  16  
40eb7fbb305626 Daniel Golle  2023-07-26  17  	aliases {
40eb7fbb305626 Daniel Golle  2023-07-26  18  		ethernet0 = &gmac0;
40eb7fbb305626 Daniel Golle  2023-07-26  19  		ethernet1 = &gmac1;
40eb7fbb305626 Daniel Golle  2023-07-26  20  		ethernet2 = &gmac2;
40eb7fbb305626 Daniel Golle  2023-07-26  21  		serial0 = &uart0;
40eb7fbb305626 Daniel Golle  2023-07-26  22  		led-boot = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  23  		led-failsafe = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  24  		led-running = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  25  		led-upgrade = &led_green;
40eb7fbb305626 Daniel Golle  2023-07-26  26  	};
40eb7fbb305626 Daniel Golle  2023-07-26  27  
40eb7fbb305626 Daniel Golle  2023-07-26  28  	chosen {
40eb7fbb305626 Daniel Golle  2023-07-26  29  		stdout-path = &uart0;
40eb7fbb305626 Daniel Golle  2023-07-26  30  		bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf ubi.block=0,fit root=/dev/fit0";
40eb7fbb305626 Daniel Golle  2023-07-26  31  		rootdisk-spim-nand = <&ubi_rootfs>;
40eb7fbb305626 Daniel Golle  2023-07-26  32  	};
40eb7fbb305626 Daniel Golle  2023-07-26  33  
40eb7fbb305626 Daniel Golle  2023-07-26 @34  	memory {
40eb7fbb305626 Daniel Golle  2023-07-26  35  		reg = <0x00 0x40000000 0x00 0x10000000>;
40eb7fbb305626 Daniel Golle  2023-07-26  36  	};
40eb7fbb305626 Daniel Golle  2023-07-26  37  
40eb7fbb305626 Daniel Golle  2023-07-26  38  	/* SFP1 cage (WAN) */
40eb7fbb305626 Daniel Golle  2023-07-26  39  	sfp1: sfp1 {
40eb7fbb305626 Daniel Golle  2023-07-26  40  		compatible = "sff,sfp";
40eb7fbb305626 Daniel Golle  2023-07-26  41  		i2c-bus = <&i2c_sfp1>;
40eb7fbb305626 Daniel Golle  2023-07-26  42  		los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  43  		mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  44  		tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  45  		tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  46  		rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  47  		maximum-power-milliwatt = <3000>;
40eb7fbb305626 Daniel Golle  2023-07-26  48  	};
40eb7fbb305626 Daniel Golle  2023-07-26  49  
40eb7fbb305626 Daniel Golle  2023-07-26  50  	/* SFP2 cage (LAN) */
40eb7fbb305626 Daniel Golle  2023-07-26  51  	sfp2: sfp2 {
40eb7fbb305626 Daniel Golle  2023-07-26  52  		compatible = "sff,sfp";
40eb7fbb305626 Daniel Golle  2023-07-26  53  		i2c-bus = <&i2c_sfp2>;
40eb7fbb305626 Daniel Golle  2023-07-26  54  		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  55  		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  56  		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  57  		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  58  		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  59  		maximum-power-milliwatt = <3000>;
40eb7fbb305626 Daniel Golle  2023-07-26  60  	};
40eb7fbb305626 Daniel Golle  2023-07-26  61  
40eb7fbb305626 Daniel Golle  2023-07-26  62  	gpio-keys {
40eb7fbb305626 Daniel Golle  2023-07-26  63  		compatible = "gpio-keys";
40eb7fbb305626 Daniel Golle  2023-07-26  64  
40eb7fbb305626 Daniel Golle  2023-07-26  65  		wps {
40eb7fbb305626 Daniel Golle  2023-07-26  66  			label = "WPS";
40eb7fbb305626 Daniel Golle  2023-07-26  67  			linux,code = <KEY_RESTART>;
40eb7fbb305626 Daniel Golle  2023-07-26  68  			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
40eb7fbb305626 Daniel Golle  2023-07-26  69  		};
40eb7fbb305626 Daniel Golle  2023-07-26  70  	};
40eb7fbb305626 Daniel Golle  2023-07-26  71  
40eb7fbb305626 Daniel Golle  2023-07-26  72  	gpio-leds {
40eb7fbb305626 Daniel Golle  2023-07-26  73  		compatible = "gpio-leds";
40eb7fbb305626 Daniel Golle  2023-07-26  74  
40eb7fbb305626 Daniel Golle  2023-07-26  75  		led_green: led-green {
40eb7fbb305626 Daniel Golle  2023-07-26  76  			function = LED_FUNCTION_STATUS;
40eb7fbb305626 Daniel Golle  2023-07-26  77  			color = <LED_COLOR_ID_GREEN>;
40eb7fbb305626 Daniel Golle  2023-07-26  78  			gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  79  			default-state = "on";
40eb7fbb305626 Daniel Golle  2023-07-26  80  		};
40eb7fbb305626 Daniel Golle  2023-07-26  81  
40eb7fbb305626 Daniel Golle  2023-07-26  82  		led_blue: led-blue {
40eb7fbb305626 Daniel Golle  2023-07-26  83  			function = LED_FUNCTION_WPS;
40eb7fbb305626 Daniel Golle  2023-07-26  84  			color = <LED_COLOR_ID_BLUE>;
40eb7fbb305626 Daniel Golle  2023-07-26  85  			gpios = <&pio 63 GPIO_ACTIVE_HIGH>;
40eb7fbb305626 Daniel Golle  2023-07-26  86  			default-state = "off";
40eb7fbb305626 Daniel Golle  2023-07-26  87  		};
40eb7fbb305626 Daniel Golle  2023-07-26  88  	};
40eb7fbb305626 Daniel Golle  2023-07-26  89  };
40eb7fbb305626 Daniel Golle  2023-07-26  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

