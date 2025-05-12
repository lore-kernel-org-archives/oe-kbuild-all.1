Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287DC134AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 01:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747012243; cv=fail; b=HF9uWxKqWHCurZvt4okELjzHbZa8zvcmMaEXqnCGwSwPl7NIUL5CluVfOOPlkBrOtKbPd7rs+p0xBNWE2FrsS97IzRWgmp8sBG4pOcPhde7+FaeWJs+LDuwi8uTD4KRPuwz0GQIxXvGc1wEd+5eyaVxgETdRLnEgHeQ0JfrrE6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747012243; c=relaxed/simple;
	bh=T8Bb4QyyMObL++ecM5nYV+9qeO8SBRd0IJcFeK7LBhw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=joNzY5h9DgcIWGhHs4/gbZa/XaO65qvcvfdLyhKklUTcJMWWsID8NJkCgoslI5v8HmaKTKBr1cLvpZK8Bb5wN+SeWFD6o9XiV7b7cR591HXrpiW05g+01ThFag8vc0xSr/4N88wyhPtR+x7HcU+DSWmT46lbIefOtqb9pLpfHqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg/UdhM+; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg/UdhM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747012241; x=1778548241;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T8Bb4QyyMObL++ecM5nYV+9qeO8SBRd0IJcFeK7LBhw=;
  b=Jg/UdhM+GdbrXU8I4+Ym9NyWA7uWftyOfhVIWHWSexYW9fZrCihyLOWa
   pYhX1QGTSS682xW1Rq6Rn3LfV/7QN7tagXHcjPD6yPUf5wwLBwb9PMKE+
   TKSBKHpArH7hYmzdOij3045vOK2lvToGU5GD8J1MtJG6E3Qi3QarmzF3q
   ZoKlbJ9J3PgQHGk2Ypsz4x++RUvt7pRcsEZPFuhNPKyLvMnqZPoTowH/S
   JdyXSBCE+MRuiwr4GS4m6UePB9nffFwVwaWykLIaUXFYC7EJcflvOrfJE
   oP/R88IPjjSWSk8WLtcsi08KJOf+HmI0jwlO0nDLgMWOB+f7w6LscfcvV
   Q==;
X-CSE-ConnectionGUID: TnF9q9ZzTA+GciHFJ0HbHA==
X-CSE-MsgGUID: Oub2oG8cSCuqRDeCVJcVKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="51449304"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="51449304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 18:10:40 -0700
X-CSE-ConnectionGUID: H0z6jcT6THuec3BhfrwKNQ==
X-CSE-MsgGUID: g7cwqVKrTP6/ezBBqMKh7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142426030"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 18:10:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 18:10:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 11 May 2025 18:10:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 11 May 2025 18:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/9CqB0nKBR3ehVNxDf8bNBiSuJtRO0LwpmwdkPjhxVXgz/GDYYrP8hhtVS8zmy9va/im9OodFmdu1kjAUStVmaJgVkjU7cAKdmuzGRIKZG5wXEg7dVLzBYuHCshNUULyCUsFzJT/ezO0PsigtIgiqT8heKBvt3vpAC4pUi7Q8Ldx8Q0sxtEeilST5fQLozSihOrm9VvM/UnFqKn9UA0aXG+3k3z1Z24SPW/nE93F19AnERMRvBpuQE+/7hyL5NLIyy6MASre5oV5c/UuZ1SiQQARsBlv+NLZkCAhXxqypz9z3kSUYOKAclOjrGgBBkEJuv+3FqiOaPkSrlA0U2PPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCbOrraw9ZNhGeqCUxRm3sMq2ygSERmD7q/2O9vQXEY=;
 b=OJgziZBBeXnrsq8vLPX7Y/W04Jveb4lS5K676A0g+xiv4Reaa1LUtw7FFOd+hC6HqRDWyMvwi9CwnBPIOZFNqoscX66efDnVKKxCXvrc/b480xK/tmlCEvtp4Suy5vPfuWNxm48nXAm1VDcI9e34n8pgqh3dt37xmgfwXEbBZtt1C5aY7wqklde+L7pM/Wt+JHI1LB09idPOV4rOU7TlcOWZXa3M0bevNM1hceyTwhmE+CPBdXtraDeM58f7HXBpowc+QP/UHXmHAyx6T8qbPk40ti/sHZgW4cY18jrlw6978ShdRXSppiRJWP2WQYAV3gGNOX5Xl/4MdbQ+p2n8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by IA0PR11MB7354.namprd11.prod.outlook.com (2603:10b6:208:434::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 01:10:20 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Mon, 12 May 2025
 01:10:20 +0000
Date: Mon, 12 May 2025 09:10:11 +0800
From: Philip Li <philip.li@intel.com>
To: Juan Yescas <jyescas@google.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	"Andrew Morton" <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 333/334] include/linux/mmzone.h:1816:8:
 warning: left shift count is negative
