Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931EC8BFA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 05:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719035606; cv=fail; b=Bqot6Qz+3oP6oiJkftX62vF+W33ZKYTVouzsEWQJ0eZ6UlMp+67WBcTzLkMASEjDo0TmZhL/HRYADPZJctasDwfg4emvB/2bDRPFpYA3fkUg8bt3mweZSCLDrcJaXyPjEBGcCCR93UDTHgnatj8BF0+DAd2ECKpehoe4ZzQweYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719035606; c=relaxed/simple;
	bh=fpR7cRXh6k3YYWeYL1sMk8+2gjEkC6XsO2v8PrsSpDI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e64V90ELjCDxk1zN5lMkIXQJvAndQyyCRzZRu/Y5zPHJblLYQq1Z7oJ1fd1B+39IUvAAscxN9x5Ry/lQXs8IrARtpAQCN9U6B0ltIk4Dhs1llI1DN/z0LJ0JfYef0qmJ3+8qOJPmLfKx9Lv8yFQO7A9MUSC9E51q73OsufB96GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=douT/EDU; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="douT/EDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719035605; x=1750571605;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fpR7cRXh6k3YYWeYL1sMk8+2gjEkC6XsO2v8PrsSpDI=;
  b=douT/EDULBwGVuJx++DnVBdHQEnBrMDA5LR3jTjECHAZnzhnZ7GK8eAB
   EiECf/kbaAaaSZKfdJG6dMsO+SeX6dDTflAE+Z8Hc23zahfL8xSjqsCb6
   QyJH2GKr8fX1tb9DYHoIQp/xz1YDuaVk49p6BcfIVhFQHILlOjNjtNvT3
   +gnhE7gTd6TZ0+XMOOIcF1VRGxS9IGuOXPkqPSStyFNMuz1dNZc+hSn3M
   5SpxuLlBD36nm5Bw8xhNkBO3wPXAd/2RSN3QuEqdwDV+qFxtHESZLJFsf
   Ol7YUNtZipKLvLrWaJusNgB0OusoSFRwP+2wgoAbBX2rHY4ZWY+d0N0xn
   w==;
X-CSE-ConnectionGUID: S81zlQGQRiiL6pBLRDABQg==
X-CSE-MsgGUID: TOW3FFP+QpqY2JdvCLkrBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16195865"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="16195865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 22:53:24 -0700
X-CSE-ConnectionGUID: gCFGOrkMSfGIlFBMCejpOQ==
X-CSE-MsgGUID: RfHSXsMMQAmGc4DL8wt0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="47731352"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jun 2024 22:53:24 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 22:53:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 22:53:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 22:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Padkso7sGQ/NVO8HrJATvlvmPjzLopjZx5qJShLgK4F9QOZtk+avet8qGPxOCtmCyIk/k1imvq+dR8fxqMaCm/O+HOmWL0zwxlBln9xBfvS8+B49F25v2J5sUYCWx3gYFWaMEnspwLWW23nqOwMIibwIAbJf0ub5T+ZVuilP9Tvk0IZ4n8TJ5h4qyuNdwycvuTbZLE69gULhHgTpDRf6jN6dxDq36+Hyl2xL/o/auI0NxAucANpj0N0nje/3gAaezmaym0UFmzCFN2Ko6UjuFsnKRdZ8vkBECWoTNBX4Dr0cXDwhBR2W3BNEyhdh3ZYDzliVw7bldA0EquOv4s52mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXnwuPaLAFzN+hTo2z57MoQ/bDIHUAyEY32rUmYzbIc=;
 b=Kot7WuOx9lH0HC/s/tAwi3FGY1MxRaruzPXB3aCd7m+bZvQvUvJVVjQE9z0zzua7PjViI4vFq2DcSzZ4qDbortZmSzBKqyJY/8yj+Ap9gV8phFIHv76ENlerxNEoEc+iBjo9CYJUoRd7MiUK3xIlGl87isosXjEXLENq4SeDroICTv1QY5qzvAVz3Wr3R5s8K1lywzHhIfAH/DrWnH0mHonhvgG76dOcnuYS1mELEd5THr3rS8C2+GMu5WNKJ/kykpqEOeweTBD4VwMe0NEZmCK58d4GEv6KWlaAl4pVQ0+9aCVGgY+p31pj/OYPZL6IEwTZHI2AgwiEzYjHGrfdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.20; Sat, 22 Jun 2024 05:53:21 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.019; Sat, 22 Jun 2024
 05:53:21 +0000
