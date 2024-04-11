Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3721145345
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712828914; cv=fail; b=Iz4otaSbE5tzKXYbdzEwCYor2eyMlNexp9EOqtKbp4+CTYeaycH0JJ7WXv+0YvR4MqRhC0uQWVOx1VkA6W0T7vX2So6oCrvtIQ1V7rzqCcjBr0blCafCiuO6ZoVKsRK8ZXfG1yEnVpvuixbz676jqUDpgR1kEzB30HpSGXvW/Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712828914; c=relaxed/simple;
	bh=Q7Ny1hAgilYv5xqirPkBwWEY6HYxNsmq52H1ddlQGzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cV46OoTUjKAGn7YvCRlnqSPvW3bd7FslbBlcUl/22le2KE5JzHykQV0eHSW6fuy1D5zpHnsINLG0mlxtxTfpUFe0hs+UvyZWUV41/UBDYBIIS2gp4B9bRAW1r6I3YOiOBTUSDUJBEEJ8/jEEe9UYzeED3MVFrQwSmh8a4FPokd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IldSSfMr; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IldSSfMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712828913; x=1744364913;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Q7Ny1hAgilYv5xqirPkBwWEY6HYxNsmq52H1ddlQGzI=;
  b=IldSSfMrSdVBirzTGmDL5Am3gaGs8ik2SzkknDy9n8LajQgYmlgGShyN
   FNsqQcwjgBKvI2l6jrRzkcOjxP2c9JlRovXPLxvA35jBKjBhvxAn1Tomc
   kxxiqTdmAPVrI9AW2TeBFAQp4rPyiaNFoWaQ/5CDUPGrD0ssKX6iS86Jx
   GZC3bLuj3GOaplRvCX/HRmco7DxbuLJOWeqUlZ8zXe9tT7Tm5V9Vk/iNj
   ze5amjDjWTgyMaulY0LvLVQkFRvn5x8ucAI687grBP3vMwpo2o/xA7+js
   cPeFcO56e5sjHsmk1PcCYMZDcKNXYx+yh8DyK9Bt4dZ61v6th3547QimQ
   g==;
X-CSE-ConnectionGUID: 4wv6MR8BTKyswQE/Sa9IpQ==
X-CSE-MsgGUID: 8okaMln1Tj+lgofz4yv4Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12080431"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12080431"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:48:33 -0700
X-CSE-ConnectionGUID: Dtr7MbMQS7C/1i+8VSv+Ug==
X-CSE-MsgGUID: m6GaMXNiSb27ApVpNTyjkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25332037"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Apr 2024 02:48:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 02:48:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 02:48:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 02:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dY25yggtU78xhziCePBYjaQMOh8Cey4VMNp8HdKI9rWXOwZ/w38wCriPbuAKaWXs4vlBkaO6yeymb5JlhEDCYRNt7BLZWGq2zT4UhA72yaccOeAIhb1nfgGXJzXy9wNVzNec4PD2YQtCzzzROhY4po2qEbOFVIUfN9zZ/pHA4yriDKzFekBbWaIsAcWbuth7ZApa9O7W1iGEXGUcGNTA0vhnVyk47EHGjAEDp3RlWhnA3VuaMhXeLqV52LOYLLpbO18jtHYrxmAwHjFz7pIb6tHjjK42ocWuaD+yfEul/ngzGNb/cKJuZZml45xsru1ZZzt34z4Nv4cB/SSyHOpdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7Ny1hAgilYv5xqirPkBwWEY6HYxNsmq52H1ddlQGzI=;
 b=U97Kb5Bggqgosk3S4SLiWq6km45Vs+esxA254vHdEZKWI+JZY7qDeoIPFtvvPpUyvvao0n+1EH6bm+ShkK28nQDBHmQensa/YtLl4nds6ogzsNwqehWUxryslq4MuKvsHnIjy3XBUbH3y3tKUyGfI0Tod1GfvN5mn6lrzRuDljbhGFzK/t7YBrRr5SRqXsN7SHi/yBPjnRX0ZBvUw3mmh8avZDDmxpNZVro0iizSztAqvq9ud5gBh0ryeUgLX4IKkOdDWMGgkUcerJIaXVR3ZbhhAai6iYnG7KukuEsLN5BYCjy8mtnTR28itCVW2+9gitK0Z0qRckvZx+/LdbGj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 11 Apr
 2024 09:48:29 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 09:48:29 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	lkp <lkp@intel.com>