Message-ID: <aCFKczeBZOp8wiPg@rli9-mobl>
References: <202505091548.FuKO4b4v-lkp@intel.com>
 <CAJDx_rg6QHsLK8=i-6D5=B=OL50-RUPP=e9JZgRiAfE3sgwRMg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJDx_rg6QHsLK8=i-6D5=B=OL50-RUPP=e9JZgRiAfE3sgwRMg@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|IA0PR11MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: a028514b-2676-4e66-0b42-08dd90f1c367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3ZOdUYvK3FWWlAyb1pPMmZHMHR4VFJKaDJLUkhtVnVCcFpiWE82ZEc3RnR6?=
 =?utf-8?B?ZnM0Vk9zRUtvVDd6OXI5SjRhUUVWNEliVlJEUmVnQ0lJNyt3U2NFL1JZN2Iw?=
 =?utf-8?B?WDU2RDQ1Qm5HV1hyaldZc0pBTUs2azRJaEVZN0diQjJxbEFMQ3RQbUw1NkpR?=
 =?utf-8?B?L1dGSVNybXl6eG9OcnZsVkZGSjZrUCtNNG5FeU9HN0lrSVpleTVxOHZzdTNj?=
 =?utf-8?B?QkE2c1JrcXFyRnhNRE51ZzZ3RDBXZUwyZ1RscGY3Q1dZVWRMVE9TZUhCMUJ2?=
 =?utf-8?B?cm5YOFltZUNYU0xjY2lqQUNqdE1reG9mcVdWRE5zWGpzU3JVc09kQTl3ZHJh?=
 =?utf-8?B?eFl3S3JYdGNXcHAxeXg1L3U3Kzl0cDQ5VU1vRzhKcFFpcHFMdllYWGlZUEtq?=
 =?utf-8?B?cnhwajNERXA4TGVqRFVacW43UW9lMXNLOUV0SmlFODh6T1VaMHl4ZitWeWRC?=
 =?utf-8?B?OXNEdkMzUzcxcnQ5ZEhhUkpvd2ZOSXhSbTEveE9qazlXQmlvVlNINFZQd3Vt?=
 =?utf-8?B?MXhaMWJTWG1qVzdENjFhc2FMVzJ5V3dBNGIxMFo4djhkMlA2WjhLSWhycnhl?=
 =?utf-8?B?RlRZc1VQL2FDMDAzZk1KRGljU3hrRHpFN0x0a0dyeksxRmlYUEo0V1FiUGI0?=
 =?utf-8?B?TXZiNlR3S0JkbVQvZzJtTjJkTjg5S2l1VzZtZ1NxWmJKdHg2bEpMbTdhZXJF?=
 =?utf-8?B?dnJ2WHN2aGZJMk84T2VEa0pZbEtIQ25KWFlCYjRGSmxGcHlkbUtFU2Zqdmlv?=
 =?utf-8?B?ZVAwUklTUjRPYnlacDR5OFJYMXRtNklRajVZRFErdXFsUzV0eC9SaGR2TGVD?=
 =?utf-8?B?QVhpai9FajJrVzZ3TVhiS2RrSEZWMFk0b0dqMXh0eVdnSzBSc2h3QW9WeU40?=
 =?utf-8?B?STFiQ1I4Um1UQVhRWnlHMUI0R3ArUzAweFpEVmIwV3UzbTl4cWwxcWgyS25r?=
 =?utf-8?B?WTM2U0o0b3ZnV1B1M0tlckZyeE1RRTJBTFZkZ2xmVmhjdk1xc1BnTlQ2T1NN?=
 =?utf-8?B?bHU5cUl6ZTJ2akMzNk9BNUdMclVmWFhTNUN4RkVOTFlyNElBTFJqZGg3Q3NZ?=
 =?utf-8?B?TmJpb3dNbVVVV3FHQ0N5Mk9CdU9adFpSTitnNFV5akFTdkxSTGhDdnZGRzg0?=
 =?utf-8?B?d1BQaXF1dXVXcDQ4UVVGNUxnV0hJR1lZYWVRQlVRbFNBL1JSNHRMSzVKQS9n?=
 =?utf-8?B?YkZ2ak1JTXNYR003bUxVNlNQOVc3QXhLSWlNMmNNYXZ0QWRGYlVZRFRpc3pJ?=
 =?utf-8?B?LytoQmtmTDZjU3ZGa2YzaHo2NFlSRG56UFM1OWpnTnl5OUdEQ3ZleCtuTlQ0?=
 =?utf-8?B?TW9JYjFTZno1cmhkaWdZQ3lKOXBISTFUdDVlNnN4K3hrRFd0MDNUKzBIUlhL?=
 =?utf-8?B?VmF2dkhOTFJOYXdGRHJGNjJZSmZRSU5LRmJBRFhPTlBqVWRsbEJnTGVVeWhB?=
 =?utf-8?B?WFplTHNVKy9PTkpBS3VCZnRMTTF3MFFCeWhSQ1FUWStaT2Z5WnlGS0Jqampu?=
 =?utf-8?B?Y2tTbnFyWHFyZUZRYXRhc1lNbmtyMGxSNC8yWk53MEZ2RXNrTW5VNjAyNEgy?=
 =?utf-8?B?OGhqYlRuak04UVJheWMvTTFSUXVmaFhkNExlbGJ5cXBSREFhTHVkbGNkaURV?=
 =?utf-8?B?SUVqRFVXU0YwK0NZNjhZd0JnNzl4QW9laHk2Uk9SaklOUy9kZHFTTHBFYnNU?=
 =?utf-8?B?bEhWbGEwTjlTakZzSDFNQ1NWK0RrV1kzK24zNVRPVVVjdmFRUEhhYUVDQ2lh?=
 =?utf-8?B?SnJtTFhkbEFkVWpTWjBPa1JUQ1FDZHlRaDFGRkUvSE5vSnJ3WVFBekw4aXE4?=
 =?utf-8?B?WGxsSURkdE52WU1uTmlJZUl2UW04c280TUVuK1p2akUrSVpzK1hJR2JSMkxS?=
 =?utf-8?Q?Si2pjBiXogyu+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjUzYTZYUi9WdVE0bG9IdHJnYXU5YlFGd2ZMTzJBZFVmclR4cndYKys0TjNj?=
 =?utf-8?B?MGZiNlZvaE9OaGI4RHROQ3hFRWdzTVM1eVNHUG9MQlVZOGNFOVgxZklheFJ4?=
 =?utf-8?B?Tm1YbXhGT3VCT3pXSldwdmhwNkgzdFJacG9NNElnZkxQcjFqaVRYb0sza1NQ?=
 =?utf-8?B?M0RoSFgyanFMREcwQUJCNStrQlo4RER2RVJjaVpoZ3NSNW5yaVZxVzJkbjZX?=
 =?utf-8?B?azZBeWQwb09JK1VuUXFlMysrWEhwQXoxZEZhSHVjaWJjTnBxcWh0SCthWWVx?=
 =?utf-8?B?RE5EUmZxODd1a3V5bnhIY0U3d0VMRmZ4MnI1Vm9MejVESGQxRHRiRHAzTHow?=
 =?utf-8?B?WkJoZ1hxNG5wV2lzdWFiQS9qSFdCZ1k4UStzdER2UFFsbmlpU0ZyNnFhNzZx?=
 =?utf-8?B?UzdQWW15OW9yNEdWNm8xL1Y2Q0JWWUFhRTJyVC9YWjg5d2x4a0lneGp6Q1I5?=
 =?utf-8?B?OExxY3JVOXRVWUNxSS93clgyTVhPamJXYnp5R2pCQUJoS0VKUS8zWnRWRlcz?=
 =?utf-8?B?U2NxRHdCL0cyTTFnUEFoKzY4a2I2OHFzdjFLVWhtM29MaTVJZ3RpWmIrWDVt?=
 =?utf-8?B?T0gxc1lNY2RoanZHRU9aUUh3WHNkWmtmLytZQ2lnZFh5c0xNWVh2NFdOQXE5?=
 =?utf-8?B?cXJLemFYdkU5bDdlYjBBS2VyTnNUN3NTR0RDVGdDTk1FanEySnVVZkVQeVB6?=
 =?utf-8?B?aGw3WVBsWUpTNGd4ZElQR1R2SVM2Y1MrK0E4Q2F6ZTNuZitFc2lBYkxvSktx?=
 =?utf-8?B?UkNsZXNCd2pxWVVMekdndUNINGNYcGNZeEhTdVdOeG8xcnVUeGF4dWI1eUx1?=
 =?utf-8?B?WVlQcUdqczNHdVVzODBPVnBPVXpRUUNsME5TTW0yYnFPNzUwYjV4bGF1eW0r?=
 =?utf-8?B?TXM1bi82SFNFb2F4QTJSbWZ5UGFKYzh5aVNSa2N3a1hUbXdLemJ6ME1hK0Vs?=
 =?utf-8?B?M0poVFp4dm9RWm5CNnZoNnluRzd2a0trSEZuNjBTU3dWSC9JUndHM1RHb0lp?=
 =?utf-8?B?RGhBQXFKTFZqUnJ0QTdOWExGTXRiaDRwSGlHQUpSMDNIMTdUUDJGTzVXTm9k?=
 =?utf-8?B?bkJBM2U4TGpJZFZkNWtRaHhKUGgrK0w2QmdvV2pzbDZNR1Q2ZnVTcXZSQlhZ?=
 =?utf-8?B?Zkxnam1TM01nR1lweEZyTlpybUs2UHZQVGdGUUIwbXpnbERLa2l1bnczZEM5?=
 =?utf-8?B?WDhNNVBDb001TWRoZkdzdnp4ZG5UOVR5ZjhyenpNUS9ZM3QzRytpQ2lWL0I0?=
 =?utf-8?B?NTVJWm4xY1c1aWhBQ2NIYTZIZFlGbi9DTk0yZENUSlFSVkhCOEE0eU5lMk1S?=
 =?utf-8?B?S2cxc2c2ZTJVaWRwR281WWFpRlZ2dDFBSDhaTCtOcW9vNWM0Z1ZKbUg0b01J?=
 =?utf-8?B?ZHg2cFp2Zk0zVHVhbTBaMEtSak1SdHFTUEhwMDZucDgzQWQyRk5ZK2lsQXVQ?=
 =?utf-8?B?cW5xU2t3bUlwV0JPeU9LS0trUjcyQjNkYUMvVW1BRFdyQ1U3OWxMd0hPZGpU?=
 =?utf-8?B?Y2tyQ0FMS0JNOFNHYlFIOGNybEQ5eTJVNWJvMXZ0TUJpQnYraktDTkJtN0Iw?=
 =?utf-8?B?UFdPeGZzWVo1cy9NTkg4WjFLeEdJcHRkRW5Qc3BaQi96Sy9GSyt0R1BkY3RX?=
 =?utf-8?B?dW4zT0EwYUpjUUlJZVlsYm1zUWFjeTB4MnFXQmRmVE5IRW9uWjBHL285RUF1?=
 =?utf-8?B?RWh4M3pyYWZ6ZFlSK2FLcUh3Z08xa21TR1N4S21qeEVVcE1qRDVrT2pock9E?=
 =?utf-8?B?N1JWdXlzcDJXWXRFYkJ1VjhxdUdwQnI1T25OREV5OEZOV0d0SmZVUkhZYksz?=
 =?utf-8?B?UXV3dmtzdWhMZS9rYlhhNVlmQld1MmQvdlA3c3Zydmk0WHpTZHMzVURRZlVG?=
 =?utf-8?B?bFlNYk5Hc1dkWTNodU1VQ2dZRHlCRzJaZUNkNndMNzlabG5FM1kwLzRWc25R?=
 =?utf-8?B?ZjBOdDVwWG0wQk00M24xaUZHa040empURU1aWTRnWEk0Nmw5WCs2UFhWQkdj?=
 =?utf-8?B?azkzS24zcW5ad2NoOVRCeFlDWVVBdzkva3Z3cnI4UTFKUDd6ZEtNNWdsUXRU?=
 =?utf-8?B?bytlcHFKQWxBWXRnbFFIdzg2Qk1FMkJneUgxTm1RVTFtRG1WZ3M3UWR2Tnpt?=
 =?utf-8?Q?jiN7uY7Z6ecva60ufHv4eQHnj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a028514b-2676-4e66-0b42-08dd90f1c367
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 01:10:19.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01CcTAjpRXjFc8xD+/wKCR0oMh0v5sIz8chqRrlxennNm0fRkeEjfp8MSwBSD7myBizflxknXBBTcDgs0vElTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
X-OriginatorOrg: intel.com