Date: Sat, 22 Jun 2024 13:53:09 +0800
From: Philip Li <philip.li@intel.com>
To: Barry Song <21cnbao@gmail.com>
CC: kernel test robot <lkp@intel.com>, Chuanhua Han <hanchuanhua@oppo.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Barry Song
	<v-songbaohua@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying"
	<ying.huang@intel.com>
Subject: Re: [linux-next:master 6448/7397] mm/swapfile.c:1388:6: error:
 redefinition of 'swap_free_nr'
Message-ID: <ZnZmxZ1Y4Pn50d+V@rli9-mobl>
References: <202406220112.qjyQbasK-lkp@intel.com>
 <CAGsJ_4xn7bw797EBtNvATgYbu+WiDpqgPY69JY6MxRF8db0jtw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4xn7bw797EBtNvATgYbu+WiDpqgPY69JY6MxRF8db0jtw@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c88c08-06bd-4109-0cc1-08dc927f9f01
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjhWckFGNERFR0xvZENtZXYzZjlLaVpETlpaa25zUmQ3RmNMNG1JbXduaFY3?=
 =?utf-8?B?RVJvN1JGNTRaWmdqREdEZ1JGb1YzblhlK3dzTEVMNlZ3bXZqUHZSWjMyQzBQ?=
 =?utf-8?B?bHRGc0RpbU5yVE5sRnhpd2wzMldOQzFNQ0c5MHNQTFhYZzhXRG5TdVdMeWRs?=
 =?utf-8?B?aHN3cEhRdjBDd0RzTGt1UjZYR1VGNlR0cS9wR0RyNUs4K2FSU0NKSjFpWDRB?=
 =?utf-8?B?V0ZJOTNKQ3FZSDB3aE5ZeFMxS3JLVDJuRTEvYndZM3I4c0Vjdm9KNnAzUjJI?=
 =?utf-8?B?ZlVhdjVjczZGdlRFRnl5ODdMRHRUdTlKaUFJT0dRNmlYZ2VMS3Yzc2F2RTU4?=
 =?utf-8?B?ME9TakxTS3MxRjc5M2JXUGp6NnM0aVo5bDhadkVOUXlBNVQ0aGg1azJiMjVM?=
 =?utf-8?B?azJoUTJqeWJlc0dYYmd6QytYakJEVFFWdU9vSUhEVmhHMCsxVDFSNVVqM3Bh?=
 =?utf-8?B?M0ZoNytzRjZGQXVSd2lPZjFFQWcwWFA0SHR5d3kwczRZSXREUlpudlpjeFZT?=
 =?utf-8?B?N1ZvUjFpQlRuaUx3YzlUSkZHUkNoQUZsVFVYQkdZaVhnV3FEeVhSd1o4Wk43?=
 =?utf-8?B?WUpNWUt2VERhMUdlbWcrRHRVZ0ExaHFwbzZLZGs5N0JOeUkrdWE5NTVnWVAv?=
 =?utf-8?B?cmlNZW5ZbWx1UXl0NGZhZTFJT1dPZXVaM3N6TXV4RTlOa3pQUmtTOTVxVDRk?=
 =?utf-8?B?SlNBQ3JEKzdZMTZ6dXcxQnBwRWpTcUpSamJ4QVNhVTFDUUQxaTRIS1lNMnJC?=
 =?utf-8?B?Vm9tV2crQWdrYjBQakp0aS9QaVp0dk1zSzJOU0lSZkFUOVA2bWNZVmdNdFox?=
 =?utf-8?B?T291YjVWbm5TdVh4c3k5VUlmZ09qL1cwR1cwSXVqZExjNVo0cE55Wmpxa0lz?=
 =?utf-8?B?UDdMeWtuTzdSc1ZjM0krYmVPTnJDRHZQdmI3NTZleE5EcDMxbUdHOGZFNDVK?=
 =?utf-8?B?OHdzd292M2dMdCszQWl1SFFDZXpyZDhyZFRBYTBUNzZrSGlZankyMlVUVTFS?=
 =?utf-8?B?ZzVXSUNmUjcybjk3dUQxWDcxeGFTcll3ZzE0Y3dJc2xmQ2hjUzY3dU9zbHZU?=
 =?utf-8?B?S2pONGlNa29tN05zVktldS94ejFCTzM0YTFiaWQyRzdSZzVQdWpxNFplYldP?=
 =?utf-8?B?VmRtSzNuY3B1Z2pucVd4QTdSRkx1L0dxN3J3WWV3TTdnV1UvWGdHeFZqY1J3?=
 =?utf-8?B?SVVLNnRqdUJ4TDFrY1I5eXRvdFJtZERSZWhQQk5JZzM2QnRPaHNZYy9wVDhY?=
 =?utf-8?B?enJhNCt5c3ZkbC9zcjhkNU4veEZVYkdmQlFVWWxscXlOUEhHRWZOemRKeHJD?=
 =?utf-8?B?UmRqcDRqNFNyMjN3S21PQUxGcDRjUlozbThibGN0MzExQVVIeFk1SStVNDVU?=
 =?utf-8?B?djh2bysydU5OS0VQOTY0R2hwM2V3eWk1S25pWDZKZDFPQkQrWjFTZCtDaWlV?=
 =?utf-8?B?YjF4c3JRSkk0ajZ4MlVXUzUxZ1RWWXkzNjM2Q3dCUmFtM1Q5RHZMRzNRZ2x6?=
 =?utf-8?B?V0V6d0NJZG9VdkZabWFUQzljelBRQjNzWFhOM1NWSW0zcHJidGpjYzh0STdU?=
 =?utf-8?B?VS9DZ0RXbXRnWC93ZWZlUU5CTDhYQ1dBek9QbzJRNkFyRno5NDBVMTRrOFU4?=
 =?utf-8?B?RjhVV0VTQ0VHYjV6Y1JMOUx1TFM0MzFQM2REWSs5OWFxSjVIQ3lGNERnMUJZ?=
 =?utf-8?B?TWdzaTN6ZXloU3FNMEpFTDdjQVNvMlhuZ1lXc0NPaVBtcVp2MWZJbHVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTA1U3RHVWIrVjdOQlE2NW1sY0thMXRkRGpBM3VRaWc5UWtCVjZOVHdsWXQ1?=
 =?utf-8?B?Q1JwMlkxdmNJam1VSEF4M3ZMOU9VY3BQQXcrYkRTV2xZejAxdmJQckJSak0w?=
 =?utf-8?B?TW4vUzdEcVFKazIwRnBNdzU0K0xnV0E0MlFpNzZLUzRBb0U4a2xaaEZ3NnR3?=
 =?utf-8?B?Slo3OXlpRG5qN0Z2R0htWXZPYTUzUlNYMGRwekIyK0ZQV0ZqZXZwSDBWUG9E?=
 =?utf-8?B?V0Erd1UzdXlvZjJMbk56NmxMQmE5L0VOOEM4T0M2SitaMTVmZEg3WHkxOTJn?=
 =?utf-8?B?ZVNRcWFzZm5RNHFoYzNSQmlDZFh0MEVCcDRHVld6eU1RVkw0SVRMeUgwd3J2?=
 =?utf-8?B?SDBWYnRxY1RUTERjZjdVOVFNVkwrWFF0cWlQdExGT0VURVlFVGpFVFZMNmlj?=
 =?utf-8?B?Znd3TFAyUG1SUEUrRTNPUlVhU2dKVGhiWFgzVmNiaDVkamgrWitRYVhmZXNK?=
 =?utf-8?B?SklSZlduQmwrTTU5dGhKWDhaaHN2czdFb3NFc0hZOVNnNVluRndqRkJ0RnJz?=
 =?utf-8?B?WnpCS3I4bXBLS1NyR3N4NUI1QmJBVTBLUWI3eFBmZ1Flbzhza2w2b09sc2Jz?=
 =?utf-8?B?TVJxdE1JU3RPTklzckRCNXZleG9nZDYrNm9BMzB1Ri9CeU5idlh5M00yd0Va?=
 =?utf-8?B?SVl0VTZoMlA1dU05ajh1bzREOHF0L2lhOVR3Y3JNZGp4ZDRzOUYxaVRza0F4?=
 =?utf-8?B?UmtIMWJxK1dmZVgvY2Jrb0pldVJOKzhCbzYybDd5TlpENGZLMkI3YXF1dGg0?=
 =?utf-8?B?QjZvNlp0QXdycmhYcitBaEFIZW40bnNmVDBzMUQ1QUswL1NKSmNhRzNtZVhw?=
 =?utf-8?B?YVdYMlMwdkpQSWcrcXFhRTduV29DQzFaWldMQ2lVcUhPZ1p2eWVlY0tnRWhh?=
 =?utf-8?B?amxFWVZ5WnpPU1dnRUpNcnNqMEM3RE1HZWlza2dkeXNPZWVvbjhzNW5semJS?=
 =?utf-8?B?YXh2WmExdDNLd2FzUkhTNklhNlIvU09KVkpMKzFZczh0OFgyN2ZCVFBEV0d4?=
 =?utf-8?B?QTNjcVEzRDN5Qkl4cUNiVnRUNGhremtUMGFCR0JFUW83M1BkZ0NnOEhQeXF1?=
 =?utf-8?B?c0FrVjFza3VIZEd2bU1FZUpzMk53OE9RUUI0ZnBFYVEzSTVOMnZuS2VScHIz?=
 =?utf-8?B?aWNuZk9UU2l3QS8yYzJnWDkrMTZielFtSWowWWd1NjdCZURNeWhEV1V4NXdu?=
 =?utf-8?B?ZnhDS1pkNXlmMHVKN1FwRWR0ZmUxN1RLRG95UDgrbW5JaXdCWStkUUp2Zm9n?=
 =?utf-8?B?YSt3WnUydVJDQXBqdEZmV1NDTWJOY3NmWnhlN3diUlhiNENPVzRxUkVISWli?=
 =?utf-8?B?Z1FSeDNPdzZhcGthTm9rSjByYkNwU0RvQ29CbFpRTlEyVDljRUdsZ0tpTFJZ?=
 =?utf-8?B?ZW1WTjVZUVZWWnRjN2lTdFRUUGlVaU5xcjBaOEF1eGx4eGpubjF5aEVjSVFK?=
 =?utf-8?B?aHR3eFc3Z2dURkxvUUh0Y211TEVJWGxRUXVFU0hnT3hlQWNPVzAvNFpFYzRK?=
 =?utf-8?B?UFNyZmE1bkw1ZXVoZjZmT1huWDcwNG92N1VVOVl0VWlId2pqZlR4WTJwWlg4?=
 =?utf-8?B?VENsYjVGaWVVa2FJc1o0RnhjM05OcE1wdDRRL01yQkhtNHFKa0FZbHVYWWV3?=
 =?utf-8?B?WDlaYWk0RlR1MTRDY0F4aHFuZnl1YzBGamRLM3k1S043SEcrSHkvL0JRclpt?=
 =?utf-8?B?ano0VWh0RW9WNDh2Mk9OekFuK2dnL2h4eTRmVHVRSTZ2QW11SWxOS1dKbWRG?=
 =?utf-8?B?TXJ0R01SL2g3dUl4UEhmZExCOWJNL3pwSTQvaDVpUmZMQWphT3o5MWRTUmFB?=
 =?utf-8?B?R2ZodktvODg2c1MrTlZYT3UzN3d4MTZpYmd1ZGNrVkc2T3o5NW4zRE5RU2ZS?=
 =?utf-8?B?R2oxS2RSTWZLZEl4bTdUQWJvbmpZZkpDVTNoQ1pEeldqa3dTZzMzNzEvY0FL?=
 =?utf-8?B?djNOYmQ5am9COXdJSUUzMjRJa2w1Nm00SEx6dG9PZXpJWUJFM2duQkRZdGor?=
 =?utf-8?B?MExnZDFBMFA0ZnhibC9hREE1UzNYaHo5eis5RWsyTFEvM0IzY0syemRwelI1?=
 =?utf-8?B?eWhkdzdwbHczR1RJZnJqUEZweHh2bW1wK3ZFaEFkQ29qdldYOWw4MU5VNXp3?=
 =?utf-8?Q?a///Q7FB9dBAB6s30Pz4tcwP4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c88c08-06bd-4109-0cc1-08dc927f9f01
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2024 05:53:20.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf/19opkhmZNiu3g3oq0yNHftwHuqfJECZOLd27e1AUmEjL1LBzR9ADcAKk3TEEUJKq6om5H8hER6yIghi13Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
X-OriginatorOrg: intel.com