CC: "glider@google.com" <glider@google.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "yury.norov@gmail.com" <yury.norov@gmail.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Lobakin,
 Aleksander" <aleksander.lobakin@intel.com>
Subject: Re: [linux-next:master 2203/5042] WARNING: modpost: vmlinux: section
 mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Thread-Topic: [linux-next:master 2203/5042] WARNING: modpost: vmlinux: section
 mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Thread-Index: AQHai1sSTHfpls5ockqtgFdzmESOgbFhoJUAgAExsgA=
Date: Thu, 11 Apr 2024 09:48:29 +0000
Message-ID: <8aaf29b84843289c2c1652df7e4fe158a6e2628d.camel@intel.com>
References: <202404102353.Cv1gUjk3-lkp@intel.com>
	 <Zhav9krPj3qBjpuP@smile.fi.intel.com>
In-Reply-To: <Zhav9krPj3qBjpuP@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|MW3PR11MB4524:EE_
x-ms-office365-filtering-correlation-id: 5c4504d0-754e-4633-cd70-08dc5a0c8ac8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pxkFszuWkK+sEFEYuR4dqHYMYfCJ/D06W9jt6u9rwAPmgGUjRcJXBwLnVSudSGn+1cQsR8QrHaHK5yAqdZ9dEBk9Cs3HuTOO0GjOXRlMcFvi+aFsG4rCbqdTVdelA08NHn+u2wwnV2zYS5tBXjdrYdd+PIdU0CXjkCN7KATbfNHSGPdoOpXelAlGr9QEi79RAaOwk/SchE+EAUVIqBVQjtwAAAf0ivjGj1bN5STISyT8TVqRDNV0nhMhj/3aA0qFVAtKme4xQNmdHPlx/Zbs3DyjYTekAqFgranv+K0/yaRDzpoYMkTTe72BrVvT7tww5hDRg+fdCwyfHImafbSWnGSMkKA2OZ+zl6hcAL8jPJKG6b13dU0SWC2fjVXc5dxxo6B5XOT11WoYrGEs9gSV4PqIZmVjVYNvKym4XoBwaegB4ds/o2Z7O2ZBY3htEUA7TSVxSDNnXdK2JNXrRGJOtmYwHbhqYvzIhWmd55NwUy55Lh9agq775cAr2NTN/UNPMMWa6RZYOf+sfm8u5wGlIn158bsIrzERc/+EvdqVRLo2LWDg9yUxpA2NtSf52UTaQY//UD5EDDWvAUb0n/xDwonfBCgoIa5b5SVZsedk1juPOWS4fKk8Fweqh2OPCzHUZ3Fqsh1wUpZLf2reO2QlXzuyl8NXkNkTQ/Lp3qnLdS2Qulzi9KpaMso1jJMalHlf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmdxYmlkaGtkQ2dJc0U4ZVRiaGhmWlVNOERyZEk4S2ZHUjdXcmFNeG1PaDVQ?=
 =?utf-8?B?UUUxbVdnZ3IxeG5LQ1VDQU5vVVcrcHlXbDhVTWR1eFp1c0FFQkpjQmFDQXBw?=
 =?utf-8?B?cE1CKzg3WTd2a1Bvbks2YXpiVHNicU9OaHBvcmoxTXc3NEpzTE5jMnNEZ3FN?=
 =?utf-8?B?amMwQ25ybU1hb0VubXUzUE9oOG9iZ0dHekdHNGZwV3JzMkdPeEM3ZFdyS3dM?=
 =?utf-8?B?YjI5TTNmVzNlSWlBMm5DdktXaTRyN3c1UCtjUk5oVXUyeTdQczl6Z0NlYzNu?=
 =?utf-8?B?Q203TVltUjQxRkJrN3VRSzg0K1ZrZWErK3c5U2NjM01Fc2FWbHNFb2l2MDhB?=
 =?utf-8?B?VVkyOXJYWlB5cEVhekdHYnFrRmNBT1lSV2J0MXplY0FoN0hPSmZveFJYMnpC?=
 =?utf-8?B?NEd5WEtPc1dJbmJpY01HVGUxUmkrVjZySzQ3QmxHcmdqL0RjZnU5S0Jzei9K?=
 =?utf-8?B?RE9tR09tSlU0WVRQL2tXWG40NmtOZVhxMjhpYkVNR2dMNWxIVUdwWldJOGcz?=
 =?utf-8?B?YjhCYWRSWDZyNDlGdENpTmlPVjdLeGNEdmxVSDNUbnhWd1F3YXVWMisxTnJI?=
 =?utf-8?B?eDRmMzNCZnZNRHdRbzZhTUo5T1JQL3BKRTQxTlVpVHAxd0d4VDVzV0REc0RU?=
 =?utf-8?B?NWp0ZVJKK2MrVEgwclczSlNpQ0hqQU1PemNUNWxXbXZwcWRWMHFnWEsxOTRP?=
 =?utf-8?B?VldJQXV3NTQ1N3MrMFlDblowbUlKRjBTSHhCTGZnVlZzTDZ0TmFLSGp0OVZq?=
 =?utf-8?B?VmJQM3BWV0UxVGdqaGhRcGgrYVRSb0JCMy94aUdFdlQ4WTZLM2U1ZzRMTG5M?=
 =?utf-8?B?MDRxaWFQbnllcW9BNEdCaDNyMlkrVEV4Uzg5OU5SYUxsSnN0bzBtVXdYU0s1?=
 =?utf-8?B?MTVPMzNEMG5NVSs2bnlzOUVsYzdQNkRyUmR0WDNCcHZPamg0VTFrRU5VcTRV?=
 =?utf-8?B?dGdpaFFVZ0pEZ1JhR2Vzc29pVmxza3dVM2dmeUZFU0VDUGp6TWwzSCtBdlBU?=
 =?utf-8?B?MUlSc3o5S1RaUXVON2JiQzdXM3U2cW1PMnJYanVnOTUySkl5SzVubE9FcU02?=
 =?utf-8?B?R3hvSEV4L3BFVkRMVFBYZ1h6eGNVcnp4OUx4Y0JTdWJYR015K1JwY25VVzB3?=
 =?utf-8?B?aW14ZzFIdDluRkEveEZkSGVKem9WbG5DK2E5UHkvbTlyS1FUbTFlOWw5Mmty?=
 =?utf-8?B?dW1Mdm9EY0RnSUNWTnFxSk4vTytxdVdheU5pNXZ1R3hUZ0VNLzRTOEs4c2tI?=
 =?utf-8?B?dXg4eUhUM0NKMEx3V0J2RnlQRVZKcFhsRytXcE1HS3pJUXN3YXoyNXVDU2pr?=
 =?utf-8?B?UldubnpYSEw3Y3NWS1dVUmszME41SnhtNEdESGg4ZmJGcXQ0Uk9DWWRwU1Fy?=
 =?utf-8?B?VjJLSmhOUmlQaU9iWFNkU1pQZDZiWjVhWktBZlEyYnZxbW12aVU4cmhBczJF?=
 =?utf-8?B?RVZ4Ky8zNXk2ZUxVWUp3NmRVYW1meW83UFR2c2F6RUU1Qm94MWJicERESDQ0?=
 =?utf-8?B?NkVXdGZ5UUhVSFIwdEZWbUZVZTg4ZS92OERGMGtkcGd5MGhYWkhFcC81b1lm?=
 =?utf-8?B?MDRwcm5obGpjV1FLc3A2SzlpQjJHTmFlUzJpWERZdUFnand4WWF1YzVKajhH?=
 =?utf-8?B?Sy9sUzFZZFdHaVBjVUdnK1JGZjlramtqOU9COERXTFdwTVpYekV4MWpkQzFK?=
 =?utf-8?B?RmVBMDZxa0JYWVY3TkhRdDh5TDAxZzJNMDAyb3FFTm1ReXFmcWl2ei80OGRj?=
 =?utf-8?B?Szdyb1ZuWGJJMEhxdFJIMUpHODZJRWo5K3JLQUluL3hWYjMzb2hWZTRXbnZE?=
 =?utf-8?B?akR4Y1Z3Rm9aamIvNWE1NTJvS2FtRzJvOUJ4ZEdYY0NkdXY0TzYrK3l3My9R?=
 =?utf-8?B?NVh4d3hYU3R6bUYwTjd3d2V1emcwbHZkZU5vTzZKSy9qbjVvSGJGbDI0ell1?=
 =?utf-8?B?T2xOOHhTcHVPNVBpRlZ0bGVaWGpYaTJ1cm1PSUdMcVE3dU1JUkdZK2c2ZDAr?=
 =?utf-8?B?aGlmdWFNcU5oSFpuZzFGT3hkOGFyWVVGY0REck5ENE9DN3FPc0lsSWZWdW9t?=
 =?utf-8?B?bi9GZzQyWkFPU296eFV4bFVKT1pUS3psVFBiYXUxbjE0YytvMTJqTWFWS2V0?=
 =?utf-8?Q?1q/EmO+dzyU4Rco4N/+S3dyU8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55D46A214919E5419280024F85A6DFB5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4504d0-754e-4633-cd70-08dc5a0c8ac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 09:48:29.3894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQekkfq1pPgz16T268zLpTrti7pJlOBbJGy92iEZCn2+tL3w4beMZwp/dZwFmsa7xygL6knPoFLjqX1iUxLeBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-OriginatorOrg: intel.com