On Fri, May 09, 2025 at 01:43:33PM -0700, Juan Yescas wrote:
> On Fri, May 9, 2025 at 12:49 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   930c125f685d7e8eef566fcd563390b76a28d824
> > commit: 16994f2b09a22523885d371caa59f17999686805 [333/334] mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order
> > config: powerpc64-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091548.FuKO4b4v-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 10.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091548.FuKO4b4v-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from include/vdso/const.h:5,
> >                     from include/linux/const.h:4,
> >                     from include/linux/bits.h:5,
> >                     from include/linux/ratelimit_types.h:5,
> >                     from include/linux/printk.h:9,
> >                     from include/asm-generic/bug.h:22,
> >                     from arch/powerpc/include/asm/bug.h:116,
> >                     from include/linux/bug.h:5,
> >                     from include/linux/mmdebug.h:5,
> >                     from include/linux/mm.h:6,
> >                     from mm/sparse.c:5:
> >    mm/sparse.c: In function 'usemap_size':
> > >> include/linux/mmzone.h:1816:8: warning: left shift count is negative [-Wshift-count-negative]
> >     1816 |  ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
> >          |        ^~
> >    include/uapi/linux/const.h:51:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
> >       51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> >          |                                        ^
> >    mm/sparse.c:301:9: note: in expansion of macro 'BITS_TO_LONGS'
> >      301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsigned long);
> >          |         ^~~~~~~~~~~~~
> >    mm/sparse.c:301:23: note: in expansion of macro 'SECTION_BLOCKFLAGS_BITS'
> >      301 |  return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsigned long);
> >          |                       ^~~~~~~~~~~~~~~~~~~~~~~
> >
> >
> > vim +1816 include/linux/mmzone.h
> >
> > d41dee369bff3b Andy Whitcroft 2005-06-23  1814
> > 835c134ec4dd75 Mel Gorman     2007-10-16  1815  #define SECTION_BLOCKFLAGS_BITS \
> > d9c2340052278d Mel Gorman     2007-10-16 @1816          ((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
> > 835c134ec4dd75 Mel Gorman     2007-10-16  1817
> >
> 
> Thanks for testing,
> 
> The reason for the warning is because CONFIG_PAGE_BLOCK_ORDER >
> CONFIG_ARCH_FORCE_MAX_ORDER.
> 
> This config: powerpc64-randconfig-003-20250509
> (https://download.01.org/0day-ci/archive/20250509/202505091548.FuKO4b4v-lkp@intel.com/config)
> 
> is not respecting the range config below. Should the test make sure
> that the ranges are valid?

Thanks for the information, I will check the bot side to resolve the problem.

Sorry for the false positive.

> 
> config PAGE_BLOCK_ORDER
> int "Page Block Order"
> range 1 10 if !ARCH_FORCE_MAX_ORDER
> default 10 if !ARCH_FORCE_MAX_ORDER
> range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> 
> I can add a check in include/linux/pageblock-flags.h
> 
> /*
>  * The PAGE_BLOCK_ORDER, which defines the order for the number of pages
>  * that can have a migrate type, must be less or equal to the MAX_PAGE_ORDER,
>  * which defines the max order of pages to be allocated by the buddy allocator.
>  */
> BUILD_BUG_ON_MSG(PAGE_BLOCK_ORDER > MAX_PAGE_ORDER,
>         "MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER");
> 
> Is there any preference?
> 
> > :::::: The code at line 1816 was first introduced by commit
> > :::::: d9c2340052278d8eb2ffb16b0484f8f794def4de Do not depend on MAX_ORDER when grouping pages by mobility
> >
> > :::::: TO: Mel Gorman <mel@csn.ul.ie>
> > :::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