On Sat, Jun 22, 2024 at 04:24:43PM +1200, Barry Song wrote:
> On Sat, Jun 22, 2024 at 7:09 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
> > commit: b858a8a49e72678a7e0ac90b8135d746b31d7586 [6448/7397] mm: swap: introduce swap_free_nr() for batched swap_free()
> > config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240622/202406220112.qjyQbasK-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220112.qjyQbasK-lkp@intel.com/reproduce)
> 
> I'm not sure why this is happening. I've downloaded the config and
> kernel code and tried to
> reproduce the issue using the same GCC version, but everything seems fine.
> 
> Is LKP experiencing issues today?

Sorry about the false report, it is a wrong one similar to another report at
https://lore.kernel.org/oe-kbuild-all/202406211750.Ks4k82Gi-lkp@intel.com/.

Kindly ignore this or any one that uses x86_64-randconfig-014-20240202 kconfig,
and we will resolve the bot bug asap.

> 
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406220112.qjyQbasK-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from mm/swapfile.c:17:
> >    include/linux/swap.h:519:49: error: expected identifier or '(' before numeric constant
> >      519 | #define total_swap_pages                        0L
> >          |                                                 ^~
> >    mm/swapfile.c:67:6: note: in expansion of macro 'total_swap_pages'
> >       67 | long total_swap_pages;
> >          |      ^~~~~~~~~~~~~~~~
> >    mm/swapfile.c:236:10: warning: no previous prototype for 'swap_folio_sector' [-Wmissing-prototypes]
> >      236 | sector_t swap_folio_sector(struct folio *folio)
> >          |          ^~~~~~~~~~~~~~~~~
> >    mm/swapfile.c: In function 'set_cluster_next':
> >    mm/swapfile.c:797:22: error: 'SWAP_ADDRESS_SPACE_SHIFT' undeclared (first use in this function)
> >      797 |         if ((prev >> SWAP_ADDRESS_SPACE_SHIFT) !=
> >          |                      ^~~~~~~~~~~~~~~~~~~~~~~~
> >    mm/swapfile.c:797:22: note: each undeclared identifier is reported only once for each function it appears in
> >    In file included from include/vdso/const.h:5,
> >                     from include/linux/const.h:4,
> >                     from include/linux/list.h:9,
> >                     from include/linux/wait.h:7,
> >                     from include/linux/wait_bit.h:8,
> >                     from include/linux/fs.h:6,
> >                     from include/linux/highmem.h:5,
> >                     from include/linux/bvec.h:10,
> >                     from include/linux/blk_types.h:10,
> >                     from include/linux/blkdev.h:9,
> >                     from mm/swapfile.c:9:
> >    mm/swapfile.c:803:41: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (first use in this function)
> >      803 |                 next = ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_PAGES);
> >          |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
> >    include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIGN_KERNEL_MASK'
> >       32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
> >          |                                            ^
> >    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
> >        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
> >          |                                 ^~~~~~~~~~~~~~
> >    mm/swapfile.c:803:24: note: in expansion of macro 'ALIGN_DOWN'
> >      803 |                 next = ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_PAGES);
> >          |                        ^~~~~~~~~~
> >    mm/swapfile.c: At top level:
> >    mm/swapfile.c:1071:5: warning: no previous prototype for 'get_swap_pages' [-Wmissing-prototypes]
> >     1071 | int get_swap_pages(int n_goal, swp_entry_t swp_entries[], int entry_order)
> >          |     ^~~~~~~~~~~~~~
> >    mm/swapfile.c:1278:26: error: redefinition of 'get_swap_device'
> >     1278 | struct swap_info_struct *get_swap_device(swp_entry_t entry)
> >          |                          ^~~~~~~~~~~~~~~
> >    include/linux/swap.h:509:40: note: previous definition of 'get_swap_device' with type 'struct swap_info_struct *(swp_entry_t)'
> >      509 | static inline struct swap_info_struct *get_swap_device(swp_entry_t entry)
> >          |                                        ^~~~~~~~~~~~~~~
> >    mm/swapfile.c:1350:6: error: redefinition of 'swap_free'
> >     1350 | void swap_free(swp_entry_t entry)
> >          |      ^~~~~~~~~
> >    include/linux/swap.h:559:20: note: previous definition of 'swap_free' with type 'void(swp_entry_t)'
> >      559 | static inline void swap_free(swp_entry_t swp)
> >          |                    ^~~~~~~~~
> > >> mm/swapfile.c:1388:6: error: redefinition of 'swap_free_nr'
> >     1388 | void swap_free_nr(swp_entry_t entry, int nr_pages)
> >          |      ^~~~~~~~~~~~
> >    include/linux/swap.h:563:20: note: previous definition of 'swap_free_nr' with type 'void(swp_entry_t,  int)'
> >      563 | static inline void swap_free_nr(swp_entry_t entry, int nr_pages)
> >          |                    ^~~~~~~~~~~~
> >    mm/swapfile.c:1409:6: error: redefinition of 'put_swap_folio'
> >     1409 | void put_swap_folio(struct folio *folio, swp_entry_t entry)
> >          |      ^~~~~~~~~~~~~~
> >    include/linux/swap.h:567:20: note: previous definition of 'put_swap_folio' with type 'void(struct folio *, swp_entry_t)'
> >      567 | static inline void put_swap_folio(struct folio *folio, swp_entry_t swp)
> >          |                    ^~~~~~~~~~~~~~
> >    mm/swapfile.c:1461:6: warning: no previous prototype for 'swapcache_free_entries' [-Wmissing-prototypes]
> >     1461 | void swapcache_free_entries(swp_entry_t *entries, int n)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~
> >    mm/swapfile.c:1489:5: error: redefinition of '__swap_count'
> >     1489 | int __swap_count(swp_entry_t entry)
> >          |     ^~~~~~~~~~~~
> >    include/linux/swap.h:571:19: note: previous definition of '__swap_count' with type 'int(swp_entry_t)'
> >      571 | static inline int __swap_count(swp_entry_t entry)
> >          |                   ^~~~~~~~~~~~
> >    mm/swapfile.c:1502:5: error: redefinition of 'swap_swapcount'
> >     1502 | int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry)
> >          |     ^~~~~~~~~~~~~~
> >    include/linux/swap.h:576:19: note: previous definition of 'swap_swapcount' with type 'int(struct swap_info_struct *, swp_entry_t)'
> >      576 | static inline int swap_swapcount(struct swap_info_struct *si, swp_entry_t entry)
> >          |                   ^~~~~~~~~~~~~~
> >    mm/swapfile.c:1518:5: error: redefinition of 'swp_swapcount'
> >     1518 | int swp_swapcount(swp_entry_t entry)
> >          |     ^~~~~~~~~~~~~
> >    include/linux/swap.h:581:19: note: previous definition of 'swp_swapcount' with type 'int(swp_entry_t)'
> >      581 | static inline int swp_swapcount(swp_entry_t entry)
> >          |                   ^~~~~~~~~~~~~
> >    mm/swapfile.c:1611:6: error: redefinition of 'folio_free_swap'
> >     1611 | bool folio_free_swap(struct folio *folio)
> >          |      ^~~~~~~~~~~~~~~
> >    include/linux/swap.h:593:20: note: previous definition of 'folio_free_swap' with type 'bool(struct folio *)' {aka '_Bool(struct folio *)'}
> >      593 | static inline bool folio_free_swap(struct folio *folio)
> >          |                    ^~~~~~~~~~~~~~~
> >    mm/swapfile.c:1655:6: error: redefinition of 'free_swap_and_cache_nr'
> >     1655 | void free_swap_and_cache_nr(swp_entry_t entry, int nr)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/swap.h:532:20: note: previous definition of 'free_swap_and_cache_nr' with type 'void(swp_entry_t,  int)'
> >      532 | static inline void free_swap_and_cache_nr(swp_entry_t entry, int nr)
> >          |                    ^~~~~~~~~~~~~~~~~~~~~~
> >    mm/swapfile.c:2303:1: error: redefinition of 'add_swap_extent'
> >     2303 | add_swap_extent(struct swap_info_struct *sis, unsigned long start_page,
> >          | ^~~~~~~~~~~~~~~
> >    include/linux/swap.h:598:19: note: previous definition of 'add_swap_extent' with type 'int(struct swap_info_struct *, long unsigned int,  long unsigned int,  sector_t)' {aka 'int(struct swap_info_struct *, long unsigned int,  long unsigned int,  long long unsigned int)'}
> >      598 | static inline int add_swap_extent(struct swap_info_struct *sis,
> >          |                   ^~~~~~~~~~~~~~~
> >    mm/swapfile.c: In function 'setup_swap_extents':
> >    mm/swapfile.c:2389:21: error: implicit declaration of function 'sio_pool_init'; did you mean 'mempool_init'? [-Werror=implicit-function-declaration]
> >     2389 |                     sio_pool_init() != 0) {
> >          |                     ^~~~~~~~~~~~~
> >          |                     mempool_init
> >    mm/swapfile.c:2396:16: error: implicit declaration of function 'generic_swapfile_activate' [-Werror=implicit-function-declaration]
> >     2396 |         return generic_swapfile_activate(sis, swap_file, span);
> >          |                ^~~~~~~~~~~~~~~~~~~~~~~~~
> >    mm/swapfile.c: In function '_enable_swap_info':
> >    mm/swapfile.c:2444:26: error: lvalue required as left operand of assignment
> >     2444 |         total_swap_pages += p->pages;
> >          |                          ^~
> >    mm/swapfile.c: At top level:
> >    mm/swapfile.c:2499:6: warning: no previous prototype for 'has_usable_swap' [-Wmissing-prototypes]
> >     2499 | bool has_usable_swap(void)
> >          |      ^~~~~~~~~~~~~~~
> >    mm/swapfile.c: In function '__do_sys_swapoff':
> >    mm/swapfile.c:2574:26: error: lvalue required as left operand of assignment
> >     2574 |         total_swap_pages -= p->pages;
> >          |                          ^~
> >    mm/swapfile.c:2650:9: error: implicit declaration of function 'exit_swap_address_space'; did you mean 'swap_address_space'? [-Werror=implicit-function-declaration]
> >     2650 |         exit_swap_address_space(p->type);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~
> >          |         swap_address_space
> >    In file included from include/linux/export.h:5,
> >                     from include/linux/linkage.h:7,
> >                     from include/linux/fs.h:5:
> >    mm/swapfile.c: In function 'setup_swap_map_and_extents':
> >    mm/swapfile.c:2995:22: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (first use in this function)
> >     2995 |         DIV_ROUND_UP(SWAP_ADDRESS_SPACE_PAGES, SWAPFILE_CLUSTER)
> >          |                      ^~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:284:55: note: in definition of macro '__is_constexpr'
> >      284 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
> >          |                                                       ^
> >    include/linux/minmax.h:169:33: note: in expansion of macro '__careful_cmp'
> >      169 | #define max_t(type, x, y)       __careful_cmp(max, (type)(x), (type)(y))
> >          |                                 ^~~~~~~~~~~~~
> >    mm/swapfile.c:2997:9: note: in expansion of macro 'max_t'
> >     2997 |         max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUSTER_SPACE_COLS)
> >          |         ^~~~~
> >    include/linux/math.h:37:22: note: in expansion of macro '__KERNEL_DIV_ROUND_UP'
> >       37 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
> >          |                      ^~~~~~~~~~~~~~~~~~~~~
> >    mm/swapfile.c:2997:53: note: in expansion of macro 'SWAP_CLUSTER_SPACE_COLS'
> >     2997 |         max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUSTER_SPACE_COLS)
> >          |                                                     ^~~~~~~~~~~~~~~~~~~~~~~
> >    mm/swapfile.c:3010:66: note: in expansion of macro 'SWAP_CLUSTER_COLS'
> >     3010 |         unsigned long col = p->cluster_next / SWAPFILE_CLUSTER % SWAP_CLUSTER_COLS;
> >          |                                                                  ^~~~~~~~~~~~~~~~~
> >    In file included from include/linux/container_of.h:5,
> >
> >
> > vim +/swap_free_nr +1388 mm/swapfile.c
> >
> >   1387
> > > 1388  void swap_free_nr(swp_entry_t entry, int nr_pages)
> >   1389  {
> >   1390          int nr;
> >   1391          struct swap_info_struct *sis;
> >   1392          unsigned long offset = swp_offset(entry);
> >   1393
> >   1394          sis = _swap_info_get(entry);
> >   1395          if (!sis)
> >   1396                  return;
> >   1397
> >   1398          while (nr_pages) {
> >   1399                  nr = min_t(int, nr_pages, SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
> >   1400                  cluster_swap_free_nr(sis, offset, nr);
> >   1401                  offset += nr;
> >   1402                  nr_pages -= nr;
> >   1403          }
> >   1404  }
> >   1405
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
> 
> Thanks
> Barry
> 