SGkgQW5keSwNCg0KT24gV2VkLCAyMDI0LTA0LTEwIGF0IDE4OjI3ICswMzAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDExOjIyOjE2UE0gKzA4MDAs
IGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0KPiA+IHRyZWU6ICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdCBtYXN0ZXIN
Cj4gPiBoZWFkOiAgIDZlYmYyMTFiYjExZGZjMDA0YTJmZjczYTlkZTUzODZmYTMwOWM0MzANCj4g
PiBjb21taXQ6IDk5MWU1NTgzNjQ3ZDMzZWUzYTljODkyNDg5NzRlZjk4YjlmNTM5YTggWzIyMDMv
NTA0Ml0gbGliL3Rlc3RfYml0bWFwOiBhZGQgdGVzdHMgZm9yIGJpdG1hcF97cmVhZCx3cml0ZX0o
KQ0KPiA+IGNvbmZpZzogeHRlbnNhLXJhbmRjb25maWctcjAxMi0yMDIzMDcyNSAoaHR0cHM6Ly9k
b3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwNDEwLzIwMjQwNDEwMjM1My5DdjFn
VWprMy1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gPiBjb21waWxlcjogeHRlbnNhLWxpbnV4LWdj
YyAoR0NDKSAxMy4yLjANCj4gPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0
cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwNDEwLzIwMjQwNDEwMjM1
My5DdjFnVWprMy1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkNCj4gPiANCj4gPiBJZiB5b3UgZml4
IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5l
dyB2ZXJzaW9uIG9mDQo+ID4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xs
b3dpbmcgdGFncw0KPiA+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPg0KPiA+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQt
YWxsLzIwMjQwNDEwMjM1My5DdjFnVWprMy1sa3BAaW50ZWwuY29tLw0KPiA+IA0KPiA+IEFsbCB3
YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4sIG9sZCBvbmVzIHByZWZpeGVkIGJ5IDw8
KToNCj4gPiANCj4gPiBXQVJOSU5HOiBtb2Rwb3N0OiBtaXNzaW5nIE1PRFVMRV9ERVNDUklQVElP
TigpIGluIHZtbGludXgubw0KPiA+ID4gPiBXQVJOSU5HOiBtb2Rwb3N0OiB2bWxpbnV4OiBzZWN0
aW9uIG1pc21hdGNoIGluIHJlZmVyZW5jZTogYml0bWFwX3JlYWQrMHgxMjggKHNlY3Rpb246IC50
ZXh0LnVubGlrZWx5KSAtPiBfX3NldHVwX3N0cl9pbml0Y2FsbF9ibGFja2xpc3QgKHNlY3Rpb246
IC5pbml0LnJvZGF0YSkNCj4gPiBXQVJOSU5HOiBtb2Rwb3N0OiB2bWxpbnV4OiBzZWN0aW9uIG1p
c21hdGNoIGluIHJlZmVyZW5jZTogYml0bWFwX2FsbG9jYXRlX3JlZ2lvbisweGI0IChzZWN0aW9u
OiAudGV4dC51bmxpa2VseSkgLT4gX19zZXR1cF9zdHJfaW5pdGNhbGxfYmxhY2tsaXN0IChzZWN0
aW9uOiAuaW5pdC5yb2RhdGEpDQo+IA0KPiBBcyBwb2ludGVkIG91dCBlYXJsaWVyLCB0aGlzIGlz
IHVuY29uZmlybWVkIGJ1ZyBpbiBHQ0MgKEdDQyBkZXZlbG9wZXJzDQo+IHBvaW50IGEgZmluZ2Vy
IGF0IGtlcm5lbCBjb2RlIGFuZCB2aWNlIHZlcnNhKS4gQ2FuIHlvdSByZXByb2R1Y2UgdGhpcw0K
PiB3aXRoIGNsYW5nPw0KDQpUaGFua3MgZm9yIHRoZSByZW1pbmRlciBvZiB0aGUgcHJldmlvdXMg
Y29tbWVudCBpbiBbMV0uDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAz
MTIxMDMyLldEWThmdEtxLWxrcEBpbnRlbC5jb20vDQoNClRoaXMgd2FybmluZyB3YXMgY2FwdHVy
ZWQgaW4gYSByYW5kY29uZmlnIGNyb3NzIGNvbXBpbGF0aW9uIGZvciB4dGVuc2ENCmFyY2hpdGVj
dHVyZS4gU2VlbXMgY2xhbmcgZG9lc24ndCBzdXBwb3J0IHh0ZW5zYSBiYWNrZW5kIHlldC4gV2Ug
dHJpZWQNCnNvbWUgcmFuZGNvbmZpZyBidWlsZCBmb3IgeDg2XzY0IHdpdGggY2xhbmcsIGJ1dCBj
YW5ub3QgcmVwcm9kdWNlDQp0aGlzLsKgDQoNCldlIG9ubHkgb2JzZXJ2ZWQgdGhpcyB3YXJuaW5n
IG9uIHh0ZW5zYSwgYnV0IG5vdCBvbiBvdGhlcg0KYXJjaGl0ZWN0dXJlcywgc28gd2UgZG9uJ3Qg
aGF2ZSBvdGhlciBjb25maWdzIGF0IGhhbmQgdGhhdCBjYW4gYmUgdXNlZA0KdG8gcmVwcm9kdWNl
IHdpdGggY2xhbmcuIFNvcnJ5IGZvciB0aGlzLg0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KWXVqaWUN
Cg==
