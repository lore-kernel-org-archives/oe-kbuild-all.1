Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FABA27E054
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959259; cv=fail; b=ESaSThbSgD/piH7T7j73GBFP80ZRW3ACJIdZbgZRMrmOZaxO7r98+/IWGDT/jInE3px+u6mMvT4W3jepWB/zXw9lwCCHGQi4xixEdoFkSdkXJ7hr+2l+LKn82gIhiM2dYU1NJYkGl7dYJCJLS5RXTwqf03IIrGzfKapfOYVULEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959259; c=relaxed/simple;
	bh=beYpa/Die4XmBB2F5yCQYrE5pfmHH60BS4C88fq+SWc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kDrqPKFGmbzaXvLxAS7VK6PfO8eL4vxRmN6qPOOeDxWRu0HOOi3FhbCzzGH5lMZLdp9/bh5ADxk1b5BWA120iGTVLIJz5+YLODUVvGvPwt3MsD2R/1vddbhfKvFhllnWScQ+eIQeJSZ0oNQwNqZ00Lr4Ry+D2i2/e7Tm1Mz0CwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NFYYuwHn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sjRVwrzX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NFYYuwHn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sjRVwrzX"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OEMvf2351837;
	Tue, 24 Feb 2026 18:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Y53uHVxBpvMu0mO0u4Aq4WLKeWLmnsMqgZ2svS1pEE0=; b=
	NFYYuwHn9KSldHIsvbJWSMI1ZNhokTPm3/xturPk5kaDJLA269EW3lkpUU/Y0AQa
	LqbvJnTuMvCSLQlxbQsdz6Zs0xljcuUa5Y8QpCnImqH9Hl6S0jLIQXUe/3t63+LU
	WABdtWHIchxVSsATe0PlT5SI/YFTO6T4P6Ge7b7dVBLTlv3AmtrDIf4wWwEa3I0v
	tR5s1zqv8hJfHTqh/sfvbAKwvoFlksiEwjm+reIGW7flx7SH/HqonI7vhxgHwIXB
	NAxdORnSSWIw+ZAS73OnMiC0Tm3TyEnshav/RUT518ihSB2/J9sarhrC6t1DYlqe
	YBGOii43LYqnZly2HqpyvQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf4arcua8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 18:54:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61OHbQ67028929;
	Tue, 24 Feb 2026 18:54:14 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35a314x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 18:54:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeCdZS/ZueGJR4iImZT/SZodqvtr7SCm/IMuHmYQlgdpw3jJlehK9ic8pT4G90RypvzXPvppJptYjaO/8Y/YYHpveHUZNJ+mdUHr/v2aWVQPe5F6IcXXcBmpYEuGIuC0vJnBi7JAz241rpGTbKxChBK8/bOENygrhlm38Rn/s3NbSN/XAqW7K+wz1b0Z8a5yB15NiUOyRxMcz6YpbiyAy/dfcSNB+DW9D4c/A6RiBb8LVpewtCvFF8SwPp8DpWG/C/lK/w0Eay7K2I/C/9j2ZkpM5onCbDzUUKOsuHhlDE3SfI+5FghIJvRGK0B7H7LDagWso91MoPzUc3rko7Nx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y53uHVxBpvMu0mO0u4Aq4WLKeWLmnsMqgZ2svS1pEE0=;
 b=A52MrxM7hxQJWvlBjlqhP14GtxYQT+vID+crCVj+4TRT+ykWU9Y3shFkdsApNR3xgBS2iDWpOqnVTlc/6x4edr7s5U5k2wmH7iqD94ZUDk9TGis1wyAjGW5YiAja+BHY/5fq/kVwb4b70o9FmCTz0gzwMgDMFsVDdi2Zeo5yXGkewgncWxuTIAPJkiJtAD+ekJLCv6ING8NbvqWqD0iufykRhVZaZrVe5n7BbOI7X/BlsDzIigg2GyvkiKElcaZ9XKKJqCeo25j5g3+ZILddTjKgJnLeKNnvck5JPu/GSydf170kbZZO5eyNkN8RAEIb15vDzKX3efVgUT6iQNUu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y53uHVxBpvMu0mO0u4Aq4WLKeWLmnsMqgZ2svS1pEE0=;
 b=sjRVwrzXZeBpT363W90Bs7KVYfQMkTcxZpMyY8eUgU4NWOWSXlVXZgQMmo3urPFDHBYopmm76ThZ537d5IwzZMfEzIhGKCuk2raYRHE71ooJNBdYcaIBcJqKCxoM/V8V0fxfBphgupm+0Im1+0ECydM0aQrrc95uMyIOKTKBe48=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7730.namprd10.prod.outlook.com (2603:10b6:510:308::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:54:10 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 18:54:10 +0000
Message-ID: <de821329-d25a-41a2-99b0-382ff55f36b8@oracle.com>
Date: Tue, 24 Feb 2026 13:54:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [cel:nfsd-testing 29/69] ERROR: modpost: "__crypto_memneq"
 [fs/nfsd/nfsd.ko] undefined!
To: Benjamin Coddington <bcodding@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
References: <202602250104.IwFsHK6w-lkp@intel.com>
 <E960A26C-F3A8-438E-BD28-AB5C29FA4EC2@hammerspace.com>
 <2BB51201-EF40-4334-8D8E-30112099043E@hammerspace.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <2BB51201-EF40-4334-8D8E-30112099043E@hammerspace.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR11CA0016.namprd11.prod.outlook.com
 (2603:10b6:610:54::26) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH7PR10MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f25aa3-01b6-4fd3-df28-08de73d6186f
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Q1VBVUJ1MFdaNHVFTkt3TW52aWcvWGc5Nm1yODB3WlV2ZHpySWVUaFRjeTVj?=
 =?utf-8?B?UXFueWdoR3NnV3ROVmhBRmNrb25wVHo3WCs2MnJvM1hOdTdLdlN6V2pXNDlD?=
 =?utf-8?B?d21YV2ZWd3laT3RzZGltQktwajllME1CZW91Mnc3Z250blFHT3JDc1BGZmRO?=
 =?utf-8?B?bUtjc3Z4ejBCU1M1c0w4azI0T2pUalBtQVBBeUFYdWRJZ3RMWk5tK0lPZWFl?=
 =?utf-8?B?eVRRMVhWbTNxYmlkZk4yOGtOVlY3TWJteE9OOUlFanJYckhweURkdjY3NHBU?=
 =?utf-8?B?Y3krOTBDTlRFTG94SnNjQXUwa0dlaUNjTkN1dS9wR3FWS1lSVTIzd0E4eGJB?=
 =?utf-8?B?MXdmMXdVby9ZWWhnelFieUl2UmprNFRHWUwyaGR5dmYyQVNYRXYzdnRmZ3Jn?=
 =?utf-8?B?ZzNITWJpUFNUYkJjU0pqWTVBVkpIK2tvTUZhNk1vZWxzM29wR1VlZkNXTE9J?=
 =?utf-8?B?b2pRV05uL1ZuZGNra1I0WVNDMk9GU3RTOUwvTG1ybFBBdTgvakRWZGxJUnNV?=
 =?utf-8?B?OC90N00xYW5tVVZRalZIZTQzR1RFVUp4VUhZVk1aN29rdnBDVWl0V1pVSy9v?=
 =?utf-8?B?TkdITjBvc05KcGRkS20ybCs4eWI1Sk50N1Y5M3hId1YvZWlCalhkcDc4aUNy?=
 =?utf-8?B?a282eXV0bU80Q2ZFUFV5Nis0ODg1dEtPVEpoekdoMXBwc1Fuek1iSDIyN21h?=
 =?utf-8?B?d3NjYWJpYVhGQTZlMVhHY0lYdWdrN1IreStZYXVLZUtDVnJHdnZ0QzE1N2RG?=
 =?utf-8?B?ZGFla1E3Y2hkV21RRUZ5c0MyaHZkdktsN0tFNTArWnRobzJsUVRVK20xaDZS?=
 =?utf-8?B?eFNaUURITjBqZnJKVjRJdzRGNXplVytWWlNGdUR2amdvMTF3V3NTQkRLdTZy?=
 =?utf-8?B?UDB4UWZlL0hzOHdoaEJ5NHZLNGtudEMwTFBEK3A1T2ltMXFEUUlGQUZXendt?=
 =?utf-8?B?UE5oOGt3Y29HR3BxRzd1RHZmTkljVWl1WWQ5eC9ZUmd6UlZyT0QwYjB3bXlr?=
 =?utf-8?B?K1lHa3cwQ1A4TWpxeDdza1hSc3pXUnJhK0ozVmtZck1CQ0tIem5nM3R5QVFw?=
 =?utf-8?B?K21PSjBrZ1h6SzBuNTllenlNN2VDaEdXRUtyWGdDT1pRMy9CR1FORTE2N2sx?=
 =?utf-8?B?M0h1dHpPdHZYNVpoTUVCb01xMG11eUc0Qm9zckhLRnp4Zy9FYXR3bmlXTEJ2?=
 =?utf-8?B?VTdUcHNBQVlhU3NpcDc0TlkzRDNUVmU2a3dyZTlwNzg5MEdCSExwNWFUV3dq?=
 =?utf-8?B?Q0VUVUhBdGJLeFl6aHZ4R3NidUROZ0V4SjdyRGhRdC9tcXorVDhMSHRBTGFk?=
 =?utf-8?B?NmZPL0hYcTJpZVhhUDkrNC95ajI0RmxuSUZqTlJ6UWtpeGZZYzNDaVJVUzNI?=
 =?utf-8?B?cGJVZDFaWjBPdGlJRlA5Y2VzU0NLWUFGd1dFNVZCUzFvbFFtWG5Jdlk4WnNM?=
 =?utf-8?B?T1h2TWFIYmw3bTVmNEZ3d1VLMGZXV2VDZzBldHJwT2RLOTRtMU41UFQzT3cx?=
 =?utf-8?B?WDRzLzVlalB5Skd3MnhvTmZNVElHbGF6SmxxM2xBdGJnY1dUV2ZBdE1ZcjBt?=
 =?utf-8?B?bEJ2T3JHRUtTUEhHVkFSeUwwSzB3MTdkYWl5TTR2QTFLTW53ZWpxK2l4ZVVZ?=
 =?utf-8?B?aU1lRUlaaEV0dllPT3Y2aG1EUXVKTEV3SE1SbWhqUXY2RE1zVjFhVlRVSkF4?=
 =?utf-8?B?Z0p0TkE3WW5rRHZ3QTdoZEFrTy9SVTJxUSs3UXBTMHhMeUhSaEVkSFBTOHMw?=
 =?utf-8?B?Y2dlcEVMWXlqUVNlaTVQMEVRSUc2aEZpcFFUUHZxOE9XODdHZjdZYm5HdkJD?=
 =?utf-8?B?RGRGaGNuUy9NVHhTbVZyUmgvcWMySmxzSSt4VUh6aTNXK3V1U2hZUlQzSWEz?=
 =?utf-8?B?bWFSWjlqcEVDWitINnNrRzA2UGZvbDhydUZzNTlGV1puaUlWb0Z4aWw1cVZT?=
 =?utf-8?B?NHRmd0h6Ynk3c0ppY0UrdEYxYXJqVGNOUWZhZVJUT0ZvTHRqZ1JWcU9USThQ?=
 =?utf-8?B?dTE1NzA1bUxEWjFobVU5eVVSSXZndXZmNFhWOU9sL0JvSUw1d2hkNHF6cHVS?=
 =?utf-8?B?Vk4wekhvRFZZUGhHYWRqNHNjQWhOUGNoWUN3eEQzaVNHakhBL2dTdHdMczc3?=
 =?utf-8?Q?IenDG+X3mGayMd5znGnUCNoRq?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YU4vWXcwZ0J0WDdyQ1ZLRzBna0ZSZ1cyTE9uRXJvcHg1Si9ta094S0pzSXRy?=
 =?utf-8?B?MVJ0eGtlSGU4L0lJb0hPeThNMk5VNFV5S211TllVbDEyRlB5VE1LWCsrdGgr?=
 =?utf-8?B?M2R5SGNTMFgrNzh5MkUvSFlNTHB6a0lENHhMd1Z3Tk4wTmtWelUrSG1YUHVI?=
 =?utf-8?B?Q1ZTdXBqZDhPRkcvR0NReFZuclRJSkNrQmo2Uk9yS3NMTkYvWHdmRDRxeFN4?=
 =?utf-8?B?cGtjcTJldk83ZVppeXpkeDlrR2hIcTJ0NkVTY0RmVFE3QlVNTDJHay80eXlS?=
 =?utf-8?B?R0Q2V2VxVGNKU1E5TFJqRjZoK1B0MHlOOFl1dTAzdWJERm1VOXV5UFNVZERR?=
 =?utf-8?B?TWFuMVQ2anNNR21BY08yczRUc1JRaUI3UlB1bml2cGs3SkRqREZmajNQZkFV?=
 =?utf-8?B?OThlaEY0OU91MmE2T3lrV3dOaEdiNVgxSUtDRFE4UVJmQ3ZhVjM5YUs5aEh1?=
 =?utf-8?B?SGdWODNRbHJGdFFKcTlQTkgzZTI4ZjA3VHNnOGprMEVJYXhON2FnTGNMTjhY?=
 =?utf-8?B?OTJJK2RJS2t4MjRWeExhbndQUTAxRThXb1oyVlhpc3VmdWpSbmQvUjNjUTUy?=
 =?utf-8?B?N0hlTWppTldWaVkwZ2VYcVFRck9HMXZkUk9xUmhGa1UyMForR0VOdWRUYlo3?=
 =?utf-8?B?ZXRkdlNadDlRcDlyUzEzQ1hqbnZoUzlpUlRiVnozbk9hV3pncjZwb3QyUTRl?=
 =?utf-8?B?MlhHeFdVcDdUQUFKMjk5NDU1b1dGTzd0UGI1TjRheHU4VWR5Zm5manJROHRO?=
 =?utf-8?B?YW42citCR3gxVXgxL3pBdDVGbWFYZU1HRTUwaTRtQkhhTTUwaGZpRXNJWUMv?=
 =?utf-8?B?NUxyMVpXUHhKczNCZUw5cktYQ05HS3hZNFRHODlOMmVIcXZDZnRlRHlJanZL?=
 =?utf-8?B?MTNSM2kveFFHMmM1eWY4SmRUTWxRNlFBeG1aQWVIVDdsMjF0c1dBU3lBVmIr?=
 =?utf-8?B?alRFaDcxK2l4UHpVN3I0MDg0SzlIYzlGMDR1OUVXeWRNVVlxelU2bFE2Mzlw?=
 =?utf-8?B?M3VFdVQrLzVVUWJvR1BETXZOaWU0WUFUY3Z6dEcxUlJqQy9DQWZ3R3ZaclQ0?=
 =?utf-8?B?aG5SZE9HWGFyYnptTmpud0t0UFliZmJuYzJ1czQzWGUwUyswWmtoUmpjVTFJ?=
 =?utf-8?B?dVlVcW9yK1BZWDVBMU02dno5WVpLWWdxQWYxUmo2QmhvMG5ZU2xvb0R5MUFK?=
 =?utf-8?B?Zzh1RVkyVEhjSDB1ZUtoYlBEN2JKdThSMDlHWFBEWGZUaHpRSnkxamcremtW?=
 =?utf-8?B?NzQvU0J1V2MyZUlUeEN5SW1aWmpTdG44azNHa2RHK0pKYStQMjQwd1orQ2Fj?=
 =?utf-8?B?US9ZdG5sc2lpeDREc254WjhwcGdta2VoUDNhTFBwS2liaUY1bU1VcGdJWmZ0?=
 =?utf-8?B?dGs1YVZuNHVrSmdTTFV2dG1LZlJvTTZkcnRibncwSDhBbmI1SVpWRTI0aWdk?=
 =?utf-8?B?Vk9McmVJWjdHUW9RU0VQcmcxK0lJcXhWYjZEamY3NVdXd1QvL0R6d2Q3cXlD?=
 =?utf-8?B?a2ppMlhIaG93TUszcEdWRk9Zd0VBN2VQUFBjTnFwbFFEK3J3Tk14SERndExT?=
 =?utf-8?B?R0xrcFRCQmk2VTNKdEhHUUNtb0YvQ2pVcCtnVnc0emJidG1WTU9iN1EwUDJ5?=
 =?utf-8?B?QSsxVVNEVFFVd3FKRjFLWlM4OVlBMTlOUHBhQkV4WHJDYUVOMnNGM3IvL0R0?=
 =?utf-8?B?USt6WTl0Z2F3d0Z0K3cvK2RlUGtiYWZQcDNwdHZnNWNMVEl2ZndRTFVRNHU3?=
 =?utf-8?B?TkhOVUJZamFkUXY3a0J3TFNIVWpPN3JTVWFoVThqZzFUMm9Za3E2M05FMGlh?=
 =?utf-8?B?Y0k4VkFTVzVlZHdSWXJERjlCM2RpUWpJckN6RmJzQXBKYkMyd2x6K0tUUnJy?=
 =?utf-8?B?T2YyY2YveVZqa1pHNEw2SmZLcFpTeUdraFRHdUtkL3V6OTdCTlF3dCsrTUsw?=
 =?utf-8?B?ZzFXVVRWWjlQYWhwNHlMaXB6VitoT3hlMk5LMlgwT2RESG1jUy9MakUzampO?=
 =?utf-8?B?a3JhV1E1V0oybW5jZFJpNUowbWJycngvakU4ZkFoNnVhUzlNYXBOZUxiT1ho?=
 =?utf-8?B?UGZicElac04zRm1WWkV5Ryt1OTN4cEhBdTFoenA1U1FEMlRhL1RjczVpQ3FT?=
 =?utf-8?B?TEhuY1VicERoL3pRUFg0NGJOWUpuVjJtMm9uUDNDL3NkRFg5ci8xcFdhMG9D?=
 =?utf-8?B?QWRLT3R4RnBGcm1Jd3dxUVJ5M2ZqaFdSQ1FCRkpkN0gzSHVvUDNFcXdYSXYz?=
 =?utf-8?B?MDZuN1Rmc2JMeTVZV3QyWCtKelZwVnFWSVFXNy8vbWpaa1lWUFY0LzNlMzRh?=
 =?utf-8?B?VGRpQThPanFmcVFXTGlWR1d4dUlvbWlPTmdWYTllSlV4VGt6Qy9WQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QaVkAyVxE/YINw7RFYA6JWba526Tp/k7MRCPEz5Ov3S0CzJrhCHigv2jyR+SkG3dy4JtOlRcgOvtKKakf4i1lVDm03dDD63SuUyd2VTRPovLke8fLwYBkgoCuzBWUsX0Pb0qBXUi4pTazZZa+zcXiAEp5amwDEZreMoTk7bcrPe6F/BeAXFn6qx+ibDyj3GooHFb/P41VchsgDZ84LChoIfBoi5ZP7AnO4LsWMgNiXMWVelnHPXFPAwLecjnYlleIhvSDFM9qZmBPpbDDzGs4hOoGePxCO/t5URBEMoG6E/UcxwSNLy+oZKpJsEUinTMscrl7RMZaky0CzSiwb6K+h9H/zAk9tXVppl2PpXpkTPElVJhfzEgePD8Eqrn7xatDWjKldieh1Gs+TZO8/Tyucyqen78gGVcDtIJ8G1cwFFeW7SIewIJ8uvenHJWUmpD8i8ZsOoWpRWLGxlplh/ZGTDFNXhr3HfHcCXOBWWJNxf1bIt5Cz2Qew9U+DaQ/DtLXvEW2KDwHihuM+aI7NOTS3ouVkb4Pgwkw9nXl8VCMtyHuALKdbHkqZMLDqtQyaZoLCGVUnE+P/UHcqbieGRYdr0D799yRxdRED1JkhTCsD0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f25aa3-01b6-4fd3-df28-08de73d6186f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:54:10.4553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VXzjWVgv2N64vNB/0c0XjEGG06l6E0BDHc1GY+gOq/xHr1n5oInL8/DSk/xgC4Jc/k85ti5Sm0aUVdcDlb18g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7730
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602240161
X-Authority-Analysis: v=2.4 cv=La0xKzfi c=1 sm=1 tr=0 ts=699df3d7 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8 a=SsiewLjO6V8hze0O6UcA:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: cvsboJrOMx6NMaVNhK9y0T2d0xHsSGw1
X-Proofpoint-GUID: cvsboJrOMx6NMaVNhK9y0T2d0xHsSGw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE2MSBTYWx0ZWRfXwcZblngMJQJd
 YQgKTVV7+IalSauvzGQjC7BUyk3vf5C71SmiI9tU9OB2vS47MQERPoXtt+Th+0vytels7pHlOGl
 CeFvuZLOIsug3fw+l7wmw7ka4i/abf0PCU9x7DlZQCbGghxi7D6+wtVIHzLEm8oFSb2q1offOCA
 HbGfxhB1rzbGR6dGmsL3OG+Ht38katd++hAVS6kbYJyIwjRGAQtq1QAEaRkOJq9OrMhMIv1NgZH
 R2loHQBrILq60ihZoYdg7zcYf2A18xKIwGQ6bMsDm6y+rDw0y5idHf0WYcCSjO/sYVZzHMtbZWD
 YhALU95OHiLOG/T7PAuOrP19Nkhf0wZNL9lR7fsKtnNHt2met8+QghYdKn70Rtrpn9tiIh1BjkA
 glpBAXVprSA93k/3d7DfcugFwunwwr3dEEMnlNZyboJgiYDv1uopzdKgAaI0DWJqIL+RlZRWw3a
 enxKvZHlfATBYNSqLyQ==

On 2/24/26 12:45 PM, Benjamin Coddington wrote:
> On 24 Feb 2026, at 12:35, Benjamin Coddington wrote:
> 
>> On 24 Feb 2026, at 12:20, kernel test robot wrote:
>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
>>> head:   70a2007855af80c48aa0cc86ad2a1c50b907e37b
>>> commit: 35a0423a2954050da493296010d5c57e0d76f8bb [29/69] NFSD: Sign filehandles
>>> config: sh-landisk_defconfig (https://download.01.org/0day-ci/archive/20260225/202602250104.IwFsHK6w-lkp@intel.com/config)
>>> compiler: sh4-linux-gcc (GCC) 15.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250104.IwFsHK6w-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202602250104.IwFsHK6w-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>>>> ERROR: modpost: "__crypto_memneq" [fs/nfsd/nfsd.ko] undefined!
>>>
>>> -- 
>>> 0-DAY CI Kernel Test Service
>>> https://github.com/intel/lkp-tests/wiki
>>
>> Probably because:
>> # CONFIG_CRYPTO is not set
>>
>> .. which means CRYPTO_LIB_UTILS is not set, which would compile __crypto_memneq.
>>
>> Several parts of NFS won't work without crypto - should we just set up the Kconfig dependencies?
>>
>> Ben
> 
> This fixes it:
> 
> 
> diff --git a/fs/nfsd/Kconfig b/fs/nfsd/Kconfig
> index fc0e87eaa257..ffb76761d6a8 100644
> --- a/fs/nfsd/Kconfig
> +++ b/fs/nfsd/Kconfig
> @@ -7,6 +7,7 @@ config NFSD
>         select CRC32
>         select CRYPTO_LIB_MD5 if NFSD_LEGACY_CLIENT_TRACKING
>         select CRYPTO_LIB_SHA256 if NFSD_V4
> +       select CRYPTO # required by RPCSEC_GSS_KRB5 and signed filehandles
>         select LOCKD
>         select SUNRPC
>         select EXPORTFS
> @@ -78,7 +79,6 @@ config NFSD_V4
>         depends on NFSD && PROC_FS
>         select FS_POSIX_ACL
>         select RPCSEC_GSS_KRB5
> -       select CRYPTO # required by RPCSEC_GSS_KRB5
>         select GRACE_PERIOD
>         select NFS_V4_2_SSC_HELPER if NFS_V4_2
>         help
> 
> 
> Chuck would you prefer to fold that in or take a new patch?

I would like the crypto folks to give a nod to this, they are
particular about Kconfig dependencies these days. Can you respin
the series with all the To: and Cc: ?


-- 
Chuck Lever
